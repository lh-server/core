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

#include "Item.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "WorldPacket.h"
#include "Database/DatabaseEnv.h"
#include "ItemEnchantmentMgr.h"
#include "GuildMgr.h"

void AddItemsSetItem(Player* player, Item* item)
{
    ItemPrototype const* proto = item->GetProto();
    uint32 setid = proto->ItemSet;

    ItemSetEntry const* set = sItemSetStore.LookupEntry(setid);

    if (!set)
    {
        sLog.outErrorDb("Item set %u for item (id %u) not found, mods not applied.", setid, proto->ItemId);
        return;
    }

    if (set->required_skill_id && player->GetSkillValue(set->required_skill_id) < set->required_skill_value)
        return;

    ItemSetEffect* eff = NULL;

    for (size_t x = 0; x < player->ItemSetEff.size(); ++x)
    {
        if (player->ItemSetEff[x] && player->ItemSetEff[x]->setid == setid)
        {
            eff = player->ItemSetEff[x];
            break;
        }
    }

    if (!eff)
    {
        eff = new ItemSetEffect;
        memset(eff, 0, sizeof(ItemSetEffect));
        eff->setid = setid;

        size_t x = 0;
        for (; x < player->ItemSetEff.size(); x++)
            if (!player->ItemSetEff[x])
                break;

        if (x < player->ItemSetEff.size())
            player->ItemSetEff[x] = eff;
        else
            player->ItemSetEff.push_back(eff);
    }

    ++eff->item_count;

    for (uint32 x = 0; x < 8; x++)
    {
        if (!set->spells[x])
            continue;
        // not enough for  spell
        if (set->items_to_triggerspell[x] > eff->item_count)
            continue;

        uint32 z = 0;
        for (; z < 8; z++)
            if (eff->spells[z] && eff->spells[z]->Id == set->spells[x])
                break;

        if (z < 8)
            continue;

        // new spell
        for (uint32 y = 0; y < 8; y++)
        {
            if (!eff->spells[y])                             // free slot
            {
                SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(set->spells[x]);
                if (!spellInfo)
                {
                    sLog.outError("WORLD: unknown spell id %u in items set %u effects", set->spells[x], setid);
                    break;
                }

                // spell casted only if fit form requirement, in other case will casted at form change
                player->ApplyEquipSpell(spellInfo, NULL, true);
                eff->spells[y] = spellInfo;
                break;
            }
        }
    }
}

void RemoveItemsSetItem(Player* player, ItemPrototype const* proto)
{
    uint32 setid = proto->ItemSet;

    ItemSetEntry const* set = sItemSetStore.LookupEntry(setid);

    if (!set)
    {
        sLog.outErrorDb("Item set #%u for item #%u not found, mods not removed.", setid, proto->ItemId);
        return;
    }

    ItemSetEffect* eff = NULL;
    size_t setindex = 0;
    for (; setindex < player->ItemSetEff.size(); setindex++)
    {
        if (player->ItemSetEff[setindex] && player->ItemSetEff[setindex]->setid == setid)
        {
            eff = player->ItemSetEff[setindex];
            break;
        }
    }

    // can be in case now enough skill requirement for set appling but set has been appliend when skill requirement not enough
    if (!eff)
        return;

    --eff->item_count;

    for (uint32 x = 0; x < 8; x++)
    {
        if (!set->spells[x])
            continue;

        // enough for spell
        if (set->items_to_triggerspell[x] <= eff->item_count)
            continue;

        for (uint32 z = 0; z < 8; z++)
        {
            if (eff->spells[z] && eff->spells[z]->Id == set->spells[x])
            {
                // spell can be not active if not fit form requirement
                player->ApplyEquipSpell(eff->spells[z], NULL, false);
                eff->spells[z] = NULL;
                break;
            }
        }
    }

    if (!eff->item_count)                                    // all items of a set were removed
    {
        MANGOS_ASSERT(eff == player->ItemSetEff[setindex]);
        delete eff;
        player->ItemSetEff[setindex] = NULL;
    }
}

bool ItemCanGoIntoBag(ItemPrototype const* pProto, ItemPrototype const* pBagProto)
{
    if (!pProto || !pBagProto)
        return false;

    switch (pBagProto->Class)
    {
        case ITEM_CLASS_CONTAINER:
            switch (pBagProto->SubClass)
            {
                case ITEM_SUBCLASS_CONTAINER:
                    return true;
                case ITEM_SUBCLASS_SOUL_CONTAINER:
                    if (pProto->BagFamily != BAG_FAMILY_SOUL_SHARDS)
                        return false;
                    return true;
                case ITEM_SUBCLASS_HERB_CONTAINER:
                    if (pProto->BagFamily != BAG_FAMILY_HERBS)
                        return false;
                    return true;
                case ITEM_SUBCLASS_ENCHANTING_CONTAINER:
                    if (pProto->BagFamily != BAG_FAMILY_ENCHANTING_SUPP)
                        return false;
                    return true;
                case ITEM_SUBCLASS_ENGINEERING_CONTAINER:
                    if (pProto->BagFamily != BAG_FAMILY_ENGINEERING_SUPP)
                        return false;
                    return true;
            }
            return false;
        case ITEM_CLASS_QUIVER:
            switch (pBagProto->SubClass)
            {
                case ITEM_SUBCLASS_QUIVER:
                    if (pProto->BagFamily != BAG_FAMILY_ARROWS)
                        return false;
                    return true;
                case ITEM_SUBCLASS_AMMO_POUCH:
                    if (pProto->BagFamily != BAG_FAMILY_BULLETS)
                        return false;
                    return true;
                default:
                    return false;
            }
    }
    return false;
}

Item::Item() : loot(NULL)
{
    m_objectType |= TYPEMASK_ITEM;
    m_objectTypeId = TYPEID_ITEM;
    m_updateFlag = UPDATEFLAG_ALL;

    m_valuesCount = ITEM_END;
    m_slot = 0;
    uState = ITEM_NEW;
    uQueuePos = -1;
    m_container = NULL;
    mb_in_trade = false;
    m_lootState = ITEM_LOOT_NONE;
    generatedLoot = false;
}

bool Item::Create(uint32 guidlow, uint32 itemid, ObjectGuid ownerGuid)
{
    Object::_Create(guidlow, 0, HIGHGUID_ITEM);

    SetEntry(itemid);
    SetObjectScale(DEFAULT_OBJECT_SCALE);

    SetGuidValue(ITEM_FIELD_OWNER, ownerGuid);
    SetGuidValue(ITEM_FIELD_CONTAINED, ObjectGuid());

    ItemPrototype const* itemProto = ObjectMgr::GetItemPrototype(itemid);
    if (!itemProto)
        return false;

    SetUInt32Value(ITEM_FIELD_STACK_COUNT, 1);
    SetUInt32Value(ITEM_FIELD_MAXDURABILITY, itemProto->MaxDurability);
    SetUInt32Value(ITEM_FIELD_DURABILITY, itemProto->MaxDurability);

    for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        SetSpellCharges(i, itemProto->Spells[i].SpellCharges);

    SetUInt32Value(ITEM_FIELD_DURATION, itemProto->Duration);

    return true;
}

void Item::RemoveFromWorld()
{
    Player* owner = GetOwner();
    if (owner)
        owner->InterruptSpellsWithCastItem(this);
    Object::RemoveFromWorld();
}

void Item::UpdateDuration(Player* owner, uint32 diff)
{
    if (!GetUInt32Value(ITEM_FIELD_DURATION))
        return;

    //DEBUG_LOG("Item::UpdateDuration Item (Entry: %u Duration %u Diff %u)", GetEntry(), GetUInt32Value(ITEM_FIELD_DURATION), diff);

    if (GetUInt32Value(ITEM_FIELD_DURATION) <= diff)
    {
        owner->DestroyItem(GetBagSlot(), GetSlot(), true);
        return;
    }

    SetUInt32Value(ITEM_FIELD_DURATION, GetUInt32Value(ITEM_FIELD_DURATION) - diff);
    SetState(ITEM_CHANGED, owner);                          // save new time in database
}

void Item::SaveToDB()
{
    uint32 guid = GetGUIDLow();
    switch (uState)
    {
        case ITEM_CHANGED:
        {
            static SqlStatementID updGifts;
            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(updGifts, "UPDATE character_gifts SET guid = ? WHERE item_guid = ?");
                stmt.PExecute(GetOwnerGuid().GetCounter(), GetGUIDLow());
            }
        }
        // no break
        case ITEM_NEW:
        {
            static SqlStatementID insItem;
            static SqlStatementID updItem;

            SqlStatement stmt = (uState == ITEM_NEW) ?
                                CharacterDatabase.CreateStatement(insItem, "REPLACE INTO item_instance (itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, generated_loot, guid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                                :
                                CharacterDatabase.CreateStatement(updItem, "UPDATE item_instance SET itemEntry = ?, owner_guid = ?, creatorGuid = ?, giftCreatorGuid = ?, count = ?, duration = ?, charges = ?, flags = ?, enchantments = ?, randomPropertyId = ?, durability = ?, text = ?, generated_loot = ? WHERE guid = ?");
            stmt.addUInt32(GetEntry());
            stmt.addUInt32(GetOwnerGuid().GetCounter());
            stmt.addUInt32(GetGuidValue(ITEM_FIELD_CREATOR).GetCounter());
            stmt.addUInt32(GetGuidValue(ITEM_FIELD_GIFTCREATOR).GetCounter());
            stmt.addUInt32(GetCount());
            stmt.addUInt32(GetUInt32Value(ITEM_FIELD_DURATION));

            std::ostringstream ssSpells;
            for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
                ssSpells << GetSpellCharges(i) << ' ';
            stmt.addString(ssSpells.str());

            stmt.addUInt32(GetUInt32Value(ITEM_FIELD_FLAGS));

            std::ostringstream ssEnchants;
            for (uint8 i = 0; i < MAX_ENCHANTMENT_SLOT; ++i)
            {
                ssEnchants << GetEnchantmentId(EnchantmentSlot(i)) << ' ';
                ssEnchants << GetEnchantmentDuration(EnchantmentSlot(i)) << ' ';
                ssEnchants << GetEnchantmentCharges(EnchantmentSlot(i)) << ' ';
            }
            stmt.addString(ssEnchants.str());

            stmt.addUInt16(GetItemRandomPropertyId());
            stmt.addUInt16(GetUInt32Value(ITEM_FIELD_DURABILITY));
            stmt.addUInt32(GetUInt32Value(ITEM_FIELD_ITEM_TEXT_ID));
            stmt.addUInt8(generatedLoot); // can't use bool, SQL ERROR: Using unsupported buffer type: 16  (parameter: 13), todo, maybe.
            stmt.addUInt32(guid);
            stmt.Execute();
        }
        break;
        case ITEM_REMOVED:
        {
            static SqlStatementID delItemText;
            static SqlStatementID delInst ;
            static SqlStatementID delGifts ;
            static SqlStatementID delLoot ;

            if (uint32 item_text_id = GetUInt32Value(ITEM_FIELD_ITEM_TEXT_ID))
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(delItemText, "DELETE FROM item_text WHERE id = ?");
                stmt.PExecute(item_text_id);
            }

            SqlStatement stmt = CharacterDatabase.CreateStatement(delInst, "DELETE FROM item_instance WHERE guid = ?");
            stmt.PExecute(guid);

            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
            {
                stmt = CharacterDatabase.CreateStatement(delGifts, "DELETE FROM character_gifts WHERE item_guid = ?");
                stmt.PExecute(GetGUIDLow());
            }

            if (HasSavedLoot())
            {
                stmt = CharacterDatabase.CreateStatement(delLoot, "DELETE FROM item_loot WHERE guid = ?");
                stmt.PExecute(GetGUIDLow());
            }
            if (IsInWorld())
                RemoveFromWorld();

            delete this;
            return;
        }
        case ITEM_UNCHANGED:
            return;
    }

    if (m_lootState == ITEM_LOOT_CHANGED || m_lootState == ITEM_LOOT_REMOVED)
    {
        static SqlStatementID delLoot ;

        SqlStatement stmt = CharacterDatabase.CreateStatement(delLoot, "DELETE FROM item_loot WHERE guid = ?");
        stmt.PExecute(GetGUIDLow());
    }

    if (m_lootState == ITEM_LOOT_NEW || m_lootState == ITEM_LOOT_CHANGED)
    {
        if (auto ownerGuid = GetOwnerGuid())
        {
            static SqlStatementID saveGold ;
            static SqlStatementID saveLoot ;

            // save money as 0 itemid data
            if (loot.gold)
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(saveGold, "INSERT INTO item_loot (guid,owner_guid,itemid,amount,property) VALUES (?, ?, 0, ?, 0)");
                stmt.PExecute(GetGUIDLow(), ownerGuid.GetCounter(), loot.gold);
            }

            SqlStatement stmt = CharacterDatabase.CreateStatement(saveLoot, "INSERT INTO item_loot (guid,owner_guid,itemid,amount,property) VALUES (?, ?, ?, ?, ?)");

            // save items and quest items (at load its all will added as normal, but this not important for item loot case)
            for (size_t i = 0; i < loot.GetMaxSlotInLootFor(ownerGuid); ++i)
            {
                QuestItem* qitem = NULL;

                LootItem* item = loot.LootItemInSlot(i, ownerGuid, &qitem);
                if (!item)
                    continue;

                // questitems use the blocked field for other purposes
                if (!qitem && item->is_blocked)
                    continue;

                stmt.addUInt32(GetGUIDLow());
                stmt.addUInt32(ownerGuid);
                stmt.addUInt32(item->itemid);
                stmt.addUInt8(item->count);
                stmt.addInt32(item->randomPropertyId);

                stmt.Execute();
            }
        }

    }

    if (m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_TEMPORARY)
        SetLootState(ITEM_LOOT_UNCHANGED);

    SetState(ITEM_UNCHANGED);
}

bool Item::LoadFromDB(uint32 guidLow, ObjectGuid ownerGuid, Field* fields, uint32 entry)
{
    //                0                1      2         3        4      5             6                 7           8     9       10         11
    // SELECT creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, item_guid, itemEntry
    // create item before any checks for store correct guid
    // and allow use "FSetState(ITEM_REMOVED); SaveToDB();" for deleting item from DB
    Object::_Create(guidLow, 0, HIGHGUID_ITEM);

    // Set entry, MUST be before proto check
    SetEntry(entry);
    SetObjectScale(1.0f);

    ItemPrototype const* proto = GetProto();
    if (!proto)
        return false;

    // set owner (not if item is only loaded for gbank/auction/mail
    if (ownerGuid)
        SetOwnerGuid(ownerGuid);

    bool need_save = false;                                 // need explicit save data at load fixes
    SetGuidValue(ITEM_FIELD_CREATOR, ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32()));
    SetGuidValue(ITEM_FIELD_GIFTCREATOR, ObjectGuid(HIGHGUID_PLAYER, fields[1].GetUInt32()));
    SetCount(fields[2].GetUInt32());

    uint32 duration = fields[3].GetUInt32();
    SetUInt32Value(ITEM_FIELD_DURATION, duration);
    // update duration if need, and remove if not need
    if ((proto->Duration == 0) != (GetUInt32Value(ITEM_FIELD_DURATION) == 0))
    {
        SetUInt32Value(ITEM_FIELD_DURATION, proto->Duration);
        need_save = true;
    }

    Tokenizer tokens(fields[4].GetString(), ' ', MAX_ITEM_PROTO_SPELLS);
    if (tokens.size() == MAX_ITEM_PROTO_SPELLS)
        for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
            SetSpellCharges(i, atoi(tokens[i]));

    SetUInt32Value(ITEM_FIELD_FLAGS, fields[5].GetUInt32());
    // Remove bind flag for items vs NO_BIND set
    if (IsSoulBound() && proto->Bonding == NO_BIND)
    {
        ApplyModFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BINDED, false);
        need_save = true;
    }


    std::string enchants = fields[6].GetString();
    _LoadIntoDataField(enchants.c_str(), ITEM_FIELD_ENCHANTMENT, MAX_ENCHANTMENT_SLOT * MAX_ENCHANTMENT_OFFSET);
    SetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID, fields[7].GetInt16());

    uint32 durability = fields[8].GetUInt16();
    SetUInt32Value(ITEM_FIELD_DURABILITY, durability);
    // update max durability (and durability) if need
    SetUInt32Value(ITEM_FIELD_MAXDURABILITY, proto->MaxDurability);
    if (durability > proto->MaxDurability)
    {
        SetUInt32Value(ITEM_FIELD_DURABILITY, proto->MaxDurability);
        need_save = true;
    }

    SetUInt32Value(ITEM_FIELD_ITEM_TEXT_ID, fields[9].GetUInt32());

    // set correct wrapped state
    if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
    {
        // wrapped item must be wrapper (used version that not stackable)
        if (!(proto->Flags & ITEM_FLAG_WRAPPER) || GetMaxStackCount() > 1)
        {
            RemoveFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED);
            need_save = true;

            static SqlStatementID delGifts;

            // also cleanup for sure gift table
            SqlStatement stmt = CharacterDatabase.CreateStatement(delGifts, "DELETE FROM character_gifts WHERE item_guid = ?");
            stmt.PExecute(GetGUIDLow());
        }
    }

    if (need_save)                                          // normal item changed state set not work at loading
    {
        static SqlStatementID updItem;

        SqlStatement stmt = CharacterDatabase.CreateStatement(updItem, "UPDATE item_instance SET duration = ?, flags = ?, durability = ? WHERE guid = ?");

        stmt.addUInt32(GetUInt32Value(ITEM_FIELD_DURATION));
        stmt.addUInt32(GetUInt32Value(ITEM_FIELD_FLAGS));
        stmt.addUInt32(GetUInt32Value(ITEM_FIELD_DURABILITY));
        stmt.addUInt32(guidLow);
        stmt.Execute();
    }

    return true;
}

void Item::DeleteAllFromDB(uint32 guidLow)
{
    CharacterDatabase.PExecute("DELETE FROM item_instance WHERE guid = '%u'", guidLow);
    CharacterDatabase.PExecute("DELETE FROM character_inventory WHERE item = '%u'", guidLow);
    CharacterDatabase.PExecute("DELETE FROM auction WHERE itemguid = '%u'", guidLow);
    CharacterDatabase.PExecute("DELETE FROM mail_items WHERE item_guid = '%u'", guidLow);
    // Petitions
    if (Petition* petition = sGuildMgr.GetPetitionByCharterGuid(ObjectGuid(guidLow)))
        sGuildMgr.DeletePetition(petition);

    CharacterDatabase.PExecute("DELETE FROM character_gifts WHERE item_guid = '%u'", guidLow);
}

void Item::LoadLootFromDB(Field* fields)
{
    uint32 item_id     = fields[1].GetUInt32();
    uint32 item_amount = fields[2].GetUInt32();
    int32  item_propid = fields[3].GetInt32();

    // money value special case
    if (item_id == 0)
    {
        loot.gold = item_amount;
        SetLootState(ITEM_LOOT_UNCHANGED);
        return;
    }

    // normal item case
    ItemPrototype const* proto = ObjectMgr::GetItemPrototype(item_id);

    if (!proto)
    {
        CharacterDatabase.PExecute("DELETE FROM item_loot WHERE guid = '%u' AND itemid = '%u'", GetGUIDLow(), item_id);
        sLog.outError("Item::LoadLootFromDB: %s has an unknown item (id: #%u) in item_loot, deleted.", GetOwnerGuid().GetString().c_str(), item_id);
        return;
    }

    loot.items.push_back(LootItem(item_id, item_amount, item_propid));
    ++loot.unlootedCount;

    SetLootState(ITEM_LOOT_UNCHANGED);
}

void Item::DeleteFromDB()
{
    static SqlStatementID delItem ;

    SqlStatement stmt = CharacterDatabase.CreateStatement(delItem, "DELETE FROM item_instance WHERE guid = ?");
    stmt.PExecute(GetGUIDLow());
}

void Item::DeleteFromInventoryDB()
{
    static SqlStatementID delInv ;

    SqlStatement stmt = CharacterDatabase.CreateStatement(delInv, "DELETE FROM character_inventory WHERE item = ?");
    stmt.PExecute(GetGUIDLow());
}

ItemPrototype const* Item::GetProto() const
{
    return ObjectMgr::GetItemPrototype(GetEntry());
}

Player* Item::GetOwner()const
{
    return sObjectMgr.GetPlayer(GetOwnerGuid());
}

uint32 Item::GetSkill()
{
    const static uint32 item_weapon_skills[MAX_ITEM_SUBCLASS_WEAPON] =
    {
        SKILL_AXES,     SKILL_2H_AXES,  SKILL_BOWS,          SKILL_GUNS,      SKILL_MACES,
        SKILL_2H_MACES, SKILL_POLEARMS, SKILL_SWORDS,        SKILL_2H_SWORDS, 0,
        SKILL_STAVES,   0,              0,                   SKILL_UNARMED,   0,
        SKILL_DAGGERS,  SKILL_THROWN,   SKILL_ASSASSINATION, SKILL_CROSSBOWS, SKILL_WANDS,
        SKILL_FISHING
    };

    const static uint32 item_armor_skills[MAX_ITEM_SUBCLASS_ARMOR] =
    {
        0, SKILL_CLOTH, SKILL_LEATHER, SKILL_MAIL, SKILL_PLATE_MAIL, 0, SKILL_SHIELD, 0, 0, 0
    };

    ItemPrototype const* proto = GetProto();

    switch (proto->Class)
    {
        case ITEM_CLASS_WEAPON:
            if (proto->SubClass >= MAX_ITEM_SUBCLASS_WEAPON)
                return 0;
            else
                return item_weapon_skills[proto->SubClass];

        case ITEM_CLASS_ARMOR:
            if (proto->SubClass >= MAX_ITEM_SUBCLASS_ARMOR)
                return 0;
            else
                return item_armor_skills[proto->SubClass];

        default:
            return 0;
    }
}

uint32 Item::GetSpell()
{
    ItemPrototype const* proto = GetProto();

    switch (proto->Class)
    {
        case ITEM_CLASS_WEAPON:
            switch (proto->SubClass)
            {
                case ITEM_SUBCLASS_WEAPON_AXE:
                    return  196;
                case ITEM_SUBCLASS_WEAPON_AXE2:
                    return  197;
                case ITEM_SUBCLASS_WEAPON_BOW:
                    return  264;
                case ITEM_SUBCLASS_WEAPON_GUN:
                    return  266;
                case ITEM_SUBCLASS_WEAPON_MACE:
                    return  198;
                case ITEM_SUBCLASS_WEAPON_MACE2:
                    return  199;
                case ITEM_SUBCLASS_WEAPON_POLEARM:
                    return  200;
                case ITEM_SUBCLASS_WEAPON_SWORD:
                    return  201;
                case ITEM_SUBCLASS_WEAPON_SWORD2:
                    return  202;
                case ITEM_SUBCLASS_WEAPON_STAFF:
                    return  227;
                case ITEM_SUBCLASS_WEAPON_DAGGER:
                    return 1180;
                case ITEM_SUBCLASS_WEAPON_THROWN:
                    return 2567;
                case ITEM_SUBCLASS_WEAPON_SPEAR:
                    return 3386;
                case ITEM_SUBCLASS_WEAPON_CROSSBOW:
                    return 5011;
                case ITEM_SUBCLASS_WEAPON_WAND:
                    return 5009;
            }
            return 0;
        case ITEM_CLASS_ARMOR:
            switch (proto->SubClass)
            {
                case ITEM_SUBCLASS_ARMOR_CLOTH:
                    return 9078;
                case ITEM_SUBCLASS_ARMOR_LEATHER:
                    return 9077;
                case ITEM_SUBCLASS_ARMOR_MAIL:
                    return 8737;
                case ITEM_SUBCLASS_ARMOR_PLATE:
                    return  750;
                case ITEM_SUBCLASS_ARMOR_SHIELD:
                    return 9116;
                default:
                    return 0;
            }
    }
    return 0;
}

int32 Item::GenerateItemRandomPropertyId(uint32 item_id)
{
    ItemPrototype const* itemProto = sItemStorage.LookupEntry<ItemPrototype>(item_id);

    if (!itemProto)
        return 0;

    // RandomProperty case
    if (itemProto->RandomProperty)
    {
        uint32 randomPropId = GetItemEnchantMod(itemProto->RandomProperty);
        ItemRandomPropertiesEntry const* random_id = sItemRandomPropertiesStore.LookupEntry(randomPropId);
        if (!random_id)
        {
            sLog.outErrorDb("Enchantment id #%u used but it doesn't have records in 'ItemRandomProperties.dbc'", randomPropId);
            return 0;
        }

        return random_id->ID;
    }

    return 0;
}

void Item::SetItemRandomProperties(int32 randomPropId)
{
    if (!randomPropId)
        return;

    if (randomPropId > 0)
    {
        ItemRandomPropertiesEntry const* item_rand = sItemRandomPropertiesStore.LookupEntry(randomPropId);
        if (item_rand)
        {
            if (GetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID) != int32(item_rand->ID))
            {
                SetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID, item_rand->ID);
                SetState(ITEM_CHANGED);
            }
            for (uint32 i = PROP_ENCHANTMENT_SLOT_0; i < PROP_ENCHANTMENT_SLOT_0 + 3; ++i)
                SetEnchantment(EnchantmentSlot(i), item_rand->enchant_id[i - PROP_ENCHANTMENT_SLOT_0], 0, 0);
        }
    }
}

void Item::SetState(ItemUpdateState state, Player* forplayer)
{
    if (uState == ITEM_NEW && state == ITEM_REMOVED)
    {
        // pretend the item never existed
        RemoveFromUpdateQueueOf(forplayer);
        delete this;
        return;
    }

    if (state != ITEM_UNCHANGED)
    {
        // new items must stay in new state until saved
        if (uState != ITEM_NEW) uState = state;
        AddToUpdateQueueOf(forplayer);
    }
    else
    {
        // unset in queue
        // the item must be removed from the queue manually
        uQueuePos = -1;
        uState = ITEM_UNCHANGED;
    }
}

void Item::AddToUpdateQueueOf(Player* player)
{
    if (IsInUpdateQueue())
        return;

    if (!player)
    {
        player = GetOwner();
        if (!player)
        {
            sLog.outError("Item::AddToUpdateQueueOf - %s current owner (%s) not in world!",
                          GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str());
            return;
        }
    }

    if (player->GetObjectGuid() != GetOwnerGuid())
    {
        sLog.outError("Item::AddToUpdateQueueOf - %s current owner (%s) and inventory owner (%s) don't match!",
                      GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str(), player->GetGuidStr().c_str());
        return;
    }

    if (player->m_itemUpdateQueueBlocked)
        return;

    player->m_itemUpdateQueue.push_back(this);
    uQueuePos = player->m_itemUpdateQueue.size() - 1;
}

void Item::RemoveFromUpdateQueueOf(Player* player)
{
    if (!IsInUpdateQueue())
        return;

    if (!player)
    {
        player = GetOwner();
        if (!player)
        {
            sLog.outError("Item::RemoveFromUpdateQueueOf - %s current owner (%s) not in world!",
                          GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str());
            return;
        }
    }

    if (player->GetObjectGuid() != GetOwnerGuid())
    {
        sLog.outError("Item::RemoveFromUpdateQueueOf - %s current owner (%s) and inventory owner (%s) don't match!",
                      GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str(), player->GetGuidStr().c_str());
        return;
    }

    if (player->m_itemUpdateQueueBlocked)
        return;

    player->m_itemUpdateQueue[uQueuePos] = NULL;
    uQueuePos = -1;
}

uint8 Item::GetBagSlot() const
{
    return m_container ? m_container->GetSlot() : uint8(INVENTORY_SLOT_BAG_0);
}

bool Item::IsEquipped() const
{
    return !IsInBag() && m_slot < EQUIPMENT_SLOT_END;
}

bool Item::CanBeTraded() const
{
    if (IsSoulBound())
        return false;
    if (IsBag() && (Player::IsBagPos(GetPos()) || !((Bag const*)this)->IsEmpty()))
        return false;

    if (Player* owner = GetOwner())
    {
        if (owner->CanUnequipItem(GetPos(), false) !=  EQUIP_ERR_OK)
            return false;
        if (owner->GetLootGuid() == GetObjectGuid())
            return false;
    }

    if (HasGeneratedLoot())
        return false;

    if (IsBoundByEnchant())
        return false;

    return true;
}

bool Item::IsBoundByEnchant() const
{
    // Check all enchants for soulbound
    for (uint32 enchant_slot = PERM_ENCHANTMENT_SLOT; enchant_slot < MAX_ENCHANTMENT_SLOT; ++enchant_slot)
    {
        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));
        if (!enchant_id)
            continue;

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
            continue;

        if (enchantEntry->slot & ENCHANTMENT_CAN_SOULBOUND)
            return true;
    }
    return false;
}

bool Item::IsFitToSpellRequirements(SpellEntry const* spellInfo) const
{
    ItemPrototype const* proto = GetProto();

    if (spellInfo->EquippedItemClass != -1)                 // -1 == any item class
    {
        // Ustaag <Nostalrius> : ajout exception pour le spell Enchant Cloak - Minor Agility
        // prob de DB : spellInfo->EquippedItemClass == 2 alors qu'il devrait etre == 4
        if (spellInfo->Id == 13419 && proto->InventoryType == INVTYPE_CLOAK)
            return true;
        if ((spellInfo->EquippedItemClass != int32(proto->Class)) && spellInfo->Id != 13419)
            return false;                                   //  wrong item class

        if (spellInfo->EquippedItemSubClassMask != 0)        // 0 == any subclass
        {
            if ((spellInfo->EquippedItemSubClassMask & (1 << proto->SubClass)) == 0)
                return false;                               // subclass not present in mask
        }
    }

    // Only check for item enchantments (TARGET_FLAG_ITEM), all other spells are either NPC spells
    // or spells where slot requirements are already handled with AttributesEx3 fields
    // and special code (Titan's Grip, Windfury Attack). Check clearly not applicable for Lava Lash.
    if (spellInfo->EquippedItemInventoryTypeMask != 0 && (spellInfo->Targets & TARGET_FLAG_ITEM))    // 0 == any inventory type
    {
        if ((spellInfo->EquippedItemInventoryTypeMask  & (1 << proto->InventoryType)) == 0)
            return false;                                   // inventory type not present in mask
    }

    return true;
}

bool Item::IsTargetValidForItemUse(Unit* pUnitTarget)
{
    ItemRequiredTargetMapBounds bounds = sObjectMgr.GetItemRequiredTargetMapBounds(GetProto()->ItemId);

    if (bounds.first == bounds.second)
        return true;

    if (!pUnitTarget)
        return false;

    for (ItemRequiredTargetMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        if (itr->second.IsFitToRequirements(pUnitTarget))
            return true;

    return false;
}

void Item::SetEnchantment(EnchantmentSlot slot, uint32 id, uint32 duration, uint32 charges)
{
    // Better lost small time at check in comparison lost time at item save to DB.
    if ((GetEnchantmentId(slot) == id) && (GetEnchantmentDuration(slot) == duration) && (GetEnchantmentCharges(slot) == charges))
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_ID_OFFSET, id);
    SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_DURATION_OFFSET, duration);
    SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_CHARGES_OFFSET, charges);
    SetState(ITEM_CHANGED);
}

void Item::SetEnchantmentDuration(EnchantmentSlot slot, uint32 duration)
{
    if (GetEnchantmentDuration(slot) == duration)
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_DURATION_OFFSET, duration);
    SetState(ITEM_CHANGED);
}

void Item::SetEnchantmentCharges(EnchantmentSlot slot, uint32 charges)
{
    if (GetEnchantmentCharges(slot) == charges)
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_CHARGES_OFFSET, charges);
    SetState(ITEM_CHANGED);
}

void Item::ClearEnchantment(EnchantmentSlot slot)
{
    if (!GetEnchantmentId(slot))
        return;

    for (uint8 x = 0; x < 3; ++x)
        SetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot * MAX_ENCHANTMENT_OFFSET + x, 0);
    SetState(ITEM_CHANGED);
}

bool Item::IsLimitedToAnotherMapOrZone(uint32 cur_mapId, uint32 cur_zoneId) const
{
    ItemPrototype const* proto = GetProto();
    return proto && ((proto->Map && proto->Map != cur_mapId) || (proto->Area && proto->Area != cur_zoneId));
}

// Though the client has the information in the item's data field,
// we have to send SMSG_ITEM_TIME_UPDATE to display the remaining
// time.
void Item::SendTimeUpdate(Player* owner)
{
    uint32 duration = GetUInt32Value(ITEM_FIELD_DURATION);
    if (!duration)
        return;

    WorldPacket data(SMSG_ITEM_TIME_UPDATE, (8 + 4));
    data << ObjectGuid(GetObjectGuid());
    data << uint32(duration);
    owner->GetSession()->SendPacket(&data);
}

Item* Item::CreateItem(uint32 item, uint32 count, Player const* player)
{
    if (count < 1)
        return NULL;                                        //don't create item at zero count

    if (ItemPrototype const* pProto = ObjectMgr::GetItemPrototype(item))
    {
        if (count > pProto->GetMaxStackSize())
            count = pProto->GetMaxStackSize();

        MANGOS_ASSERT(count != 0 && "pProto->Stackable == 0 but checked at loading already");

        Item* pItem = NewItemOrBag(pProto);
        uint32 lowGuid = 0;
        if (player)
            lowGuid = player->GetSession()->GenerateItemLowGuid();
        else
            lowGuid = sObjectMgr.GenerateItemLowGuid();

        if (pItem->Create(lowGuid, item, player ? player->GetObjectGuid() : ObjectGuid()))
        {
            pItem->SetCount(count);
            return pItem;
        }
        else
            delete pItem;
    }
    return NULL;
}

Item* Item::CloneItem(uint32 count, Player const* player) const
{
    Item* newItem = CreateItem(GetEntry(), count, player);
    if (!newItem)
        return NULL;

    newItem->SetGuidValue(ITEM_FIELD_CREATOR,     GetGuidValue(ITEM_FIELD_CREATOR));
    newItem->SetGuidValue(ITEM_FIELD_GIFTCREATOR, GetGuidValue(ITEM_FIELD_GIFTCREATOR));
    newItem->SetUInt32Value(ITEM_FIELD_FLAGS,     GetUInt32Value(ITEM_FIELD_FLAGS));
    newItem->SetUInt32Value(ITEM_FIELD_DURATION,  GetUInt32Value(ITEM_FIELD_DURATION));
    newItem->SetItemRandomProperties(GetItemRandomPropertyId());
    newItem->generatedLoot = generatedLoot;
    return newItem;
}

bool Item::IsBindedNotWith(Player const* player) const
{
    // own item
    if (GetOwnerGuid() == player->GetObjectGuid())
        return false;

    // has loot with diff owner
    if (HasGeneratedLoot())
        return true;

    // not binded item
    if (!IsSoulBound())
        return false;

    return true;
}

void Item::AddToClientUpdateList()
{
    if (Player* pl = GetOwner())
        pl->GetMap()->AddUpdateObject(this);
}

void Item::RemoveFromClientUpdateList()
{
    if (Player* pl = GetOwner())
        pl->GetMap()->RemoveUpdateObject(this);
}

void Item::BuildUpdateData(UpdateDataMapType& update_players)
{
    if (Player* pl = GetOwner())
        BuildUpdateDataForPlayer(pl, update_players);

    ClearUpdateMask(false);
}

InventoryResult Item::CanBeMergedPartlyWith(ItemPrototype const* proto) const
{
    // check item type
    if (GetEntry() != proto->ItemId)
        return EQUIP_ERR_ITEM_CANT_STACK;

    // check free space (full stacks can't be target of merge
    if (GetCount() >= proto->GetMaxStackSize())
        return EQUIP_ERR_ITEM_CANT_STACK;

    // not allow merge looting currently items
    if (HasGeneratedLoot())
        return EQUIP_ERR_ALREADY_LOOTED;

    return EQUIP_ERR_OK;
}

bool ItemRequiredTarget::IsFitToRequirements(Unit* pUnitTarget) const
{
    if (pUnitTarget->GetTypeId() != TYPEID_UNIT)
        return false;

    if (pUnitTarget->GetEntry() != m_uiTargetEntry)
        return false;

    switch (m_uiType)
    {
        case ITEM_TARGET_TYPE_CREATURE:
            return pUnitTarget->isAlive();
        case ITEM_TARGET_TYPE_DEAD:
            return !pUnitTarget->isAlive();
        default:
            return false;
    }
}

void Item::SetLootState(ItemLootUpdateState state)
{
    // ITEM_LOOT_NONE -> ITEM_LOOT_TEMPORARY -> ITEM_LOOT_NONE
    // ITEM_LOOT_NONE -> ITEM_LOOT_NEW -> ITEM_LOOT_NONE
    // ITEM_LOOT_NONE -> ITEM_LOOT_NEW -> ITEM_LOOT_UNCHANGED [<-> ITEM_LOOT_CHANGED] -> ITEM_LOOT_REMOVED -> ITEM_LOOT_NONE
    switch (state)
    {
        case ITEM_LOOT_NONE:
        case ITEM_LOOT_NEW:
            ASSERT(false);                                 // not used in state change calls
            return;
        case ITEM_LOOT_TEMPORARY:
            ASSERT(m_lootState == ITEM_LOOT_NONE);          // called only for not generated yet loot case
            m_lootState = ITEM_LOOT_TEMPORARY;
            break;
        case ITEM_LOOT_CHANGED:
            // new loot must stay in new state until saved, temporary must stay until remove
            if (m_lootState != ITEM_LOOT_NEW && m_lootState != ITEM_LOOT_TEMPORARY)
                m_lootState = m_lootState == ITEM_LOOT_NONE ? ITEM_LOOT_NEW : state;
            break;
        case ITEM_LOOT_UNCHANGED:
            // expected that called after DB update or load
            if (m_lootState == ITEM_LOOT_REMOVED)
                m_lootState = ITEM_LOOT_NONE;
            // temporary must stay until remove (ignore any changes)
            else if (m_lootState != ITEM_LOOT_TEMPORARY)
                m_lootState = ITEM_LOOT_UNCHANGED;
            break;
        case ITEM_LOOT_REMOVED:
            // if loot not saved then it existence in past can be just ignored
            if (m_lootState == ITEM_LOOT_NEW || m_lootState == ITEM_LOOT_TEMPORARY)
            {
                m_lootState = ITEM_LOOT_NONE;
                return;
            }

            m_lootState = ITEM_LOOT_REMOVED;
            break;
    }

    if (m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_UNCHANGED && m_lootState != ITEM_LOOT_TEMPORARY)
        SetState(ITEM_CHANGED);
}

bool Item::ChangeEntry(ItemPrototype const* pNewProto)
{
    SetEntry(pNewProto->ItemId);
    for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        SetSpellCharges(i, pNewProto->Spells[i].SpellCharges);
    SetItemRandomProperties(GenerateItemRandomPropertyId(pNewProto->ItemId));
    SetState(ITEM_CHANGED);
    if (Player* pOwner = GetOwner())
        AddToUpdateQueueOf(pOwner);
    return true;
}

void Item::GetLocalizedNameWithSuffix(std::string& name, const ItemPrototype* proto, const ItemRandomPropertiesEntry* randomProp, int dbLocale, LocaleConstant dbcLocale)
{
    // local name
    if (dbLocale >= 0)
    {
        ItemLocale const *il = sObjectMgr.GetItemLocale(proto->ItemId);
        if (il)
        {
            if (il->Name.size() > size_t(dbLocale) && !il->Name[dbLocale].empty())
                name = il->Name[dbLocale];
        }
    }

    if (randomProp)
    {
        std::string nameSuffix(randomProp->internalName);
        if (dbcLocale < MAX_DBC_LOCALE)
        {
            std::string localeSuffix = randomProp->nameSuffix[dbcLocale];
            if (localeSuffix.length() > 0)
                nameSuffix = localeSuffix;
        }

        if (!nameSuffix.empty())
        {
            // Support backwards languages
            switch (dbcLocale)
            {
                case LOCALE_zhCN:
                case LOCALE_zhTW:
                    name = nameSuffix + name;
                    break;
                case LOCALE_koKR:
                    name = nameSuffix + " " + name;
                    break;
                default:
                    name += " " + nameSuffix;
                    break;
            }
        }
    }
}