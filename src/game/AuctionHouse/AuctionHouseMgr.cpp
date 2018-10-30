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

#include "AuctionHouseMgr.h"
#include "Database/DatabaseEnv.h"
#include "SQLStorages.h"
#include "DBCStores.h"
#include "ProgressBar.h"

#include "AccountMgr.h"
#include "Item.h"
#include "Language.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "World.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Mail.h"

#include "Policies/SingletonImp.h"

INSTANTIATE_SINGLETON_1(AuctionHouseMgr);

bool AuctionHouseObject::RemoveAuction(AuctionEntry* entry)
{
    // Clean up multimaps before final erasure
    auto bounds = OrderedAuctionMap.equal_range(entry->buyout);
    for (AuctionMultiMap::iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second->Id == entry->Id) {
            OrderedAuctionMap.erase(itr);
            break;
        }
    }

    bounds = AccountAuctionMap.equal_range(entry->ownerAccount);
    for (AuctionMultiMap::iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second->Id == entry->Id) {
            AccountAuctionMap.erase(itr);
            break;
        }
    }

    if (AuctionsMap.erase(entry->Id) > 0)
    {
        sObjectMgr.FreeAuctionID(entry->Id);
        return true;
    }
    return false;
}

void AuctionHouseObject::AddAuction(AuctionEntry *ah)
{
    MANGOS_ASSERT(ah);
    AuctionsMap[ah->Id] = ah;
    OrderedAuctionMap.insert(std::pair<uint32, AuctionEntry*>(ah->buyout, ah));
    AccountAuctionMap.insert(std::pair<uint32, AuctionEntry*>(ah->ownerAccount, ah));
}

AuctionHouseMgr::AuctionHouseMgr()
{
}

AuctionHouseMgr::~AuctionHouseMgr()
{
    for (ItemMap::const_iterator itr = mAitems.begin(); itr != mAitems.end(); ++itr)
        delete itr->second;
}

AuctionHouseObject * AuctionHouseMgr::GetAuctionsMap(AuctionHouseEntry const* house)
{
    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_AUCTION))
        return &mNeutralAuctions;

    // team have linked auction houses
    switch (GetAuctionHouseTeam(house))
    {
        case ALLIANCE:
            return &mAllianceAuctions;
        case HORDE:
            return &mHordeAuctions;
        default:
            return &mNeutralAuctions;
    }
}

uint32 AuctionHouseMgr::GetAuctionDeposit(AuctionHouseEntry const* entry, uint32 time, Item *pItem)
{
    float deposit = float(pItem->GetProto()->SellPrice * pItem->GetCount() * (time / MIN_AUCTION_TIME));

    deposit = deposit * entry->depositPercent / 100.0f;

    float min_deposit = float(sWorld.getConfig(CONFIG_UINT32_AUCTION_DEPOSIT_MIN));

    if (deposit < min_deposit)
        deposit = min_deposit;

    return uint32(deposit * sWorld.getConfig(CONFIG_FLOAT_RATE_AUCTION_DEPOSIT));
}

// does not clear ram
void AuctionHouseMgr::SendAuctionWonMail(AuctionEntry *auction)
{
    Item *pItem = GetAItem(auction->itemGuidLow);
    if (!pItem)
        return;

    ObjectGuid bidder_guid = ObjectGuid(HIGHGUID_PLAYER, auction->bidder);
    Player *bidder = sObjectMgr.GetPlayer(bidder_guid);

    uint32 bidder_accId = 0;

    // data for gm.log
    if (sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
    {
        uint32 bidder_security = 0;
        std::string bidder_name;
        if (bidder)
        {
            bidder_accId = bidder->GetSession()->GetAccountId();
            bidder_security = bidder->GetSession()->GetSecurity();
            bidder_name = bidder->GetName();
        }
        else
        {
            bidder_accId = sObjectMgr.GetPlayerAccountIdByGUID(bidder_guid);
            bidder_security = sAccountMgr.GetSecurity(bidder_accId);

            if (bidder_security > SEC_PLAYER)               // not do redundant DB requests
            {
                if (!sObjectMgr.GetPlayerNameByGUID(bidder_guid, bidder_name))
                    bidder_name = sObjectMgr.GetMangosStringForDBCLocale(LANG_UNKNOWN);
            }
        }

        if (bidder_security > SEC_PLAYER)
        {
            ObjectGuid owner_guid = ObjectGuid(HIGHGUID_PLAYER, auction->owner);
            std::string owner_name;
            if (!sObjectMgr.GetPlayerNameByGUID(owner_guid, owner_name))
                owner_name = sObjectMgr.GetMangosStringForDBCLocale(LANG_UNKNOWN);

            uint32 owner_accid = sObjectMgr.GetPlayerAccountIdByGUID(owner_guid);

            sLog.outCommand(bidder_accId, "GM %s (Account: %u) won item in auction: %s (Entry: %u Count: %u) and pay money: %u. Original owner %s (Account: %u)",
                            bidder_name.c_str(), bidder_accId, pItem->GetProto()->Name1, pItem->GetEntry(), pItem->GetCount(), auction->bid, owner_name.c_str(), owner_accid);
        }
    }
    else if (!bidder)
        bidder_accId = sObjectMgr.GetPlayerAccountIdByGUID(bidder_guid);

    // receiver exist
    if (bidder || bidder_accId)
    {
        std::ostringstream msgAuctionWonSubject;
        msgAuctionWonSubject << auction->itemTemplate << ":0:" << AUCTION_WON;

        std::ostringstream msgAuctionWonBody;
        msgAuctionWonBody.width(16);
        msgAuctionWonBody << std::right << std::hex << auction->owner;
        msgAuctionWonBody << std::dec << ":" << auction->bid << ":" << auction->buyout;
        DEBUG_LOG("AuctionWon body string : %s", msgAuctionWonBody.str().c_str());

        // set owner to bidder (to prevent delete item with sender char deleting)
        // owner in `data` will set at mail receive and item extracting
        CharacterDatabase.PExecute("UPDATE item_instance SET owner_guid = '%u' WHERE guid='%u'", auction->bidder, pItem->GetGUIDLow());
        CharacterDatabase.CommitTransaction();

        if (bidder)
            bidder->GetSession()->SendAuctionBidderNotification(auction, true);
        else
            RemoveAItem(pItem->GetGUIDLow());               // we have to remove the item, before we delete it !!

        // will delete item or place to receiver mail list
        MailDraft(msgAuctionWonSubject.str(), msgAuctionWonBody.str())
        .AddItem(pItem)
        .SendMailTo(MailReceiver(bidder, bidder_guid), auction, MAIL_CHECK_MASK_COPIED);
    }
    // receiver not exist
    else
    {
        CharacterDatabase.PExecute("DELETE FROM item_instance WHERE guid='%u'", pItem->GetGUIDLow());
        RemoveAItem(pItem->GetGUIDLow());                   // we have to remove the item, before we delete it !!
        delete pItem;
    }
}

// call this method to send mail to auction owner, when auction is successful, it does not clear ram
void AuctionHouseMgr::SendAuctionSuccessfulMail(AuctionEntry * auction)
{
    ObjectGuid owner_guid = ObjectGuid(HIGHGUID_PLAYER, auction->owner);
    Player *owner = sObjectMgr.GetPlayer(owner_guid);

    uint32 owner_accId = 0;
    if (!owner)
        owner_accId = sObjectMgr.GetPlayerAccountIdByGUID(owner_guid);

    // owner exist
    if (owner || owner_accId)
    {
        std::ostringstream msgAuctionSuccessfulSubject;
        msgAuctionSuccessfulSubject << auction->itemTemplate << ":0:" << AUCTION_SUCCESSFUL;

        std::ostringstream auctionSuccessfulBody;
        uint32 auctionCut = auction->GetAuctionCut();

        auctionSuccessfulBody.width(16);
        auctionSuccessfulBody << std::right << std::hex << auction->bidder;
        auctionSuccessfulBody << std::dec << ":" << auction->bid << ":" << auction->buyout;
        auctionSuccessfulBody << ":" << auction->deposit << ":" << auctionCut;

        DEBUG_LOG("AuctionSuccessful body string : %s", auctionSuccessfulBody.str().c_str());

        uint32 profit = auction->bid + auction->deposit - auctionCut;

        if (owner)
        {
            //send auction owner notification, bidder must be current!
            owner->GetSession()->SendAuctionOwnerNotification(auction, true);
        }

        MailDraft(msgAuctionSuccessfulSubject.str(), auctionSuccessfulBody.str())
        .SetMoney(profit)
        .SendMailTo(MailReceiver(owner, owner_guid), auction, MAIL_CHECK_MASK_COPIED);
    }
}

// does not clear ram
void AuctionHouseMgr::SendAuctionExpiredMail(AuctionEntry * auction)
{
    // return an item in auction to its owner by mail
    Item *pItem = GetAItem(auction->itemGuidLow);
    if (!pItem)
    {
        sLog.outError("Auction item (GUID: %u) not found, and lost.", auction->itemGuidLow);
        return;
    }

    ObjectGuid owner_guid = ObjectGuid(HIGHGUID_PLAYER, auction->owner);
    Player *owner = sObjectMgr.GetPlayer(owner_guid);

    uint32 owner_accId = 0;
    if (!owner)
        owner_accId = sObjectMgr.GetPlayerAccountIdByGUID(owner_guid);

    // owner exist
    if (owner || owner_accId)
    {
        std::ostringstream subject;
        subject << auction->itemTemplate << ":0:" << AUCTION_EXPIRED;

        if (owner)
            owner->GetSession()->SendAuctionOwnerNotification(auction, false);
        else
            RemoveAItem(pItem->GetGUIDLow());               // we have to remove the item, before we delete it !!

        // will delete item or place to receiver mail list
        MailDraft(subject.str())
        .AddItem(pItem)
        .SendMailTo(MailReceiver(owner, owner_guid), auction, MAIL_CHECK_MASK_COPIED);
    }
    // owner not found
    else
    {
        CharacterDatabase.PExecute("DELETE FROM item_instance WHERE guid='%u'", pItem->GetGUIDLow());
        RemoveAItem(pItem->GetGUIDLow());                   // we have to remove the item, before we delete it !!
        delete pItem;
    }
}

void AuctionHouseMgr::LoadAuctionItems()
{
    //               0                1      2         3        4      5             6                 7           8           9       10       11
    QueryResult *result = CharacterDatabase.Query("SELECT creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, itemguid, itemEntry FROM auction JOIN item_instance ON itemguid = guid");

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded 0 auction items");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    uint32 count = 0;

    Field *fields;
    do
    {
        bar.step();

        fields = result->Fetch();
        uint32 item_guid        = fields[10].GetUInt32();
        uint32 item_template    = fields[11].GetUInt32();

        ItemPrototype const *proto = ObjectMgr::GetItemPrototype(item_template);

        if (!proto)
        {
            sLog.outError("AuctionHouseMgr::LoadAuctionItems: Unknown item (GUID: %u id: #%u) in auction, skipped.", item_guid, item_template);
            continue;
        }

        Item *item = NewItemOrBag(proto);

        if (!item->LoadFromDB(item_guid, ObjectGuid(), fields, item_template))
        {
            delete item;
            continue;
        }
        AddAItem(item);

        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u auction items", count);
}

void AuctionHouseMgr::LoadAuctions()
{
    QueryResult *result = CharacterDatabase.Query("SELECT COUNT(*) FROM auction");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded 0 auctions. DB table `auction` is empty.");
        return;
    }

    Field *fields = result->Fetch();
    uint32 AuctionCount = fields[0].GetUInt32();
    delete result;

    if (!AuctionCount)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded 0 auctions. DB table `auction` is empty.");
        return;
    }

    result = CharacterDatabase.Query("SELECT id,houseid,itemguid,item_template,itemowner,buyoutprice,time,buyguid,lastbid,startbid,deposit FROM auction");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded 0 auctions. DB table `auction` is empty.");
        return;
    }

    BarGoLink bar(AuctionCount);

    do
    {
        fields = result->Fetch();

        bar.step();

        AuctionEntry *auction = new AuctionEntry;
        auction->Id = fields[0].GetUInt32();
        uint32 houseid  = fields[1].GetUInt32();
        auction->itemGuidLow = fields[2].GetUInt32();
        auction->itemTemplate = fields[3].GetUInt32();
        auction->owner = fields[4].GetUInt32();
        auction->buyout = fields[5].GetUInt32();
        auction->depositTime = 0;
        auction->expireTime = fields[6].GetUInt32();
        auction->bidder = fields[7].GetUInt32();
        auction->bid = fields[8].GetUInt32();
        auction->startbid = fields[9].GetUInt32();
        auction->deposit = fields[10].GetUInt32();
        auction->auctionHouseEntry = NULL;                  // init later

        auction->ownerAccount = sObjectMgr.GetPlayerAccountIdByGUID(auction->owner);

        // check if sold item exists for guid
        // and item_template in fact (GetAItem will fail if problematic in result check in AuctionHouseMgr::LoadAuctionItems)
        Item* pItem = GetAItem(auction->itemGuidLow);
        if (!pItem)
        {
            auction->DeleteFromDB();
            sLog.outError("Auction %u has not a existing item : %u, deleted", auction->Id, auction->itemGuidLow);
            delete auction;
            continue;
        }

        auction->auctionHouseEntry = sAuctionHouseStore.LookupEntry(houseid);

        if (!houseid)
        {
            // need for send mail, use goblin auctionhouse
            auction->auctionHouseEntry = sAuctionHouseStore.LookupEntry(7);

            // Attempt send item back to owner
            std::ostringstream msgAuctionCanceledOwner;
            msgAuctionCanceledOwner << auction->itemTemplate << ":0:" << AUCTION_CANCELED;

            // item will deleted or added to received mail list
            MailDraft(msgAuctionCanceledOwner.str(), "")    // TODO: fix body
            .AddItem(pItem)
            .SendMailTo(MailReceiver(ObjectGuid(HIGHGUID_PLAYER, auction->owner)), auction, MAIL_CHECK_MASK_COPIED);

            RemoveAItem(auction->itemGuidLow);
            auction->DeleteFromDB();
            delete auction;

            continue;
        }

        GetAuctionsMap(auction->auctionHouseEntry)->AddAuction(auction);

    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u auctions", AuctionCount);
}

void AuctionHouseMgr::AddAItem(Item* it)
{
    MANGOS_ASSERT(it);
    MANGOS_ASSERT(mAitems.find(it->GetGUIDLow()) == mAitems.end());
    mAitems[it->GetGUIDLow()] = it;
}

bool AuctionHouseMgr::RemoveAItem(uint32 id)
{
    ItemMap::iterator i = mAitems.find(id);
    if (i == mAitems.end())
        return false;
    mAitems.erase(i);
    return true;
}

void AuctionHouseMgr::Update()
{
    mHordeAuctions.Update();
    mAllianceAuctions.Update();
    mNeutralAuctions.Update();
}

uint32 AuctionHouseMgr::GetAuctionHouseTeam(AuctionHouseEntry const* house)
{
    // auction houses have faction field pointing to PLAYER,* factions,
    // but player factions not have filled team field, and hard go from faction value to faction_template value,
    // so more easy just sort by auction house ids
    switch (house->houseId)
    {
        case 1:
        case 2:
        case 3:
            return ALLIANCE;
        case 4:
        case 5:
        case 6:
            return HORDE;
        case 7:
        default:
            return 0;                                       // neutral
    }
}

AuctionHouseEntry const* AuctionHouseMgr::GetAuctionHouseEntry(Unit* unit)
{
    uint32 houseid = 1;                                     // dwarf auction house (used for normal cut/etc percents)

    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_AUCTION))
    {
        if (unit->GetTypeId() == TYPEID_UNIT)
        {
            // FIXME: found way for proper auctionhouse selection by another way
            // AuctionHouse.dbc have faction field with _player_ factions associated with auction house races.
            // but no easy way convert creature faction to player race faction for specific city
            uint32 factionTemplateId = unit->getFaction();
            switch (factionTemplateId)
            {
                case   12:
                    houseid = 1;
                    break;              // human
                case   29:
                    houseid = 6;
                    break;              // orc, and generic for horde
                case   55:
                    houseid = 2;
                    break;              // dwarf/gnome, and generic for alliance
                case   68:
                    houseid = 4;
                    break;              // undead
                case   80:
                    houseid = 3;
                    break;              // n-elf
                case  104:
                    houseid = 5;
                    break;              // trolls
                case  120:
                    houseid = 7;
                    break;              // booty bay, neutral
                case  474:
                    houseid = 7;
                    break;              // gadgetzan, neutral
                case  534:
                    houseid = 2;
                    break;              // Alliance Generic
                case  855:
                    houseid = 7;
                    break;              // everlook, neutral
                default:                                    // for unknown case
                {
                    FactionTemplateEntry const* u_entry = sObjectMgr.GetFactionTemplateEntry(factionTemplateId);
                    if (!u_entry)
                        houseid = 7;                        // goblin auction house
                    else if (u_entry->ourMask & FACTION_MASK_ALLIANCE)
                        houseid = 1;                        // human auction house
                    else if (u_entry->ourMask & FACTION_MASK_HORDE)
                        houseid = 6;                        // orc auction house
                    else
                        houseid = 7;                        // goblin auction house
                    break;
                }
            }
        }
        else
        {
            Player* player = (Player*)unit;
            if (player->GetAuctionAccessMode() > 0)
                houseid = 7;
            else
            {
                switch (((Player*)unit)->GetTeam())
                {
                    case ALLIANCE:
                        houseid = player->GetAuctionAccessMode() == 0 ? 1 : 6;
                        break;
                    case HORDE:
                        houseid = player->GetAuctionAccessMode() == 0 ? 6 : 1;
                        break;
                }
            }
        }
    }

    return sAuctionHouseStore.LookupEntry(houseid);
}

AuctionHouseEntry const* AuctionHouseMgr::GetAuctionHouseEntry(uint32 factionTemplateId)
{
    uint32 houseid = 1;                                     // dwarf auction house (used for normal cut/etc percents)

    switch (factionTemplateId)
    {
        case   12:
            houseid = 1;
            break;              // human
        case   29:
            houseid = 6;
            break;              // orc, and generic for horde
        case   55:
            houseid = 2;
            break;              // dwarf/gnome, and generic for alliance
        case   68:
            houseid = 4;
            break;              // undead
        case   80:
            houseid = 3;
            break;              // n-elf
        case  104:
            houseid = 5;
            break;              // trolls
        case  120:
            houseid = 7;
            break;              // booty bay, neutral
        case  474:
            houseid = 7;
            break;              // gadgetzan, neutral
        case  534:
            houseid = 2;
            break;              // Alliance Generic
        case  855:
            houseid = 7;
            break;              // everlook, neutral
        default:                                    // for unknown case
        {
            FactionTemplateEntry const* u_entry = sObjectMgr.GetFactionTemplateEntry(factionTemplateId);
            if (!u_entry)
                houseid = 7;                        // goblin auction house
            else if (u_entry->ourMask & FACTION_MASK_ALLIANCE)
                houseid = 1;                        // human auction house
            else if (u_entry->ourMask & FACTION_MASK_HORDE)
                houseid = 6;                        // orc auction house
            else
                houseid = 7;                        // goblin auction house
            break;
        }
    }

    return sAuctionHouseStore.LookupEntry(houseid);
}

void AuctionHouseObject::Update()
{
    time_t curTime = sWorld.GetGameTime();
    ///- Handle expired auctions
    AuctionEntryMap::iterator next;
    // Store a ref to the entry and use it rather than derefencing the itr.
    // Also required to properly erase the itr and delete the entry if
    // necessary
    AuctionEntry* entry = nullptr;
    for (AuctionEntryMap::iterator itr = AuctionsMap.begin(); itr != AuctionsMap.end(); itr = next)
    {
        entry = itr->second;
        if (entry->depositTime + 5*60 < curTime) // Locked for 5 minutes on IP to prevent AH snipping
            entry->lockedIpAddress.clear();

        next = itr;
        ++next;
        if (curTime > (entry->expireTime))
        {
            ///- Either cancel the auction if there was no bidder
            if (entry->bidder == 0)
                sAuctionMgr.SendAuctionExpiredMail(entry);
            ///- Or perform the transaction
            else
            {
                PlayerTransactionData data;
                data.type = "Bid";
                data.parts[0].lowGuid = entry->owner;
                data.parts[0].itemsEntries[0] = entry->itemTemplate;
                Item* item = sAuctionMgr.GetAItem(entry->itemGuidLow);
                data.parts[0].itemsCount[0] = item ? item->GetCount() : 0;
                data.parts[0].itemsGuid[0] = entry->itemGuidLow;
                data.parts[1].lowGuid = entry->bidder;
                data.parts[1].money = entry->bid;
                sWorld.LogTransaction(data);

                //we should send an "item sold" message if the seller is online
                //we send the item to the winner
                //we send the money to the seller
                sAuctionMgr.SendAuctionSuccessfulMail(entry);
                sAuctionMgr.SendAuctionWonMail(entry);
            }

            ///- In any case clear the auction
            entry->DeleteFromDB();
            sAuctionMgr.RemoveAItem(entry->itemGuidLow);
            // Invalidates the ref to itr, cannot call delete on itr->second
            // after removal
            RemoveAuction(entry);

            delete entry;
            entry = nullptr;
        }
    }
}

void AuctionHouseObject::BuildListBidderItems(WorldPacket& data, Player* player, uint32 listfrom, uint32& count, uint32& totalcount)
{
    for (AuctionEntryMap::const_iterator itr = AuctionsMap.begin(); itr != AuctionsMap.end(); ++itr)
    {
        AuctionEntry *Aentry = itr->second;
        if (Aentry && Aentry->bidder == player->GetGUIDLow())
        {
            ++totalcount;

            if (count < 50 && totalcount > listfrom)
                if (itr->second->BuildAuctionInfo(data))
                    ++count;
        }
    }
}

void AuctionHouseObject::BuildListOwnerItems(WorldPacket& data, Player* player, uint32 listfrom, uint32& count, uint32& totalcount)
{
    auto bounds = AccountAuctionMap.equal_range(player->GetSession()->GetAccountId());
    for (auto itr = bounds.first; itr != bounds.second; ++itr)
    {
        AuctionEntry *Aentry = itr->second;
        if (Aentry && Aentry->owner == player->GetGUIDLow())
        {
            ++totalcount;
            if (count < 50 && totalcount > listfrom)
                if (Aentry->BuildAuctionInfo(data))
                    ++count;
        }
    }
}

void AuctionHouseObject::BuildListAuctionItems(WorldPacket& data, Player* player,
        AuctionHouseClientQuery const& query,
        uint32& count, uint32& totalcount)
{
    // Happening often, and easy to deal with
    if (query.auctionMainCategory == 0xffffffff && query.auctionSubCategory == 0xffffffff && query.auctionSlotID == 0xffffffff &&
        query.quality == 0xffffffff && query.levelmin == 0x00 && query.levelmax == 0x00 && query.usable == 0x00 && query.wsearchedname.empty())
    {
        totalcount = OrderedAuctionMap.size();
        if (query.listfrom < totalcount)
        {
            auto itr = OrderedAuctionMap.cbegin();
            std::advance(itr, query.listfrom);
            for (; itr != OrderedAuctionMap.cend(); ++itr)
            {
                if (!itr->second->IsAvailableFor(player))
                    continue;

                itr->second->BuildAuctionInfo(data);
                if ((++count) >= 50)
                    break;
            }
        }
        return;
    }

    time_t currTime = sWorld.GetGameTime();
    int loc_idx = player->GetSession()->GetSessionDbLocaleIndex();
    LocaleConstant dbc_loc = player->GetSession()->GetSessionDbcLocale();

    // Micro opt on name/suffix initialization
    std::string name;
    name.reserve(140);

    for (auto itr = OrderedAuctionMap.cbegin(); itr != OrderedAuctionMap.cend(); ++itr)
    {
        AuctionEntry *Aentry = itr->second;
        Item *item = sAuctionMgr.GetAItem(Aentry->itemGuidLow);
        if (!item)
            continue;

        {
            ItemPrototype const *proto = item->GetProto();

            if (query.auctionMainCategory != 0xffffffff && proto->Class != query.auctionMainCategory)
                continue;

            if (query.auctionSubCategory != 0xffffffff && proto->SubClass != query.auctionSubCategory)
                continue;

            if (query.auctionSlotID != 0xffffffff && proto->InventoryType != query.auctionSlotID &&
                    (query.auctionSlotID != INVTYPE_CHEST ||  query.auctionSlotID == INVTYPE_CHEST && proto->InventoryType != INVTYPE_ROBE))
                continue;

            if (query.quality != 0xffffffff && proto->Quality < query.quality)
                continue;

            if (query.levelmin != 0x00 && (proto->RequiredLevel < query.levelmin || (query.levelmax != 0x00 && proto->RequiredLevel > query.levelmax)))
                continue;

            if (query.usable != 0x00 && player->CanUseItem(item) != EQUIP_ERR_OK)
                continue;

            if (query.usable != 0x00 && proto->Class == ITEM_CLASS_RECIPE)
                if (SpellEntry const* spell = sSpellMgr.GetSpellEntry(proto->Spells[0].SpellId))
                    if (player->HasSpell(spell->EffectTriggerSpell[EFFECT_INDEX_0]))
                        continue;

            // IP locked auction
            if (!Aentry->IsAvailableFor(player))
                continue;

            if (!query.wsearchedname.empty())
            {
                name = proto->Name1;
                if (name.empty())
                    continue;

                int32 propertyId = item->GetItemRandomPropertyId();
                const ItemRandomPropertiesEntry* randomProperty = nullptr;
                if (propertyId > 0)
                     randomProperty = sItemRandomPropertiesStore.LookupEntry(static_cast<uint32>(propertyId));

                Item::GetLocalizedNameWithSuffix(name, proto, randomProperty, loc_idx, dbc_loc);

                if (!Utf8FitTo(name, query.wsearchedname))
                    continue;
            }

            if (count < 50 && totalcount >= query.listfrom)
            {
                ++count;
                Aentry->BuildAuctionInfo(data);
            }
        }

        ++totalcount;
    }
}

// this function inserts to WorldPacket auction's data
bool AuctionEntry::BuildAuctionInfo(WorldPacket & data) const
{
    Item *pItem = sAuctionMgr.GetAItem(itemGuidLow);
    if (!pItem)
    {
        sLog.outError("auction to item, that doesn't exist !!!!");
        return false;
    }
    data << uint32(Id);
    data << uint32(pItem->GetEntry());

    // [-ZERO] no other infos about enchantment in 1.12 [?]
    //for (uint8 i = 0; i < MAX_INSPECTED_ENCHANTMENT_SLOT; ++i)
    //{
    data << uint32(pItem->GetEnchantmentId(EnchantmentSlot(PERM_ENCHANTMENT_SLOT)));
    //    data << uint32(pItem->GetEnchantmentDuration(EnchantmentSlot(i)));
    //    data << uint32(pItem->GetEnchantmentCharges(EnchantmentSlot(i)));
    //}

    data << uint32(pItem->GetItemRandomPropertyId());       // random item property id
    data << uint32(pItem->GetItemSuffixFactor());           // SuffixFactor
    data << uint32(pItem->GetCount());                      // item->count
    data << uint32(pItem->GetSpellCharges());               // item->charge FFFFFFF
    data << ObjectGuid(HIGHGUID_PLAYER, owner);             // Auction->owner
    data << uint32(startbid);                               // Auction->startbid (not sure if useful)
    data << uint32(bid ? GetAuctionOutBid() : 0);           // minimal outbid
    data << uint32(buyout);                                 // auction->buyout
    data << uint32((expireTime - time(NULL))*IN_MILLISECONDS); // time left
    data << ObjectGuid(HIGHGUID_PLAYER, bidder);            // auction->bidder current
    data << uint32(bid);                                    // current bid
    return true;
}

uint32 AuctionEntry::GetAuctionCut() const
{
    return uint32(auctionHouseEntry->cutPercent * bid * sWorld.getConfig(CONFIG_FLOAT_RATE_AUCTION_CUT) / 100.0f);
}

/// the sum of outbid is (1% from current bid)*5, if bid is very small, it is 1c
uint32 AuctionEntry::GetAuctionOutBid() const
{
    uint32 outbid = (bid / 100) * 5;
    if (!outbid)
        outbid = 1;
    return outbid;
}

void AuctionEntry::DeleteFromDB() const
{
    //No SQL injection (Id is integer)
    CharacterDatabase.PExecute("DELETE FROM auction WHERE id = '%u'", Id);
}

void AuctionEntry::SaveToDB() const
{
    //No SQL injection (no strings)
    CharacterDatabase.PExecute("INSERT INTO auction (id,houseid,itemguid,item_template,itemowner,buyoutprice,time,buyguid,lastbid,startbid,deposit) "
                               "VALUES ('%u', '%u', '%u', '%u', '%u', '%u', '" UI64FMTD "', '%u', '%u', '%u', '%u')",
                               Id, auctionHouseEntry->houseId, itemGuidLow, itemTemplate, owner, buyout, (uint64)expireTime, bidder, bid, startbid, deposit);
}

bool AuctionEntry::IsAvailableFor(Player* player)
{
    if (!lockedIpAddress.empty())
        return lockedIpAddress == player->GetSession()->GetRemoteAddress();

    return true;
}
