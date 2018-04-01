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

#include "GameObject.h"
#include "QuestDef.h"
#include "ObjectMgr.h"
#include "PoolManager.h"
#include "SpellMgr.h"
#include "Spell.h"
#include "UpdateMask.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "World.h"
#include "Database/DatabaseEnv.h"
#include "LootMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "InstanceData.h"
#include "MapManager.h"
#include "MapPersistentStateMgr.h"
#include "BattleGround.h"
#include "BattleGroundAV.h"
#include "Util.h"

#include "GameObjectAI.h"
#include "ScriptMgr.h"
#include "ZoneScript.h"
#include "DynamicTree.h"
#include "vmap/GameObjectModel.h"

GameObject::GameObject() : WorldObject(),
    loot(this),
    m_goInfo(NULL),
    m_visible(true)
{
    m_objectType |= TYPEMASK_GAMEOBJECT;
    m_objectTypeId = TYPEID_GAMEOBJECT;
    m_updateFlag = (UPDATEFLAG_ALL | UPDATEFLAG_HAS_POSITION);

    m_valuesCount = GAMEOBJECT_END;
    m_respawnTime = 0;
    m_respawnDelayTime = 25;
    m_lootState = GO_NOT_READY;
    m_spawnedByDefault = true;
    m_useTimes = 0;
    m_spellId = 0;
    m_cooldownTime = 0;
    i_AI = NULL;
    m_model = NULL;
    m_rotation = 0;
    m_playerGroupId = 0;
    m_summonTarget = ObjectGuid();
}

GameObject::~GameObject()
{
    delete i_AI;
    delete m_model;
}

void GameObject::AddToWorld()
{
    ///- Register the gameobject for guid lookup
    if (!IsInWorld())
    {
        GetMap()->InsertObject<GameObject>(GetObjectGuid(), this);
        if (m_zoneScript)
            m_zoneScript->OnGameObjectCreate(this);

        if (m_model)
            GetMap()->InsertGameObjectModel(*m_model);
    }
    Object::AddToWorld();

    // After Object::AddToWorld so that for initial state the GO is added to the world (and hence handled correctly)
    UpdateCollisionState();

    if (!i_AI)
        AIM_Initialize();
}

void GameObject::AIM_Initialize()
{
    if (i_AI)
        delete i_AI;
    i_AI = sScriptMgr.GetGameObjectAI(this);
}

void GameObject::RemoveFromWorld()
{
    ///- Remove the gameobject from the accessor
    if (IsInWorld())
    {
        if (m_zoneScript)
            m_zoneScript->OnGameObjectRemove(this);

        // Remove GO from owner
        if (ObjectGuid owner_guid = GetOwnerGuid())
        {
            if (Unit* owner = ObjectAccessor::GetUnit(*this, owner_guid))
                owner->RemoveGameObject(this, false);
            else
            {
                sLog.outError("Delete %s with SpellId %u LinkedGO %u that lost references to owner %s GO list. Crash possible later.",
                              GetGuidStr().c_str(), m_spellId, GetGOInfo()->GetLinkedGameObjectEntry(), owner_guid.GetString().c_str());
            }
        }

        if (m_model && GetMap()->ContainsGameObjectModel(*m_model))
            GetMap()->RemoveGameObjectModel(*m_model);

        GetMap()->EraseObject<GameObject>(GetObjectGuid());
    }

    Object::RemoveFromWorld();
}

bool GameObject::Create(uint32 guidlow, uint32 name_id, Map *map, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 animprogress, GOState go_state)
{
    MANGOS_ASSERT(map);
    Relocate(x, y, z, ang);
    SetMap(map);

    if (!IsPositionValid())
    {
        sLog.outError("Gameobject (GUID: %u Entry: %u ) not created. Suggested coordinates are invalid (X: %f Y: %f)", guidlow, name_id, x, y);
        return false;
    }

    SetZoneScript();

    GameObjectInfo const* goinfo = ObjectMgr::GetGameObjectInfo(name_id);
    if (!goinfo)
    {
        sLog.outErrorDb("Gameobject (GUID: %u) not created: Entry %u does not exist in `gameobject_template`. Map: %u  (X: %f Y: %f Z: %f) ang: %f rotation0: %f rotation1: %f rotation2: %f rotation3: %f", guidlow, name_id, map->GetId(), x, y, z, ang, rotation0, rotation1, rotation2, rotation3);
        return false;
    }

    Object::_Create(guidlow, goinfo->id, HIGHGUID_GAMEOBJECT);

    m_goInfo = goinfo;

    if (goinfo->type >= MAX_GAMEOBJECT_TYPE)
    {
        sLog.outErrorDb("Gameobject (GUID: %u) not created: Entry %u has invalid type %u in `gameobject_template`. It may crash client if created.", guidlow, name_id, goinfo->type);
        return false;
    }

    SetObjectScale(goinfo->size);

    SetFloatValue(GAMEOBJECT_POS_X, x);
    SetFloatValue(GAMEOBJECT_POS_Y, y);
    SetFloatValue(GAMEOBJECT_POS_Z, z);
    SetFloatValue(GAMEOBJECT_FACING, ang);

    SetFloatValue(GAMEOBJECT_ROTATION + 0, rotation0);
    SetFloatValue(GAMEOBJECT_ROTATION + 1, rotation1);

    UpdateRotationFields(rotation2, rotation3);             // GAMEOBJECT_FACING, GAMEOBJECT_ROTATION+2/3

    SetUInt32Value(GAMEOBJECT_FACTION, goinfo->faction);
    SetUInt32Value(GAMEOBJECT_FLAGS, goinfo->flags);

    if (goinfo->type == GAMEOBJECT_TYPE_TRANSPORT)
        SetFlag(GAMEOBJECT_FLAGS, (GO_FLAG_TRANSPORT | GO_FLAG_NODESPAWN));

    SetEntry(goinfo->id);
    SetDisplayId(goinfo->displayId);

    SetGoState(go_state);
    SetGoType(GameobjectTypes(goinfo->type));

    SetGoAnimProgress(animprogress);
    SetName(goinfo->name);

    //Notify the map's instance data.
    //Only works if you create the object in it, not if it is moves to that map.
    //Normally non-players do not teleport to other maps.
    if (m_zoneScript)
        m_zoneScript->OnObjectCreate(this);

    return true;
}

class HunterTrapTargetSelectorCheck
{
public:
    HunterTrapTargetSelectorCheck(GameObject const* obj, Unit const* funit, float range) : i_trap(obj), i_trapOwner(funit), i_range(range) {}
    WorldObject const& GetFocusObject() const
    {
        return *i_trap;
    }
    bool operator()(Unit* u)
    {
        if (!i_trap->CanSeeInWorld(u))
            return false;
        bool _isTotem = u->GetTypeId() == TYPEID_UNIT && ((Creature*)u)->IsTotem();
        if (u->isAlive() && i_trap->IsWithinDistInMap(u, _isTotem ? i_range / 3.0f : i_range) && i_trapOwner->_IsValidAttackTarget(u))
        {
            i_range = i_trap->GetDistance(u);
            return true;
        }
        return false;
    }
private:
    GameObject const* i_trap;
    Unit const* i_trapOwner;
    float i_range;
};

void GameObject::Update(uint32 update_diff, uint32 /*p_time*/)
{
    WorldObject::Update(update_diff, update_diff);
    if (GetObjectGuid().IsMOTransport())
    {
        //((Transport*)this)->Update(p_time);
        return;
    }

    ///- UpdateAI
    if (i_AI)
        i_AI->UpdateAI(update_diff);

    switch (m_lootState)
    {
        case GO_NOT_READY:
        {
            switch (GetGoType())
            {
                case GAMEOBJECT_TYPE_TRAP:
                {
                    // Arming Time for GAMEOBJECT_TYPE_TRAP (6)
                    /* Ivina < Nostalrius > : toujours appliquer le startDelay. Retirer le delai de la DB si jamais un piege n'en a pas. */
                    // Unit* owner = GetOwner();
                    // if (owner && ((Player*)owner)->isInCombat())
                    if (GetGOInfo()->trap.startDelay)
                        m_cooldownTime = time(NULL) + GetGOInfo()->trap.startDelay;
                    m_lootState = GO_READY;
                    break;
                }
                case GAMEOBJECT_TYPE_FISHINGNODE:
                {
                    // fishing code (bobber ready)
                    if (time(NULL) > m_respawnTime - FISHING_BOBBER_READY_TIME)
                    {
                        // splash bobber (bobber ready now)
                        Unit* caster = GetOwner();
                        if (caster && caster->GetTypeId() == TYPEID_PLAYER)
                        {
                            SetGoState(GO_STATE_ACTIVE);
                            // SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_NODESPAWN);

			    
			    
                            SendForcedObjectUpdate();

			    // Play splash sound
			    PlayDistanceSound(3355);
                            SendGameObjectCustomAnim();
                        }

                        m_lootState = GO_READY;             // can be successfully open with some chance
                    }
                    return;
                }
                default:
                    m_lootState = GO_READY;                 // for other GO is same switched without delay to GO_READY
                    break;
            }
        }
        // NO BREAK for switch (m_lootState)
        case GO_READY:
        {
            if (m_respawnTime > 0)                          // timer on
            {
                if (m_respawnTime <= time(NULL))            // timer expired
                {
                    m_respawnTime = 0;
                    ClearAllUsesData();

                    switch (GetGoType())
                    {
                        case GAMEOBJECT_TYPE_FISHINGNODE:   // can't fish now
                        {
                            Unit* caster = GetOwner();
                            if (caster && caster->GetTypeId() == TYPEID_PLAYER)
                            {
                                caster->FinishSpell(CURRENT_CHANNELED_SPELL);

                                WorldPacket data(SMSG_FISH_NOT_HOOKED, 0);
                                ((Player*)caster)->GetSession()->SendPacket(&data);
                            }
                            // can be deleted
                            m_lootState = GO_JUST_DEACTIVATED;
                            return;
                        }
                        case GAMEOBJECT_TYPE_DOOR:
                        case GAMEOBJECT_TYPE_BUTTON:
                            //we need to open doors if they are closed (add there another condition if this code breaks some usage, but it need to be here for battlegrounds)
                            if (GetGoState() != GO_STATE_READY)
                                ResetDoorOrButton();
                            //flags in AB are type_button and we need to add them here so no break!
                        case GAMEOBJECT_TYPE_CHEST:
                        case GAMEOBJECT_TYPE_SPELL_FOCUS:
                        case GAMEOBJECT_TYPE_GOOBER:
                            // Respawn linked trap if any exists
                            RespawnLinkedGameObject();
                        default:
                            if (!m_spawnedByDefault)        // despawn timer
                            {
                                // can be despawned or destroyed
                                SetLootState(GO_JUST_DEACTIVATED);
                                return;
                            }

                            const LockEntry *lock = sLockStore.LookupEntry(GetGOInfo()->GetLockId());
                            //workarounds for PvP banners
                            if (lock && lock->Index[1] == LOCKTYPE_SLOW_OPEN)
                            {
                                m_respawnDelayTime = -1; //spawn animation
                                GetMap()->Add(this);
                                m_respawnDelayTime = 0;
                                SendGameObjectReset();
                            }
                            else
                                GetMap()->Add(this);
                    }
                }
            }

            if (isSpawned())
            {
                // traps can have time and can not have
                GameObjectInfo const* goInfo = GetGOInfo();
                if (goInfo->type == GAMEOBJECT_TYPE_TRAP)
                {
                    if (m_cooldownTime >= time(NULL))
                        return;

                    // traps
                    Unit* owner = GetOwner();
                    Unit* ok = NULL;                        // pointer to appropriate target if found any

                    bool IsBattleGroundTrap = false;
                    //FIXME: this is activation radius (in different casting radius that must be selected from spell data)
                    //TODO: move activated state code (cast itself) to GO_ACTIVATED, in this place only check activating and set state
                    float radius = float(goInfo->trap.radius);
                    if (!radius)
                    {
                        if (goInfo->trap.cooldown != 3)     // cast in other case (at some triggering/linked go/etc explicit call)
                            return;
                        else
                        {
                            if (m_respawnTime > 0)
                                break;

                            // battlegrounds gameobjects has data2 == 0 && data5 == 3
                            radius = float(goInfo->trap.cooldown);
                            IsBattleGroundTrap = true;
                        }
                    }
                    // Rayon float et non entier (impose par la DB) pour certains pieges chassoux :
                    switch (goInfo->id)
                    {
                        case 2561:
                        case 164638:
                        case 164639:
                        case 164839:
                        case 164872:
                        case 164873:
                        case 164874:
                        case 164875:
                        case 164876:
                        case 164877:
                        case 164879:
                        case 164880:
                            radius = 2.5f;
                            break;
                    }

                    // Note: this hack with search required until GO casting not implemented
                    // search unfriendly creature
                    if (owner && goInfo->trap.charges > 0)  // hunter trap
                    {
                        HunterTrapTargetSelectorCheck u_check(this, owner, radius);
                        MaNGOS::UnitLastSearcher<HunterTrapTargetSelectorCheck> checker(ok, u_check);
                        Cell::VisitWorldObjects(this, checker, radius); // players
                        Cell::VisitGridObjects(this, checker, radius); // units
                    }
                    else                                    // environmental trap
                    {
                        // environmental damage spells already have around enemies targeting but this not help in case nonexistent GO casting support

                        // affect only players
                        Player* p_ok = NULL;
                        MaNGOS::AnyPlayerInObjectRangeCheck p_check(this, radius);
                        MaNGOS::PlayerSearcher<MaNGOS::AnyPlayerInObjectRangeCheck>  checker(p_ok, p_check);
                        Cell::VisitWorldObjects(this, checker, radius);
                        ok = p_ok;
                    }

                    if (ok && (!AI() || !AI()->OnUse(ok)))
                    {
                        Unit *caster =  owner ? owner : ok;

                        caster->CastSpell(ok, goInfo->trap.spellId, true, NULL, NULL, GetObjectGuid());
                        // use template cooldown if provided
                        m_cooldownTime = time(NULL) + (goInfo->trap.cooldown ? goInfo->trap.cooldown : uint32(4));

                        // count charges
                        if (goInfo->trap.charges > 0)
                            AddUse();

                        if (IsBattleGroundTrap && ok->GetTypeId() == TYPEID_PLAYER)
                        {
                            //BattleGround gameobjects case
                            if (((Player*)ok)->InBattleGround())
                                if (BattleGround *bg = ((Player*)ok)->GetBattleGround())
                                    bg->HandleTriggerBuff(GetObjectGuid());
                        }

                        // TODO: all traps can be activated, also those without spell.
                        // Some may have have animation and/or are expected to despawn.
                        switch (GetDisplayId())
                        {
                            case 3073:
                            case 4392:
                            case 4472:
                            case 4491:
                            case 6785:
                            case 6747: //sapphiron birth
                                SendGameObjectCustomAnim();
                                break;
                        }
                    }
                }

                if (uint32 max_charges = goInfo->GetCharges())
                {
                    if (m_useTimes >= max_charges)
                    {
                        m_useTimes = 0;
                        SetLootState(GO_JUST_DEACTIVATED);  // can be despawned or destroyed
                    }
                }
            }
            break;
        }
        case GO_ACTIVATED:
        {
            switch (GetGoType())
            {
                case GAMEOBJECT_TYPE_DOOR: // Ustaag <Nostalrius>
                {
                    if ((m_cooldownTime < time(NULL)) && (GetGOInfo()->GetAutoCloseTime() != 0))
                        ResetDoorOrButton();
                    break;
                }
                case GAMEOBJECT_TYPE_BUTTON:
                {
                    if ((m_cooldownTime < time(NULL)) && (GetGOInfo()->GetAutoCloseTime() != 0))  // Ustaag <Nostalrius>
                        //if (m_respawnDelayTime && (m_cooldownTime < time(NULL)))
                        ResetDoorOrButton();
                    break;
                }
                case GAMEOBJECT_TYPE_GOOBER:
                    if (m_cooldownTime < time(NULL))
                    {
                        RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);

                        SetLootState(GO_JUST_DEACTIVATED);
                        m_cooldownTime = 0;
                    }
                    break;
                default:
                    break;
            }
            break;
        }
        case GO_JUST_DEACTIVATED:
        {
            // if Gameobject should cast spell, then this, but some GOs (type = 10) should be destroyed
            if (GetGoType() == GAMEOBJECT_TYPE_GOOBER)
            {
                uint32 spellId = GetGOInfo()->goober.spellId;

                if (spellId)
                {
                    // TODO find out why this is here, because m_UniqueUsers is empty for GAMEOBJECT_TYPE_GOOBER
                    for (GuidsSet::const_iterator itr = m_UniqueUsers.begin(); itr != m_UniqueUsers.end(); ++itr)
                    {
                        if (Player* owner = GetMap()->GetPlayer(*itr))
                            owner->CastSpell(owner, spellId, false, NULL, NULL, GetObjectGuid());
                    }

                    ClearAllUsesData();
                }

                SetGoState(GO_STATE_READY);

                //any return here in case battleground traps
            }

            if (GetOwnerGuid())
            {
                if (Unit* owner = GetOwner())
                    owner->RemoveGameObject(this, false);

                SetRespawnTime(0);
                Delete();
                return;
            }

            // burning flags in some battlegrounds, if you find better condition, just add it
            if (GetGOInfo()->IsDespawnAtAction() || GetGoAnimProgress() > 0)
            {
                SendObjectDeSpawnAnim(GetObjectGuid());
                // reset flags
                if (GetMap()->Instanceable())
                {
                    // In Instances GO_FLAG_LOCKED or GO_FLAG_NO_INTERACT are not changed
                    uint32 currentLockOrInteractFlags = GetUInt32Value(GAMEOBJECT_FLAGS) & (GO_FLAG_LOCKED | GO_FLAG_NO_INTERACT);
                    SetUInt32Value(GAMEOBJECT_FLAGS, GetGOInfo()->flags & ~(GO_FLAG_LOCKED | GO_FLAG_NO_INTERACT) | currentLockOrInteractFlags);
                }
                else
                    SetUInt32Value(GAMEOBJECT_FLAGS, GetGOInfo()->flags);
            }

            loot.clear();
            SetLootState(GO_READY);

            if (!m_respawnDelayTime)
                return;

            if (m_spawnedByDefault)
            {
                m_respawnTime = time(NULL) + ComputeRespawnDelay();
            }
            else
                m_respawnTime = 0;

            // if option not set then object will be saved at grid unload
            if (sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY))
                SaveRespawnTime();
            UpdateObjectVisibility();
            JustDespawnedWaitingRespawn();
            break;
        }
    }
}

uint32 GameObject::ComputeRespawnDelay() const
{
    if (GameObjectData const* data = GetGOData())
        return data->ComputeRespawnDelay(m_respawnDelayTime);
    return m_respawnDelayTime;
}

uint32 GameObjectData::ComputeRespawnDelay(uint32 respawnDelay) const
{
    if (spawnFlags & SPAWN_FLAG_RANDOM_RESPAWN_TIME)
        respawnDelay = uint32(float(respawnDelay * urand(90, 110)) / 100.f);
    if (spawnFlags & SPAWN_FLAG_DYNAMIC_RESPAWN_TIME && sWorld.GetActiveSessionCount() > BLIZZLIKE_REALM_POPULATION)
        respawnDelay = uint32(float(respawnDelay * BLIZZLIKE_REALM_POPULATION) / float(sWorld.GetActiveSessionCount()));
    return respawnDelay;
}

void GameObject::JustDespawnedWaitingRespawn()
{
    if (uint16 poolid = sPoolMgr.IsPartOfAPool<GameObject>(GetGUIDLow()))
    {
        uint32 guidLow = GetGUIDLow();
        MapPersistentState& state = *GetMap()->GetPersistentState();
        sPoolMgr.GetPoolGameObjects(poolid).DespawnObject(state, guidLow); // Calls 'AddObjectToRemoveList', so the object is deleted. Do not use any class method / attribute!
        if (!IsDeleted())
        {
            sLog.outInfo("[Pool #%u] %s is not deleted but should be", poolid, GetGuidStr().c_str());
            AddObjectToRemoveList();
        }
        sPoolMgr.UpdatePool<GameObject>(state, poolid, GetGUIDLow());
        return;
    }
}

void GameObject::Refresh()
{
    // not refresh despawned not casted GO (despawned casted GO destroyed in all cases anyway)
    if (m_respawnTime > 0 && m_spawnedByDefault)
        return;

    if (isSpawned())
        GetMap()->Add(this);
}

void GameObject::AddUniqueUse(Player* player)
{
    std::unique_lock<std::mutex> guard(m_UniqueUsers_lock);

    AddUse();

    if (m_UniqueUsers.find(player->GetObjectGuid()) != m_UniqueUsers.end())
        return;

    if (!m_firstUser)
        m_firstUser = player->GetObjectGuid();

    m_UniqueUsers.insert(player->GetObjectGuid());

    guard.unlock();

    if (GameObjectInfo const* info = GetGOInfo())
        if (info->type == GAMEOBJECT_TYPE_SUMMONING_RITUAL &&
            info->summoningRitual.animSpell &&
            GetOwnerGuid() != player->GetObjectGuid())
        {
            SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(info->summoningRitual.animSpell);
            if (!spellInfo)
            {
                sLog.outError("WORLD: unknown spell id %u at play anim for gameobject (Entry: %u GoType: %u )", info->summoningRitual.animSpell, GetEntry(), GetGoType());
                return;
            }
            Spell* spell = new Spell(player, spellInfo, true, GetObjectGuid());
            spell->SetChannelingVisual(true);
            SpellCastTargets targets;
            targets.setGOTarget(this);
            spell->prepare(std::move(targets));
        }
}

void GameObject::RemoveUniqueUse(Player* player)
{
    std::lock_guard<std::mutex> guard(m_UniqueUsers_lock);

    auto itr = m_UniqueUsers.find(player->GetObjectGuid());
    if (itr == m_UniqueUsers.end())
        return;
    m_UniqueUsers.erase(itr);

    if (GameObjectInfo const* info = GetGOInfo())
        // owner cancelled
        if (player->GetObjectGuid() == GetOwnerGuid() ||
            // too many helpers cancelled while it's activated
            (GetGoState() == GO_STATE_ACTIVE &&
            m_UniqueUsers.size() < info->summoningRitual.reqParticipants))
        {
            if (!info->summoningRitual.ritualPersistent)
            {
                if (GetGoState() != GO_STATE_ACTIVE)
                    SetLootState(GO_JUST_DEACTIVATED);
                else if (GetOwner())
                    // if active it'll be destroyed in Spell::update
                    // remove it from owner's list to keep it running
                    GetOwner()->RemoveGameObject(this, false);
            }
            SetGoState(GO_STATE_READY);
        }
}

void GameObject::FinishRitual()
{
    std::unique_lock<std::mutex> guard(m_UniqueUsers_lock);

    if (GameObjectInfo const* info = GetGOInfo())
    {
        // take spell cooldown
        if (GetOwner() && GetOwner()->IsPlayer())
            if (SpellEntry const* createBySpell = sSpellMgr.GetSpellEntry(GetSpellId()))
                GetOwner()->CooldownEvent(createBySpell);
        if (!info->summoningRitual.ritualPersistent)
            SetLootState(GO_JUST_DEACTIVATED);
        // Only ritual of doom deals a second spell
        if (uint32 spellid = info->summoningRitual.casterTargetSpell)
        {
            // On a random user
            auto it = m_UniqueUsers.begin();
            if (it != m_UniqueUsers.end())
            {
                std::advance(it, urand(0, m_UniqueUsers.size() - 1));

                guard.unlock();

                if (Player* target = GetMap()->GetPlayer(*it))
                    target->CastSpell(target, spellid, true);
            }
        }
    }
}

bool GameObject::HasUniqueUser(Player* player)
{
    std::lock_guard<std::mutex> guard(m_UniqueUsers_lock);
    return m_UniqueUsers.find(player->GetObjectGuid()) != m_UniqueUsers.end();
}

uint32 GameObject::GetUniqueUseCount()
{
    std::lock_guard<std::mutex> guard(m_UniqueUsers_lock);
    return m_UniqueUsers.size();
}

void GameObject::Delete()
{
    if (!IsDeleted())
        AddObjectToRemoveList();

    // no despawn animation for not activated rituals
    if (GetGoType() != GAMEOBJECT_TYPE_SUMMONING_RITUAL ||
        GetGoState() == GO_STATE_ACTIVE)
        SendObjectDeSpawnAnim(GetObjectGuid());

    SetGoState(GO_STATE_READY);
    SetUInt32Value(GAMEOBJECT_FLAGS, GetGOInfo()->flags);

    if (uint16 poolid = sPoolMgr.IsPartOfAPool<GameObject>(GetGUIDLow()))
        sPoolMgr.GetPoolGameObjects(poolid).DespawnObject(*GetMap()->GetPersistentState(), GetGUIDLow());
}

void GameObject::getFishLoot(Loot *fishloot, Player* loot_owner)
{
    fishloot->clear();

    uint32 zone, subzone;
    GetZoneAndAreaId(zone, subzone);

    // Don't allow fishing in hidden wetlands lake
    if (subzone == 11 && loot_owner->IsWithinDist2d(-4074.74f, -1315.79f, 100.0f))
        return;

    // if subzone loot exist use it
    if (!fishloot->FillLoot(subzone, LootTemplates_Fishing, loot_owner, true, (subzone != zone)) && subzone != zone)
        // else use zone loot (if zone diff. from subzone, must exist in like case)
        fishloot->FillLoot(zone, LootTemplates_Fishing, loot_owner, true);
}

void GameObject::SaveToDB()
{
    // this should only be used when the gameobject has already been loaded
    // preferably after adding to map, because mapid may not be valid otherwise
    GameObjectData const *data = sObjectMgr.GetGOData(GetGUIDLow());
    if (!data)
    {
        sLog.outError("GameObject::SaveToDB failed, cannot get gameobject data!");
        return;
    }

    SaveToDB(GetMapId());
}

void GameObject::SaveToDB(uint32 mapid)
{
    const GameObjectInfo *goI = GetGOInfo();

    if (!goI)
        return;

    // update in loaded data (changing data only in this place)
    GameObjectData& data = sObjectMgr.NewGOData(GetGUIDLow());

    // data->guid = guid don't must be update at save
    data.id = GetEntry();
    data.mapid = mapid;
    data.posX = GetFloatValue(GAMEOBJECT_POS_X);
    data.posY = GetFloatValue(GAMEOBJECT_POS_Y);
    data.posZ = GetFloatValue(GAMEOBJECT_POS_Z);
    data.orientation = GetFloatValue(GAMEOBJECT_FACING);
    data.rotation0 = GetFloatValue(GAMEOBJECT_ROTATION + 0);
    data.rotation1 = GetFloatValue(GAMEOBJECT_ROTATION + 1);
    data.rotation2 = GetFloatValue(GAMEOBJECT_ROTATION + 2);
    data.rotation3 = GetFloatValue(GAMEOBJECT_ROTATION + 3);
    data.spawntimesecsmin = m_spawnedByDefault ? (int32)m_respawnDelayTime : -(int32)m_respawnDelayTime;
    data.spawntimesecsmax = m_spawnedByDefault ? (int32)m_respawnDelayTime : -(int32)m_respawnDelayTime;
    data.animprogress = GetGoAnimProgress();
    data.go_state = GetGoState();
    data.spawnFlags = m_isActiveObject ? SPAWN_FLAG_ACTIVE : 0;

    // updated in DB
    std::ostringstream ss;
    ss << "INSERT INTO gameobject VALUES ( "
       << GetGUIDLow() << ", "
       << GetEntry() << ", "
       << mapid << ", "
       << GetFloatValue(GAMEOBJECT_POS_X) << ", "
       << GetFloatValue(GAMEOBJECT_POS_Y) << ", "
       << GetFloatValue(GAMEOBJECT_POS_Z) << ", "
       << GetFloatValue(GAMEOBJECT_FACING) << ", "
       << GetFloatValue(GAMEOBJECT_ROTATION) << ", "
       << GetFloatValue(GAMEOBJECT_ROTATION + 1) << ", "
       << GetFloatValue(GAMEOBJECT_ROTATION + 2) << ", "
       << GetFloatValue(GAMEOBJECT_ROTATION + 3) << ", "
       << data.spawntimesecsmin << ", " // PRESERVE SPAWNED BY DEFAULT
       << data.spawntimesecsmax << ", "
       << uint32(GetGoAnimProgress()) << ", "
       << uint32(GetGoState()) << ", "
       << m_isActiveObject << ", "
       << m_visibilityModifier << ", "
       << 0 << ", "  // patch_min
       << 10 << ")"; // patch_max

    WorldDatabase.BeginTransaction();
    WorldDatabase.PExecuteLog("DELETE FROM gameobject WHERE guid = '%u'", GetGUIDLow());
    WorldDatabase.PExecuteLog("%s", ss.str().c_str());
    WorldDatabase.CommitTransaction();
}

bool GameObject::LoadFromDB(uint32 guid, Map *map)
{
    GameObjectData const* data = sObjectMgr.GetGOData(guid);

    if (!data)
    {
        sLog.outErrorDb("Gameobject (GUID: %u) not found in table `gameobject`, can't load. ", guid);
        return false;
    }
    if (data->spawnFlags & SPAWN_FLAG_DISABLED)
        return false;


    uint32 entry = data->id;
    //uint32 map_id = data->mapid;                          // already used before call
    float x = data->posX;
    float y = data->posY;
    float z = data->posZ;
    float ang = data->orientation;

    float rotation0 = data->rotation0;
    float rotation1 = data->rotation1;
    float rotation2 = data->rotation2;
    float rotation3 = data->rotation3;

    uint32 animprogress = data->animprogress;
    GOState go_state = data->go_state;

    if (!Create(guid, entry, map, x, y, z, ang, rotation0, rotation1, rotation2, rotation3, animprogress, go_state))
        return false;

    if (!GetGOInfo()->GetDespawnPossibility() && !GetGOInfo()->IsDespawnAtAction() && data->spawntimesecsmin >= 0)
    {
        SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NODESPAWN);
        m_spawnedByDefault = true;
        m_respawnDelayTime = 0;
        m_respawnTime = 0;
    }
    else
    {
        if (data->spawntimesecsmin >= 0)
        {
            m_spawnedByDefault = true;
            m_respawnDelayTime = data->GetRandomRespawnTime();

            m_respawnTime  = map->GetPersistentState()->GetGORespawnTime(GetGUIDLow());

            // ready to respawn
            if (m_respawnTime && m_respawnTime <= time(NULL))
            {
                m_respawnTime = 0;
                map->GetPersistentState()->SaveGORespawnTime(GetGUIDLow(), 0);
            }
        }
        else
        {
            m_spawnedByDefault = false;
            m_respawnDelayTime = -data->spawntimesecsmin;
            m_respawnTime = 0;
        }
    }

    m_isActiveObject = (data->spawnFlags & SPAWN_FLAG_ACTIVE);
    m_visibilityModifier = data->visibilityModifier;

    return true;
}

struct GameObjectRespawnDeleteWorker
{
    explicit GameObjectRespawnDeleteWorker(uint32 guid) : i_guid(guid) {}

    void operator()(MapPersistentState* state) const
    {
        state->SaveGORespawnTime(i_guid, 0);
    }

    uint32 i_guid;
};


void GameObject::DeleteFromDB() const
{
    if (!HasStaticDBSpawnData())
    {
        DEBUG_LOG("Trying to delete not saved gameobject!");
        return;
    }

    GameObjectRespawnDeleteWorker worker(GetGUIDLow());
    sMapPersistentStateMgr.DoForAllStatesWithMapId(GetMapId(), GetInstanceId(), worker);

    sObjectMgr.DeleteGOData(GetGUIDLow());
    WorldDatabase.PExecuteLog("DELETE FROM gameobject WHERE guid = '%u'", GetGUIDLow());
    WorldDatabase.PExecuteLog("DELETE FROM game_event_gameobject WHERE guid = '%u'", GetGUIDLow());
    WorldDatabase.PExecuteLog("DELETE FROM gameobject_battleground WHERE guid = '%u'", GetGUIDLow());
}

GameObjectInfo const *GameObject::GetGOInfo() const
{
    return m_goInfo;
}

/*********************************************************/
/***                    QUEST SYSTEM                   ***/
/*********************************************************/
bool GameObject::HasQuest(uint32 quest_id) const
{
    QuestRelationsMapBounds bounds = sObjectMgr.GetGOQuestRelationsMapBounds(GetEntry());
    for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second == quest_id)
            return true;
    }
    return false;
}

bool GameObject::HasInvolvedQuest(uint32 quest_id) const
{
    QuestRelationsMapBounds bounds = sObjectMgr.GetGOQuestInvolvedRelationsMapBounds(GetEntry());
    for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second == quest_id)
            return true;
    }
    return false;
}

bool GameObject::IsTransport() const
{
    // If something is marked as a transport, don't transmit an out of range packet for it.
    GameObjectInfo const * gInfo = GetGOInfo();
    if (!gInfo) return false;
    return gInfo->type == GAMEOBJECT_TYPE_TRANSPORT || gInfo->type == GAMEOBJECT_TYPE_MO_TRANSPORT;
}

Unit* GameObject::GetOwner() const
{
    if (!FindMap())
        return NULL;
    return FindMap()->GetUnit(GetOwnerGuid());
}

void GameObject::SaveRespawnTime()
{
    if (m_respawnTime > time(NULL) && m_spawnedByDefault)
        GetMap()->GetPersistentState()->SaveGORespawnTime(GetGUIDLow(), m_respawnTime);
}

void GameObject::SetVisible(bool b)
{
    if (m_visible == b)
        return;
    m_visible = b;
    UpdateObjectVisibility();
}

bool GameObject::isVisibleForInState(Player const* u, WorldObject const* viewPoint, bool inVisibleList) const
{
    // Not in world
    if (!IsInWorld() || !u->IsInWorld())
        return false;

    // Transport always visible at this step implementation
    if (IsTransport() && IsInMap(u))
        return true;

    // quick check visibility false cases for non-GM-mode
    if (!u->isGameMaster())
    {
        if (!IsVisible())
            return false;

        // despawned and then not visible for non-GM in GM-mode
        if (!isSpawned())
            return false;

        // special invisibility cases
        /* TODO: implement trap stealth, take look at spell 2836
        if(GetGOInfo()->type == GAMEOBJECT_TYPE_TRAP && GetGOInfo()->trap.stealthed && u->IsHostileTo(GetOwner()))
        {
            if(check stuff here)
                return false;
        }*/
        if (GetGOInfo()->type == GAMEOBJECT_TYPE_TRAP && GetGOInfo()->trap.stealthed && IsHostileTo(u))
        {
            if (!(u->m_detectInvisibilityMask & (1 << 3))) // Detection des pieges
                return false;
        }
        // Smuggled Mana Cell required 10 invisibility type detection/state
        if (GetEntry() == 187039 && ((u->m_detectInvisibilityMask | u->m_invisibilityMask) & (1 << 10)) == 0)
            return false;
    }

    // check distance
    return IsWithinDistInMap(viewPoint, GetMap()->GetVisibilityDistance() +
                             (inVisibleList ? World::GetVisibleObjectGreyDistance() : 0.0f) + GetVisibilityModifier(), false);
}

void GameObject::Respawn()
{
    if (m_spawnedByDefault && m_respawnTime > 0)
    {
        m_respawnTime = time(NULL);
        GetMap()->GetPersistentState()->SaveGORespawnTime(GetGUIDLow(), 0);
    }
}

bool GameObject::ActivateToQuest(Player *pTarget) const
{
    // if GO is ReqCreatureOrGoN for quest
    if (pTarget->HasQuestForGO(GetEntry()))
        return true;

    if (!sObjectMgr.IsGameObjectForQuests(GetEntry()))
        return false;

    switch (GetGoType())
    {
        case GAMEOBJECT_TYPE_QUESTGIVER:
        {
            // Not fully clear when GO's can activate/deactivate
            // For cases where GO has additional (except quest itself),
            // these conditions are not sufficient/will fail.
            // Never expect flags|4 for these GO's? (NF-note: It doesn't appear it's expected)

            QuestRelationsMapBounds bounds = sObjectMgr.GetGOQuestRelationsMapBounds(GetEntry());

            for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
                if (const Quest* qInfo = sObjectMgr.GetQuestTemplate(itr->second))
                    if (pTarget->CanTakeQuest(qInfo, false))
                        return true;

            bounds = sObjectMgr.GetGOQuestInvolvedRelationsMapBounds(GetEntry());

            for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
            {
                if ((pTarget->GetQuestStatus(itr->second) == QUEST_STATUS_INCOMPLETE || pTarget->GetQuestStatus(itr->second) == QUEST_STATUS_COMPLETE)
                        && !pTarget->GetQuestRewardStatus(itr->second))
                    return true;
            }

            break;
        }
        // scan GO chest with loot including quest items
        case GAMEOBJECT_TYPE_CHEST:
        {
            if (pTarget->GetQuestStatus(GetGOInfo()->chest.questId) == QUEST_STATUS_INCOMPLETE)
                return true;

            if (LootTemplates_Gameobject.HaveQuestLootForPlayer(GetGOInfo()->GetLootId(), pTarget))
            {
                //look for battlegroundAV for some objects which are only activated after mine gots captured by own team
//                if (GetEntry() == BG_AV_OBJECTID_MINE_N || GetEntry() == BG_AV_OBJECTID_MINE_S)
//                    if (BattleGround *bg = pTarget->GetBattleGround())
//                        if (bg->GetTypeID() == BATTLEGROUND_AV && !(((BattleGroundAV*)bg)->PlayerCanDoMineQuest(GetEntry(), pTarget->GetTeam())))
//                            return false;
                return true;
            }
            break;
        }
        case GAMEOBJECT_TYPE_GENERIC:
        {
            if (pTarget->GetQuestStatus(GetGOInfo()->_generic.questID) == QUEST_STATUS_INCOMPLETE)
                return true;
            break;
        }
        case GAMEOBJECT_TYPE_SPELL_FOCUS:
        {
            if (pTarget->GetQuestStatus(GetGOInfo()->spellFocus.questID) == QUEST_STATUS_INCOMPLETE)
                return true;
            break;
        }
        case GAMEOBJECT_TYPE_GOOBER:
        {
            if (pTarget->GetQuestStatus(GetGOInfo()->goober.questId) == QUEST_STATUS_INCOMPLETE)
                return true;
            break;
        }
        default:
            break;
    }

    return false;
}

void GameObject::SummonLinkedTrapIfAny()
{
    uint32 linkedEntry = GetGOInfo()->GetLinkedGameObjectEntry();
    if (!linkedEntry)
        return;

    GameObject* linkedGO = new GameObject;
    if (!linkedGO->Create(GetMap()->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), linkedEntry, GetMap(),
                          GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
    {
        delete linkedGO;
        return;
    }

    linkedGO->SetRespawnTime(GetRespawnDelay());
    linkedGO->SetSpellId(GetSpellId());

    if (GetOwnerGuid())
    {
        linkedGO->SetOwnerGuid(GetOwnerGuid());
        linkedGO->SetUInt32Value(GAMEOBJECT_LEVEL, GetUInt32Value(GAMEOBJECT_LEVEL));
    }

    GetMap()->Add(linkedGO);
}

void GameObject::TriggerLinkedGameObject(Unit* target)
{
    uint32 trapEntry = GetGOInfo()->GetLinkedGameObjectEntry();

    if (!trapEntry)
        return;

    GameObjectInfo const* trapInfo = sGOStorage.LookupEntry<GameObjectInfo>(trapEntry);
    if (!trapInfo || trapInfo->type != GAMEOBJECT_TYPE_TRAP)
        return;

    SpellEntry const* trapSpell = sSpellMgr.GetSpellEntry(trapInfo->trap.spellId);

    // The range to search for linked trap is weird. We set 0.5 as default. Most (all?)
    // traps are probably expected to be pretty much at the same location as the used GO,
    // so it appears that using range from spell is obsolete.
    float range = 0.5f;

    if (trapSpell)                                          // checked at load already
        range = GetSpellMaxRange(sSpellRangeStore.LookupEntry(trapSpell->rangeIndex));

    // search nearest linked GO
    GameObject* trapGO = NULL;

    {
        // search closest with base of used GO, using max range of trap spell as search radius (why? See above)
        MaNGOS::NearestGameObjectEntryInObjectRangeCheck go_check(*this, trapEntry, range);
        MaNGOS::GameObjectLastSearcher<MaNGOS::NearestGameObjectEntryInObjectRangeCheck> checker(trapGO, go_check);

        Cell::VisitGridObjects(this, checker, range);
    }

    // found correct GO
    if (trapGO && trapGO->isSpawned())
        trapGO->Use(target);
}

void GameObject::RespawnLinkedGameObject()
{
    uint32 trapEntry = GetGOInfo()->GetLinkedGameObjectEntry();

    if (!trapEntry)
        return;

    GameObjectInfo const* trapInfo = sGOStorage.LookupEntry<GameObjectInfo>(trapEntry);
    if (!trapInfo || trapInfo->type != GAMEOBJECT_TYPE_TRAP)
        return;

    float range = 0.5f;

    // search nearest linked GO
    GameObject* trapGO = NULL;
    {
        // search closest with base of used GO, using max range of trap spell as search radius
        MaNGOS::NearestGameObjectEntryInObjectRangeCheck go_check(*this, trapEntry, range);
        MaNGOS::GameObjectLastSearcher<MaNGOS::NearestGameObjectEntryInObjectRangeCheck> checker(trapGO, go_check);

        Cell::VisitGridObjects(this, checker, range);
    }

    // Respawn the trap
    if (trapGO && !trapGO->isSpawned())
        trapGO->Respawn();
}

GameObject* GameObject::LookupFishingHoleAround(float range)
{
    GameObject* ok = NULL;

    MaNGOS::NearestGameObjectFishingHoleCheck u_check(*this, range);
    MaNGOS::GameObjectSearcher<MaNGOS::NearestGameObjectFishingHoleCheck> checker(ok, u_check);
    Cell::VisitGridObjects(this, checker, range);

    return ok;
}

void GameObject::ResetDoorOrButton()
{
    if (m_lootState == GO_READY || m_lootState == GO_JUST_DEACTIVATED)
        return;

    SwitchDoorOrButton(false);
    SetLootState(GO_JUST_DEACTIVATED);
    m_cooldownTime = 0;
}

void GameObject::UseDoorOrButton(uint32 time_to_restore, bool alternative /* = false */)
{
    // GO_NOT_READY: needed in OnGameObjectCreate
    if (m_lootState != GO_READY && m_lootState != GO_NOT_READY)
        return;

    if (!time_to_restore)
        time_to_restore = GetGOInfo()->GetAutoCloseTime();

    SwitchDoorOrButton(true, alternative);
    SetLootState(GO_ACTIVATED);

    m_cooldownTime = time(NULL) + time_to_restore;
}

void GameObject::SwitchDoorOrButton(bool activate, bool alternative /* = false */)
{
    if (activate)
        SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
    else
        RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);

    if (GetGoState() == GO_STATE_READY)                     //if closed -> open
        SetGoState(alternative ? GO_STATE_ACTIVE_ALTERNATIVE : GO_STATE_ACTIVE);
    else                                                    //if open -> close
        SetGoState(GO_STATE_READY);
}

void GameObject::Use(Unit* user)
{
    // by default spell caster is user
    Unit* spellCaster = user;
    uint32 spellId = 0;
    bool triggered = false;

    // Nostalrius : Compatible avec les Unit comme caster.
    if (AI() && AI()->OnUse(user))
        return;

    if (user->GetTypeId() == TYPEID_PLAYER && sScriptMgr.OnGameObjectUse((Player*)user, this))
        return;

    // test only for exist cooldown data (cooldown timer used for door/buttons reset that not have use cooldown)
    if (uint32 cooldown = GetGOInfo()->GetCooldown())
    {
        if (m_cooldownTime > sWorld.GetGameTime())
            return;

        m_cooldownTime = sWorld.GetGameTime() + cooldown;
    }

    switch (GetGoType())
    {
        case GAMEOBJECT_TYPE_DOOR:                          // 0
        {
            //doors never really despawn, only reset to default state/flags
            UseDoorOrButton();

            // activate script
            GetMap()->ScriptsStart(sGameObjectScripts, GetGUIDLow(), spellCaster, this);
            return;
        }
        case GAMEOBJECT_TYPE_BUTTON:                        // 1
        {
            // add LOS requirement for Lever objects, like the ones inside sm cath/armory entrance
            if (GetDisplayId() == 295)
                if (!user->IsWithinLOSInMap(this, false))
                    return;

            //buttons never really despawn, only reset to default state/flags
            UseDoorOrButton();

            // activate script
            GetMap()->ScriptsStart(sGameObjectScripts, GetGUIDLow(), spellCaster, this);

            TriggerLinkedGameObject(user);
            return;
        }
        case GAMEOBJECT_TYPE_QUESTGIVER:                    // 2
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            if (!sScriptMgr.OnGossipHello(player, this))
            {
                player->PrepareGossipMenu(this, GetGOInfo()->questgiver.gossipID);
                player->SendPreparedGossip(this);
            }

            return;
        }
        case GAMEOBJECT_TYPE_CHEST:                         // 3
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            TriggerLinkedGameObject(user);
            return;
        }
        case GAMEOBJECT_TYPE_GENERIC:                       // 5
        {
            // No known way to exclude some - only different approach is to select despawnable GOs by Entry
            SetLootState(GO_JUST_DEACTIVATED);
            return;
        }
        case GAMEOBJECT_TYPE_TRAP:                          // 6
        {
            // Currently we do not expect trap code below to be Use()
            // directly (except from spell effect). Code here will be called by TriggerLinkedGameObject.

            // FIXME: when GO casting will be implemented trap must cast spell to target
            if (uint32 spellId = GetGOInfo()->trap.spellId)
                user->CastSpell(user, spellId, true, NULL, NULL, GetObjectGuid());

            if (uint32 max_charges = GetGOInfo()->GetCharges())
            {
                AddUse();
                if (m_useTimes >= max_charges)
                {
                    m_useTimes = 0;
                    SetLootState(GO_JUST_DEACTIVATED);
                }
            }

            return;
        }
        case GAMEOBJECT_TYPE_CHAIR:                         //7 Sitting: Wooden bench, chairs
        {
            GameObjectInfo const* info = GetGOInfo();
            if (!info)
                return;

            if (user->GetTypeId() != TYPEID_PLAYER)
                return;
            
            if (!user->IsWithinLOSInMap(this, false))
                return;

            Player* player = (Player*)user;

            // a chair may have n slots. we have to calculate their positions and teleport the player to the nearest one

            // check if the db is sane
            if (info->chair.slots > 0)
            {
                float lowestDist = DEFAULT_VISIBILITY_DISTANCE;

                float x_lowest = GetPositionX();
                float y_lowest = GetPositionY();

                // the object orientation + 1/2 pi
                // every slot will be on that straight line
                float orthogonalOrientation = GetOrientation() + M_PI_F * 0.5f;
                // find nearest slot
                for (uint32 i = 0; i < info->chair.slots; ++i)
                {
                    // the distance between this slot and the center of the go - imagine a 1D space
                    float relativeDistance = (info->size * i) - (info->size * (info->chair.slots - 1) / 2.0f);

                    float x_i = GetPositionX() + relativeDistance * cos(orthogonalOrientation);
                    float y_i = GetPositionY() + relativeDistance * sin(orthogonalOrientation);

                    // calculate the distance between the player and this slot
                    float thisDistance = player->GetDistance2d(x_i, y_i);

                    /* debug code. It will spawn a npc on each slot to visualize them.
                    Creature* helper = player->SummonCreature(14496, x_i, y_i, GetPositionZ(), GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 10000);
                    std::ostringstream output;
                    output << i << ": thisDist: " << thisDistance;
                    helper->MonsterSay(output.str().c_str(), LANG_UNIVERSAL);
                    */

                    if (thisDistance <= lowestDist)
                    {
                        lowestDist = thisDistance;
                        x_lowest = x_i;
                        y_lowest = y_i;
                    }
                }
                player->TeleportTo(GetMapId(), x_lowest, y_lowest, GetPositionZ(), GetOrientation(), TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET);
            }
            else
            {
                // fallback, will always work
                player->TeleportTo(GetMapId(), GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation(), TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET);
            }
            player->SetStandState(UNIT_STAND_STATE_SIT_LOW_CHAIR + info->chair.height);
            return;
        }
        case GAMEOBJECT_TYPE_SPELL_FOCUS:                   // 8
        {
            TriggerLinkedGameObject(user);

            // some may be activated in addition? Conditions for this? (ex: entry 181616)
            break;
        }
        case GAMEOBJECT_TYPE_GOOBER:                        //10
        {
            GameObjectInfo const* info = GetGOInfo();

            if (user->GetTypeId() == TYPEID_PLAYER)
            {
                Player* player = (Player*)user;

                if (info->goober.pageId)                    // show page...
                {
                    WorldPacket data(SMSG_GAMEOBJECT_PAGETEXT, 8);
                    data << ObjectGuid(GetObjectGuid());
                    player->GetSession()->SendPacket(&data);
                }
                else if (info->goober.gossipID)             // ...or gossip, if page does not exist
                {
                    if (!sScriptMgr.OnGossipHello(player, this))
                    {
                        player->PrepareGossipMenu(this, info->goober.gossipID);
                        player->SendPreparedGossip(this);
                    }
                }

                // possible quest objective for active quests
                if (info->goober.questId && sObjectMgr.GetQuestTemplate(info->goober.questId))
                {
                    //Quest require to be active for GO using
                    if (player->GetQuestStatus(info->goober.questId) != QUEST_STATUS_INCOMPLETE)
                        break;
                }

                if (info->goober.eventId)
                {
                    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Goober ScriptStart id %u for GO entry %u (GUID %u).", info->goober.eventId, GetEntry(), GetGUIDLow());

                    if (!sScriptMgr.OnProcessEvent(info->goober.eventId, player, this, true))
                        GetMap()->ScriptsStart(sEventScripts, info->goober.eventId, player, this);
                }

                // possible quest objective for active quests
                if (info->goober.questId && sObjectMgr.GetQuestTemplate(info->goober.questId))
                {
                    //Quest require to be active for GO using
                    if (player->GetQuestStatus(info->goober.questId) != QUEST_STATUS_INCOMPLETE)
                        break;
                }

                player->RewardPlayerAndGroupAtCast(this);
            }

            TriggerLinkedGameObject(user);

            SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
            SetLootState(GO_ACTIVATED);

            uint32 time_to_restore = info->GetAutoCloseTime();

            // this appear to be ok, however others exist in addition to this that should have custom (ex: 190510, 188692, 187389)
            if (time_to_restore && info->goober.customAnim)
                SendGameObjectCustomAnim();
            else
                SetGoState(GO_STATE_ACTIVE);

            m_cooldownTime = time(NULL) + time_to_restore;

            // cast this spell later if provided
            spellId = info->goober.spellId;

            break;
        }
        case GAMEOBJECT_TYPE_CAMERA:                        //13
        {
            GameObjectInfo const* info = GetGOInfo();
            if (!info)
                return;

            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            if (info->camera.cinematicId)
                player->SendCinematicStart(info->camera.cinematicId);

            if (info->camera.eventID)
            {
                if (!sScriptMgr.OnProcessEvent(info->camera.eventID, player, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->camera.eventID, player, this);
            }

            return;
        }
        case GAMEOBJECT_TYPE_FISHINGNODE:                   //17 fishing bobber
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            if (player->GetObjectGuid() != GetOwnerGuid())
                return;

            switch (getLootState())
            {
                case GO_READY:                              // ready for loot
                {
                    // 1) skill must be >= base_zone_skill
                    // 2) if skill == base_zone_skill => 5% chance
                    // 3) chance is linear dependence from (base_zone_skill-skill)

                    uint32 zone, subzone;
                    GetZoneAndAreaId(zone, subzone);

                    int32 zone_skill = sObjectMgr.GetFishingBaseSkillLevel(subzone);
                    if (!zone_skill)
                        zone_skill = sObjectMgr.GetFishingBaseSkillLevel(zone);

                    //provide error, no fishable zone or area should be 0
                    if (!zone_skill)
                        sLog.outErrorDb("Fishable areaId %u are not properly defined in `skill_fishing_base_level`.", subzone);

                    int32 skill = player->GetSkillValue(SKILL_FISHING);
                    int32 chance = skill - zone_skill + 5;
                    int32 roll = irand(1, 100);

                    DEBUG_LOG("Fishing check (skill: %i zone min skill: %i chance %i roll: %i", skill, zone_skill, chance, roll);

                    // normal chance
                    bool success = skill >= zone_skill && chance >= roll;
                    GameObject* fishingHole = NULL;

                    // overwrite fail in case fishhole if allowed (after 3.3.0)
                    if (!success)
                    {
                        if (!sWorld.getConfig(CONFIG_BOOL_SKILL_FAIL_POSSIBLE_FISHINGPOOL))
                        {
                            //TODO: find reasonable value for fishing hole search
                            fishingHole = LookupFishingHoleAround(20.0f + CONTACT_DISTANCE);
                            if (fishingHole)
                                success = true;
                        }
                    }
                    // just search fishhole for success case
                    else
                        //TODO: find reasonable value for fishing hole search
                        fishingHole = LookupFishingHoleAround(20.0f + CONTACT_DISTANCE);

                    if (success || sWorld.getConfig(CONFIG_BOOL_SKILL_FAIL_GAIN_FISHING))
                        player->UpdateFishingSkill();

                    // fish catch or fail and junk allowed (after 3.1.0)
                    if (success || sWorld.getConfig(CONFIG_BOOL_SKILL_FAIL_LOOT_FISHING))
                    {
                        // prevent removing GO at spell cancel
                        player->RemoveGameObject(this, false);
                        SetOwnerGuid(player->GetObjectGuid());

                        if (fishingHole)                    // will set at success only
                        {
                            fishingHole->Use(player);
                            SetLootState(GO_JUST_DEACTIVATED);
                        }
                        else
                            player->SendLoot(GetObjectGuid(), success ? LOOT_FISHING : LOOT_FISHING_FAIL);
                    }
                    else
                    {
                        // fish escaped, can be deleted now
                        SetLootState(GO_JUST_DEACTIVATED);

                        WorldPacket data(SMSG_FISH_ESCAPED, 0);
                        player->GetSession()->SendPacket(&data);
                    }
                    break;
                }
                case GO_JUST_DEACTIVATED:                   // nothing to do, will be deleted at next update
                    break;
                default:
                {
                    SetLootState(GO_JUST_DEACTIVATED);

                    WorldPacket data(SMSG_FISH_NOT_HOOKED, 0);
                    player->GetSession()->SendPacket(&data);
                    break;
                }
            }

            player->FinishSpell(CURRENT_CHANNELED_SPELL);
            return;
        }
        case GAMEOBJECT_TYPE_SUMMONING_RITUAL:              //18
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            Unit* owner = GetOwner();

            GameObjectInfo const* info = GetGOInfo();

            if (owner)
            {
                if (owner->GetTypeId() != TYPEID_PLAYER)
                    return;

                // accept only use by player from same group as owner, excluding owner itself (unique use already added in spell effect)
                if (player == (Player*)owner || (info->summoningRitual.castersGrouped && !player->IsInSameRaidWith(((Player*)owner))))
                    return;

                // expect owner to already be channeling, so if not...
                if (!owner->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
                    return;

                // in case summoning ritual caster is GO creator
                spellCaster = owner;
            }
            else
            {
                if (m_firstUser && player->GetObjectGuid() != m_firstUser && info->summoningRitual.castersGrouped)
                {
                    if (Group* group = player->GetGroup())
                    {
                        if (!group->IsMember(m_firstUser))
                            return;
                    }
                    else
                        return;
                }

                spellCaster = player;
            }

            AddUniqueUse(player);

            // full amount unique participants including original summoner, need more
            if (GetUniqueUseCount() < info->summoningRitual.reqParticipants ||
                !info->summoningRitual.spellId ||
                GetGoState() == GO_STATE_ACTIVE) // spell already sent
                return;

            // owner is first user for non-wild GO objects, if it offline value already set to current user
            if (!GetOwnerGuid())
                if (Player* firstUser = GetMap()->GetPlayer(m_firstUser))
                    spellCaster = firstUser;

            // Some have a visual effect
            SetGoState(GO_STATE_ACTIVE);

            spellId = info->summoningRitual.spellId;

            // spell have reagent and mana cost but it not expected use its
            // it triggered spell in fact casted at currently channeled GO
            triggered = true;

            // go to end function to spell casting
            break;
        }
        case GAMEOBJECT_TYPE_SPELLCASTER:                   //22
        {
            SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);

            GameObjectInfo const* info = GetGOInfo();
            if (!info)
                return;

            if (info->spellcaster.partyOnly)
            {
                Unit* caster = GetOwner();
                if (!caster)
                {
                    if( m_playerGroupId == 0)
                       return;

                    Group *  group = ((Player*) user)->GetGroup();
                    if(!group)
                        return;

                    if(group->GetId() != m_playerGroupId)
                        return;
                }
                else
                {
                    if(caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    if (user->GetTypeId() != TYPEID_PLAYER || !((Player*)user)->IsInSameRaidWith((Player*)caster))
                        return;
                }
            }

            spellId = info->spellcaster.spellId;

            AddUse();
            break;
        }
        case GAMEOBJECT_TYPE_MEETINGSTONE:                  //23
        {
            GameObjectInfo const* info = GetGOInfo();

            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            Player* targetPlayer = ObjectAccessor::FindPlayer(player->GetSelectionGuid());

            // accept only use by player from same group for caster except caster itself
            if (!targetPlayer || targetPlayer == player || !targetPlayer->IsInSameGroupWith(player))
                return;

            //required lvl checks!
            uint8 level = player->getLevel();
            if (level < info->meetingstone.minLevel || level > info->meetingstone.maxLevel)
                return;

            level = targetPlayer->getLevel();
            if (level < info->meetingstone.minLevel || level > info->meetingstone.maxLevel)
                return;

            spellId = 23598;

            break;
        }
        case GAMEOBJECT_TYPE_FLAGSTAND:                     // 24
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            if (player->CanUseBattleGroundObject())
            {
                // in battleground check
                BattleGround *bg = player->GetBattleGround();
                if (!bg)
                    return;
                // BG flag click
                // AB:
                // 15001
                // 15002
                // 15003
                // 15004
                // 15005
                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_INVISIBILITY);
                bg->EventPlayerClickedOnFlag(player, this);
                return;                                     //we don't need to delete flag ... it is despawned!
            }
            break;
        }
        case GAMEOBJECT_TYPE_FISHINGHOLE:                   // 25
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            player->SendLoot(GetObjectGuid(), LOOT_FISHINGHOLE);
            return;
        }
        case GAMEOBJECT_TYPE_FLAGDROP:                      // 26
        {
            if (user->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = (Player*)user;

            if (player->CanUseBattleGroundObject())
            {
                // in battleground check
                BattleGround *bg = player->GetBattleGround();
                if (!bg)
                    return;
                // BG flag dropped
                // WS:
                // 179785 - Silverwing Flag
                // 179786 - Warsong Flag
                GameObjectInfo const* info = GetGOInfo();
                if (info)
                {
                    switch (info->id)
                    {
                        case 179785:                        // Silverwing Flag
                            // check if it's correct bg
                            if (bg->GetTypeID() == BATTLEGROUND_WS)
                                bg->EventPlayerClickedOnFlag(player, this);
                            break;
                        case 179786:                        // Warsong Flag
                            if (bg->GetTypeID() == BATTLEGROUND_WS)
                                bg->EventPlayerClickedOnFlag(player, this);
                            break;
                    }
                }
                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_INVISIBILITY);
                //this cause to call return, all flags must be deleted here!!
                spellId = 0;
                Delete();
            }
            break;
        }
        case GAMEOBJECT_TYPE_CAPTURE_POINT:                 // 29
        {
            // Code here is not even halfway complete, and only added for further development.
            // Computer may very well blow up after stealing your bank accounts and wreck your car.
            // Use() object at own risk.

            GameObjectInfo const* info = GetGOInfo();

            if (!info)
                return;

            // Can we expect that only player object are able to trigger a capture point or
            // could dummy creatures be involved?
            //if (user->GetTypeId() != TYPEID_PLAYER)
            //return;

            //Player* player = (Player*)user;

            // ID1 vs ID2 are possibly related to team. The world states should probably
            // control which event to be used. For this to work, we need a far better system for
            // sWorldStateMgr (system to store and keep track of states) so that we at all times
            // know the state of every part of the world.

            // Call every event, which is obviously wrong, but can help in further development. For
            // the time being script side can process events and determine which one to use. It
            // require of course that some object call go->Use()
            if (info->capturePoint.winEventID1)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.winEventID1, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.winEventID1, user, this);
            }
            if (info->capturePoint.winEventID2)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.winEventID2, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.winEventID2, user, this);
            }

            if (info->capturePoint.contestedEventID1)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.contestedEventID1, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.contestedEventID1, user, this);
            }
            if (info->capturePoint.contestedEventID2)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.contestedEventID2, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.contestedEventID2, user, this);
            }

            if (info->capturePoint.progressEventID1)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.progressEventID1, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.progressEventID1, user, this);
            }
            if (info->capturePoint.progressEventID2)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.progressEventID2, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.progressEventID2, user, this);
            }

            if (info->capturePoint.neutralEventID1)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.neutralEventID1, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.neutralEventID1, user, this);
            }
            if (info->capturePoint.neutralEventID2)
            {
                if (!sScriptMgr.OnProcessEvent(info->capturePoint.neutralEventID2, user, this, true))
                    GetMap()->ScriptsStart(sEventScripts, info->capturePoint.neutralEventID2, user, this);
            }

            // Some has spell, need to process those further.
            return;
        }
        default:
            sLog.outError("GameObject::Use unhandled GameObject type %u (entry %u).", GetGoType(), GetEntry());
            break;
    }

    if (!spellId)
        return;

    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
    {
        sLog.outError("WORLD: unknown spell id %u at use action for gameobject (Entry: %u GoType: %u )", spellId, GetEntry(), GetGoType());
        return;
    }

    // NOTE: Some of the spells used by GOs are considered triggered, but have cast times.
    // Ensure that the spell you are using, and any event it may trigger, is checking
    // pointer validity (i.e. instance, GO, etc) since the caster may have moved maps
    // or the GO might be gone by the time the spell is executed.
    Spell *spell = new Spell(spellCaster, spellInfo, triggered, GetObjectGuid());

    SpellCastTargets targets;

    // If summoning ritual GO use the summon target instead
    if (GetGoType() == GAMEOBJECT_TYPE_SUMMONING_RITUAL)
    {
        Player* summonTarget = nullptr;
        // Only player summoning requires a target
        if (GetEntry() == 36727 && getSummonTarget())
        {
            summonTarget = sObjectMgr.GetPlayer(getSummonTarget());
            targets.setUnitTarget(summonTarget);
        }
        // Object coordinates are needed later
        targets.setGOTarget(this);
    }
    else
        targets.setUnitTarget(user);

    spell->prepare(std::move(targets));
}

// overwrite WorldObject function for proper name localization
const char* GameObject::GetNameForLocaleIdx(int32 loc_idx) const
{
    if (loc_idx >= 0)
    {
        GameObjectLocale const *cl = sObjectMgr.GetGameObjectLocale(GetEntry());
        if (cl)
        {
            if (cl->Name.size() > (size_t)loc_idx && !cl->Name[loc_idx].empty())
                return cl->Name[loc_idx].c_str();
        }
    }

    return GetName();
}

void GameObject::UpdateRotationFields(float rotation2 /*=0.0f*/, float rotation3 /*=0.0f*/)
{
    static double const atan_pow = atan(pow(2.0f, -20.0f));

    double f_rot1 = sin(GetOrientation() / 2.0f);
    double f_rot2 = cos(GetOrientation() / 2.0f);

    int64 i_rot1 = int64(f_rot1 / atan_pow * (f_rot2 >= 0 ? 1.0f : -1.0f));
    int64 rotation = i_rot1 & 0x00000000001FFFFF;

    //float f_rot2 = std::sin(0.0f / 2.0f);
    //int64 i_rot2 = f_rot2 / atan(pow(2.0f, -20.0f));
    //rotation |= (((i_rot2 << 22) >> 32) >> 11) & 0x000003FFFFE00000;

    //float f_rot3 = std::sin(0.0f / 2.0f);
    //int64 i_rot3 = f_rot3 / atan(pow(2.0f, -21.0f));
    //rotation |= (i_rot3 >> 42) & 0x7FFFFC0000000000;

    m_rotation = rotation;

    if (rotation2 == 0.0f && rotation3 == 0.0f)
    {
        rotation2 = (float)f_rot1;
        rotation3 = (float)f_rot2;
    }

    SetFloatValue(GAMEOBJECT_ROTATION + 2, rotation2);
    SetFloatValue(GAMEOBJECT_ROTATION + 3, rotation3);
}

bool GameObject::IsHostileTo(Unit const* unit) const
{
    // always non-hostile to GM in GM mode
    if (unit->GetTypeId() == TYPEID_PLAYER && ((Player const*)unit)->isGameMaster())
        return false;

    // test owner instead if have
    if (Unit const* owner = GetOwner())
        return owner->IsHostileTo(unit);

    if (Unit const* targetOwner = unit->GetCharmerOrOwner())
        return IsHostileTo(targetOwner);

    // for not set faction case (wild object) use hostile case
    if (!GetGOInfo()->faction)
        return true;

    // faction base cases
    FactionTemplateEntry const*tester_faction = sObjectMgr.GetFactionTemplateEntry(GetGOInfo()->faction);
    FactionTemplateEntry const*target_faction = unit->getFactionTemplateEntry();
    if (!tester_faction || !target_faction)
        return false;

    // GvP forced reaction and reputation case
    if (unit->GetTypeId() == TYPEID_PLAYER)
    {
        // forced reaction
        if (tester_faction->faction)
        {
            if (ReputationRank const* force = ((Player*)unit)->GetReputationMgr().GetForcedRankIfAny(tester_faction))
                return *force <= REP_HOSTILE;

            // apply reputation state
            FactionEntry const* raw_tester_faction = sObjectMgr.GetFactionEntry(tester_faction->faction);
            if (raw_tester_faction && raw_tester_faction->reputationListID >= 0)
                return ((Player const*)unit)->GetReputationMgr().GetRank(raw_tester_faction) <= REP_HOSTILE;
        }
    }

    // common faction based case (GvC,GvP)
    return tester_faction->IsHostileTo(*target_faction);
}

bool GameObject::IsFriendlyTo(Unit const* unit) const
{
    // always friendly to GM in GM mode
    if (unit->GetTypeId() == TYPEID_PLAYER && ((Player const*)unit)->isGameMaster())
        return true;

    // test owner instead if have
    if (Unit const* owner = GetOwner())
        return owner->IsFriendlyTo(unit);

    if (Unit const* targetOwner = unit->GetCharmerOrOwner())
        return IsFriendlyTo(targetOwner);

    // for not set faction case (wild object) use hostile case
    if (!GetGOInfo()->faction)
        return false;

    // faction base cases
    FactionTemplateEntry const*tester_faction = sObjectMgr.GetFactionTemplateEntry(GetGOInfo()->faction);
    FactionTemplateEntry const*target_faction = unit->getFactionTemplateEntry();
    if (!tester_faction || !target_faction)
        return false;

    // GvP forced reaction and reputation case
    if (unit->GetTypeId() == TYPEID_PLAYER)
    {
        // forced reaction
        if (tester_faction->faction)
        {
            if (ReputationRank const* force = ((Player*)unit)->GetReputationMgr().GetForcedRankIfAny(tester_faction))
                return *force >= REP_FRIENDLY;

            // apply reputation state
            if (FactionEntry const* raw_tester_faction = sObjectMgr.GetFactionEntry(tester_faction->faction))
                if (raw_tester_faction->reputationListID >= 0)
                    return ((Player const*)unit)->GetReputationMgr().GetRank(raw_tester_faction) >= REP_FRIENDLY;
        }
    }

    // common faction based case (GvC,GvP)
    return tester_faction->IsFriendlyTo(*target_faction);
}

bool GameObject::IsUseRequirementMet() const
{
    if (GameObjectUseRequirement const* req = sObjectMgr.GetGameObjectUseRequirement(GetObjectGuid()))
    {
        switch (req->reqType)
        {
            case GameObjectUseRequirement::GOBJ_REQUIRE_DEAD_CREATURE:
                if (Creature* crea = GetMap()->GetCreature(req->guid))
                    if (crea->isAlive())
                        return false;
                break;
            case GameObjectUseRequirement::GOBJ_REQUIRE_ACTIVE_OBJECT:
                if (GameObject* gobjRequired = GetMap()->GetGameObject(req->guid))
                    if (gobjRequired->GetGoState() != GO_STATE_ACTIVE)
                        return false;
                break;
        }
    }
    return true;
}

bool GameObject::PlayerCanUse(Player* pl)
{
    if (pl->isGameMaster())
        return true;

    if (!IsVisible())
        return false;

    GameObjectInfo const* inf = GetGOInfo();
    if (!inf)
        return false;
    switch (inf->type)
    {
        case GAMEOBJECT_TYPE_DOOR:
        {
            // Check lockId
            uint32 lockId = inf->GetLockId();
            if (lockId != 0)
            {
                LockEntry const *lockInfo = sLockStore.LookupEntry(lockId);
                if (!lockInfo)
                    return false;
                for (int j = 0; j < 8; ++j)
                {
                    switch (lockInfo->Type[j])
                    {
                        // check key item (many fit cases can be)
                        case LOCK_KEY_ITEM:
                        {
                            if (lockInfo->Index[j])
                            {
                                if (!pl->HasItemCount(lockInfo->Index[j], 1))
                                    return false;
                            }
                            break;
                        }
                    }
                }
            }
        }
    }

    if (!IsUseRequirementMet())
        return false;

    return true;
}

void GameObject::SetLootState(LootState state)
{
    m_lootState = state;
    UpdateCollisionState();
}

void GameObject::SetGoState(GOState state)
{
    //SetByteValue(GAMEOBJECT_BYTES_1, 0, state); // 3.3.5
    SetUInt32Value(GAMEOBJECT_STATE, state);
    UpdateCollisionState();
}

void GameObject::SetDisplayId(uint32 modelId)
{
    SetUInt32Value(GAMEOBJECT_DISPLAYID, modelId);
    UpdateModel();
}

float GameObject::GetObjectBoundingRadius() const
{
    // 1.12.1 GameObjectDisplayInfo.dbc not have any info related to size
    return DEFAULT_WORLD_OBJECT_SIZE;
}

bool GameObject::IsInSkillupList(Player* player) const
{
    return m_SkillupSet.find(player->GetObjectGuid()) != m_SkillupSet.end();
}

void GameObject::AddToSkillupList(Player* player)
{
    m_SkillupSet.insert(player->GetObjectGuid());
}

struct AddGameObjectToRemoveListInMapsWorker
{
    AddGameObjectToRemoveListInMapsWorker(ObjectGuid guid) : i_guid(guid) {}

    void operator()(Map* map)
    {
        if (GameObject* pGameobject = map->GetGameObject(i_guid))
            pGameobject->AddObjectToRemoveList();
    }

    ObjectGuid i_guid;
};

void GameObject::AddToRemoveListInMaps(uint32 db_guid, GameObjectData const* data)
{
    AddGameObjectToRemoveListInMapsWorker worker(ObjectGuid(HIGHGUID_GAMEOBJECT, data->id, db_guid));
    sMapMgr.DoForAllMapsWithMapId(data->mapid, worker);
}

struct SpawnGameObjectInMapsWorker
{
    SpawnGameObjectInMapsWorker(uint32 guid, GameObjectData const* data)
        : i_guid(guid), i_data(data) {}

    void operator()(Map* map)
    {
        // Spawn if necessary (loaded grids only)
        if (map->IsLoaded(i_data->posX, i_data->posY))
        {
            ObjectGuid guid(HIGHGUID_GAMEOBJECT, i_data->id, i_guid);
            if (GameObject* go = map->GetGameObject(guid))
            {
                sLog.outString("[CRASH] Spawning already spawned Gobj ! GUID=%u", i_guid);
                return;
            }
            GameObject* pGameobject = new GameObject;
            //DEBUG_LOG("Spawning gameobject %u", *itr);
            if (!pGameobject->LoadFromDB(i_guid, map))
                delete pGameobject;
            else
            {
                //if (pGameobject->isSpawnedByDefault())
                    map->Add(pGameobject);
                //else
                //    delete pGameobject;
            }
        }
    }

    uint32 i_guid;
    GameObjectData const* i_data;
};

void GameObject::SpawnInMaps(uint32 db_guid, GameObjectData const* data)
{
    SpawnGameObjectInMapsWorker worker(db_guid, data);
    sMapMgr.DoForAllMapsWithMapId(data->mapid, worker);
}

bool GameObject::HasStaticDBSpawnData() const
{
    return sObjectMgr.GetGOData(GetGUIDLow()) != NULL;
}

void GameObject::UpdateCollisionState()
{
    if (!m_model || !IsInWorld())
        return;

    bool enabled = GetGoType() == GAMEOBJECT_TYPE_CHEST ? getLootState() == GO_READY : GetGoState() == GO_STATE_READY;
    m_model->enable(enabled);
}

void GameObject::UpdateModel()
{
    if (m_model)
    {
        if (IsInWorld() && GetMap()->ContainsGameObjectModel(*m_model))
            GetMap()->RemoveGameObjectModel(*m_model);
        delete m_model;
    }
    m_model = GameObjectModel::construct(this);
    if (m_model && IsInWorld())
        GetMap()->InsertGameObjectModel(*m_model);
}

void GameObject::UpdateModelPosition()
{
    if (!m_model)
        return;

    if (GetMap()->ContainsGameObjectModel(*m_model))
    {
        GetMap()->RemoveGameObjectModel(*m_model);
        m_model->Relocate(*this);
        GetMap()->InsertGameObjectModel(*m_model);
    }
}

GameObjectData const * GameObject::GetGOData() const
{
    return sObjectMgr.GetGOData(GetGUIDLow());
}

void GameObject::SendGameObjectCustomAnim(uint32 animId /*= 0*/)
{
    WorldPacket data(SMSG_GAMEOBJECT_CUSTOM_ANIM, 8 + 4);
    data << GetObjectGuid();
    data << uint32(animId);
    SendMessageToSet(&data, true);
}

void GameObject::SendGameObjectReset()
{
    WorldPacket data(SMSG_GAMEOBJECT_RESET_STATE, 8);
    data << GetObjectGuid();
    SendMessageToSet(&data, true);
}

void GameObject::Despawn()
{
    SendObjectDeSpawnAnim(GetObjectGuid());
    if (GameObjectData const* data = GetGOData())
    {
        if (m_spawnedByDefault)
        {
            // TODO: Research this more. Some GOBJs don't set a respawn delay time, but call ::Despawn
            // If this happens, they will respawn instantly which is most likely undesired behaviour
            uint32 respawnTime = GetRespawnDelay();
            if (!respawnTime)
                respawnTime = data->GetRandomRespawnTime();

            SetRespawnTime(respawnTime);
        }
        else
        {
            m_respawnTime = 0;
            m_respawnDelayTime = data->spawntimesecsmin < 0 ? -data->spawntimesecsmin : data->spawntimesecsmin;
        }
    }
    else
        AddObjectToRemoveList();
}
