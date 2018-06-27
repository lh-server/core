/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Creature.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ObjectGuid.h"
#include "SpellMgr.h"
#include "QuestDef.h"
#include "GossipDef.h"
#include "Player.h"
#include "GameEventMgr.h"
#include "PoolManager.h"
#include "Opcodes.h"
#include "Log.h"
#include "LootMgr.h"
#include "MapManager.h"
#include "CreatureAI.h"
#include "CreatureAISelector.h"
#include "Formulas.h"
#include "WaypointMovementGenerator.h"
#include "InstanceData.h"
#include "MapPersistentStateMgr.h"
#include "BattleGroundMgr.h"
#include "Spell.h"
#include "Util.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "Language.h"

#include "CreatureGroups.h"
#include "ZoneScript.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Anticheat.h"
#include "CreatureLinkingMgr.h"
#include "TemporarySummon.h"
#include "ScriptedEscortAI.h"

// apply implementation of the singletons
#include "Policies/SingletonImp.h"


TrainerSpell const* TrainerSpellData::Find(uint32 spell_id) const
{
    TrainerSpellMap::const_iterator itr = spellList.find(spell_id);
    if (itr != spellList.end())
        return &itr->second;

    return nullptr;
}

bool VendorItemData::RemoveItem(uint32 item_id)
{
    for (VendorItemList::iterator i = m_items.begin(); i != m_items.end(); ++i)
    {
        if ((*i)->item == item_id)
        {
            m_items.erase(i);
            return true;
        }
    }
    return false;
}

size_t VendorItemData::FindItemSlot(uint32 item_id) const
{
    for (size_t i = 0; i < m_items.size(); ++i)
        if (m_items[i]->item == item_id)
            return i;
    return m_items.size();
}

VendorItem const* VendorItemData::FindItem(uint32 item_id) const
{
    for (VendorItemList::const_iterator i = m_items.begin(); i != m_items.end(); ++i)
        if ((*i)->item == item_id)
            return *i;
    return nullptr;
}

bool AssistDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (Unit* victim = m_owner.GetMap()->GetUnit(m_victimGuid))
    {
        while (!m_assistantGuids.empty())
        {
            Creature* assistant = m_owner.GetMap()->GetAnyTypeCreature(*m_assistantGuids.rbegin());
            m_assistantGuids.pop_back();

            if (assistant && assistant->CanAssistTo(&m_owner, victim))
            {
                assistant->SetNoCallAssistance(true);
                if (assistant->AI())
                    assistant->AI()->AttackStart(victim);
            }
        }
    }
    return true;
}

AssistDelayEvent::AssistDelayEvent(ObjectGuid victim, Unit& owner, std::list<Creature*> const& assistants) : BasicEvent(), m_victimGuid(victim), m_owner(owner)
{
    // Pushing guids because in delay can happen some creature gets despawned => invalid pointer
    m_assistantGuids.reserve(assistants.size());
    for (std::list<Creature*>::const_iterator itr = assistants.begin(); itr != assistants.end(); ++itr)
        m_assistantGuids.push_back((*itr)->GetObjectGuid());
}

bool ForcedDespawnDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_owner.ForcedDespawn();
    return true;
}

void CreatureCreatePos::SelectFinalPoint(Creature* cr)
{
    // if object provided then selected point at specific dist/angle from object forward look
    if (m_closeObject)
    {
        if (m_dist == 0.0f)
        {
            m_pos.x = m_closeObject->GetPositionX();
            m_pos.y = m_closeObject->GetPositionY();
            m_pos.z = m_closeObject->GetPositionZ();
        }
        else
            m_closeObject->GetClosePoint(m_pos.x, m_pos.y, m_pos.z, cr->GetObjectBoundingRadius(), m_dist, m_angle);
    }
}

bool CreatureCreatePos::Relocate(Creature* cr) const
{
    cr->Relocate(m_pos.x, m_pos.y, m_pos.z, m_pos.o);

    if (!cr->IsPositionValid())
    {
        sLog.outError("%s not created. Suggested coordinates isn't valid (X: %f Y: %f)", cr->GetGuidStr().c_str(), cr->GetPositionX(), cr->GetPositionY());
        return false;
    }

    return true;
}

Creature::Creature(CreatureSubtype subtype) :
    Unit(), i_AI(nullptr),
    loot(this), lootForPickPocketed(false), lootForBody(false), lootForSkin(false), skinningForOthersTimer(5000), m_TargetNotReachableTimer(0),
    _pacifiedTimer(0), _manaRegen(true), m_manaRegen(0),
    m_groupLootTimer(0), m_groupLootId(0), m_lootMoney(0), m_lootGroupRecipientId(0), m_corpseDecayTimer(0),
    m_respawnTime(0), m_respawnDelay(25), m_corpseDelay(60),
    m_respawnradius(5.0f), m_combatStartTime(0), m_combatState(false), m_combatResetCount(0), m_subtype(subtype),
    m_defaultMovementType(IDLE_MOTION_TYPE), m_equipmentId(0), m_AlreadyCallAssistance(false),
    m_AlreadySearchedAssistance(false),
    m_regenHealth(true), m_AI_locked(false), m_isDeadByDefault(false), m_temporaryFactionFlags(TEMPFACTION_NONE),
    m_meleeDamageSchoolMask(SPELL_SCHOOL_MASK_NORMAL), m_originalEntry(0), _creatureGroup(nullptr),
    m_combatStartX(0.0f), m_combatStartY(0.0f), m_combatStartZ(0.0f),
    m_HomeX(0.0f), m_HomeY(0.0f), m_HomeZ(0.0f), m_HomeOrientation(0.0f), m_reactState(REACT_PASSIVE),
    m_CombatDistance(0.0f), _lastDamageTakenForEvade(0), _playerDamageTaken(0), _nonPlayerDamageTaken(0), m_creatureInfo(nullptr),
    m_AI_InitializeOnRespawn(false), m_callForHelpDist(5.0f), m_combatWithZoneState(false), m_startwaypoint(0), m_mountId(0),
    _isEscortable(false)
{
    m_regenTimer = 200;
    m_valuesCount = UNIT_END;

    for (int i = 0; i < CREATURE_MAX_SPELLS; ++i)
        m_spells[i] = 0;

    SetWalk(true, true);
}

Creature::~Creature()
{
    CleanupsBeforeDelete();

    m_vendorItemCounts.clear();

    delete i_AI;
    i_AI = nullptr;
}

void Creature::AddToWorld()
{
    bool bWasInWorld = IsInWorld();

    ///- Register the creature for guid lookup
    if (!IsInWorld() && GetObjectGuid().GetHigh() == HIGHGUID_UNIT)
        GetMap()->InsertObject<Creature>(GetObjectGuid(), this);

    sCreatureGroupsManager->LoadCreatureGroup(this, _creatureGroup);
    if (_creatureGroup && _creatureGroup->IsFormation())
        SetActiveObjectState(true);
    Unit::AddToWorld();

    if (!i_AI)
        AIM_Initialize();
    if (!bWasInWorld && m_zoneScript)
        m_zoneScript->OnCreatureCreate(this);
}

void Creature::RemoveFromWorld()
{
    ///- Remove the creature from the accessor
    if (IsInWorld())
    {
        if (AI())
            AI()->OnRemoveFromWorld();
        if (GetObjectGuid().GetHigh() == HIGHGUID_UNIT)
            GetMap()->EraseObject<Creature>(GetObjectGuid());
        if (m_zoneScript)
            m_zoneScript->OnCreatureRemove(this);
    }
    Unit::RemoveFromWorld();
}

void Creature::RemoveCorpse()
{
    if ((getDeathState() != CORPSE && !m_isDeadByDefault) || (getDeathState() != ALIVE && m_isDeadByDefault))
        return;

    m_corpseDecayTimer = 0;
    SetDeathState(DEAD);
    UpdateObjectVisibility();

    // stop loot rolling before loot clear and for close client dialogs
    StopGroupLoot();

    loot.clear();
    uint32 respawnDelay = 0;

    if (AI())
        AI()->CorpseRemoved(respawnDelay);

    if (m_isCreatureLinkingTrigger)
        GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_DESPAWN, this);

    // script can set time (in seconds) explicit, override the original
    if (respawnDelay)
        m_respawnTime = time(nullptr) + respawnDelay;

    float x, y, z, o;
    GetRespawnCoord(x, y, z, &o);
    GetMap()->CreatureRelocation(this, x, y, z, o);
}

/**
 * change the entry of creature until respawn
 */
bool Creature::InitEntry(uint32 Entry, Team team, CreatureData const* data /*=NULL*/, GameEventCreatureData const* eventData /*=NULL*/)
{
    // use game event entry if any instead default suggested
    if (eventData && eventData->entry_id)
        Entry = eventData->entry_id;

    CreatureInfo const *normalInfo = ObjectMgr::GetCreatureTemplate(Entry);
    if (!normalInfo)
    {
        sLog.outErrorDb("Creature::UpdateEntry creature entry %u does not exist.", Entry);
        return false;
    }

    CreatureInfo const *cinfo = normalInfo;

    SetEntry(Entry);                                        // normal entry always
    m_creatureInfo = cinfo;                                 // map mode related always

    SetObjectScale(cinfo->scale);
    // Reset native scale before we apply creature info multiplier, otherwise we are
    // stuck at 1 from the previous m_nativeScaleOverride if the unit's entry is
    // being changed
    m_nativeScaleOverride = cinfo->scale;
    m_nativeScale = cinfo->scale;

    // equal to player Race field, but creature does not have race
    SetByteValue(UNIT_FIELD_BYTES_0, 0, 0);

    // known valid are: CLASS_WARRIOR,CLASS_PALADIN,CLASS_ROGUE,CLASS_MAGE
    SetByteValue(UNIT_FIELD_BYTES_0, 1, uint8(cinfo->unit_class));

    SetInitCreaturePowerType();

    uint32 display_id = ChooseDisplayId(GetCreatureInfo(), data, eventData);
    if (!display_id)                                        // Cancel load if no display id
    {
        sLog.outErrorDb("Creature (Entry: %u) has no model defined in table `creature_template`, can't load.", Entry);
        return false;
    }

    CreatureModelInfo const *minfo = sObjectMgr.GetCreatureModelRandomGender(display_id);
    if (!minfo)                                             // Cancel load if no model defined
    {
        sLog.outErrorDb("Creature (Entry: %u) has no model info defined in table `creature_model_info`, can't load.", Entry);
        return false;
    }

    display_id = minfo->modelid;                            // it can be different (for another gender)

    SetNativeDisplayId(display_id);

    // special case for totems (model for team==HORDE is stored in creature_template as the default)
    if (team == ALLIANCE && cinfo->type == CREATURE_TYPE_TOTEM)
    {
        uint32 modelid_tmp = sObjectMgr.GetCreatureModelOtherTeamModel(display_id);
        display_id = modelid_tmp ? modelid_tmp : display_id;
    }

    // normally the same as native, see above for the exeption
    SetDisplayId(display_id);

    SetByteValue(UNIT_FIELD_BYTES_0, 2, minfo->gender);

    // Load creature equipment
    if (eventData && eventData->equipment_id)
    {
        LoadEquipment(eventData->equipment_id);             // use event equipment if any for active event
    }
    else if (!data || data->equipmentId == 0)
    {
        // use default from the template
        LoadEquipment(cinfo->equipmentId);
    }
    else if (data && data->equipmentId != -1)
    {
        // override, -1 means no equipment
        LoadEquipment(data->equipmentId);
    }

    SetName(normalInfo->Name);                              // at normal entry always
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    SetFloatValue(UNIT_MOD_CAST_SPEED, 1.0f);
#else
    SetInt32Value(UNIT_MOD_CAST_SPEED, 0);
#endif
    // update speed for the new CreatureInfo base speed mods
    UpdateSpeed(MOVE_WALK, false);
    UpdateSpeed(MOVE_RUN,  false);
    SetFly(CanFly());

    if (data)
        m_startwaypoint = data->currentwaypoint;

    // checked at loading
    m_defaultMovementType = MovementGeneratorType(cinfo->MovementType);

    return true;
}


uint32 Creature::GetSpawnFlags() const
{
    if (CreatureData const* data = sObjectMgr.GetCreatureData(GetGUIDLow()))
        return data->spawnFlags;
    return 0;
}

void Creature::UnloadCreatureAddon(const CreatureDataAddon* data)
{
    if (data->mount != 0)
        Unmount();

    if (data->bytes1 != 0)
    {
        // 0 StandState
        // 1 LoyaltyLevel  Pet only, so always 0 for default creature
        // 2 ShapeshiftForm     Must be determined/set by shapeshift spell/aura
        // 3 StandMiscFlags

        SetByteValue(UNIT_FIELD_BYTES_1, 0, 0);
        //SetByteValue(UNIT_FIELD_BYTES_1, 1, 0);
        //SetByteValue(UNIT_FIELD_BYTES_1, 1, 0);
        //SetByteValue(UNIT_FIELD_BYTES_2, 2, 0);
        SetByteValue(UNIT_FIELD_BYTES_1, 3, 0);
    }

    // UNIT_FIELD_BYTES_2
    // 0 SheathState
    // 1 Bytes2Flags, in 3.x used UnitPVPStateFlags, that have different meaning
    // 2 UnitRename         Pet only, so always 0 for default creature
    // 3 ShapeshiftForm     Must be determined/set by shapeshift spell/aura
    SetByteValue(UNIT_FIELD_BYTES_2, 0, 0);

    if (data->flags != 0)
        SetByteValue(UNIT_FIELD_BYTES_2, 1, 0);

    //SetByteValue(UNIT_FIELD_BYTES_2, 2, 0);
    //SetByteValue(UNIT_FIELD_BYTES_2, 3, 0);

    if (data->emote != 0)
        SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);

    if (data->move_flags & SPLINEFLAG_FLYING)
        SetFly(false);

    if (data->auras)
    {
        for (uint32 const* cAura = data->auras; *cAura; ++cAura)
        {
            if (HasAura(*cAura))
            {
                RemoveAurasDueToSpellByCancel(*cAura);
            }
        }
    }
}

bool Creature::UpdateEntry(uint32 Entry, Team team, const CreatureData *data /*=NULL*/, GameEventCreatureData const* eventData /*=NULL*/, bool preserveHPAndPower /*=true*/)
{
    bool addonReload = false;

    /*
     * This section of code is an attempt to handle the case where creature entry IDs are
     * updated after creature creation. This is typically done to randomise trash spawn
     * types and it works (mostly) fine until the different creature entries have different
     * creature_template_aura entries. What we want to do is ensure auras belonging to
     * the previous creature entry are removed and auras belonging to the new creature
     * entry are applied. This complication is that this function is also called
     * from several other spots, including Creature::Create, which causes a
     * few problems if not handled correctly, for some definition of correct.
     *
     * TL;DR: Hack to handle randomised trash spawn auras without requiring
     * script authors to do it explicitly and/or breaking existing code.
     * Would be better to have a spawn system that could properly handle
     * random entries.
     */
    if (m_creatureInfo) // prevent aura unloading if this creature is still under creation
    {
        auto newAddonData = ObjectMgr::GetCreatureTemplateAddon(Entry);
        auto prevAddonData = ObjectMgr::GetCreatureTemplateAddon(m_creatureInfo->Entry);
        auto creaAddonData = ObjectMgr::GetCreatureAddon(GetGUIDLow());

        /*
         * Auras listed in creature_addon override anything contained in creature_template_addon,
         * so we don't want to unload GUID-based auras, even if we're changing the template entry
         */
        if (!creaAddonData && prevAddonData != newAddonData)
        {
            addonReload = true;

            /*
             * Looks like we're changing the creature's entry ID, so remove any auras
             * coming from the creature_template_auras table
             */
            if (prevAddonData)
            {
                UnloadCreatureAddon(prevAddonData);
            }
        }
    }

    if (!InitEntry(Entry, team, data, eventData))
        return false;

    if (addonReload)
    {
        LoadCreatureAddon(true);
    }

    m_regenHealth = GetCreatureInfo()->RegenHealth;

    // creatures always have melee weapon ready if any
    SetSheath(SHEATH_STATE_MELEE);
    SetByteValue(UNIT_FIELD_BYTES_2, 1, UNIT_BYTE2_FLAG_AURAS);

    SelectLevel(GetCreatureInfo(), preserveHPAndPower ? GetHealthPercent() : 100.0f, 100.0f);

    if (team == HORDE)
        setFaction(GetCreatureInfo()->faction_H);
    else
        setFaction(GetCreatureInfo()->faction_A);

    SetUInt32Value(UNIT_NPC_FLAGS, GetCreatureInfo()->npcflag);

    uint32 attackTimer = GetCreatureInfo()->baseattacktime;
    SetAttackTime(BASE_ATTACK,  attackTimer);
    SetAttackTime(OFF_ATTACK,   attackTimer);
    SetAttackTime(RANGED_ATTACK, GetCreatureInfo()->rangeattacktime);

    uint32 unitFlags = GetCreatureInfo()->unit_flags;

    // we may need to append or remove additional flags
    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT))
        unitFlags |= UNIT_FLAG_IN_COMBAT;
    // Nostalrius: we need this flag to get a proper animation
    // Giant type creatures walk underwater
    if (CanSwim() && GetCreatureInfo()->type != CREATURE_TYPE_GIANT)
        unitFlags |= UNIT_FLAG_USE_SWIM_ANIMATION;
    SetUInt32Value(UNIT_FIELD_FLAGS, unitFlags);

    // preserve all current dynamic flags if exist
    uint32 dynFlags = GetUInt32Value(UNIT_DYNAMIC_FLAGS);
    SetUInt32Value(UNIT_DYNAMIC_FLAGS, dynFlags ? dynFlags : GetCreatureInfo()->dynamicflags);
    SetModifierValue(UNIT_MOD_ARMOR,             BASE_VALUE, float(GetCreatureInfo()->armor));

    float resistances[] = {
        float(GetCreatureInfo()->resistance1),
        float(GetCreatureInfo()->resistance2),
        float(GetCreatureInfo()->resistance3),
        float(GetCreatureInfo()->resistance4),
        float(GetCreatureInfo()->resistance5),
        float(GetCreatureInfo()->resistance6)
    };

    // set spell school immunity if resistance to that element = -1 in db
    m_spellImmune[IMMUNITY_SCHOOL].clear();
    for (int i = 0; i < 6; ++i)
    {
        if (resistances[i] < 0)
        {
            SpellImmune immune;
            immune.type = (1 << (i + 1));
            immune.spellId = 642; // Any positive spell, for Unit::IsImmuneToSpell
            m_spellImmune[IMMUNITY_SCHOOL].push_back(immune);
        }
        else
            SetModifierValue(UnitMods(UNIT_MOD_RESISTANCE_HOLY + i), BASE_VALUE, resistances[i]);
    }

    SetFly(CanFly());
    SetMeleeDamageSchool(SpellSchools(GetCreatureInfo()->dmgschool));

    SetCanModifyStats(true);
    UpdateAllStats();

    // Bosses have increased loot distance.
    if (GetCreatureInfo()->rank == CREATURE_ELITE_WORLDBOSS)
        SetLootAndXPModDist(150.0f);

    // checked and error show at loading templates
    if (FactionTemplateEntry const* factionTemplate = sObjectMgr.GetFactionTemplateEntry(GetCreatureInfo()->faction_A))
    {
        if (factionTemplate->factionFlags & FACTION_TEMPLATE_FLAG_PVP || IsCivilian())
            SetPvP(true);
    }

    for (int i = 0; i < CREATURE_MAX_SPELLS; ++i)
        m_spells[i] = GetCreatureInfo()->spells[i];

    // if eventData set then event active and need apply spell_start
    if (eventData)
        ApplyGameEventSpells(eventData, true);

    return true;
}

uint32 Creature::ChooseDisplayId(const CreatureInfo *cinfo, const CreatureData *data /*= NULL*/, GameEventCreatureData const* eventData /*=NULL*/)
{
    // Use creature event model explicit, override any other static models
    if (eventData && eventData->modelid)
        return eventData->modelid;

    // Use creature model explicit, override template (creature.modelid)
    if (data && data->modelid_override)
        return data->modelid_override;

    // use defaults from the template
    uint32 display_id = 0;

    // model selected here may be replaced with other_gender using own function
    uint32 maxDisplayId = 0;
    for (; maxDisplayId < MAX_CREATURE_MODEL && cinfo->ModelId[maxDisplayId]; ++maxDisplayId);

    if (maxDisplayId)
        display_id = cinfo->ModelId[urand(0, maxDisplayId - 1)];

    // fail safe, we use creature entry 1 and make error
    if (!display_id)
    {
        sLog.outErrorDb("Call customer support, ChooseDisplayId can not select native model for creature entry %u, model from creature entry 1 will be used instead.", cinfo->Entry);

        if (const CreatureInfo *creatureDefault = ObjectMgr::GetCreatureTemplate(1))
            display_id = creatureDefault->ModelId[0];
    }

    return display_id;
}

void Creature::Update(uint32 update_diff, uint32 diff)
{
    update_diff *= sWorld.GetTimeRate();
    diff *= sWorld.GetTimeRate();

    switch (m_deathState)
    {
        case JUST_ALIVED:
            // Don't must be called, see Creature::SetDeathState JUST_ALIVED -> ALIVE promoting.
            sLog.outError("Creature (GUIDLow: %u Entry: %u ) in wrong state: JUST_ALIVED (4)", GetGUIDLow(), GetEntry());
            break;
        case JUST_DIED:
            // Don't must be called, see Creature::SetDeathState JUST_DIED -> CORPSE promoting.
            sLog.outError("Creature (GUIDLow: %u Entry: %u ) in wrong state: JUST_DEAD (1)", GetGUIDLow(), GetEntry());
            break;
        case DEAD:
        {
            if (m_respawnTime <= time(nullptr) && (!m_isSpawningLinked || GetMap()->GetCreatureLinkingHolder()->CanSpawn(this)))
            {
                DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Respawning...");
                m_respawnTime = 0;
                lootForPickPocketed = false;
                lootForBody         = false;
                lootForSkin         = false;
                skinningForOthersTimer = 5000;

                // Clear possible auras having IsDeathPersistent() attribute
                RemoveAllAuras();

                if (m_originalEntry != GetEntry())
                {
                    // need preserver gameevent state
                    GameEventCreatureData const* eventData = sGameEventMgr.GetCreatureUpdateDataForActiveEvent(GetGUIDLow());
                    UpdateEntry(m_originalEntry, TEAM_NONE, nullptr, eventData);
                }

                CreatureInfo const *cinfo = GetCreatureInfo();

                SelectLevel(cinfo);
                SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_NONE);
                if (m_isDeadByDefault)
                {
                    SetDeathState(JUST_DIED);
                    SetHealth(0);
                    i_motionMaster.Clear();
                    clearUnitState(UNIT_STAT_ALL_DYN_STATES);
                    LoadCreatureAddon(true);
                }
                else
                    SetDeathState(JUST_ALIVED);

                //Call AI respawn virtual function
                if (AI())
                {
                    AI()->JustRespawned();

                    // If the creature AI needs to be re-initialized after respawn, do it now
                    // Useful for swapping AIs on mobs that change entry on respawn
                    if (m_AI_InitializeOnRespawn)
                        AIM_Initialize();
                }

                if (m_zoneScript)
                    m_zoneScript->OnCreatureRespawn(this);

                if (m_isCreatureLinkingTrigger)
                    GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_RESPAWN, this);

                // 5 sec delay before aggro.
                if (!IsLikePlayer())
                    SetTempPacified(5000);

                GetMap()->Add(this);

                if (uint16 poolid = sPoolMgr.IsPartOfAPool<Creature>(GetGUIDLow()))
                {
                    // Will eventually call AddObjectToRemoveList
                    sPoolMgr.UpdatePool<Creature>(*GetMap()->GetPersistentState(), poolid, GetGUIDLow());
                    return;
                }
            }
            break;
        }
        case CORPSE:
        {
            Unit::Update(update_diff, diff);
            if (m_isDeadByDefault)
                break;

            // Youfie - <Nostalrius>
            // Cf. fix de Daemon [c1491] & mon autre bricolage de celui-ci [c1527)
            // Les mobs 11357, 8901, 14826 etc. : ont des minuscules temps de repop. Sans rajouter cette condition, tous les
            // mobs spawn via un event/script despawn (loots avec) au bout de genre 25s, sans qu'on puisse le changer dans la DB car pas de GUID fixe.
            if (m_corpseDecayTimer <= update_diff || (m_respawnTime <= time(nullptr) && GetDBTableGUIDLow() && !IsPet()))
            {
                if (IsInWorld())                            // can be despawned by update pool
                {
                    RemoveCorpse();
                    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Removing corpse... %u ", GetEntry());
                }
            }
            else
            {
                if (skinningForOthersTimer <= update_diff)
                    skinningForOthersTimer = 0;
                else
                    skinningForOthersTimer -= update_diff;
                m_corpseDecayTimer -= update_diff;
                if (m_groupLootId)
                {
                    if (update_diff < m_groupLootTimer)
                        m_groupLootTimer -= update_diff;
                    else
                        StopGroupLoot();
                }
            }
            if (i_AI)
            {
                m_AI_locked = true;
                i_AI->UpdateAI_corpse(diff);
                m_AI_locked = false;
            }

            break;
        }
        case ALIVE:
        {
            if (m_isDeadByDefault)
            {
                if (m_corpseDecayTimer <= update_diff)
                {
                    // since pool system can fail to roll unspawned object, this one can remain spawned, so must set respawn nevertheless
                    if (uint16 poolid = sPoolMgr.IsPartOfAPool<Creature>(GetGUIDLow()))
                        sPoolMgr.UpdatePool<Creature>(*GetMap()->GetPersistentState(), poolid, GetGUIDLow());

                    if (IsInWorld())                        // can be despawned by update pool
                    {
                        RemoveCorpse();
                        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Removing alive corpse... %u ", GetEntry());
                    }
                    else
                        return;
                }
                else
                    m_corpseDecayTimer -= update_diff;
            }

            if (_pacifiedTimer <= update_diff)
                _pacifiedTimer = 0;
            else
                _pacifiedTimer -= update_diff;

            _lastDamageTakenForEvade += update_diff;
            Unit::Update(update_diff, diff);

            if (getVictim())
            {
                float x, y, z;
                GetRespawnCoord(x, y, z, nullptr, nullptr);
                if (GetDistance(x, y, z) > 10.0f)
                    CallForHelp(m_callForHelpDist);
            }

            // creature can be dead after Unit::Update call
            // CORPSE/DEAD state will processed at next tick (in other case death timer will be updated unexpectedly)
            if (!isAlive())
                break;

            float hpPercent = GetHealthPercent();
            ModifyAuraState(AURA_STATE_HEALTHLESS_15_PERCENT, hpPercent < 16.0f);
            ModifyAuraState(AURA_STATE_HEALTHLESS_10_PERCENT, hpPercent < 11.0f);
            ModifyAuraState(AURA_STATE_HEALTHLESS_5_PERCENT, hpPercent < 6.0f);

            bool unreachableTarget = !i_motionMaster.empty() &&
                                     getVictim() &&
                                     GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE &&
                                     !HasDistanceCasterMovement() &&
                                     (!CanReachWithMeleeAttack(getVictim()) || !IsWithinLOSInMap(getVictim())) &&
                                     !GetMotionMaster()->GetCurrent()->IsReachable();
            // No evade mode for pets.
            if (unreachableTarget && GetCharmerOrOwnerGuid().IsPlayer())
                unreachableTarget = false;
            if (unreachableTarget)
                if (getVictim())
                    if (Player* victimPlayer = getVictim()->ToPlayer())
                        if (victimPlayer->GetCheatData() && victimPlayer->GetCheatData()->IsInKnockBack())
                            unreachableTarget = false;
            if (unreachableTarget)
            {
                m_TargetNotReachableTimer += update_diff;
                if (GetMapId() == 30 && CanHaveThreatList() && m_TargetNotReachableTimer > 1000) // Alterac Valley exploit fix
                    getThreatManager().modifyThreatPercent(getVictim(), -101);
            }
            else
                m_TargetNotReachableTimer = 0;

            if (m_combatState && GetCombatTime(false) > sWorld.getConfig(CONFIG_UINT32_LONGCOMBAT))
            {
                LogLongCombat();
                ResetCombatTime(true);
            }

            // Raid bosses do a periodic combat pulse
            if (m_combatState && m_combatWithZoneState)
            {
                if (WorldTimer::tickTime() % 3000 <= update_diff)
                    SetInCombatWithZone(false);
            }

            if (AI())
            {
                // do not allow the AI to be changed during update
                m_AI_locked = true;
                try
                {
                    // Reset after 24 secs
                    if (!GetMap()->IsDungeon() && m_TargetNotReachableTimer > 24000)
                        AI()->EnterEvadeMode();
                    else if (!IsEvadeBecauseTargetNotReachable())
                        AI()->UpdateAI(diff);   // AI not react good at real update delays (while freeze in non-active part of map)
                }
                catch (std::runtime_error& e)
                {
                    sLog.outInfo("[Unit/AI] Crash mob %u map %u", GetEntry(), GetMapId());
                    sLog.outInfo("%s", e.what());
                }
                m_AI_locked = false;
            }

            // creature can be dead after UpdateAI call
            // CORPSE/DEAD state will processed at next tick (in other case death timer will be updated unexpectedly)
            if (!isAlive())
                break;

            RegenerateAll(update_diff, IsEvadeBecauseTargetNotReachable());
            break;
        }
        case CORPSE_FALLING:
        {
            SetDeathState(CORPSE);
        }
        default:
            break;
    }
}

void Creature::StartGroupLoot(Group* group, uint32 timer)
{
    m_groupLootId = group->GetId();
    m_groupLootTimer = timer;
}

void Creature::StopGroupLoot()
{
    if (!m_groupLootId)
        return;

    if (Group* group = sObjectMgr.GetGroupById(m_groupLootId))
        group->EndRoll(&loot);

    m_groupLootTimer = 0;
    m_groupLootId = 0;
}

void Creature::RegenerateAll(uint32 update_diff, bool skipCombatCheck)
{
    m_regenTimer -= update_diff;

    if (m_regenTimer > 0)
        return;

    if (!isInCombat() || IsPolymorphed() || skipCombatCheck)
        RegenerateHealth();

    RegenerateMana();

    m_regenTimer = REGEN_TIME_FULL;
}

void Creature::RegenerateMana()
{
    if (!_manaRegen)
        return;

    uint32 curValue = GetPower(POWER_MANA);
    uint32 maxValue = GetMaxPower(POWER_MANA);

    if (curValue >= maxValue)
        return;

    uint32 addvalue = 0;

    // Combat and any controlled creature
    if (isInCombat() || GetCharmerOrOwnerGuid())
    {
        if (!IsUnderLastManaUseEffect())
            addvalue = m_manaRegen;
    }
    else
        addvalue = maxValue / 3;

    ModifyPower(POWER_MANA, addvalue);
}

void Creature::RegenerateHealth()
{
    if (!IsRegeneratingHealth())
        return;

    uint32 curValue = GetHealth();
    uint32 maxValue = GetMaxHealth();

    if (curValue >= maxValue)
        return;

    uint32 addvalue = 0;

    // Not only pet, but any controlled creature
    if (GetCharmerOrOwnerGuid())
    {
        if (IsPolymorphed())
        {
            addvalue = maxValue / 10;
        }
        else
        {
            float HealthIncreaseRate = sWorld.getConfig(CONFIG_FLOAT_RATE_HEALTH);
            float Spirit = GetStat(STAT_SPIRIT);

            addvalue = uint32(Spirit * 0.25 * HealthIncreaseRate);
            addvalue *= 4; // Le timer tick toutes les 4 secondes.
        }
    }
    else
    {
        addvalue = maxValue / 3;
    }

    ModifyHealth(addvalue);
}

void Creature::DoFlee()
{
    if (!getVictim() || HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    float hpPercent = GetHealthPercent();
    ModifyAuraState(AURA_STATE_HEALTHLESS_15_PERCENT, hpPercent < 16.0f);
    ModifyAuraState(AURA_STATE_HEALTHLESS_10_PERCENT, hpPercent < 11.0f);
    ModifyAuraState(AURA_STATE_HEALTHLESS_5_PERCENT, hpPercent < 6.0f);

    SetNoSearchAssistance(true);

    SetFleeing(true, getVictim()->GetObjectGuid(), 0, sWorld.getConfig(CONFIG_UINT32_CREATURE_FAMILY_FLEE_DELAY));
    MonsterTextEmote(CREATURE_FLEE_TEXT, getVictim());
    UpdateSpeed(MOVE_RUN, false);
    InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
}

void Creature::DoFleeToGetAssistance()
{
    if (!getVictim() || HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    float radius = sWorld.getConfig(CONFIG_FLOAT_CREATURE_FAMILY_FLEE_ASSISTANCE_RADIUS);

    if (radius > 0)
    {
        Creature* pCreature = nullptr;

        MaNGOS::NearestAssistCreatureInCreatureRangeCheck u_check(this, getVictim(), radius);
        MaNGOS::CreatureLastSearcher<MaNGOS::NearestAssistCreatureInCreatureRangeCheck> searcher(pCreature, u_check);
        Cell::VisitGridObjects(this, searcher, radius);

        SetNoSearchAssistance(true);

        if (!pCreature)
            SetFleeing(true, getVictim()->GetObjectGuid(), 0, sWorld.getConfig(CONFIG_UINT32_CREATURE_FAMILY_FLEE_DELAY));
        else
        {
            GetMotionMaster()->MoveSeekAssistance(pCreature->GetPositionX(), pCreature->GetPositionY(), pCreature->GetPositionZ());
            SetTargetGuid(ObjectGuid());
        }
        MonsterTextEmote(CREATURE_FLEE_TEXT, getVictim());
        UpdateSpeed(MOVE_RUN, false);
        InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
    }
}


float Creature::GetFleeingSpeed() const
{
    //TODO: There are different speeds for the different mobs, isn't there?
    return GetSpeed(MOVE_RUN);
}

bool Creature::AIM_Initialize()
{
    // make sure nothing can change the AI during AI update
    if (m_AI_locked)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "AIM_Initialize: failed to init, locked.");
        return false;
    }

    // Clear flag. Escort AI will set it if this creature is escortable
    _isEscortable = false;

    i_motionMaster.Initialize();

    CreatureAI * oldAI = i_AI;
    i_AI = FactorySelector::selectAI(this);

    delete oldAI;
    return true;
}

bool Creature::Create(uint32 guidlow, CreatureCreatePos& cPos, CreatureInfo const* cinfo, Team team /*= TEAM_NONE*/, const CreatureData *data /*= NULL*/, GameEventCreatureData const* eventData /*= NULL*/)
{
    SetMap(cPos.GetMap());

    if (!CreateFromProto(guidlow, cinfo, team, data, eventData))
        return false;

    cPos.SelectFinalPoint(this);

    if (!cPos.Relocate(this))
        return false;

    switch (GetCreatureInfo()->rank)
    {
        case CREATURE_ELITE_RARE:
            m_corpseDelay = sWorld.getConfig(CONFIG_UINT32_CORPSE_DECAY_RARE);
            break;
        case CREATURE_ELITE_ELITE:
            m_corpseDelay = sWorld.getConfig(CONFIG_UINT32_CORPSE_DECAY_ELITE);
            break;
        case CREATURE_ELITE_RAREELITE:
            m_corpseDelay = sWorld.getConfig(CONFIG_UINT32_CORPSE_DECAY_RAREELITE);
            break;
        case CREATURE_ELITE_WORLDBOSS:
            m_corpseDelay = sWorld.getConfig(CONFIG_UINT32_CORPSE_DECAY_WORLDBOSS);
            break;
        default:
            m_corpseDelay = sWorld.getConfig(CONFIG_UINT32_CORPSE_DECAY_NORMAL);
            break;
    }

    // Apply Poison & Disease immunities for Elemental and Mechanical type creatures
    if (GetCreatureInfo()->type == CREATURE_TYPE_ELEMENTAL || (GetCreatureInfo()->type == CREATURE_TYPE_MECHANICAL))
    {
        ApplySpellImmune(0, IMMUNITY_DISPEL, DISPEL_DISEASE, true);
        ApplySpellImmune(0, IMMUNITY_DISPEL, DISPEL_POISON, true);
    }

    // Add to CreatureLinkingHolder if needed
    if (sCreatureLinkingMgr.GetLinkedTriggerInformation(this))
        cPos.GetMap()->GetCreatureLinkingHolder()->AddSlaveToHolder(this);
    if (sCreatureLinkingMgr.IsLinkedEventTrigger(this))
    {
        m_isCreatureLinkingTrigger = true;
        cPos.GetMap()->GetCreatureLinkingHolder()->AddMasterToHolder(this);
    }

    LoadCreatureAddon();
    InitializeReactState();
    return true;
}

bool Creature::IsTrainerOf(Player* pPlayer, bool msg) const
{
    if (!isTrainer())
        return false;

    TrainerSpellData const* cSpells = GetTrainerSpells();
    TrainerSpellData const* tSpells = GetTrainerTemplateSpells();

    // for not pet trainer expected not empty trainer list always
    if ((!cSpells || cSpells->spellList.empty()) && (!tSpells || tSpells->spellList.empty()))
    {
        sLog.outErrorDb("Creature %u (Entry: %u) have UNIT_NPC_FLAG_TRAINER but have empty trainer spell list.",
                        GetGUIDLow(), GetEntry());
        return false;
    }

    switch (GetCreatureInfo()->trainer_type)
    {
        case TRAINER_TYPE_CLASS:
            if (pPlayer->getClass() != GetCreatureInfo()->trainer_class)
            {
                if (msg)
                {
                    pPlayer->PlayerTalkClass->ClearMenus();
                    switch (GetCreatureInfo()->trainer_class)
                    {
                        case CLASS_DRUID:
                            pPlayer->PlayerTalkClass->SendGossipMenu(4913, GetObjectGuid());
                            break;
                        case CLASS_HUNTER:
                            pPlayer->PlayerTalkClass->SendGossipMenu(10090, GetObjectGuid());
                            break;
                        case CLASS_MAGE:
                            pPlayer->PlayerTalkClass->SendGossipMenu(328, GetObjectGuid());
                            break;
                        case CLASS_PALADIN:
                            pPlayer->PlayerTalkClass->SendGossipMenu(1635, GetObjectGuid());
                            break;
                        case CLASS_PRIEST:
                            pPlayer->PlayerTalkClass->SendGossipMenu(4436, GetObjectGuid());
                            break;
                        case CLASS_ROGUE:
                            pPlayer->PlayerTalkClass->SendGossipMenu(4797, GetObjectGuid());
                            break;
                        case CLASS_SHAMAN:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5003, GetObjectGuid());
                            break;
                        case CLASS_WARLOCK:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5836, GetObjectGuid());
                            break;
                        case CLASS_WARRIOR:
                            pPlayer->PlayerTalkClass->SendGossipMenu(4985, GetObjectGuid());
                            break;
                    }
                }
                return false;
            }
            break;
        case TRAINER_TYPE_PETS:
            if (pPlayer->getClass() != CLASS_HUNTER)
            {
                if (msg)
                {
                    pPlayer->PlayerTalkClass->ClearMenus();
                    pPlayer->PlayerTalkClass->SendGossipMenu(3620, GetObjectGuid());
                }
                return false;
            }
            break;
        case TRAINER_TYPE_MOUNTS:
            if (GetCreatureInfo()->trainer_race && pPlayer->getRace() != GetCreatureInfo()->trainer_race)
            {
                // Allowed to train if exalted
                if (FactionTemplateEntry const* faction_template = getFactionTemplateEntry())
                {
                    if (pPlayer->GetReputationRank(faction_template->faction) == REP_EXALTED)
                        return true;
                }

                if (msg)
                {
                    pPlayer->PlayerTalkClass->ClearMenus();
                    switch (GetCreatureInfo()->trainer_class)
                    {
                        case RACE_DWARF:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5865, GetObjectGuid());
                            break;
                        case RACE_GNOME:
                            pPlayer->PlayerTalkClass->SendGossipMenu(4881, GetObjectGuid());
                            break;
                        case RACE_HUMAN:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5861, GetObjectGuid());
                            break;
                        case RACE_NIGHTELF:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5862, GetObjectGuid());
                            break;
                        case RACE_ORC:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5863, GetObjectGuid());
                            break;
                        case RACE_TAUREN:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5864, GetObjectGuid());
                            break;
                        case RACE_TROLL:
                            pPlayer->PlayerTalkClass->SendGossipMenu(5816, GetObjectGuid());
                            break;
                        case RACE_UNDEAD:
                            pPlayer->PlayerTalkClass->SendGossipMenu(624, GetObjectGuid());
                            break;
                    }
                }
                return false;
            }
            break;
        case TRAINER_TYPE_TRADESKILLS:
            if (GetCreatureInfo()->trainer_spell && !pPlayer->HasSpell(GetCreatureInfo()->trainer_spell))
            {
                if (msg)
                {
                    pPlayer->PlayerTalkClass->ClearMenus();
                    pPlayer->PlayerTalkClass->SendGossipMenu(11031, GetObjectGuid());
                }
                return false;
            }
            break;
        default:
            return false;                                   // checked and error output at creature_template loading
    }
    return true;
}

bool Creature::CanInteractWithBattleMaster(Player* pPlayer, bool msg) const
{
    if (!isBattleMaster())
        return false;

    BattleGroundTypeId bgTypeId = sBattleGroundMgr.GetBattleMasterBG(GetEntry());
    if (bgTypeId == BATTLEGROUND_TYPE_NONE)
        return false;

    if (!msg)
        return pPlayer->GetBGAccessByLevel(bgTypeId);

    if (!pPlayer->GetBGAccessByLevel(bgTypeId))
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (bgTypeId)
        {
            case BATTLEGROUND_AV:
                pPlayer->PlayerTalkClass->SendGossipMenu(7616, GetObjectGuid());
                break;
            case BATTLEGROUND_WS:
                pPlayer->PlayerTalkClass->SendGossipMenu(7599, GetObjectGuid());
                break;
            case BATTLEGROUND_AB:
                pPlayer->PlayerTalkClass->SendGossipMenu(7642, GetObjectGuid());
                break;
            default:
                break;
        }
        return false;
    }
    return true;
}

bool Creature::CanTrainAndResetTalentsOf(Player* pPlayer) const
{
    return pPlayer->getLevel() >= 10
           && GetCreatureInfo()->trainer_type == TRAINER_TYPE_CLASS
           && pPlayer->getClass() == GetCreatureInfo()->trainer_class;
}

/**
 * Return original player who tap creature, it can be different from player/group allowed to loot so not use it for loot code
 */
Player* Creature::GetOriginalLootRecipient() const
{
    return m_lootRecipientGuid ? ObjectAccessor::FindPlayer(m_lootRecipientGuid) : NULL;
}

/**
 * Return group if player tap creature as group member, independent is player after leave group or stil be group member
 */
Group* Creature::GetGroupLootRecipient() const
{
    // original recipient group if set and not disbanded
    return m_lootGroupRecipientId ? sObjectMgr.GetGroupById(m_lootGroupRecipientId) : NULL;
}

/**
 * Return player who can loot tapped creature (member of group or single player)
 *
 * In case when original player tap creature as group member then group tap prefered.
 * This is for example important if player after tap leave group.
 * If group not exist or disbanded or player tap creature not as group member return player
 */
Player* Creature::GetLootRecipient() const
{
    // original recipient group if set and not disbanded
    Group* group = GetGroupLootRecipient();

    // original recipient player if online
    Player* player = GetOriginalLootRecipient();

    // if group not set or disbanded return original recipient player if any
    if (!group)
        return player;

    // group case

    // return player if it still be in original recipient group
    if (player && player->GetGroup() == group)
        return player;

    // find any in group
    for (GroupReference *itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
        if (Player *p = itr->getSource())
            return p;

    return nullptr;
}

/**
 * Set player and group (if player group member) who tap creature
 */
void Creature::SetLootRecipient(Unit *unit)
{
    // set the player whose group should receive the right
    // to loot the creature after it dies
    // should be set to NULL after the loot disappears

    if (!unit)
    {
        m_lootRecipientGuid.Clear();
        m_lootGroupRecipientId = 0;
        RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TAPPED | UNIT_DYNFLAG_LOOTABLE);
        return;
    }

    Player* player = unit->GetCharmerOrOwnerPlayerOrPlayerItself();
    if (!player)                                            // normal creature, no player involved
        return;

    // set player for non group case or if group will disbanded
    if (unit->IsPet())
        m_lootRecipientGuid = unit->GetObjectGuid();
    else
        m_lootRecipientGuid = player->GetObjectGuid();

    // set group for group existing case including if player will leave group at loot time
    if (Group* group = player->GetGroup())
        m_lootGroupRecipientId = group->GetId();

    SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TAPPED);
}

// return true if this creature is tapped by the player or by a member of his group.
bool Creature::IsTappedBy(Player const* player) const
{
    ASSERT(player);

    if (player->GetObjectGuid() == m_lootRecipientGuid)
        return true;

    if (m_lootRecipientGuid && player->GetPetGuid() == m_lootRecipientGuid)
        return true;

    Group const* playerGroup = player->GetGroup();
    if (playerGroup && playerGroup->isBGGroup())
        return true;

    if (!playerGroup || playerGroup != GetGroupLootRecipient()) // if we dont have a group we arent the recipient
        return false;                                           // if creature doesnt have group bound it means it was solo killed by someone else

    return true;
}

void Creature::SaveToDB()
{
    // this should only be used when the creature has already been loaded
    // preferably after adding to map, because mapid may not be valid otherwise
    CreatureData const *data = sObjectMgr.GetCreatureData(GetGUIDLow());
    if (!data)
    {
        sLog.outError("Creature::SaveToDB failed, cannot get creature data!");
        return;
    }

    SaveToDB(GetMapId());
}

void Creature::SaveToDB(uint32 mapid)
{
    // update in loaded data
    CreatureData& data = sObjectMgr.NewOrExistCreatureData(GetGUIDLow());

    uint32 displayId = GetNativeDisplayId();

    // check if it's a custom model and if not, use 0 for displayId
    CreatureInfo const *cinfo = GetCreatureInfo();
    if (cinfo)
    {
        if (displayId != cinfo->ModelId[0] && displayId != cinfo->ModelId[1] && displayId != cinfo->ModelId[2] && displayId != cinfo->ModelId[3])
        {
            for (int i = 0; i < MAX_CREATURE_MODEL && displayId; ++i)
                if (cinfo->ModelId[i])
                    if (CreatureModelInfo const *minfo = sObjectMgr.GetCreatureModelInfo(cinfo->ModelId[i]))
                        if (displayId == minfo->modelid_other_gender)
                            displayId = 0;
        }
        else
            displayId = 0;
    }

    // data->guid = guid don't must be update at save
    data.id = GetEntry();
    data.mapid = mapid;
    data.modelid_override = displayId;
    data.equipmentId = GetEquipmentId();
    data.posX = GetPositionX();
    data.posY = GetPositionY();
    data.posZ = GetPositionZ();
    data.orientation = GetOrientation();
    data.spawntimesecsmin = m_respawnDelay;
    data.spawntimesecsmax = m_respawnDelay;
    // prevent add data integrity problems
    data.spawndist = GetDefaultMovementType() == IDLE_MOTION_TYPE ? 0 : m_respawnradius;
    data.currentwaypoint = 0;
    data.curhealth = GetHealth();
    data.curmana = GetPower(POWER_MANA);
    data.is_dead = m_isDeadByDefault;
    // prevent add data integrity problems
    data.movementType = !m_respawnradius && GetDefaultMovementType() == RANDOM_MOTION_TYPE
                        ? IDLE_MOTION_TYPE : GetDefaultMovementType();
    data.spawnFlags = m_isActiveObject ? SPAWN_FLAG_ACTIVE : 0;

    // updated in DB
    WorldDatabase.BeginTransaction();

    WorldDatabase.PExecuteLog("DELETE FROM creature WHERE guid=%u", GetGUIDLow());

    std::ostringstream ss;
    ss << "INSERT INTO creature VALUES ("
       << GetGUIDLow() << ","
       << GetEntry() << ","
       << mapid << ","
       << displayId << ","
       << GetEquipmentId() << ","
       << GetPositionX() << ","
       << GetPositionY() << ","
       << GetPositionZ() << ","
       << GetOrientation() << ","
       << data.spawntimesecsmin << ","                     // respawn time minimum
       << data.spawntimesecsmax << ","                     // respawn time maximum
       << (float) m_respawnradius << ","                   //spawn distance (float)
       << (uint32)(0) << ","                               //currentwaypoint
       << GetHealth() << ","                               //curhealth
       << GetPower(POWER_MANA) << ","                      //curmana
       << (m_isDeadByDefault ? 1 : 0) << ","               //is_dead
       << GetDefaultMovementType() << ","                 //default movement generator type
       << m_isActiveObject << ","
       << m_visibilityModifier << ","
       << "0,"                                             //patch_min
       << "10)";                                           //patch_max

    WorldDatabase.PExecuteLog("%s", ss.str().c_str());

    WorldDatabase.CommitTransaction();
}

void Creature::SelectLevel(const CreatureInfo *cinfo, float percentHealth, float percentMana)
{
    uint32 rank = IsPet() ? 0 : cinfo->rank;

    // level
    uint32 minlevel = std::min(cinfo->maxlevel, cinfo->minlevel);
    uint32 maxlevel = std::max(cinfo->maxlevel, cinfo->minlevel);
    uint32 level = minlevel == maxlevel ? minlevel : urand(minlevel, maxlevel);
    SetLevel(level);

    float rellevel = maxlevel == minlevel ? 0 : (float(level - minlevel)) / (maxlevel - minlevel);

    // health
    float healthmod = _GetHealthMod(rank);

    uint32 minhealth = std::min(cinfo->maxhealth, cinfo->minhealth);
    uint32 maxhealth = std::max(cinfo->maxhealth, cinfo->minhealth);
    uint32 health = uint32(healthmod * (minhealth + uint32(rellevel * (maxhealth - minhealth))));

    SetCreateHealth(health);
    SetMaxHealth(health);

    if (percentHealth == 100.0f)
        SetHealth(health);
    else
        SetHealthPercent(percentHealth);

    // mana
    uint32 minmana = std::min(cinfo->maxmana, cinfo->minmana);
    uint32 maxmana = std::max(cinfo->maxmana, cinfo->minmana);
    uint32 mana = minmana + uint32(rellevel * (maxmana - minmana));

    SetCreateMana(mana);
    SetMaxPower(POWER_MANA, mana);                          //MAX Mana
    SetPower(POWER_MANA, mana);

    // TODO: set UNIT_FIELD_POWER*, for some creature class case (energy, etc)

    SetModifierValue(UNIT_MOD_HEALTH, BASE_VALUE, float(health));
    SetModifierValue(UNIT_MOD_MANA, BASE_VALUE, float(mana));

    // damage
    float damagemod = _GetDamageMod(rank);

    SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, cinfo->mindmg * damagemod);
    SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, cinfo->maxdmg * damagemod);

    SetBaseWeaponDamage(OFF_ATTACK, MINDAMAGE, cinfo->mindmg * damagemod);
    SetBaseWeaponDamage(OFF_ATTACK, MAXDAMAGE, cinfo->maxdmg * damagemod);

    SetFloatValue(UNIT_FIELD_MINRANGEDDAMAGE, cinfo->minrangedmg * damagemod);
    SetFloatValue(UNIT_FIELD_MAXRANGEDDAMAGE, cinfo->maxrangedmg * damagemod);

    SetModifierValue(UNIT_MOD_ATTACK_POWER, BASE_VALUE, cinfo->attackpower * damagemod);
}

float Creature::_GetHealthMod(int32 Rank)
{
    switch (Rank)                                           // define rates for each elite rank
    {
        case CREATURE_ELITE_NORMAL:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_NORMAL_HP);
        case CREATURE_ELITE_ELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_HP);
        case CREATURE_ELITE_RAREELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_HP);
        case CREATURE_ELITE_WORLDBOSS:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_HP);
        case CREATURE_ELITE_RARE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_HP);
        default:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_HP);
    }
}

float Creature::_GetDamageMod(int32 Rank)
{
    switch (Rank)                                           // define rates for each elite rank
    {
        case CREATURE_ELITE_NORMAL:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_NORMAL_DAMAGE);
        case CREATURE_ELITE_ELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_DAMAGE);
        case CREATURE_ELITE_RAREELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_DAMAGE);
        case CREATURE_ELITE_WORLDBOSS:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_DAMAGE);
        case CREATURE_ELITE_RARE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_DAMAGE);
        default:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_DAMAGE);
    }
}

float Creature::GetSpellDamageMod(int32 Rank)
{
    switch (Rank)                                           // define rates for each elite rank
    {
        case CREATURE_ELITE_NORMAL:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_NORMAL_SPELLDAMAGE);
        case CREATURE_ELITE_ELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_SPELLDAMAGE);
        case CREATURE_ELITE_RAREELITE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_SPELLDAMAGE);
        case CREATURE_ELITE_WORLDBOSS:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_SPELLDAMAGE);
        case CREATURE_ELITE_RARE:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_SPELLDAMAGE);
        default:
            return sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_SPELLDAMAGE);
    }
}

bool Creature::CreateFromProto(uint32 guidlow, CreatureInfo const* cinfo, Team team, const CreatureData *data /*=NULL*/, GameEventCreatureData const* eventData /*=NULL*/)
{
    SetZoneScript();
    m_originalEntry = cinfo->Entry;

    Object::_Create(guidlow, cinfo->Entry, cinfo->GetHighGuid());

    if (!UpdateEntry(cinfo->Entry, team, data, eventData, false))
        return false;

    return true;
}

bool Creature::LoadFromDB(uint32 guidlow, Map *map)
{
    CreatureData const* data = sObjectMgr.GetCreatureData(guidlow);

    if (!data)
    {
        sLog.outErrorDb("Creature (GUID: %u) not found in table `creature`, can't load. ", guidlow);
        return false;
    }
    if (data->spawnFlags & SPAWN_FLAG_DISABLED)
        return false;

    CreatureInfo const *cinfo = ObjectMgr::GetCreatureTemplate(data->id);
    if (!cinfo)
    {
        sLog.outErrorDb("Creature (Entry: %u) not found in table `creature_template`, can't load. ", data->id);
        return false;
    }

    GameEventCreatureData const* eventData = sGameEventMgr.GetCreatureUpdateDataForActiveEvent(guidlow);

    // Creature can be loaded already in map if grid has been unloaded while creature walk to another grid
    if (map->GetCreature(cinfo->GetObjectGuid(guidlow)))
        return false;

    CreatureCreatePos pos(map, data->posX, data->posY, data->posZ, data->orientation);
    SetHomePosition(data->posX, data->posY, data->posZ, data->orientation);

    if (!Create(guidlow, pos, cinfo, TEAM_NONE, data, eventData))
        return false;

    m_respawnradius = data->spawndist;

    m_respawnDelay = data->GetRandomRespawnTime();
    m_isDeadByDefault = data->is_dead;
    m_deathState = m_isDeadByDefault ? DEAD : ALIVE;
    m_isActiveObject = data->spawnFlags & SPAWN_FLAG_ACTIVE;
    m_visibilityModifier = data->visibilityModifier;

    m_respawnTime  = map->GetPersistentState()->GetCreatureRespawnTime(GetGUIDLow());

    if (m_respawnTime > time(nullptr))                         // not ready to respawn
    {
        m_deathState = DEAD;
        if (CanFly())
        {
            float tz = GetMap()->GetHeight(data->posX, data->posY, data->posZ, false);
            if (data->posZ - tz > 0.1)
                Relocate(data->posX, data->posY, tz);
        }
    }
    else if (m_respawnTime)                                 // respawn time set but expired
    {
        m_respawnTime = 0;

        GetMap()->GetPersistentState()->SaveCreatureRespawnTime(GetGUIDLow(), 0);
    }

    uint32 curhealth = data->curhealth;
    if (curhealth)
    {
        curhealth = uint32(curhealth * _GetHealthMod(GetCreatureInfo()->rank));
        if (curhealth < 1)
            curhealth = 1;
    }

    if (sCreatureLinkingMgr.IsSpawnedByLinkedMob(this))
    {
        m_isSpawningLinked = true;
        if (m_deathState == ALIVE && !GetMap()->GetCreatureLinkingHolder()->CanSpawn(this))
        {
            m_deathState = DEAD;

            // Just set to dead, so need to relocate like above
            if (CanFly())
            {
                float tz = GetTerrain()->GetHeightStatic(data->posX, data->posY, data->posZ, false);
                if (data->posZ - tz > 0.1)
                    Relocate(data->posX, data->posY, tz);
            }
        }
    }

    SetHealth(m_deathState == ALIVE ? curhealth : 0);
    SetPower(POWER_MANA, data->curmana);

    // checked at creature_template loading
    m_defaultMovementType = MovementGeneratorType(data->movementType);

    // Creature Linking, Initial load is handled like respawn
    if (m_isCreatureLinkingTrigger && isAlive())
        GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_RESPAWN, this);

    if (data->spawnFlags & SPAWN_FLAG_NOT_VISIBLE)
        SetVisibility(VISIBILITY_OFF);

    return true;
}

void Creature::LoadEquipment(uint32 equip_entry, bool force)
{
    if (equip_entry == 0)
    {
        if (force)
        {
            for (uint8 i = 0; i < MAX_VIRTUAL_ITEM_SLOT; ++i)
                SetVirtualItem(VirtualItemSlot(i), 0);
            m_equipmentId = 0;
        }
        return;
    }

    if (EquipmentInfo const *einfo = sObjectMgr.GetEquipmentInfo(equip_entry))
    {
        m_equipmentId = equip_entry;
        for (uint8 i = 0; i < MAX_VIRTUAL_ITEM_SLOT; ++i)
            SetVirtualItem(VirtualItemSlot(i), einfo->equipentry[i]);
    }
    else if (EquipmentInfoRaw const *einfo = sObjectMgr.GetEquipmentInfoRaw(equip_entry))
    {
        m_equipmentId = equip_entry;
        for (uint8 i = 0; i < MAX_VIRTUAL_ITEM_SLOT; ++i)
            SetVirtualItemRaw(VirtualItemSlot(i), einfo->equipmodel[i], einfo->equipinfo[i], einfo->equipslot[i]);
    }
}

bool Creature::HasQuest(uint32 quest_id) const
{
    QuestRelationsMapBounds bounds = sObjectMgr.GetCreatureQuestRelationsMapBounds(GetEntry());
    for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second == quest_id)
            return true;
    }
    return false;
}

bool Creature::HasInvolvedQuest(uint32 quest_id) const
{
    QuestRelationsMapBounds bounds = sObjectMgr.GetCreatureQuestInvolvedRelationsMapBounds(GetEntry());
    for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second == quest_id)
            return true;
    }
    return false;
}


struct CreatureRespawnDeleteWorker
{
    explicit CreatureRespawnDeleteWorker(uint32 guid) : i_guid(guid) {}

    void operator()(MapPersistentState* state) const
    {
        state->SaveCreatureRespawnTime(i_guid, 0);
    }

    uint32 i_guid;
};

void Creature::DeleteFromDB()
{
    CreatureData const* data = sObjectMgr.GetCreatureData(GetGUIDLow());
    if (!data)
    {
        DEBUG_LOG("Trying to delete not saved creature!");
        return;
    }

    DeleteFromDB(GetGUIDLow(), data);
}

void Creature::DeleteFromDB(uint32 lowguid, CreatureData const* data)
{
    auto instanceId = sMapMgr.GetContinentInstanceId(data->mapid, data->posX, data->posY);
    CreatureRespawnDeleteWorker worker(lowguid);
    sMapPersistentStateMgr.DoForAllStatesWithMapId(data->mapid, instanceId, worker);

    sObjectMgr.DeleteCreatureData(lowguid);

    WorldDatabase.BeginTransaction();
    WorldDatabase.PExecuteLog("DELETE FROM creature WHERE guid=%u", lowguid);
    WorldDatabase.PExecuteLog("DELETE FROM creature_addon WHERE guid=%u", lowguid);
    WorldDatabase.PExecuteLog("DELETE FROM creature_movement WHERE id=%u", lowguid);
    WorldDatabase.PExecuteLog("DELETE FROM game_event_creature WHERE guid=%u", lowguid);
    WorldDatabase.PExecuteLog("DELETE FROM game_event_creature_data WHERE guid=%u", lowguid);
    WorldDatabase.PExecuteLog("DELETE FROM creature_battleground WHERE guid=%u", lowguid);
    WorldDatabase.CommitTransaction();
}

float Creature::GetAttackDistance(Unit const* pl) const
{
    float aggroRate = sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
    if (aggroRate == 0)
        return 0.0f;

    uint32 playerlevel   = pl->GetLevelForTarget(this);
    uint32 creaturelevel = GetLevelForTarget(pl);

    int32 leveldif       = int32(playerlevel) - int32(creaturelevel);

    // "The maximum Aggro Radius has a cap of 25 levels under. Example: A level 30 char has the same Aggro Radius of a level 5 char on a level 60 mob."
    if (leveldif < - 25)
        leveldif = -25;

    // "The aggro radius of a mob having the same level as the player is roughly 20 yards"
    float RetDistance = 20;

    // "Aggro Radius varies with level difference at a rate of roughly 1 yard/level"
    // radius grow if playlevel < creaturelevel
    RetDistance -= (float)leveldif;

    // detect range auras
    // SPELL_AURA_MOD_DETECT_RANGE: Par exemple [2908 - Apaiser les animaux]. Affecte uniquement si niveau < 70 par exemple (rang 3).
    AuraList const& nModDetectRange = GetAurasByType(SPELL_AURA_MOD_DETECT_RANGE);
    for (AuraList::const_iterator i = nModDetectRange.begin(); i != nModDetectRange.end(); ++i)
        if ((*i)->GetSpellProto()->MaxTargetLevel >= getLevel())
            RetDistance += (*i)->GetModifier()->m_amount;

    // detected range auras
    RetDistance += pl->GetTotalAuraModifier(SPELL_AURA_MOD_DETECTED_RANGE);

    // "Minimum Aggro Radius for a mob seems to be combat range (5 yards)"
    if (RetDistance < 5)
        RetDistance = 5;

    // Youfie <Nostalrius> Baron Rivendare
    if ((GetEntry() == 10440))
        RetDistance = 2;

    return (RetDistance * aggroRate);
}

void Creature::SetDeathState(DeathState s)
{
    if ((s == JUST_DIED && !m_isDeadByDefault) || (s == JUST_ALIVED && m_isDeadByDefault))
    {
        auto data = sObjectMgr.GetCreatureData(GetGUIDLow());

        uint32 respawnDelay = m_respawnDelay;
        ApplyDynamicRespawnDelay(respawnDelay, data);
        m_corpseDecayTimer = m_corpseDelay * IN_MILLISECONDS; // the max/default time for corpse decay (before creature is looted/AllLootRemovedFromCorpse() is called)

        if (data)
        {
            if (data->spawnFlags & SPAWN_FLAG_RANDOM_RESPAWN_TIME)
                respawnDelay *= float(urand(90, 110)) / 100.0f;
            if (data->spawnFlags & SPAWN_FLAG_DYNAMIC_RESPAWN_TIME && sWorld.GetActiveSessionCount() > BLIZZLIKE_REALM_POPULATION)
                respawnDelay *= float(BLIZZLIKE_REALM_POPULATION) / float(sWorld.GetActiveSessionCount());
        }
        m_respawnTime = time(nullptr) + respawnDelay;        // respawn delay (spawntimesecs)

        // always save boss respawn time at death to prevent crash cheating
        if (sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY) || IsWorldBoss())
            SaveRespawnTime();
    }

    Unit::SetDeathState(s);

    if (s == JUST_DIED)
    {
        SetTargetGuid(ObjectGuid());                        // remove target selection in any cases (can be set at aura remove in Unit::SetDeathState)
        SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);

        if (!IsPet() && GetCreatureInfo()->SkinLootId)
            if (LootTemplates_Skinning.HaveLootFor(GetCreatureInfo()->SkinLootId))
                if (HasLootRecipient())
                    SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);

        if (HasSearchedAssistance())
        {
            SetNoSearchAssistance(false);
            UpdateSpeed(MOVE_RUN, false);
        }

        // return, since we promote to CORPSE_FALLING. CORPSE_FALLING is promoted to CORPSE at next update.
        if (CanFly() && FallGround())
            return;

        Unit::SetDeathState(CORPSE);
    }

    if (s == JUST_ALIVED)
    {
        clearUnitState(UNIT_STAT_ALL_STATE);

        CreatureInfo const *cinfo = GetCreatureInfo();

        SetHealth(GetMaxHealth());
        SetLootRecipient(nullptr);

        if (GetTemporaryFactionFlags() & TEMPFACTION_RESTORE_RESPAWN)
            ClearTemporaryFaction();

        Unit::SetDeathState(ALIVE);

        SetMeleeDamageSchool(SpellSchools(cinfo->dmgschool));

        // Dynamic flags may be adjusted by spells. Clear them
        // first and let spell from *addon apply where needed.
        SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_NONE);
        LoadCreatureAddon(true);

        // Flags after LoadCreatureAddon. Any spell in *addon
        // will not be able to adjust these.
        SetUInt32Value(UNIT_NPC_FLAGS, cinfo->npcflag);
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);

        SetWalk(true, true);
        i_motionMaster.Initialize();
    }
}

bool Creature::FallGround()
{
    // Only if state is JUST_DIED. CORPSE_FALLING is set below and promoted to CORPSE later
    if (getDeathState() != JUST_DIED)
        return false;

    // use larger distance for vmap height search than in most other cases
    float tz = GetMap()->GetHeight(GetPositionX(), GetPositionY(), GetPositionZ(), true, MAX_FALL_DISTANCE);

    if (tz <= INVALID_HEIGHT)
    {
        DEBUG_LOG("FallGround: creature %u at map %u (x: %f, y: %f, z: %f), not able to retrive a proper GetHeight (z: %f).",
                  GetEntry(), GetMap()->GetId(), GetPositionX(), GetPositionX(), GetPositionZ(), tz);
        return false;
    }

    float Z = fabs(GetPositionZ() - tz);
    // Abort too if the ground is very near
    if (Z < 0.1f || Z >= fabs(INVALID_HEIGHT))
        return false;

    Unit::SetDeathState(CORPSE_FALLING);

    // For creatures that are moving towards target and dies, the visual effect is not nice.
    // It is possibly caused by a xyz mismatch in DestinationHolder's GetLocationNow and the location
    // of the mob in client. For mob that are already reached target or dies while not moving
    // the visual appear to be fairly close to the expected.

    Movement::MoveSplineInit init(*this, "FallGround");
    init.MoveTo(GetPositionX(), GetPositionY(), tz);
    init.SetFall();
    init.Launch();
    return true;
}

void Creature::Respawn()
{
    RemoveCorpse();

    // forced recreate creature object at clients
    UnitVisibility currentVis = GetVisibility();
    SetVisibility(VISIBILITY_RESPAWN);
    SetUnitMovementFlags(MOVEFLAG_NONE);
    UpdateObjectVisibility();
    SetVisibility(currentVis);                              // restore visibility state
    UpdateObjectVisibility();

    if (IsDespawned())
    {
        if (HasStaticDBSpawnData())
            GetMap()->GetPersistentState()->SaveCreatureRespawnTime(GetGUIDLow(), 0);
        m_respawnTime = time(nullptr);                         // respawn at next tick
    }

    if (CreatureGroup* group = GetCreatureGroup())
        group->OnRespawn(this);
}

void Creature::ForcedDespawn(uint32 timeMSToDespawn)
{
    if (timeMSToDespawn)
    {
        ForcedDespawnDelayEvent *pEvent = new ForcedDespawnDelayEvent(*this);

        m_Events.AddEvent(pEvent, m_Events.CalculateTime(timeMSToDespawn));
        return;
    }

    if (isAlive())
        SetDeathState(JUST_DIED);

    RemoveCorpse();
    SetHealth(0);                                           // just for nice GM-mode view
}

bool Creature::IsImmuneToSpell(SpellEntry const *spellInfo, bool castOnSelf)
{
    if (!spellInfo)
        return false;

    if (!castOnSelf)
    {
        if (spellInfo->Mechanic && GetCreatureInfo()->MechanicImmuneMask & (1 << (spellInfo->Mechanic - 1)))
            return true;

        if (GetCreatureInfo()->SchoolImmuneMask & (1 << spellInfo->School))
            return true;
    }

    // HACK!
    if (IsWorldBoss())
    {
        if (spellInfo->IsFitToFamily<SPELLFAMILY_HUNTER, CF_HUNTER_SCORPID_STING>())
            return true;

        switch (spellInfo->Id)
        {
        case 67:              // Vindication
        case 26017:
        case 26018:
            return true;
        }
    }

    return Unit::IsImmuneToSpell(spellInfo, castOnSelf);
}

bool Creature::IsImmuneToDamage(SpellSchoolMask meleeSchoolMask, SpellEntry const* spellInfo)
{
    if (GetCreatureInfo()->SchoolImmuneMask & meleeSchoolMask)
        return true;

    return Unit::IsImmuneToDamage(meleeSchoolMask, spellInfo);
}

// hacky - seems to be the only way of doing this without wasting more time
void Creature::SetTauntImmunity(bool immune)
{
    if (immune)
    {
        auto info = const_cast<CreatureInfo*>(m_creatureInfo);
        info->flags_extra |= CREATURE_FLAG_EXTRA_NOT_TAUNTABLE;
    }
    else
    {
        auto info = const_cast<CreatureInfo*>(m_creatureInfo);
        info->flags_extra ^= CREATURE_FLAG_EXTRA_NOT_TAUNTABLE;
    }
}

bool Creature::IsImmuneToSpellEffect(SpellEntry const *spellInfo, SpellEffectIndex index, bool castOnSelf) const
{
    if (!castOnSelf && spellInfo->EffectMechanic[index] && GetCreatureInfo()->MechanicImmuneMask & (1 << (spellInfo->EffectMechanic[index] - 1)))
        return true;

    // Taunt immunity special flag check
    if (GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NOT_TAUNTABLE)
    {
        // Taunt aura apply check
        if (spellInfo->Effect[index] == SPELL_EFFECT_APPLY_AURA)
        {
            if (spellInfo->EffectApplyAuraName[index] == SPELL_AURA_MOD_TAUNT)
                return true;
        }
        // Spell effect taunt check
        else if (spellInfo->Effect[index] == SPELL_EFFECT_ATTACK_ME)
            return true;
    }

    // Ustaag <Nostalrius> : Mechanical Creature Type check
    if (GetCreatureInfo()->type && GetCreatureInfo()->type == CREATURE_TYPE_MECHANICAL)
    {
        // Periodic leech aura apply check
        if (spellInfo->Effect[index] == SPELL_EFFECT_APPLY_AURA)
        {
            if (spellInfo->EffectApplyAuraName[index] == SPELL_AURA_PERIODIC_LEECH)
                return true;
        }
    }

    return Unit::IsImmuneToSpellEffect(spellInfo, index, castOnSelf);
}

SpellEntry const *Creature::ReachWithSpellAttack(Unit *pVictim)
{
    if (!pVictim)
        return nullptr;

    for (uint32 i = 0; i < CREATURE_MAX_SPELLS; ++i)
    {
        if (!m_spells[i])
            continue;
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(m_spells[i]);
        if (!spellInfo)
        {
            sLog.outError("WORLD: unknown spell id %i", m_spells[i]);
            continue;
        }

        bool bcontinue = true;
        for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if ((spellInfo->Effect[j] == SPELL_EFFECT_SCHOOL_DAMAGE)       ||
                    (spellInfo->Effect[j] == SPELL_EFFECT_INSTAKILL)            ||
                    (spellInfo->Effect[j] == SPELL_EFFECT_ENVIRONMENTAL_DAMAGE) ||
                    (spellInfo->Effect[j] == SPELL_EFFECT_HEALTH_LEECH)
               )
            {
                bcontinue = false;
                break;
            }
        }
        if (bcontinue) continue;

        if (spellInfo->manaCost > GetPower(POWER_MANA))
            continue;
        SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(spellInfo->rangeIndex);
        float range = GetSpellMaxRange(srange);
        float minrange = GetSpellMinRange(srange);

        float dist = GetCombatDistance(pVictim);

        //if(!isInFront( pVictim, range ) && spellInfo->AttributesEx )
        //    continue;
        if (dist > range || dist < minrange)
            continue;
        if (spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE && HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED))
            continue;
        if (spellInfo->PreventionType == SPELL_PREVENTION_TYPE_PACIFY && HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
            continue;
        return spellInfo;
    }
    return nullptr;
}

SpellEntry const *Creature::ReachWithSpellCure(Unit *pVictim)
{
    if (!pVictim)
        return nullptr;

    for (uint32 i = 0; i < CREATURE_MAX_SPELLS; ++i)
    {
        if (!m_spells[i])
            continue;
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(m_spells[i]);
        if (!spellInfo)
        {
            sLog.outError("WORLD: unknown spell id %i", m_spells[i]);
            continue;
        }

        bool bcontinue = true;
        for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if ((spellInfo->Effect[j] == SPELL_EFFECT_HEAL))
            {
                bcontinue = false;
                break;
            }
        }
        if (bcontinue)
            continue;

        if (spellInfo->manaCost > GetPower(POWER_MANA))
            continue;
        SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(spellInfo->rangeIndex);
        float range = GetSpellMaxRange(srange);
        float minrange = GetSpellMinRange(srange);

        float dist = GetCombatDistance(pVictim);

        //if(!isInFront( pVictim, range ) && spellInfo->AttributesEx )
        //    continue;
        if (dist > range || dist < minrange)
            continue;
        if (spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE && HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED))
            continue;
        if (spellInfo->PreventionType == SPELL_PREVENTION_TYPE_PACIFY && HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
            continue;
        return spellInfo;
    }
    return nullptr;
}

bool Creature::IsVisibleInGridForPlayer(Player* pl) const
{
    // gamemaster in GM mode see all, including ghosts
    if (pl->isGameMaster())
        return true;

    if (GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_INVISIBLE)
        return false;

    // Live player (or with not release body see live creatures or death creatures with corpse disappearing time > 0
    if (pl->isAlive() || pl->GetDeathTimer() > 0)
        return (isAlive() || m_corpseDecayTimer > 0 || (m_isDeadByDefault && m_deathState == CORPSE));

    // Dead player see live creatures near own corpse
    if (isAlive())
    {
        Corpse *corpse = pl->GetCorpse();
        if (corpse)
        {
            // 20 - aggro distance for same level, 25 - max additional distance if player level less that creature level
            if (corpse->IsWithinDistInMap(this, (20 + 25)*sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO)))
                return true;
        }
    }

    // Dead player can see ghosts
    if (GetCreatureInfo()->type_flags & CREATURE_TYPEFLAGS_GHOST_VISIBLE)
        return true;

    // and not see any other
    return false;
}

void Creature::SendAIReaction(AiReaction reactionType)
{
    WorldPacket data(SMSG_AI_REACTION, 12);

    data << GetObjectGuid();
    data << uint32(reactionType);

    ((WorldObject*)this)->SendObjectMessageToSet(&data, true);

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "WORLD: Sent SMSG_AI_REACTION, type %u.", reactionType);
}

void Creature::CallAssistance()
{
    if (!m_AlreadyCallAssistance && getVictim() && !IsPet() && !isCharmed())
    {
        SetNoCallAssistance(true);

        float radius = sWorld.getConfig(CONFIG_FLOAT_CREATURE_FAMILY_ASSISTANCE_RADIUS);
        if (radius > 0)
        {
            std::list<Creature*> assistList;

            MaNGOS::AnyAssistCreatureInRangeCheck u_check(this, getVictim(), radius);
            MaNGOS::CreatureListSearcher<MaNGOS::AnyAssistCreatureInRangeCheck> searcher(assistList, u_check);
            Cell::VisitGridObjects(this, searcher, radius);

            if (!getVictim()) // May be invalidated by AI at grid activation ...
                return;

            if (!assistList.empty())
            {
                AssistDelayEvent *e = new AssistDelayEvent(getVictim()->GetObjectGuid(), *this, assistList);
                m_Events.AddEvent(e, m_Events.CalculateTime(sWorld.getConfig(CONFIG_UINT32_CREATURE_FAMILY_ASSISTANCE_DELAY)));
            }
        }
    }
}

void Creature::CallForHelp(float fRadius)
{
    if (fRadius <= 0.0f || !getVictim() || IsPet() || isCharmed())
        return;

    MaNGOS::CallOfHelpCreatureInRangeDo u_do(this, getVictim(), fRadius);
    MaNGOS::CreatureWorker<MaNGOS::CallOfHelpCreatureInRangeDo> worker(this, u_do);
    Cell::VisitGridObjects(this, worker, fRadius);
}

bool Creature::CanAssistTo(const Unit* u, const Unit* enemy, bool checkfaction /*= true*/) const
{
    if (!isAlive())
        return false;

    if (GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_ASSIST)
        return false;

    if (GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_AGGRO)
        return false;

    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PASSIVE))
        return false;

    // skip fighting creature
    if (isInCombat())
        return false;

    // only free creature
    if (GetCharmerOrOwnerGuid())
        return false;

    // Invisible
    if (m_invisibilityMask)
        return false;

    if (IsInEvadeMode())
        return false;

    // only from same creature faction
    if (checkfaction)
    {
        if (getFaction() != u->getFaction())
            return false;
    }
    else
    {
        if (!IsFriendlyTo(u))
            return false;
    }

    // skip non hostile to caster enemy creatures
    if (!IsHostileTo(enemy))
        return false;

    return true;
}

bool Creature::CanInitiateAttack()
{
    if (hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED | UNIT_STAT_DIED))
        return false;

    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE))
        return false;

    if (isPassiveToHostile())
        return false;

    if (IsTempPacified())
        return false;

    return true;
}

class DynamicRespawnRatesChecker
{
public:
    DynamicRespawnRatesChecker(Creature* crea) : _count(0), _me(crea), _hasNearbyEscort(false)
    {
        _myLevel = crea->getLevel();
        _maxLevelDiff = sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_PLAYERS_LEVELDIFF);
    }
    void operator()(Player* player)
    {
        if (_hasNearbyEscort || player->GetEscortingGuid())
        {
            _hasNearbyEscort = true;
            return;
        }

        if (uint32(abs(int32(player->getLevel()) - (int32)_myLevel)) > _maxLevelDiff)
            return;

        ++_count;
    }
    uint32 GetCount() const { return _count; }
    bool HasNearbyEscort() const { return _hasNearbyEscort; }
private:
    uint32 _count;
    Creature* _me;
    uint32 _myLevel;
    uint32 _maxLevelDiff;
    bool _hasNearbyEscort;
};

void Creature::ApplyDynamicRespawnDelay(uint32& delay, CreatureData const* data)
{
    if (!IsInWorld())
        return;
    // Only affects continents
    if (GetMapId() > 1)
        return;

    // Only affects rares and above with the forced flag
    if (GetCreatureInfo()->rank > CREATURE_ELITE_ELITE)
        if (data && !(data->spawnFlags & SPAWN_FLAG_FORCE_DYNAMIC_ELITE) || !data)
            return;

    if (getLevel() > sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_AFFECT_LEVEL_BELOW))
        return;
    float checkRange = sWorld.getConfig(CONFIG_FLOAT_DYN_RESPAWN_CHECK_RANGE);
    if (checkRange <= 0)
        return;
    if (delay > sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_AFFECT_RESPAWN_TIME_BELOW))
        return;
    if (delay < sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME))
        return;

    DynamicRespawnRatesChecker check(this);
    MaNGOS::PlayerWorker<DynamicRespawnRatesChecker> searcher(check);
    Cell::VisitWorldObjects(this, searcher, checkRange);

    // No dynamic respawns around an in progress escort
    if (check.HasNearbyEscort())
        return;

    int32 count = check.GetCount();
    count -= sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_PLAYERS_THRESHOLD);
    if (count <= 0)
        return;

    uint32 originalDelay = delay;

    float maxReductionRate = sWorld.getConfig(CONFIG_FLOAT_DYN_RESPAWN_MAX_REDUCTION_RATE);
    float reductionRate = count * sWorld.getConfig(CONFIG_FLOAT_DYN_RESPAWN_PERCENT_PER_PLAYER) / 100.0f;
    if (reductionRate > maxReductionRate)
        reductionRate = maxReductionRate;

    // Invalid configuration
    if (reductionRate < 0)
        return;

    uint32 reduction = static_cast<uint32>(reductionRate * originalDelay);
    if (reduction >= delay)
        delay = 0;
    else
        delay -= reduction;

    uint32 minimum = sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME);
    uint32 indoorMinimum = sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME_INDOORS);
    if (GetCreatureInfo()->rank >= CREATURE_ELITE_ELITE)
    {
        uint32 eliteMin = sWorld.getConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME_ELITE);
        if (minimum < eliteMin)
            minimum = eliteMin;
    }
    else if (indoorMinimum > 0 && !GetTerrain()->IsOutdoors(GetPositionX(), GetPositionY(), GetPositionZ()))
    {
        minimum = indoorMinimum;
    }

    // Cap the lower-end reduction at the chosen minimum
    if (delay < minimum)
        delay = minimum;

    // Prevent bad configs extending the respawn time beyond default
    if (delay > originalDelay)
        delay = originalDelay;
}

void Creature::SaveRespawnTime()
{
    if (IsPet() || !HasStaticDBSpawnData())
        return;

    if (m_respawnTime > time(nullptr))                         // dead (no corpse)
        GetMap()->GetPersistentState()->SaveCreatureRespawnTime(GetGUIDLow(), m_respawnTime);
    else if (m_corpseDecayTimer > 0)                        // dead (corpse)
        GetMap()->GetPersistentState()->SaveCreatureRespawnTime(GetGUIDLow(), time(nullptr) + m_respawnDelay + m_corpseDecayTimer / IN_MILLISECONDS);
}

bool Creature::IsOutOfThreatArea(Unit* pVictim) const
{
    // In dungeons, there is no threat area limit - only for active creatures (technical limitation, non actives are not updated without players around them)
    if (GetMap()->IsDungeon())
        return false;

    if (!pVictim)
        return true;

    if (pVictim->IsInMap(this))
    {
        float AttackDist = GetAttackDistance(pVictim);
        float ThreatRadius = sWorld.getConfig(CONFIG_FLOAT_THREAT_RADIUS);

        //Use AttackDistance in distance check if threat radius is lower. This prevents creature bounce in and out of combat every update tick.
        float threatAreaDistance = ThreatRadius > AttackDist ? ThreatRadius : AttackDist;
        bool inThreatArea = pVictim->IsWithinDist3d(m_combatStartX, m_combatStartY, m_combatStartZ, threatAreaDistance);
        if (!inThreatArea && _lastDamageTakenForEvade > 12000)
            return true;
    }

    return false;
}

CreatureDataAddon const* Creature::GetCreatureAddon() const
{
    if (CreatureDataAddon const* addon = ObjectMgr::GetCreatureAddon(GetGUIDLow()))
        return addon;

    return ObjectMgr::GetCreatureTemplateAddon(GetCreatureInfo()->Entry);
}

CreatureData const* Creature::GetCreatureData() const
{
    return sObjectMgr.GetCreatureData(GetDBTableGUIDLow());
}

uint32 Creature::GetDBTableEntry() const
{
    if (CreatureData const* data = GetCreatureData())
        return data->id;
    return 0;
}

//creature_addon table
bool Creature::LoadCreatureAddon(bool reload)
{
    CreatureDataAddon const *cainfo = GetCreatureAddon();
    if (!cainfo)
        return false;

    if (!reload)
        m_mountId = cainfo->mount;

    if (m_mountId != 0)
        Mount(m_mountId);

    if (cainfo->bytes1 != 0)
    {
        // 0 StandState
        // 1 LoyaltyLevel  Pet only, so always 0 for default creature
        // 2 ShapeshiftForm     Must be determined/set by shapeshift spell/aura
        // 3 StandMiscFlags

        SetByteValue(UNIT_FIELD_BYTES_1, 0, uint8(cainfo->bytes1 & 0xFF));
        //SetByteValue(UNIT_FIELD_BYTES_1, 1, uint8((cainfo->bytes1 >> 8) & 0xFF));
        //SetByteValue(UNIT_FIELD_BYTES_1, 1, 0);
        //SetByteValue(UNIT_FIELD_BYTES_2, 2, 0);
        SetByteValue(UNIT_FIELD_BYTES_1, 3, uint8((cainfo->bytes1 >> 24) & 0xFF));
    }

    // UNIT_FIELD_BYTES_2
    // 0 SheathState
    // 1 Bytes2Flags, in 3.x used UnitPVPStateFlags, that have different meaning
    // 2 UnitRename         Pet only, so always 0 for default creature
    // 3 ShapeshiftForm     Must be determined/set by shapeshift spell/aura
    SetByteValue(UNIT_FIELD_BYTES_2, 0, cainfo->sheath_state);

    if (cainfo->flags != 0)
        SetByteValue(UNIT_FIELD_BYTES_2, 1, cainfo->flags);

    //SetByteValue(UNIT_FIELD_BYTES_2, 2, 0);
    //SetByteValue(UNIT_FIELD_BYTES_2, 3, 0);

    if (cainfo->emote != 0)
        SetUInt32Value(UNIT_NPC_EMOTESTATE, cainfo->emote);

    if (cainfo->move_flags & SPLINEFLAG_FLYING)
        SetFly(true);

    if (cainfo->auras)
    {
        for (uint32 const* cAura = cainfo->auras; *cAura; ++cAura)
        {
            SpellEntry const *AdditionalSpellInfo = sSpellMgr.GetSpellEntry(*cAura);
            if (!AdditionalSpellInfo)
            {
                sLog.outErrorDb("Creature (GUIDLow: %u Entry: %u ) has wrong spell %u defined in `auras` field.", GetGUIDLow(), GetEntry(), *cAura);
                continue;
            }

            if (HasAura(*cAura))
            {
                if (!reload)
                    sLog.outErrorDb("Creature (GUIDLow: %u Entry: %u) has duplicate spell %u in `auras` field.", GetGUIDLow(), GetEntry(), *cAura);

                continue;
            }

            CastSpell(this, AdditionalSpellInfo, true);
        }
    }
    return true;
}

/// Send a message to LocalDefense channel for players opposition team in the zone
void Creature::SendZoneUnderAttackMessage(Player* attacker)
{
    Team enemy_team = attacker->GetTeam();

    WorldPacket data(SMSG_ZONE_UNDER_ATTACK, 4);
    data << uint32(GetZoneId());
    sWorld.SendGlobalMessage(&data, nullptr, (enemy_team == ALLIANCE ? HORDE : ALLIANCE));
}

void Creature::SetInCombatWithZone(bool initialPulse)
{
    if (!CanHaveThreatList())
    {
        sLog.outError("Creature entry %u call SetInCombatWithZone but creature cannot have threat list.", GetEntry());
        return;
    }

    Map* pMap = GetMap();

    if (!pMap->IsDungeon())
    {
        sLog.outError("Creature entry %u call SetInCombatWithZone for map (id: %u) that isn't an instance.", GetEntry(), pMap->GetId());
        return;
    }

    Map::PlayerList const &PlList = pMap->GetPlayers();

    if (PlList.isEmpty())
        return;

    if (!m_combatWithZoneState)
        UpdateCombatWithZoneState(true);

    for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
    {
        if (Player* pPlayer = i->getSource())
        {
            if (pPlayer->isGameMaster())
                continue;

            if (!initialPulse && pPlayer->isInCombat())
                continue;

            if (pPlayer->isAlive() && !IsFriendlyTo(pPlayer))
            {
                pPlayer->SetInCombatWith(this);
                AddThreat(pPlayer);
            }
        }
    }
}


bool Creature::MeetsSelectAttackingRequirement(Unit* pTarget, SpellEntry const* pSpellInfo, uint32 selectFlags) const
{
    if (selectFlags & SELECT_FLAG_PLAYER && pTarget->GetTypeId() != TYPEID_PLAYER)
        return false;

    if (selectFlags & SELECT_FLAG_NO_TOTEM && pTarget->ToCreature() && pTarget->ToCreature()->IsTotem())
        return false;

    if (selectFlags & SELECT_FLAG_POWER_MANA && pTarget->getPowerType() != POWER_MANA)
        return false;

    if (selectFlags & SELECT_FLAG_POWER_RAGE && pTarget->getPowerType() != POWER_RAGE)
        return false;

    if (selectFlags & SELECT_FLAG_POWER_ENERGY && pTarget->getPowerType() != POWER_ENERGY)
        return false;

    if (selectFlags & SELECT_FLAG_IN_MELEE_RANGE && !IsWithinMeleeRange(pTarget))
        return false;

    if (selectFlags & SELECT_FLAG_NOT_IN_MELEE_RANGE && IsWithinMeleeRange(pTarget))
        return false;

    if (selectFlags & SELECT_FLAG_IN_LOS && !IsWithinLOSInMap(pTarget))
        return false;

    if (selectFlags & SELECT_FLAG_PLAYER_NOT_GM && (pTarget->GetTypeId() != TYPEID_PLAYER || pTarget->ToPlayer()->isGameMaster()))
        return false;

    if (selectFlags & SELECT_FLAG_PET && !pTarget->ToPet())
        return false;

    if (selectFlags & SELECT_FLAG_NOT_PLAYER && pTarget->GetTypeId() == TYPEID_PLAYER)
        return false;

    if (pSpellInfo)
    {
        switch (pSpellInfo->rangeIndex)
        {
            case SPELL_RANGE_IDX_SELF_ONLY:
                return false;
            case SPELL_RANGE_IDX_ANYWHERE:
                return true;
            case SPELL_RANGE_IDX_COMBAT:
                return IsWithinMeleeRange(pTarget);
        }

        SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(pSpellInfo->rangeIndex);
        float max_range = GetSpellMaxRange(srange);
        float min_range = GetSpellMinRange(srange);
        float dist = GetCombatDistance(pTarget);

        return dist < max_range && dist >= min_range;
    }

    return true;
}


void Creature::LogDeath(Unit* pKiller) const
{
    if (!LogsDatabase || !sWorld.getConfig(CONFIG_BOOL_SMARTLOG_DEATH))
        return;

    // by default we log bosses only
    if (!IsWorldBoss())
    {
        if (sLog.m_smartlogExtraEntries.empty() && sLog.m_smartlogExtraGuids.empty())
            return;

        // if entry or guid matches one of extra values from config we log too
        bool extraEntry = std::find(sLog.m_smartlogExtraEntries.begin(), sLog.m_smartlogExtraEntries.end(), GetEntry()) != sLog.m_smartlogExtraEntries.end();
        bool extraGuid = std::find(sLog.m_smartlogExtraGuids.begin(), sLog.m_smartlogExtraGuids.end(), GetGUIDLow()) != sLog.m_smartlogExtraGuids.end();

        if (!extraEntry && !extraGuid)
            return;
    }

    static SqlStatementID insLogDeath;
    SqlStatement logStmt = LogsDatabase.CreateStatement(insLogDeath, "INSERT INTO smartlog_creature SET type=?, entry=?, guid=?, specifier=?, combatTime=?, content=?");

    logStmt.addString("Death");
    logStmt.addInt32(GetEntry());
    logStmt.addInt32(GetGUIDLow());

    const MapEntry* mapEntry = sMapStorage.LookupEntry<MapEntry>(GetMapId());
    std::string result0 = mapEntry->name;

    logStmt.addString(result0 + "." + GetName());
    logStmt.addInt32(GetCombatTime(true));

    if (pKiller)
    {
        // 1: we try to extract player from last hit
        auto pPlayer = pKiller->GetCharmerOrOwnerPlayerOrPlayerItself();
        bool lasthit = true;

        // 2: we try to extract player from threat list
        Unit* pUnit = nullptr;
        if (!pPlayer)
        {
            pUnit = SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER);
            lasthit = false;

            if (pUnit)
                pPlayer = static_cast<Player*>(pUnit);
        }

        if (pPlayer)
        {
            std::string result1 = lasthit ? "Last hit by player: <" : "One of players: <";
            result1 += pPlayer->GetName();

            if (pPlayer->GetMap()->Instanceable())
                result1 += "> with instanceId <" + std::to_string(pPlayer->GetInstanceId());

            result1 += ">.";

            logStmt.addString(result1);
        }
        else if (pUnit)
        {
            if (auto pCreature = pUnit->ToCreature())
            {
                std::string result1 = "Last hit by creature: <";
                result1 += pCreature->GetName();
                result1 += "> with entry <";
                result1 += pCreature->GetEntry();
                result1 += ">.";
                logStmt.addString(result1);
            }
            else
                logStmt.addString("Dead not by creature or player, unit exists though.");
        }
        else
            logStmt.addString("Dead not by creature or player, unit not exists.");
    }
    else
    {
        logStmt.addString("Unknown death reason (no argument passed).");
    }

    logStmt.Execute();
}

void Creature::LogLongCombat() const
{
    if (!LogsDatabase || !sWorld.getConfig(CONFIG_BOOL_SMARTLOG_LONGCOMBAT))
        return;

    static SqlStatementID insLogDeath;
    SqlStatement logStmt = LogsDatabase.CreateStatement(insLogDeath, "INSERT INTO smartlog_creature SET type=?, entry=?, guid=?, specifier=?, combatTime=?, content=?");

    logStmt.addString("LongCombat");
    logStmt.addInt32(GetEntry());
    logStmt.addInt32(GetGUIDLow());

    const MapEntry* mapEntry = sMapStorage.LookupEntry<MapEntry>(GetMapId());
    std::string result0 = mapEntry->name;

    logStmt.addString(result0 + "." + GetName());
    logStmt.addInt32(GetCombatTime(true));
    logStmt.addString("");

    logStmt.Execute();
}

void Creature::LogScriptInfo(std::ostringstream &data) const
{
    if (!LogsDatabase || !sWorld.getConfig(CONFIG_BOOL_SMARTLOG_SCRIPTINFO))
        return;

    static SqlStatementID insLogDeath;
    SqlStatement logStmt = LogsDatabase.CreateStatement(insLogDeath, "INSERT INTO smartlog_creature SET type=?, entry=?, guid=?, specifier=?, combatTime=?, content=?");

    logStmt.addString("ScriptInfo");
    logStmt.addInt32(GetEntry());
    logStmt.addInt32(GetGUIDLow());

    const MapEntry* mapEntry = sMapStorage.LookupEntry<MapEntry>(GetMapId());
    std::string result0 = mapEntry->name;

    logStmt.addString(result0 + "." + GetName());
    logStmt.addInt32(GetCombatTime(true));
    logStmt.addString(data);

    logStmt.Execute();
}

Unit* Creature::SelectAttackingTarget(AttackingTarget target, uint32 position, uint32 spellId, uint32 selectFlags) const
{
    return SelectAttackingTarget(target, position, sSpellMgr.GetSpellEntry(spellId), selectFlags);
}

Unit* Creature::SelectAttackingTarget(AttackingTarget target, uint32 position, SpellEntry const* pSpellInfo /*= nullptr*/, uint32 selectFlags/*= SELECT_FLAG_NO_TOTEM*/) const
{
    if (!CanHaveThreatList())
        return nullptr;

    // ThreatList m_threatlist;
    ThreatList const& threatlist = getThreatManager().getThreatList();
    ThreatList::const_iterator itr = threatlist.begin();
    ThreatList::const_reverse_iterator ritr = threatlist.rbegin();

    if (position >= threatlist.size() || !threatlist.size())
        return nullptr;

    switch (target)
    {
        case ATTACKING_TARGET_RANDOM:
        {
            std::vector<Unit*> suitableUnits;
            suitableUnits.reserve(threatlist.size() - position);
            advance(itr, position);
            for (; itr != threatlist.end(); ++itr)
                if (Unit* pTarget = GetMap()->GetUnit((*itr)->getUnitGuid()))
                    if (!selectFlags || MeetsSelectAttackingRequirement(pTarget, pSpellInfo, selectFlags))
                        suitableUnits.push_back(pTarget);

            if (!suitableUnits.empty())
                return suitableUnits[urand(0, suitableUnits.size() - 1)];

            break;
        }
        case ATTACKING_TARGET_TOPAGGRO:
        {
            advance(itr, position);
            for (; itr != threatlist.end(); ++itr)
                if (Unit* pTarget = GetMap()->GetUnit((*itr)->getUnitGuid()))
                    if (!selectFlags || MeetsSelectAttackingRequirement(pTarget, pSpellInfo, selectFlags))
                        return pTarget;

            break;
        }
        case ATTACKING_TARGET_BOTTOMAGGRO:
        {
            advance(ritr, position);
            for (; ritr != threatlist.rend(); ++ritr)
                if (Unit* pTarget = GetMap()->GetUnit((*itr)->getUnitGuid()))
                    if (!selectFlags || MeetsSelectAttackingRequirement(pTarget, pSpellInfo, selectFlags))
                        return pTarget;

            break;
        }
        case ATTACKING_TARGET_NEAREST:
        {
            float distance = -1;
            float combatDistance = 0;
            Unit* pTarget = nullptr;
            Unit* suitableTarget = nullptr;

            advance(itr, position);
            for (; itr != threatlist.end(); ++itr)
            {
                pTarget = GetMap()->GetUnit((*itr)->getUnitGuid());
                if (pTarget && MeetsSelectAttackingRequirement(pTarget, pSpellInfo, selectFlags))
                {
                    combatDistance = GetDistanceToCenter(pTarget);
                    if (!suitableTarget || combatDistance < distance)
                    {
                        distance = combatDistance;
                        suitableTarget = pTarget;
                    }
                }
            }

            return suitableTarget;
        }
        case ATTACKING_TARGET_FARTHEST:
        {
            float distance = -1;
            float combatDistance = 0;
            Unit* pTarget = nullptr;
            Unit* suitableTarget = nullptr;

            advance(itr, position);
            for (; itr != threatlist.end(); ++itr)
            {
                pTarget = GetMap()->GetUnit((*itr)->getUnitGuid());
                if (pTarget && MeetsSelectAttackingRequirement(pTarget, pSpellInfo, selectFlags))
                {
                    combatDistance = GetCombatDistance(pTarget);
                    if (combatDistance > distance)
                    {
                        distance = combatDistance;
                        suitableTarget = pTarget;
                    }
                }
            }

            return suitableTarget;
        }
    }

    return nullptr;
}

bool Creature::IsInEvadeMode() const
{
    if (IsEvadeBecauseTargetNotReachable())
        return true;
    return !i_motionMaster.empty() && i_motionMaster.GetCurrentMovementGeneratorType() == HOME_MOTION_TYPE;
}

bool Creature::HasSpell(uint32 spellID) const
{
    uint8 i;
    for (i = 0; i < CREATURE_MAX_SPELLS; ++i)
        if (spellID == m_spells[i])
            break;
    return i < CREATURE_MAX_SPELLS;                         // break before end of iteration of known spells
}

time_t Creature::GetRespawnTimeEx() const
{
    time_t now = time(nullptr);
    if (m_respawnTime > now)                                // dead (no corpse)
        return m_respawnTime;
    else if (m_corpseDecayTimer > 0)                        // dead (corpse)
        return now + m_respawnDelay + m_corpseDecayTimer / IN_MILLISECONDS;
    else
        return now;
}

void Creature::GetRespawnCoord(float &x, float &y, float &z, float* ori, float* dist) const
{
    // Nostalrius : pouvoir changer point de spawn d'un mob -> Creature::SetHomePosition
    if (m_HomeX > 0.1f || m_HomeX < -0.1f)
    {
        x = m_HomeX;
        y = m_HomeY;
        z = m_HomeZ;
        if (ori)
            *ori = m_HomeOrientation;
        if (dist)
            *dist = GetRespawnRadius();
    }
    else if (CreatureData const* data = sObjectMgr.GetCreatureData(GetGUIDLow()))
    {
        x = data->posX;
        y = data->posY;
        z = data->posZ;
        if (ori)
            *ori = data->orientation;
        if (dist)
            *dist = GetRespawnRadius();
    }
    else
    {
        float orient;

        GetSummonPoint(x, y, z, orient);

        if (ori)
            *ori = orient;
        if (dist)
            *dist = GetRespawnRadius();
    }

    //lets check if our creatures have valid spawn coordinates
    MANGOS_ASSERT(MaNGOS::IsValidMapCoord(x, y, z) || PrintCoordinatesError(x, y, z, "respawn"));
}

void Creature::AllLootRemovedFromCorpse()
{
    skinningForOthersTimer = 5000;
    if (lootForBody && !HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE))
    {
        uint32 corpseLootedDelay;

        if (!lootForSkin)                                   // corpse was not skinned -> apply corpseLootedDelay
        {
            // use a static spawntimesecs/3 modifier (guessed/made up value) unless config are more than 0.0
            // spawntimesecs=3min:  corpse decay after 1min
            // spawntimesecs=4hour: corpse decay after 1hour 20min
            if (sWorld.getConfig(CONFIG_FLOAT_RATE_CORPSE_DECAY_LOOTED) > 0.0f)
                corpseLootedDelay = (uint32)((m_corpseDelay * IN_MILLISECONDS) * sWorld.getConfig(CONFIG_FLOAT_RATE_CORPSE_DECAY_LOOTED));
            else
                corpseLootedDelay = (m_respawnDelay * IN_MILLISECONDS) / 3;
        }
        else                                                // corpse was skinned, corpse will despawn next update
            corpseLootedDelay = 0;

        // if m_respawnTime is not expired already
        if (m_respawnTime >= time(nullptr))
        {
            // if spawntimesecs is larger than default corpse delay always use corpseLootedDelay
            if (m_respawnDelay > m_corpseDelay)
                m_corpseDecayTimer = corpseLootedDelay;
            else
            {
                // if m_respawnDelay is relatively short and corpseDecayTimer is larger than corpseLootedDelay
                if (m_corpseDecayTimer > corpseLootedDelay)
                    m_corpseDecayTimer = corpseLootedDelay;
            }
        }
        else
        {
            m_corpseDecayTimer = 0;

            // TODO: reaching here, means mob will respawn at next tick.
            // This might be a place to set some aggro delay so creature has
            // ~5 seconds before it can react to hostile surroundings.

            // It's worth noting that it will not be fully correct either way.
            // At this point another "instance" of the creature are presumably expected to
            // be spawned already, while this corpse will not appear in respawned form.
        }
    }
}

uint32 Creature::GetLevelForTarget(Unit const* target) const
{
    if (!IsWorldBoss())
        return Unit::GetLevelForTarget(target);

    uint32 level = target->getLevel() + sWorld.getConfig(CONFIG_UINT32_WORLD_BOSS_LEVEL_DIFF);
    if (level < 1)
        return 1;
    if (level > 255)
        return 255;
    return level;
}

std::string Creature::GetAIName() const
{
    return ObjectMgr::GetCreatureTemplate(GetEntry())->AIName;
}

std::string Creature::GetScriptName() const
{
    return sScriptMgr.GetScriptName(GetScriptId());
}

uint32 Creature::GetScriptId() const
{
    return ObjectMgr::GetCreatureTemplate(GetEntry())->ScriptID;
}

VendorItemData const* Creature::GetVendorItems() const
{
    return sObjectMgr.GetNpcVendorItemList(GetEntry());
}

VendorItemData const* Creature::GetVendorTemplateItems() const
{
    uint32 vendorId = GetCreatureInfo()->vendorId;
    return vendorId ? sObjectMgr.GetNpcVendorTemplateItemList(vendorId) : NULL;
}

uint32 Creature::GetVendorItemCurrentCount(VendorItem const* vItem)
{
    if (!vItem->maxcount)
        return vItem->maxcount;

    VendorItemCounts::iterator itr = m_vendorItemCounts.begin();
    for (; itr != m_vendorItemCounts.end(); ++itr)
        if (itr->itemId == vItem->item)
            break;

    if (itr == m_vendorItemCounts.end())
        return vItem->maxcount;

    VendorItemCount* vCount = &*itr;

    time_t ptime = time(nullptr);

    if (vCount->lastIncrementTime + vItem->incrtime <= ptime)
    {
        ItemPrototype const* pProto = ObjectMgr::GetItemPrototype(vItem->item);

        uint32 diff = uint32((ptime - vCount->lastIncrementTime) / vItem->incrtime);
        if ((vCount->count + diff * pProto->BuyCount) >= vItem->maxcount)
        {
            m_vendorItemCounts.erase(itr);
            return vItem->maxcount;
        }

        vCount->count += diff * pProto->BuyCount;
        vCount->lastIncrementTime = ptime;
    }

    return vCount->count;
}

uint32 Creature::UpdateVendorItemCurrentCount(VendorItem const* vItem, uint32 used_count)
{
    if (!vItem->maxcount)
        return 0;

    VendorItemCounts::iterator itr = m_vendorItemCounts.begin();
    for (; itr != m_vendorItemCounts.end(); ++itr)
        if (itr->itemId == vItem->item)
            break;

    if (itr == m_vendorItemCounts.end())
    {
        uint32 new_count = vItem->maxcount > used_count ? vItem->maxcount - used_count : 0;
        m_vendorItemCounts.push_back(VendorItemCount(vItem->item, new_count));
        return new_count;
    }

    VendorItemCount* vCount = &*itr;

    time_t ptime = time(nullptr);

    if (vCount->lastIncrementTime + vItem->incrtime <= ptime)
    {
        ItemPrototype const* pProto = ObjectMgr::GetItemPrototype(vItem->item);

        uint32 diff = uint32((ptime - vCount->lastIncrementTime) / vItem->incrtime);
        if ((vCount->count + diff * pProto->BuyCount) < vItem->maxcount)
            vCount->count += diff * pProto->BuyCount;
        else
            vCount->count = vItem->maxcount;
    }

    vCount->count = vCount->count > used_count ? vCount->count - used_count : 0;
    vCount->lastIncrementTime = ptime;
    return vCount->count;
}

TrainerSpellData const* Creature::GetTrainerTemplateSpells() const
{
    uint32 trainerId = GetCreatureInfo()->trainerId;
    return trainerId ? sObjectMgr.GetNpcTrainerTemplateSpells(trainerId) : NULL;
}

TrainerSpellData const* Creature::GetTrainerSpells() const
{
    return sObjectMgr.GetNpcTrainerSpells(GetEntry());
}

// overwrite WorldObject function for proper name localization
const char* Creature::GetNameForLocaleIdx(int32 loc_idx) const
{
    if (loc_idx >= 0)
    {
        CreatureLocale const *cl = sObjectMgr.GetCreatureLocale(GetEntry());
        if (cl)
        {
            if (cl->Name.size() > (size_t)loc_idx && !cl->Name[loc_idx].empty())
                return cl->Name[loc_idx].c_str();
        }
    }

    return GetName();
}

void Creature::SetFactionTemporary(uint32 factionId, uint32 tempFactionFlags)
{
    m_temporaryFactionFlags = tempFactionFlags;
    setFaction(factionId);
}

void Creature::ClearTemporaryFaction()
{
    // No restore if creature is charmed/possessed.
    // For later we may consider extend to restore to charmer faction where charmer is creature.
    // This can also be done by update any pet/charmed of creature at any faction change to charmer.
    if (isCharmed())
        return;

    m_temporaryFactionFlags = TEMPFACTION_NONE;
    setFaction(GetCreatureInfo()->faction_A);
}

void Creature::SendAreaSpiritHealerQueryOpcode(Player *pl)
{
    uint32 next_resurrect = 0;
    if (Spell* pcurSpell = GetCurrentSpell(CURRENT_CHANNELED_SPELL))
        next_resurrect = pcurSpell->GetCastedTime();
    WorldPacket data(SMSG_AREA_SPIRIT_HEALER_TIME, 8 + 4);
    data << ObjectGuid(GetObjectGuid());
    data << uint32(next_resurrect);
    pl->SendDirectMessage(&data);
}

void Creature::DisappearAndDie()
{
    if (!IsInWorld())
    {
        sLog.outInfo("[CRASH][%s]DisappearAndDie: le mob n'est pas InWorld.", GetName());
        return;
    }

    if (IsCreature() && ToCreature()->IsPet())
        ((Pet*)this)->Unsummon(PET_SAVE_AS_DELETED);
    DestroyForNearbyPlayers();
    if (isAlive())
        SetDeathState(JUST_DIED);
    RemoveCorpse();
}

void Creature::GetHomePosition(float &x, float &y, float &z, float &o, float* dist)
{
    if (m_HomeX != 0.0f)
    {
        x = m_HomeX;
        y = m_HomeY;
        z = m_HomeZ;
        o = m_HomeOrientation;
        if (dist)
            (*dist) = GetRespawnRadius();
        return;
    }
    GetRespawnCoord(x, y, z, &o, dist);
}
void Creature::SetHomePosition(float x, float y, float z, float o)
{
    m_HomeX = x;
    m_HomeY = y;
    m_HomeZ = z;
    m_HomeOrientation = o;
}

void Creature::ResetHomePosition()
{
    if (CreatureData const *data = sObjectMgr.GetCreatureData(GetGUIDLow()))
        SetHomePosition(data->posX, data->posY, data->posZ, data->orientation);
    else if (IsTemporarySummon())
        GetSummonPoint(m_HomeX, m_HomeY, m_HomeZ, m_HomeOrientation);
}

void Creature::OnLeaveCombat()
{
    UpdateCombatState(false);
    UpdateCombatWithZoneState(false);

    // a delayed spell event could set the creature in combat again
    auto itEvent = m_Events.GetEvents().begin();
    for (; itEvent != m_Events.GetEvents().end(); ++itEvent)
        if (SpellEvent* event = dynamic_cast<SpellEvent*>(itEvent->second))
            if (event->GetSpell()->getState() != SPELL_STATE_FINISHED)
                event->GetSpell()->cancel();

    if (_creatureGroup)
        _creatureGroup->OnLeaveCombat(this);

    if (i_AI)
        i_AI->EnterEvadeMode();

    if (m_zoneScript)
        m_zoneScript->OnCreatureEvade(this);
}

void Creature::OnEnterCombat(Unit* pWho, bool notInCombat)
{
    if (!pWho)
        return;

    if (i_AI && !hasUnitState(UNIT_STAT_CONFUSED | UNIT_STAT_FLEEING))
        i_AI->AttackedBy(pWho);

    if (_creatureGroup)
        _creatureGroup->OnMemberAttackStart(this, pWho);

    // Pas encore en combat.
    if (notInCombat)
    {
        ResetCombatTime();
        UpdateCombatState(true);

        SetStandState(UNIT_STAND_STATE_STAND);
        _pacifiedTimer = 0;

        if (m_zoneScript)
            m_zoneScript->OnCreatureEnterCombat(this);

        if (IsMounted())
            Unmount();

        if (i_AI)
            i_AI->EnterCombat(pWho);
    }
}

void Creature::ResetStats()
{
    if (m_creatureInfo)
    {
        SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, m_creatureInfo->mindmg);
        SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, m_creatureInfo->maxdmg);
        UpdateDamagePhysical(BASE_ATTACK);
    }
    RemoveAllAuras();
}

Unit* Creature::GetNearestVictimInRange(float min, float max)
{
    if (!CanHaveThreatList())
        return nullptr;

    float bestRange = max;
    Unit* pUnit = nullptr;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());
        if (!pTarget)
            continue;

        float currRange = GetDistance(pTarget);
        if (currRange <= bestRange && currRange >= min)
        {
            bestRange = currRange;
            pUnit = pTarget;
        }
    }
    return pUnit;
}

Unit* Creature::GetFarthestVictimInRange(float min, float max)
{
    if (!CanHaveThreatList())
        return nullptr;

    float bestRange = min;
    Unit* pUnit = nullptr;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());
        if (!pTarget)
            continue;

        float currRange = GetDistance(pTarget);
        if (currRange > bestRange && currRange < max)
        {
            bestRange = currRange;
            pUnit = pTarget;
        }
    }
    return pUnit;
}

Unit* Creature::GetVictimInRange(float min, float max)
{
    if (!CanHaveThreatList())
        return nullptr;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());

        if (pTarget && IsInRange(pTarget, min, max))
            return pTarget;
    }
    return nullptr;
}

Unit* Creature::GetHostileCasterInRange(float min, float max)
{
    if (!CanHaveThreatList())
        return nullptr;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());

        if (pTarget && pTarget->IsCaster() && IsInRange(pTarget, min, max))
            return pTarget;
    }
    return nullptr;
}

Unit* Creature::GetHostileCaster()
{
    if (!CanHaveThreatList())
        return nullptr;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());

        if (pTarget && pTarget->IsCaster())
            return pTarget;
    }
    return nullptr;
}

void Creature::ProcessThreatList(ThreatListProcesser* f)
{
    if (!CanHaveThreatList())
        return;

    ThreatList const& tList = getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* target = GetMap()->GetUnit((*i)->getUnitGuid());

        if (target)
            if (f->Process(target))
                return;
    }
}

bool Creature::CastSpellOnFarthestVictim(uint32 spellId, float min, float max, bool triggered)
{
    if (Unit* pTarget = GetFarthestVictimInRange(min, max))
    {
        CastSpell(pTarget, spellId, triggered);
        return true;
    }
    return false;
}

bool Creature::CastSpellOnNearestVictim(uint32 spellId, float min, float max, bool triggered)
{
    if (Unit* pTarget = GetNearestVictimInRange(min, max))
    {
        CastSpell(pTarget, spellId, triggered);
        return true;
    }
    return false;
}

bool Creature::CastSpellOnHostileCaster(uint32 spellId, bool triggered)
{
    if (Unit* pTarget = GetHostileCaster())
    {
        CastSpell(pTarget, spellId, triggered);
        return true;
    }
    return false;
}

bool Creature::CastSpellOnHostileCasterInRange(uint32 spellId, float min, float max, bool triggered)
{
    if (Unit* pTarget = GetHostileCasterInRange(min, max))
    {
        CastSpell(pTarget, spellId, triggered);
        return true;
    }
    return false;
}

bool Creature::CastSpellOnAllInRange(uint32 spellId, float min, float max, bool triggered)
{
    if (Unit* pTarget = GetHostileCasterInRange(min, max))
    {
        CastSpell(pTarget, spellId, triggered);
        return true;
    }
    return false;
}
void Creature::AddThreatsOf(Creature const* pOther)
{
    ThreatList const& tList = pOther->getThreatManager().getThreatList();
    for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
    {
        Unit* pTarget = GetMap()->GetUnit((*i)->getUnitGuid());

        if (pTarget && pTarget->isAlive() && !IsFriendlyTo(pTarget))
        {
            pTarget->SetInCombatWith(this);
            AddThreat(pTarget);
        }
    }
}

// select nearest hostile unit within the given attack distance (i.e. distance is ignored if > than ATTACK_DISTANCE), regardless of threat list.
Unit* Creature::SelectNearestTargetInAttackDistance(float dist) const
{
    CellPair p(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(p);
    cell.SetNoCreate();

    Unit *target = nullptr;

    if (dist > ATTACK_DISTANCE)
        sLog.outError("Creature (GUID: %u Entry: %u) SelectNearestTargetInAttackDistance called with dist > ATTACK_DISTANCE. Extra distance ignored.", GetGUIDLow(), GetEntry());

    MaNGOS::NearestHostileUnitInAttackDistanceCheck u_check(this, dist);
    MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAttackDistanceCheck> searcher(target, u_check);

    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAttackDistanceCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAttackDistanceCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

    cell.Visit(p, world_unit_searcher, *GetMap(), *this, ATTACK_DISTANCE);
    cell.Visit(p, grid_unit_searcher, *GetMap(), *this, ATTACK_DISTANCE);

    return target;
}

Unit* Creature::SelectNearestHostileUnitInAggroRange(bool useLOS) const
{
    // Selects nearest hostile target within creature's aggro range. Used primarily by
    //  pets set to aggressive. Will not return neutral or friendly targets.
    CellPair p(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(p);
    cell.SetNoCreate();

    Unit *target = nullptr;

    MaNGOS::NearestHostileUnitInAggroRangeCheck u_check(ToCreature(), useLOS);
    MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAggroRangeCheck> searcher(target, u_check);

    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAggroRangeCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitInAggroRangeCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

    cell.Visit(p, world_unit_searcher, *GetMap(), *this, MAX_VISIBILITY_DISTANCE);
    cell.Visit(p, grid_unit_searcher, *GetMap(), *this, MAX_VISIBILITY_DISTANCE);

    return target;
}

// Returns friendly unit with the most amount of hp missing from max hp
Unit* Creature::DoSelectLowestHpFriendly(float fRange, uint32 uiMinHPDiff, bool bPercent, Unit* except) const
{
    std::list<Unit *> targets;

    MaNGOS::MostHPMissingInRangeCheck u_check(this, fRange, uiMinHPDiff, bPercent);
    MaNGOS::UnitListSearcher<MaNGOS::MostHPMissingInRangeCheck> searcher(targets, u_check);

    Cell::VisitAllObjects(this, searcher, fRange);

    // remove current target
    if (except)
        targets.remove(except);

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    return *targets.begin();
}

// Returns friendly unit that does not have an aura from the provided spellid
Unit* Creature::DoFindFriendlyMissingBuff(float range, uint32 spellid, Unit* except) const
{
    std::list<Unit *> targets;

    MaNGOS::FriendlyMissingBuffInRangeCheck u_check(this, range, spellid);
    MaNGOS::UnitListSearcher<MaNGOS::FriendlyMissingBuffInRangeCheck> searcher(targets, u_check);

    Cell::VisitGridObjects(this, searcher, range);

    // remove current target
    if (except)
        targets.remove(except);

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    return *targets.begin();
}

// Returns friendly unit that is under a crowd control effect
Unit* Creature::DoFindFriendlyCC(float range) const
{
    Unit* pUnit = nullptr;

    MaNGOS::FriendlyCCedInRangeCheck u_check(this, range);
    MaNGOS::UnitSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(pUnit, u_check);

    Cell::VisitGridObjects(this, searcher, range);

    return pUnit;
}

SpellCastResult Creature::TryToCast(Unit* pTarget, uint32 uiSpell, uint32 uiCastFlags, uint8 uiChance)
{
    if (IsNonMeleeSpellCasted(false) && !(uiCastFlags & (CF_TRIGGERED | CF_INTERRUPT_PREVIOUS)))
        return SPELL_FAILED_SPELL_IN_PROGRESS;

    const SpellEntry* pSpellInfo = sSpellMgr.GetSpellEntry(uiSpell);

    if (!pSpellInfo)
    {
        sLog.outError("TryToCast: attempt to cast unknown spell %u by creature with entry: %u", uiSpell, GetEntry());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    return TryToCast(pTarget, pSpellInfo, uiCastFlags, uiChance);
}

SpellCastResult Creature::TryToCast(Unit* pTarget, const SpellEntry* pSpellInfo, uint32 uiCastFlags, uint8 uiChance)
{
    if (!pTarget)
        return SPELL_FAILED_BAD_IMPLICIT_TARGETS;

    // This spell should only be cast when target does not have the aura it applies.
    if ((uiCastFlags & CF_AURA_NOT_PRESENT) && pTarget->HasAura(pSpellInfo->Id))
        return SPELL_FAILED_AURA_BOUNCED;

    // Can't cast while fleeing.
    if (GetMotionMaster()->GetCurrentMovementGeneratorType() == TIMED_FLEEING_MOTION_TYPE)
        return SPELL_FAILED_FLEEING;

    // This spell is only used when target is in melee range.
    if ((uiCastFlags & CF_ONLY_IN_MELEE) && !CanReachWithMeleeAttack(pTarget))
        return SPELL_FAILED_OUT_OF_RANGE;

    // This spell should not be used if target is in melee range.
    if ((uiCastFlags & CF_NOT_IN_MELEE) && CanReachWithMeleeAttack(pTarget))
        return SPELL_FAILED_TOO_CLOSE;

    // This spell should only be cast when we cannot get into melee range.
    if ((uiCastFlags & CF_TARGET_UNREACHABLE) && (CanReachWithMeleeAttack(pTarget) || (GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE) || !(hasUnitState(UNIT_STAT_NOT_MOVE) || !GetMotionMaster()->GetCurrent()->IsReachable())))
        return SPELL_FAILED_MOVING;

    // Custom checks
    if (!(uiCastFlags & CF_FORCE_CAST))
    {
        // If the spell requires to be behind the target.
        if (pSpellInfo->Custom & SPELL_CUSTOM_FROM_BEHIND && pTarget->HasInArc(M_PI_F, this))
            return SPELL_FAILED_UNIT_NOT_BEHIND;

        if (!IsAreaOfEffectSpell(pSpellInfo))
        {
            // If the spell requires the target having a specific power type.
            if (!IsTargetPowerTypeValid(pSpellInfo, pTarget->getPowerType()))
                return SPELL_FAILED_UNKNOWN;

            // No point in casting if target is immune.
            if (pTarget->IsImmuneToDamage(GetSpellSchoolMask(pSpellInfo), pSpellInfo))
                return SPELL_FAILED_IMMUNE;
        }

        // Mind control abilities can't be used with just 1 attacker or mob will reset.
        if ((getThreatManager().getThreatList().size() == 1) && IsCharmSpell(pSpellInfo))
            return SPELL_FAILED_UNKNOWN;

        // Do not use dismounting spells when target is not mounted (there are 4 such spells).
        if (!pTarget->IsMounted() && IsDismountSpell(pSpellInfo))
            return SPELL_FAILED_ONLY_MOUNTED;
    }

    // Interrupt any previous spell
    if ((uiCastFlags & CF_INTERRUPT_PREVIOUS) && IsNonMeleeSpellCasted(false))
        InterruptNonMeleeSpells(false);

    Spell *spell = new Spell(this, pSpellInfo, uiCastFlags & CF_TRIGGERED);

    SpellCastTargets targets;

    // Don't set unit target on destination target based spells, otherwise the spell will cancel
    // as soon as the target dies or leaves the area of the effect
    if (pSpellInfo->Targets & TARGET_FLAG_DEST_LOCATION)
        targets.setDestination(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
    else
        targets.setUnitTarget(pTarget);

    if (pSpellInfo->Targets & TARGET_FLAG_SOURCE_LOCATION)
        if (WorldObject* caster = spell->GetCastingObject())
            targets.setSource(caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());

    spell->SetCastItem(nullptr);
    return spell->prepare(std::move(targets), nullptr, uiChance);
}

// use this function to avoid having hostile creatures attack
// friendlies and other mobs they shouldn't attack
bool Creature::_IsTargetAcceptable(Unit const *target) const
{
    ASSERT(target);

    // if the target cannot be attacked, the target is not acceptable
    if (IsFriendlyTo(target)
            || !target->isAttackableByAOE()
            || target->hasUnitState(UNIT_STAT_DIED))
        return false;

    Unit *myVictim = getAttackerForHelper();
    Unit *targetVictim = target->getAttackerForHelper();

    // if I'm already fighting target, or I'm hostile towards the target, the target is acceptable
    if (myVictim == target || targetVictim == this || IsHostileTo(target))
        return true;

    // if the target's victim is friendly, and the target is neutral, the target is acceptable
    if (targetVictim && IsFriendlyTo(targetVictim))
        return true;

    // if the target's victim is not friendly, or the target is friendly, the target is not acceptable
    return false;
}

// this should not be called by petAI or
bool Creature::canCreatureAttack(Unit const *pVictim, bool force) const
{
    if (!pVictim->IsInMap(this))
        return false;

    if (!canAttack(pVictim, force))
        return false;

    if (GetMap()->IsDungeon())
        return true;

    //Use AttackDistance in distance check if threat radius is lower. This prevents creature bounce in and out of combat every update tick.
    float dist = std::max(GetAttackDistance(pVictim), 150.0f) + m_CombatDistance;

    if (Unit *unit = GetCharmerOrOwner())
    {
        if (!pVictim->IsWithinDist(unit, dist))
            return false;
    }
    else if (!pVictim->IsWithinDist3d(m_HomeX, m_HomeY, m_HomeZ, dist))
        return false;

    if (!pVictim->isInAccessablePlaceFor(this))
        return false;
    return true;
}

time_t Creature::GetCombatTime(bool total) const
{
    auto diff = time(nullptr) - m_combatStartTime;

    return total ? sWorld.getConfig(CONFIG_UINT32_LONGCOMBAT) * m_combatResetCount + diff : diff;
}

void Creature::ResetCombatTime(bool combat)
{
    m_combatStartTime = time(nullptr);

    if (combat)
        ++m_combatResetCount;
    else
        m_combatResetCount = 0;
}

bool Creature::canStartAttack(Unit const* who, bool force) const
{
    if (IsCivilian())
        return false;

    if (!CanFly() && (GetDistanceZ(who) > CREATURE_Z_ATTACK_RANGE + m_CombatDistance))
        //|| who->IsControlledByPlayer() && who->IsFlying()))
        // we cannot check flying for other creatures, too much map/vmap calculation
        // TODO: should switch to range attack
        return false;

    if (!force)
    {
        if (!_IsTargetAcceptable(who))
            return false;

        if (who->isInCombat())
            if (Unit *victim = who->getAttackerForHelper())
                if (IsWithinDistInMap(victim, 10.0f))
                    force = true;

        if (!force && (IsNeutralToAll() || !IsWithinDistInMap(who, GetAttackDistance(who) + m_CombatDistance)))
            return false;
    }

    if (!canCreatureAttack(who, force))
        return false;

    return IsWithinLOSInMap(who);
}

void Creature::ApplyGameEventSpells(GameEventCreatureData const* eventData, bool activated)
{
    uint32 cast_spell = activated ? eventData->spell_id_start : eventData->spell_id_end;
    uint32 remove_spell = activated ? eventData->spell_id_end : eventData->spell_id_start;

    if (remove_spell)
        if (SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(remove_spell))
            if (IsSpellAppliesAura(spellEntry))
                RemoveAurasDueToSpell(remove_spell);

    if (cast_spell)
        CastSpell(this, cast_spell, true);
}

void Creature::FillGuidsListFromThreatList(std::vector<ObjectGuid>& guids, uint32 maxamount /*= 0*/)
{
    if (!CanHaveThreatList())
        return;

    ThreatList const& threats = getThreatManager().getThreatList();

    maxamount = maxamount > 0 ? std::min(maxamount, uint32(threats.size())) : threats.size();

    guids.reserve(guids.size() + maxamount);

    for (ThreatList::const_iterator itr = threats.begin(); maxamount && itr != threats.end(); ++itr, --maxamount)
        guids.push_back((*itr)->getUnitGuid());
}

struct AddCreatureToRemoveListInMapsWorker
{
    AddCreatureToRemoveListInMapsWorker(ObjectGuid guid) : i_guid(guid) {}

    void operator()(Map* map)
    {
        if (Creature* pCreature = map->GetCreature(i_guid))
            pCreature->AddObjectToRemoveList();
    }

    ObjectGuid i_guid;
};

void Creature::AddToRemoveListInMaps(uint32 db_guid, CreatureData const* data)
{
    AddCreatureToRemoveListInMapsWorker worker(data->GetObjectGuid(db_guid));
    sMapMgr.DoForAllMapsWithMapId(data->mapid, worker);
}

struct SpawnCreatureInMapsWorker
{
    SpawnCreatureInMapsWorker(uint32 guid, CreatureData const* data)
        : i_guid(guid), i_data(data) {}

    void operator()(Map* map)
    {
        // We use spawn coords to spawn
        if (map->IsLoaded(i_data->posX, i_data->posY))
        {
            Creature* pCreature = new Creature;
            //DEBUG_LOG("Spawning creature %u",*itr);
            if (!pCreature->LoadFromDB(i_guid, map))
                delete pCreature;
            else
                map->Add(pCreature);
        }
    }

    uint32 i_guid;
    CreatureData const* i_data;
};

void Creature::SpawnInMaps(uint32 db_guid, CreatureData const* data)
{
    SpawnCreatureInMapsWorker worker(db_guid, data);
    sMapMgr.DoForAllMapsWithMapId(data->mapid, worker);
}

bool Creature::HasStaticDBSpawnData() const
{
    return sObjectMgr.GetCreatureData(GetGUIDLow()) != nullptr;
}

uint32 Creature::GetDBTableGUIDLow() const
{
    if (HasStaticDBSpawnData())
        return GetGUIDLow();
    return 0;
}

void Creature::SetVirtualItem(VirtualItemSlot slot, uint32 item_id)
{
    if (item_id == 0)
    {
        SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + slot, 0);
        SetUInt32Value(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, 0);
        SetUInt32Value(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 1, 0);
        return;
    }

    ItemPrototype const* proto = ObjectMgr::GetItemPrototype(item_id);
    if (!proto)
    {
        sLog.outError("Not listed in 'item_template' item (ID:%u) used as virtual item for %s", item_id, GetGuidStr().c_str());
        return;
    }

    SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + slot, proto->DisplayInfoID);
    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_CLASS,    proto->Class);
    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_SUBCLASS, proto->SubClass);
    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_MATERIAL, proto->Material);
    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_INVENTORYTYPE, proto->InventoryType);

    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 1, VIRTUAL_ITEM_INFO_1_OFFSET_SHEATH,        proto->Sheath);
}

void Creature::SetVirtualItemRaw(VirtualItemSlot slot, uint32 display_id, uint32 info0, uint32 info1)
{
    SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + slot, display_id);
    SetUInt32Value(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, info0);
    SetByteValue(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_INVENTORYTYPE, info1);

    // dummy: zero sheath
    SetUInt32Value(UNIT_VIRTUAL_ITEM_INFO + (slot * 2) + 1, 0);
}

void Creature::JoinCreatureGroup(Creature* leader, float dist, float angle, uint32 options)
{
    if (CreatureGroup* myGroup = GetCreatureGroup())
        myGroup->RemoveMember(GetObjectGuid());
    CreatureGroup* group = leader->GetCreatureGroup();
    if (!group)
    {
        group = new CreatureGroup(leader->GetObjectGuid());
        leader->SetCreatureGroup(group);
    }
    group->AddMember(GetObjectGuid(), dist, angle, options);
    SetCreatureGroup(group);
    if (group->IsFormation())
        GetMotionMaster()->Initialize();
}

bool Creature::HasWeapon() const
{
    uint8 itemClass = GetByteValue(UNIT_VIRTUAL_ITEM_INFO + (0 * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_CLASS);
    if (itemClass == ITEM_CLASS_WEAPON)
        return true;

    return false;
}

void Creature::DespawnOrUnsummon(uint32 msTimeToDespawn /*= 0*/)
{
    if (IsTemporarySummon())
        static_cast<TemporarySummon*>(this)->UnSummon(msTimeToDespawn);
    else if (IsPet())
        static_cast<Pet*>(this)->DelayedUnsummon(msTimeToDespawn, PET_SAVE_AS_DELETED);
    else
        ForcedDespawn(msTimeToDespawn);
}

void Creature::SetFeatherFall(bool enable)
{
    Unit::SetFeatherFall(enable);

    WorldPacket data(enable ? SMSG_SPLINE_MOVE_FEATHER_FALL : SMSG_SPLINE_MOVE_NORMAL_FALL);
    data << GetPackGUID();
    SendMessageToSet(&data, true);
}

void Creature::SetHover(bool enable)
{
    Unit::SetHover(enable);

    WorldPacket data(enable ? SMSG_SPLINE_MOVE_SET_HOVER : SMSG_SPLINE_MOVE_UNSET_HOVER, 9);
    data << GetPackGUID();
    SendMessageToSet(&data, false);
}

void Creature::SetWaterWalk(bool enable)
{
    Unit::SetWaterWalk(enable);

    WorldPacket data(enable ? SMSG_SPLINE_MOVE_WATER_WALK : SMSG_SPLINE_MOVE_LAND_WALK, 9);
    data << GetPackGUID();
    SendMessageToSet(&data, true);
}