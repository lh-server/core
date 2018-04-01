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

#ifndef MANGOSSERVER_GAMEOBJECT_H
#define MANGOSSERVER_GAMEOBJECT_H

#include "Common.h"
#include "SharedDefines.h"
#include "Object.h"
#include "LootMgr.h"
#include "Database/DatabaseEnv.h"
#include <mutex>
#include "Util.h"

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

// from `gameobject_template`
struct GameObjectInfo
{
    uint32  id;
    uint32  type;
    uint32  displayId;
    char   *name;
    uint32  faction;
    uint32  flags;
    float   size;
    union                                                   // different GO types have different data field
    {
        //0 GAMEOBJECT_TYPE_DOOR
        struct
        {
            uint32 startOpen;                               //0 used client side to determine GO_ACTIVATED means open/closed
            uint32 lockId;                                  //1 -> Lock.dbc
            uint32 autoCloseTime;                           //2 secs till autoclose = autoCloseTime / 0x10000
            uint32 noDamageImmune;                          //3 break opening whenever you recieve damage?
            uint32 openTextID;                              //4 can be used to replace castBarCaption?
            uint32 closeTextID;                             //5
        } door;
        //1 GAMEOBJECT_TYPE_BUTTON
        struct
        {
            uint32 startOpen;                               //0
            uint32 lockId;                                  //1 -> Lock.dbc
            uint32 autoCloseTime;                           //2 secs till autoclose = autoCloseTime / 0x10000
            uint32 linkedTrapId;                            //3
            uint32 noDamageImmune;                          //4 isBattlegroundObject
            uint32 large;                                   //5
            uint32 openTextID;                              //6 can be used to replace castBarCaption?
            uint32 closeTextID;                             //7
            uint32 losOK;                                   //8
        } button;
        //2 GAMEOBJECT_TYPE_QUESTGIVER
        struct
        {
            uint32 lockId;                                  //0 -> Lock.dbc
            uint32 questList;                               //1
            uint32 pageMaterial;                            //2
            uint32 gossipID;                                //3
            uint32 customAnim;                              //4
            uint32 noDamageImmune;                          //5
            uint32 openTextID;                              //6 can be used to replace castBarCaption?
            uint32 losOK;                                   //7
            uint32 allowMounted;                            //8
            uint32 large;                                   //9
        } questgiver;
        //3 GAMEOBJECT_TYPE_CHEST
        struct
        {
            uint32 lockId;                                  //0 -> Lock.dbc
            uint32 lootId;                                  //1
            uint32 chestRestockTime;                        //2
            uint32 consumable;                              //3
            uint32 minSuccessOpens;                         //4
            uint32 maxSuccessOpens;                         //5
            uint32 eventId;                                 //6 lootedEvent
            uint32 linkedTrapId;                            //7
            uint32 questId;                                 //8 not used currently but store quest required for GO activation for player
            uint32 level;                                   //9
            uint32 losOK;                                   //10
            uint32 leaveLoot;                               //11
            uint32 notInCombat;                             //12
            uint32 logLoot;                                 //13
            uint32 openTextID;                              //14 can be used to replace castBarCaption?
            uint32 groupLootRules;                          //15
        } chest;
        //4 GAMEOBJECT_TYPE_BINDER - empty
        //5 GAMEOBJECT_TYPE_GENERIC
        struct
        {
            uint32 floatingTooltip;                         //0
            uint32 highlight;                               //1
            uint32 serverOnly;                              //2
            uint32 large;                                   //3
            uint32 floatOnWater;                            //4
            uint32 questID;                                 //5
        } _generic;
        //6 GAMEOBJECT_TYPE_TRAP
        struct
        {
            uint32 lockId;                                  //0 -> Lock.dbc
            uint32 level;                                   //1
            uint32 radius;                                  //2 radius for trap activation
            uint32 spellId;                                 //3
            uint32 charges;                                 //4 need respawn (if > 0)
            uint32 cooldown;                                //5 time in secs
            uint32 autoCloseTime;                           //6
            uint32 startDelay;                              //7
            uint32 serverOnly;                              //8
            uint32 stealthed;                               //9
            uint32 large;                                   //10
            uint32 stealthAffected;                         //11
            uint32 openTextID;                              //12 can be used to replace castBarCaption?
            uint32 closeTextID;                             //13
        } trap;
        //7 GAMEOBJECT_TYPE_CHAIR
        struct
        {
            uint32 slots;                                   //0
            uint32 height;                                  //1
            uint32 onlyCreatorUse;                          //2
        } chair;
        //8 GAMEOBJECT_TYPE_SPELL_FOCUS
        struct
        {
            uint32 focusId;                                 //0
            uint32 dist;                                    //1
            uint32 linkedTrapId;                            //2
            uint32 serverOnly;                              //3
            uint32 questID;                                 //4
            uint32 large;                                   //5
        } spellFocus;
        //9 GAMEOBJECT_TYPE_TEXT
        struct
        {
            uint32 pageID;                                  //0
            uint32 language;                                //1
            uint32 pageMaterial;                            //2
            uint32 allowMounted;                            //3
        } text;
        //10 GAMEOBJECT_TYPE_GOOBER
        struct
        {
            uint32 lockId;                                  //0 -> Lock.dbc
            uint32 questId;                                 //1
            uint32 eventId;                                 //2
            uint32 autoCloseTime;                           //3
            uint32 customAnim;                              //4
            uint32 consumable;                              //5
            uint32 cooldown;                                //6
            uint32 pageId;                                  //7
            uint32 language;                                //8
            uint32 pageMaterial;                            //9
            uint32 spellId;                                 //10
            uint32 noDamageImmune;                          //11
            uint32 linkedTrapId;                            //12
            uint32 large;                                   //13
            uint32 openTextID;                              //14 can be used to replace castBarCaption?
            uint32 closeTextID;                             //15
            uint32 losOK;                                   //16 isBattlegroundObject
            uint32 allowMounted;                            //17
            uint32 floatingTooltip;                         //18
            uint32 gossipID;                                //19
        } goober;
        //11 GAMEOBJECT_TYPE_TRANSPORT
        struct
        {
            uint32 pause;                                   //0
            uint32 startOpen;                               //1
            uint32 autoCloseTime;                           //2 secs till autoclose = autoCloseTime / 0x10000
        } transport;
        //12 GAMEOBJECT_TYPE_AREADAMAGE
        struct
        {
            uint32 lockId;                                  //0
            uint32 radius;                                  //1
            uint32 damageMin;                               //2
            uint32 damageMax;                               //3
            uint32 damageSchool;                            //4
            uint32 autoCloseTime;                           //5 secs till autoclose = autoCloseTime / 0x10000
            uint32 openTextID;                              //6
            uint32 closeTextID;                             //7
        } areadamage;
        //13 GAMEOBJECT_TYPE_CAMERA
        struct
        {
            uint32 lockId;                                  //0 -> Lock.dbc
            uint32 cinematicId;                             //1
            uint32 eventID;                                 //2
            uint32 openTextID;                              //3 can be used to replace castBarCaption?
        } camera;
        //14 GAMEOBJECT_TYPE_MAPOBJECT - empty
        //15 GAMEOBJECT_TYPE_MO_TRANSPORT
        struct
        {
            uint32 taxiPathId;                              //0
            uint32 moveSpeed;                               //1
            uint32 accelRate;                               //2
            uint32 startEventID;                            //3
            uint32 stopEventID;                             //4
            uint32 transportPhysics;                        //5
            uint32 mapID;                                   //6
        } moTransport;
        //16 GAMEOBJECT_TYPE_DUELFLAG - empty
        //17 GAMEOBJECT_TYPE_FISHINGNODE
        struct
        {
            uint32 _data0;                                  //0
            uint32 lootId;                                  //1
        } fishnode;
        //18 GAMEOBJECT_TYPE_SUMMONING_RITUAL
        struct
        {
            uint32 reqParticipants;                         //0
            uint32 spellId;                                 //1
            uint32 animSpell;                               //2
            uint32 ritualPersistent;                        //3
            uint32 casterTargetSpell;                       //4
            uint32 casterTargetSpellTargets;                //5
            uint32 castersGrouped;                          //6
            uint32 ritualNoTargetCheck;                     //7
        } summoningRitual;
        //19 GAMEOBJECT_TYPE_MAILBOX - empty
        //20 GAMEOBJECT_TYPE_AUCTIONHOUSE
        struct
        {
            uint32 actionHouseID;                           //0
        } auctionhouse;
        //21 GAMEOBJECT_TYPE_GUARDPOST
        struct
        {
            uint32 creatureID;                              //0
            uint32 charges;                                 //1
        } guardpost;
        //22 GAMEOBJECT_TYPE_SPELLCASTER
        struct
        {
            uint32 spellId;                                 //0
            uint32 charges;                                 //1
            uint32 partyOnly;                               //2
        } spellcaster;
        //23 GAMEOBJECT_TYPE_MEETINGSTONE
        struct
        {
            uint32 minLevel;                                //0
            uint32 maxLevel;                                //1
            uint32 areaID;                                  //2
        } meetingstone;
        //24 GAMEOBJECT_TYPE_FLAGSTAND
        struct
        {
            uint32 lockId;                                  //0
            uint32 pickupSpell;                             //1
            uint32 radius;                                  //2
            uint32 returnAura;                              //3
            uint32 returnSpell;                             //4
            uint32 noDamageImmune;                          //5
            uint32 openTextID;                              //6
            uint32 losOK;                                   //7
        } flagstand;
        //25 GAMEOBJECT_TYPE_FISHINGHOLE
        struct
        {
            uint32 radius;                                  //0 how close bobber must land for sending loot
            uint32 lootId;                                  //1
            uint32 minSuccessOpens;                         //2
            uint32 maxSuccessOpens;                         //3
            uint32 lockId;                                  //4 -> Lock.dbc; possibly 1628 for all?
        } fishinghole;
        //26 GAMEOBJECT_TYPE_FLAGDROP
        struct
        {
            uint32 lockId;                                  //0
            uint32 eventID;                                 //1
            uint32 pickupSpell;                             //2
            uint32 noDamageImmune;                          //3
            uint32 openTextID;                              //4
        } flagdrop;
        //27 GAMEOBJECT_TYPE_MINI_GAME
        struct
        {
            uint32 gameType;                                //0
        } miniGame;
        //29 GAMEOBJECT_TYPE_CAPTURE_POINT
        struct
        {
            uint32 radius;                                  //0
            uint32 spell;                                   //1
            uint32 worldState1;                             //2
            uint32 worldstate2;                             //3
            uint32 winEventID1;                             //4
            uint32 winEventID2;                             //5
            uint32 contestedEventID1;                       //6
            uint32 contestedEventID2;                       //7
            uint32 progressEventID1;                        //8
            uint32 progressEventID2;                        //9
            uint32 neutralEventID1;                         //10
            uint32 neutralEventID2;                         //11
            uint32 neutralPercent;                          //12
            uint32 worldstate3;                             //13
            uint32 minSuperiority;                          //14
            uint32 maxSuperiority;                          //15
            uint32 minTime;                                 //16
            uint32 maxTime;                                 //17
            uint32 large;                                   //18
            uint32 highlight;                               //19
        } capturePoint;
        //30 GAMEOBJECT_TYPE_AURA_GENERATOR
        struct
        {
            uint32 startOpen;                               //0
            uint32 radius;                                  //1
            uint32 auraID1;                                 //2
            uint32 conditionID1;                            //3
            uint32 auraID2;                                 //4
            uint32 conditionID2;                            //5
            uint32 serverOnly;                              //6
        } auraGenerator;

        // not use for specific field access (only for output with loop by all filed), also this determinate max union size
        struct
        {
            uint32 data[24];
        } raw;
    };

    uint32 MinMoneyLoot;
    uint32 MaxMoneyLoot;
    uint32 ScriptId;

    // helpers
    bool IsDespawnAtAction() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_CHEST:  return chest.consumable;
            case GAMEOBJECT_TYPE_GOOBER: return goober.consumable;
            default: return false;
        }
    }

    uint32 GetLockId() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_DOOR:       return door.lockId;
            case GAMEOBJECT_TYPE_BUTTON:     return button.lockId;
            case GAMEOBJECT_TYPE_QUESTGIVER: return questgiver.lockId;
            case GAMEOBJECT_TYPE_CHEST:      return chest.lockId;
            case GAMEOBJECT_TYPE_TRAP:       return trap.lockId;
            case GAMEOBJECT_TYPE_GOOBER:     return goober.lockId;
            case GAMEOBJECT_TYPE_AREADAMAGE: return areadamage.lockId;
            case GAMEOBJECT_TYPE_CAMERA:     return camera.lockId;
            case GAMEOBJECT_TYPE_FLAGSTAND:  return flagstand.lockId;
            case GAMEOBJECT_TYPE_FISHINGHOLE:return fishinghole.lockId;
            case GAMEOBJECT_TYPE_FLAGDROP:   return flagdrop.lockId;
            default: return 0;
        }
    }

    bool GetDespawnPossibility() const                      // despawn at targeting of cast?
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_DOOR:       return door.noDamageImmune;
            case GAMEOBJECT_TYPE_BUTTON:     return button.noDamageImmune;
            case GAMEOBJECT_TYPE_QUESTGIVER: return questgiver.noDamageImmune;
            case GAMEOBJECT_TYPE_GOOBER:     return goober.noDamageImmune;
            case GAMEOBJECT_TYPE_FLAGSTAND:  return flagstand.noDamageImmune;
            case GAMEOBJECT_TYPE_FLAGDROP:   return flagdrop.noDamageImmune;
            default: return true;
        }
    }

    uint32 GetCharges() const                               // despawn at uses amount
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_TRAP:        return trap.charges;
            case GAMEOBJECT_TYPE_GUARDPOST:   return guardpost.charges;
            case GAMEOBJECT_TYPE_SPELLCASTER: return spellcaster.charges;
            default: return 0;
        }
    }

    uint32 GetCooldown() const                              // not triggering at detection target or use until coolodwn expire
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_TRAP:        return trap.cooldown;
            case GAMEOBJECT_TYPE_GOOBER:      return goober.cooldown;
            default: return 0;
        }
    }

    uint32 GetLinkedGameObjectEntry() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_BUTTON:      return button.linkedTrapId;
            case GAMEOBJECT_TYPE_CHEST:       return chest.linkedTrapId;
            case GAMEOBJECT_TYPE_SPELL_FOCUS: return spellFocus.linkedTrapId;
            case GAMEOBJECT_TYPE_GOOBER:      return goober.linkedTrapId;
            default: return 0;
        }
    }

    uint32 GetAutoCloseTime() const
    {
        uint32 autoCloseTime = 0;
        switch(type)
        {
            case GAMEOBJECT_TYPE_DOOR:          autoCloseTime = door.autoCloseTime; break;
            case GAMEOBJECT_TYPE_BUTTON:        autoCloseTime = button.autoCloseTime; break;
            case GAMEOBJECT_TYPE_TRAP:          autoCloseTime = trap.autoCloseTime; break;
            case GAMEOBJECT_TYPE_GOOBER:        autoCloseTime = goober.autoCloseTime; break;
            case GAMEOBJECT_TYPE_TRANSPORT:     autoCloseTime = transport.autoCloseTime; break;
            case GAMEOBJECT_TYPE_AREADAMAGE:    autoCloseTime = areadamage.autoCloseTime; break;
            default: break;
        }
        return autoCloseTime / 0x10000;
    }

    uint32 GetLootId() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_CHEST:       return chest.lootId;
            case GAMEOBJECT_TYPE_FISHINGHOLE: return fishinghole.lootId;
            default: return 0;
        }
    }

    uint32 GetGossipMenuId() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_QUESTGIVER:    return questgiver.gossipID;
            case GAMEOBJECT_TYPE_GOOBER:        return goober.gossipID;
            default: return 0;
        }
    }

    uint32 GetEventScriptId() const
    {
        switch(type)
        {
            case GAMEOBJECT_TYPE_GOOBER:        return goober.eventId;
            case GAMEOBJECT_TYPE_CHEST:         return chest.eventId;
            case GAMEOBJECT_TYPE_CAMERA:        return camera.eventID;
            default: return 0;
        }
    }
};

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

struct GameObjectLocale
{
    std::vector<std::string> Name;
};

// client side GO show states
enum GOState
{
    GO_STATE_ACTIVE             = 0,                        // show in world as used and not reset (closed door open)
    GO_STATE_READY              = 1,                        // show in world as ready (closed door close)
    GO_STATE_ACTIVE_ALTERNATIVE = 2                         // show in world as used in alt way and not reset (closed door open by cannon fire)
};

#define MAX_GO_STATE              3

// from `gameobject`
struct GameObjectData
{
    uint32 id;                                              // entry in gamobject_template
    uint32 mapid;
    float posX;
    float posY;
    float posZ;
    float orientation;
    float rotation0;
    float rotation1;
    float rotation2;
    float rotation3;
    int32  spawntimesecsmin;
    int32  spawntimesecsmax;
    uint32 animprogress;
    GOState go_state;
    uint32 spawnFlags;
    float visibilityModifier;

    uint32 instanciatedContinentInstanceId;
    uint32 ComputeRespawnDelay(uint32 baseDelay) const;
    uint32 GetRandomRespawnTime() const { return urand(uint32(spawntimesecsmin), uint32(spawntimesecsmax)); }
};

// For containers:  [GO_NOT_READY]->GO_READY (close)->GO_ACTIVATED (open) ->GO_JUST_DEACTIVATED->GO_READY        -> ...
// For bobber:      [GO_NOT_READY]->GO_READY (close)->GO_ACTIVATED (open) ->GO_JUST_DEACTIVATED-><deleted>
// For door(closed):[GO_NOT_READY]->GO_READY (close)->GO_ACTIVATED (open) ->GO_JUST_DEACTIVATED->GO_READY(close) -> ...
// For door(open):  [GO_NOT_READY]->GO_READY (open) ->GO_ACTIVATED (close)->GO_JUST_DEACTIVATED->GO_READY(open)  -> ...
enum LootState
{
    GO_NOT_READY = 0,
    GO_READY,                                               // can be ready but despawned, and then not possible activate until spawn
    GO_ACTIVATED,
    GO_JUST_DEACTIVATED
};

class Unit;
class GameObjectAI;
class GameObjectModel;
class Transport;

struct GameObjectDisplayInfoEntry;

// 5 sec for bobber catch
#define FISHING_BOBBER_READY_TIME 5

#define GO_ANIMPROGRESS_DEFAULT 100                         // in 3.x 0xFF

class MANGOS_DLL_SPEC GameObject : public WorldObject
{
    public:
        explicit GameObject();
        ~GameObject();

        void AddToWorld();
        void RemoveFromWorld();

        bool Create(uint32 guidlow, uint32 name_id, Map *map, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 animprogress, GOState go_state);
        void Update(uint32 update_diff, uint32 p_time) override;
        GameObjectInfo const* GetGOInfo() const;

        bool IsTransport() const;

        bool HasStaticDBSpawnData() const;                  // listed in `gameobject` table and have fixed in DB guid
        uint32 GetDBTableGUIDLow() const { return HasStaticDBSpawnData() ? GetGUIDLow() : 0; }

        void UpdateRotationFields(float rotation2 = 0.0f, float rotation3 = 0.0f);

        // overwrite WorldObject function for proper name localization
        const char* GetNameForLocaleIdx(int32 locale_idx) const;

        void SaveToDB();
        void SaveToDB(uint32 mapid);
        bool LoadFromDB(uint32 guid, Map *map);
        void DeleteFromDB() const;

        void SetOwnerGuid(ObjectGuid ownerGuid)
        {
            m_spawnedByDefault = false;                     // all object with owner is despawned after delay
            SetGuidValue(OBJECT_FIELD_CREATED_BY, ownerGuid);
        }

        ObjectGuid const& GetOwnerGuid() const { return GetGuidValue(OBJECT_FIELD_CREATED_BY); }
        Unit* GetOwner() const;

        void SetSpellId(uint32 id)
        {
            m_spawnedByDefault = false;                     // all summoned object is despawned after delay
            m_spellId = id;
        }
        uint32 GetSpellId() const { return m_spellId;}

        time_t GetRespawnTime() const { return m_respawnTime; }
        time_t GetRespawnTimeEx() const
        {
            time_t now = time(NULL);
            if(m_respawnTime > now)
                return m_respawnTime;
            else
                return now;
        }

        void Despawn();
        void JustDespawnedWaitingRespawn();
        void SetRespawnTime(time_t respawn)
        {
            m_respawnTime = respawn > 0 ? time(NULL) + respawn : 0;
            m_respawnDelayTime = respawn > 0 ? uint32(respawn) : 0;
        }
        void SetRespawnDelay(time_t respawn)
        {
        	m_respawnDelayTime = respawn;
        }
        void Respawn();
        bool isSpawned() const
        {
            return m_respawnDelayTime == 0 ||
                (m_respawnTime > 0 && !m_spawnedByDefault) ||
                (m_respawnTime == 0 && m_spawnedByDefault);
        }
        bool isSpawnedByDefault() const { return m_spawnedByDefault; }
        void SetSpawnedByDefault(bool b) { m_spawnedByDefault = b; }
        uint32 GetRespawnDelay() const { return m_respawnDelayTime; }
        uint32 ComputeRespawnDelay() const; // Applies dynamic / random respawn timers if needed.
        void Refresh();
        void Delete();

        // Functions spawn/remove gameobject with DB guid in all loaded map copies (if point grid loaded in map)
        static void AddToRemoveListInMaps(uint32 db_guid, GameObjectData const* data);
        static void SpawnInMaps(uint32 db_guid, GameObjectData const* data);

        void getFishLoot(Loot *loot, Player* loot_owner);
        GameobjectTypes GetGoType() const { return GameobjectTypes(GetUInt32Value(GAMEOBJECT_TYPE_ID)); }
        void SetGoType(GameobjectTypes type) { SetUInt32Value(GAMEOBJECT_TYPE_ID, type); }
        GOState GetGoState() const { return GOState(GetUInt32Value(GAMEOBJECT_STATE)); }
        void SetGoState(GOState state);
        uint32 GetGoArtKit() const { return GetUInt32Value(GAMEOBJECT_ARTKIT); }
        void SetGoArtKit(uint32 artkit) { SetUInt32Value(GAMEOBJECT_ARTKIT, artkit); }
        uint32 GetGoAnimProgress() const { return GetUInt32Value(GAMEOBJECT_ANIMPROGRESS); }
        void SetGoAnimProgress(uint32 animprogress) { SetUInt32Value(GAMEOBJECT_ANIMPROGRESS, animprogress); }
        uint32 GetDisplayId() const { return GetUInt32Value(GAMEOBJECT_DISPLAYID); }
        void SetDisplayId(uint32 modelId);

        void SendGameObjectCustomAnim(uint32 animId = 0);
        void SendGameObjectReset();

        float GetObjectBoundingRadius() const;              // overwrite WorldObject version

        void Use(Unit* user);

        LootState getLootState() const { return m_lootState; }
        void SetLootState(LootState s);

        void AddToSkillupList(Player* player);
        bool IsInSkillupList(Player* player) const;
        void ClearSkillupList() { m_SkillupSet.clear(); }
        void ClearAllUsesData()
        {
            ClearSkillupList();
            m_useTimes = 0;
            m_firstUser.Clear();
            m_UniqueUsers.clear();
        }

        // Used for GAMEOBJECT_TYPE_SUMMONING_RITUAL
        ObjectGuid getSummonTarget() const { return m_summonTarget; }
        void SetSummonTarget(ObjectGuid o) { m_summonTarget = o; }
        void FinishRitual();
        void AddUniqueUse(Player* player);
        void RemoveUniqueUse(Player* player);
        bool HasUniqueUser(Player* player);
        uint32 GetUniqueUseCount();

        void AddUse() { ++m_useTimes; }
        uint32 GetUseCount() const { return m_useTimes; }

        void SaveRespawnTime();

        Loot        loot;

        bool HasQuest(uint32 quest_id) const;
        bool HasInvolvedQuest(uint32 quest_id) const;
        bool ActivateToQuest(Player *pTarget) const;
        void UseDoorOrButton(uint32 time_to_restore = 0, bool alternative = false);
                                                            // 0 = use `gameobject`.`spawntimesecs`
        void ResetDoorOrButton();

        bool IsHostileTo(Unit const* unit) const;
        bool IsFriendlyTo(Unit const* unit) const;

        void SummonLinkedTrapIfAny();
        void TriggerLinkedGameObject(Unit* target);
        void RespawnLinkedGameObject();

        bool isVisibleForInState(Player const* u, WorldObject const* viewPoint, bool inVisibleList) const;

        GameObject* LookupFishingHoleAround(float range);

        GridReference<GameObject> &GetGridRef() { return m_gridRef; }

        // Nostalrius
        bool IsUseRequirementMet() const;
        bool PlayerCanUse(Player* pl);
        void SetOwnerGroupId(uint32 groupId) { m_playerGroupId = groupId; }

        // Gestion des GameObjectAI
        void AIM_Initialize();
        GameObjectAI* AI() { return i_AI; }

        // NOSTALRIUS: GOCollision
        void UpdateCollisionState();
        void UpdateModel();                                 // updates model in case displayId were changed
        GameObjectModel* m_model;
        void UpdateModelPosition();
        GameObjectData const * GetGOData() const;

        // Transports system
        uint64 GetRotation() const { return m_rotation; }
        Transport* ToTransport() { if (GetGOInfo()->type == GAMEOBJECT_TYPE_MO_TRANSPORT) return reinterpret_cast<Transport*>(this); else return NULL; }
        Transport const* ToTransport() const { if (GetGOInfo()->type == GAMEOBJECT_TYPE_MO_TRANSPORT) return reinterpret_cast<Transport const*>(this); else return NULL; }

        bool IsVisible() const { return m_visible; }
        void SetVisible(bool b);

    protected:
        bool        m_visible;
        uint32      m_spellId;
        time_t      m_respawnTime;                          // (secs) time of next respawn (or despawn if GO have owner()),
        uint32      m_respawnDelayTime;                     // (secs) if 0 then current GO state no dependent from timer
        LootState   m_lootState;
        bool        m_spawnedByDefault;
        time_t      m_cooldownTime;                         // used as internal reaction delay time store (not state change reaction).
                                                            // For traps/goober this: spell casting cooldown, for doors/buttons: reset time.

        typedef std::set<ObjectGuid> GuidsSet;

        GuidsSet m_SkillupSet;                              // players that already have skill-up at GO use

        uint32 m_useTimes;                                  // amount uses/charges triggered

        // collected only for GAMEOBJECT_TYPE_SUMMONING_RITUAL
        ObjectGuid m_firstUser;                             // first GO user, in most used cases owner, but in some cases no, for example non-summoned multi-use GAMEOBJECT_TYPE_SUMMONING_RITUAL
        GuidsSet m_UniqueUsers;                             // all players who use item, some items activated after specific amount unique uses
        std::mutex m_UniqueUsers_lock;
        ObjectGuid m_summonTarget;                          // The player who is being summoned

        uint64 m_rotation;
        GameObjectInfo const* m_goInfo;

        GameObjectAI *i_AI;

        uint32 m_playerGroupId;
    private:
        void SwitchDoorOrButton(bool activate, bool alternative = false);

        GridReference<GameObject> m_gridRef;
};
#endif
