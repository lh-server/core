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

#include "MotionMaster.h"
#include "CreatureAISelector.h"
#include "Creature.h"

#include "ConfusedMovementGenerator.h"
#include "FleeingMovementGenerator.h"
#include "FearMovementGenerator.h"
#include "HomeMovementGenerator.h"
#include "IdleMovementGenerator.h"
#include "PointMovementGenerator.h"
#include "TargetedMovementGenerator.h"
#include "WaypointMovementGenerator.h"
#include "RandomMovementGenerator.h"

#include "MoveSpline.h"
#include "MoveSplineInit.h"

#include <cassert>

inline bool isStatic(MovementGenerator *mv)
{
    return (mv == &si_idleMovement);
}

void MotionMaster::Initialize()
{
    // stop current move
    if (!m_owner->IsStopped())
        m_owner->StopMoving();

    // clear ALL movement generators (including default)
    Clear(false, true);

    // set new default movement generator
    if (m_owner->GetTypeId() == TYPEID_UNIT && !m_owner->hasUnitState(UNIT_STAT_CONTROLLED))
    {
        MovementGenerator* movement = FactorySelector::selectMovementGenerator((Creature*)m_owner);
        push(movement == NULL ? &si_idleMovement : movement);
        top()->Initialize(*m_owner);
    }
    else
        push(&si_idleMovement);

    // Pet movement after control movement spell
    if (CharmInfo* ci = m_owner->GetCharmInfo())
    {
        ci->SetIsAtStay(false);
        ci->SetIsReturning(false);
        ci->SetIsFollowing(false);
    }
}

MotionMaster::~MotionMaster()
{
    // just deallocate movement generator, but do not Finalize since it may access to already deallocated owner's memory
    while (!empty())
    {
        MovementGenerator * m = top();
        pop();
        if (!isStatic(m))
            delete m;
    }

    if (m_expList)
    {
        for (size_t i = 0; i < m_expList->size(); ++i)
        {
            MovementGenerator* mg = (*m_expList)[i];
            if (!isStatic(mg))
                delete mg;
        }

        delete m_expList;
    }
}

void MotionMaster::UpdateMotion(uint32 diff)
{
    if (m_owner->hasUnitState(UNIT_STAT_CAN_NOT_MOVE))
        return;

    MANGOS_ASSERT(!empty());
    m_cleanFlag |= MMCF_UPDATE;

    if (!top()->Update(*m_owner, diff))
    {
        m_cleanFlag &= ~MMCF_UPDATE;
        MovementExpired();
    }
    else
        m_cleanFlag &= ~MMCF_UPDATE;

    if (m_expList)
    {
        for (size_t i = 0; i < m_expList->size(); ++i)
        {
            MovementGenerator* mg = (*m_expList)[i];
            if (!isStatic(mg))
                delete mg;
        }

        delete m_expList;
        m_expList = NULL;

        if (empty())
            Initialize();

        if (m_cleanFlag & MMCF_RESET)
        {
            top()->Reset(*m_owner);
            m_cleanFlag &= ~MMCF_RESET;
        }
    }
}

void MotionMaster::UpdateMotionAsync(uint32 diff)
{
    m_needsAsyncUpdate = false;
    if (m_owner->hasUnitState(UNIT_STAT_CAN_NOT_MOVE))
        return;

    MANGOS_ASSERT(!empty());
    m_cleanFlag |= MMCF_UPDATE;

    top()->UpdateAsync(*m_owner, diff);
}

void MotionMaster::DirectClean(bool reset, bool all)
{
    // Nostalrius: We need to clean top mvt gens, and call Finalize once it's done
    // because Finalize calls CreatureAI::MovementInform that can call MovePoint / ...

    typedef std::list<MovementGenerator*> MvtGenList;
    MvtGenList mvtGensToFinalize;
    while (all ? !empty() : size() > 1)
    {
        MovementGenerator *curr = top();
        pop();
        mvtGensToFinalize.push_back(curr);
    }
    if (!all && reset)
    {
        if (empty()) // Should not happen
            Initialize();
        MANGOS_ASSERT(!empty());
        top()->Reset(*m_owner);
    }
    for (MvtGenList::iterator it = mvtGensToFinalize.begin(); it != mvtGensToFinalize.end(); ++it)
    {
        (*it)->Finalize(*m_owner);
        if (!isStatic((*it)))
            delete(*it);
    }
}

void MotionMaster::DelayedClean(bool reset, bool all)
{
    if (reset)
        m_cleanFlag |= MMCF_RESET;
    else
        m_cleanFlag &= ~MMCF_RESET;

    if (empty() || (!all && size() == 1))
        return;

    if (!m_expList)
        m_expList = new ExpireList();

    typedef std::list<MovementGenerator*> MvtGenList;
    MvtGenList mvtGensToFinalize;
    while (all ? !empty() : size() > 1)
    {
        MovementGenerator *curr = top();
        pop();
        mvtGensToFinalize.push_back(curr);
    }
    for (MvtGenList::iterator it = mvtGensToFinalize.begin(); it != mvtGensToFinalize.end(); ++it)
    {
        (*it)->Finalize(*m_owner);

        if (!isStatic((*it)))
            m_expList->push_back((*it));
    }
}

void MotionMaster::DirectExpire(bool reset)
{
    if (empty() || size() == 1)
        return;

    MovementGenerator *curr = top();
    pop();

    // also drop stored under top() targeted motions
    typedef std::list<MovementGenerator*> MvtGenList;
    MvtGenList mvtGensToFinalize;
    while (!empty() && (top()->GetMovementGeneratorType() == CHASE_MOTION_TYPE || top()->GetMovementGeneratorType() == FOLLOW_MOTION_TYPE))
    {
        MovementGenerator *temp = top();
        pop();
        mvtGensToFinalize.push_back(temp);
    }
    for (MvtGenList::iterator it = mvtGensToFinalize.begin(); it != mvtGensToFinalize.end(); ++it)
    {
        (*it)->Finalize(*m_owner);
        delete(*it);
    }
    // Store current top MMGen, as Finalize might push a new MMGen
    MovementGenerator* nowTop = empty() ? NULL : top();
    // it can add another motions instead
    curr->Finalize(*m_owner);

    if (!isStatic(curr))
        delete curr;

    if (empty())
        Initialize();

    // Prevent reseting possible new pushed MMGen
    if (reset && top() == nowTop)
        top()->Reset(*m_owner);
}

void MotionMaster::DelayedExpire(bool reset)
{
    if (reset)
        m_cleanFlag |= MMCF_RESET;
    else
        m_cleanFlag &= ~MMCF_RESET;

    if (empty() || size() == 1)
        return;

    MovementGenerator *curr = top();
    pop();

    if (!m_expList)
        m_expList = new ExpireList();

    // also drop stored under top() targeted motions
    typedef std::list<MovementGenerator*> MvtGenList;
    MvtGenList mvtGensToFinalize;
    while (!empty() && (top()->GetMovementGeneratorType() == CHASE_MOTION_TYPE || top()->GetMovementGeneratorType() == FOLLOW_MOTION_TYPE))
    {
        MovementGenerator *temp = top();
        pop();
        mvtGensToFinalize.push_back(temp);
    }
    for (MvtGenList::iterator it = mvtGensToFinalize.begin(); it != mvtGensToFinalize.end(); ++it)
    {
        (*it)->Finalize(*m_owner);
        m_expList->push_back(*it);
    }

    curr->Finalize(*m_owner);

    if (!isStatic(curr))
        m_expList->push_back(curr);
}

void MotionMaster::MoveIdle()
{
    if (empty() || !isStatic(top()))
        push(&si_idleMovement);
}

void MotionMaster::MoveRandom()
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        sLog.outError("%s attempt to move random.", m_owner->GetGuidStr().c_str());
    else
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s move random.", m_owner->GetGuidStr().c_str());
        Mutate(new RandomMovementGenerator<Creature>(*m_owner));
    }
}

void MotionMaster::MoveTargetedHome()
{
    if (m_owner->hasUnitState(UNIT_STAT_LOST_CONTROL))
        return;

    Clear(false);

    if (m_owner->GetTypeId() == TYPEID_UNIT && !((Creature*)m_owner)->GetCharmerOrOwnerGuid())
    {
        // Manual exception for linked mobs
        if (m_owner->IsLinkingEventTrigger() && m_owner->GetMap()->GetCreatureLinkingHolder()->TryFollowMaster((Creature*)m_owner))
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s refollowed linked master", m_owner->GetGuidStr().c_str());
        else
        {
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s targeted home", m_owner->GetGuidStr().c_str());
            Mutate(new HomeMovementGenerator<Creature>());
        }
    }
    else if (m_owner->GetTypeId() == TYPEID_UNIT && ((Creature*)m_owner)->GetCharmerOrOwnerGuid())
    {
        if (Unit *target = ((Creature*)m_owner)->GetCharmerOrOwner())
        {
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s follow to %s", m_owner->GetGuidStr().c_str(), target->GetGuidStr().c_str());
            Mutate(new FollowMovementGenerator<Creature>(*target, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE));
        }
        else
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s attempt but fail to follow owner", m_owner->GetGuidStr().c_str());
    }
    else
        sLog.outError("%s attempt targeted home", m_owner->GetGuidStr().c_str());
}

void MotionMaster::MoveConfused()
{
    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s move confused", m_owner->GetGuidStr().c_str());

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new ConfusedMovementGenerator<Player>());
    else
        Mutate(new ConfusedMovementGenerator<Creature>());
}

void MotionMaster::MoveChase(Unit* target, float dist, float angle)
{
    // ignore movement request if target not exist
    if (!target)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s chase to %s", m_owner->GetGuidStr().c_str(), target->GetGuidStr().c_str());

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new ChaseMovementGenerator<Player>(*target, dist, angle));
    else
        Mutate(new ChaseMovementGenerator<Creature>(*target, dist, angle));
}

void MotionMaster::MoveFollow(Unit* target, float dist, float angle)
{
    if (m_owner->hasUnitState(UNIT_STAT_LOST_CONTROL))
        return;

    Clear();

    // ignore movement request if target not exist
    if (!target)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s follow to %s", m_owner->GetGuidStr().c_str(), target->GetGuidStr().c_str());

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new FollowMovementGenerator<Player>(*target, dist, angle));
    else
        Mutate(new FollowMovementGenerator<Creature>(*target, dist, angle));
}

void MotionMaster::MovePoint(uint32 id, float x, float y, float z, uint32 options, float speed, float finalOrientation)
{
    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s targeted point (Id: %u X: %f Y: %f Z: %f)", m_owner->GetGuidStr().c_str(), id, x, y, z);

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new PointMovementGenerator<Player>(id, x, y, z, options, speed, finalOrientation));
    else
        Mutate(new PointMovementGenerator<Creature>(id, x, y, z, options, speed, finalOrientation));
}

void MotionMaster::MoveSeekAssistance(float x, float y, float z)
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        sLog.outError("%s attempt to seek assistance", m_owner->GetGuidStr().c_str());
    else
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s seek assistance (X: %f Y: %f Z: %f)",
                         m_owner->GetGuidStr().c_str(), x, y, z);
        Mutate(new AssistanceMovementGenerator(x, y, z));
    }
}

void MotionMaster::MoveSeekAssistanceDistract(uint32 time)
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        sLog.outError("%s attempt to call distract after assistance", m_owner->GetGuidStr().c_str());
    else
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s is distracted after assistance call (Time: %u)",
                         m_owner->GetGuidStr().c_str(), time);
        Mutate(new AssistanceDistractMovementGenerator(time));
    }
}

void MotionMaster::MoveFleeing(Unit* enemy, uint32 time)
{
    if (!enemy)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s flee from %s", m_owner->GetGuidStr().c_str(), enemy->GetGuidStr().c_str());

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new FleeingMovementGenerator<Player>(enemy->GetObjectGuid()));
    else
    {
        if (time)
            Mutate(new TimedFleeingMovementGenerator(enemy->GetObjectGuid(), time));
        else
            Mutate(new FleeingMovementGenerator<Creature>(enemy->GetObjectGuid()));
    }
}

void MotionMaster::MoveFeared(Unit* enemy, uint32 time)
{
    if (!enemy)
        return;

    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new FearMovementGenerator<Player>(enemy->GetObjectGuid()));
    else
    {
        if (time)
            Mutate(new TimedFearMovementGenerator(enemy->GetObjectGuid(), time));
        else
            Mutate(new FearMovementGenerator<Creature>(enemy->GetObjectGuid()));
    }
}

void MotionMaster::MoveWaypoint(bool repeat)
{
    if (m_owner->GetTypeId() == TYPEID_UNIT)
    {
        if (GetCurrentMovementGeneratorType() == WAYPOINT_MOTION_TYPE)
        {
            sLog.outError("Creature %s (Entry %u) attempt to MoveWaypoint() but creature is already using waypoint", m_owner->GetGuidStr().c_str(), m_owner->GetEntry());
            return;
        }

        Creature* creature = (Creature*)m_owner;

        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Creature %s (Entry %u) start MoveWaypoint()", m_owner->GetGuidStr().c_str(), m_owner->GetEntry());
        Mutate(new WaypointMovementGenerator<Creature>(*creature, repeat));
    }
    else
        sLog.outError("Non-creature %s attempt to MoveWaypoint()", m_owner->GetGuidStr().c_str());
}

void MotionMaster::MoveTaxiFlight(uint32 path, uint32 pathnode)
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
    {
        if (path < sTaxiPathNodesByPath.size())
        {
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s taxi to (Path %u node %u)", m_owner->GetGuidStr().c_str(), path, pathnode);
            FlightPathMovementGenerator* mgen = new FlightPathMovementGenerator(sTaxiPathNodesByPath[path], pathnode);
            Mutate(mgen);
        }
        else
        {
            sLog.outError("%s attempt taxi to (nonexistent Path %u node %u)",
                          m_owner->GetGuidStr().c_str(), path, pathnode);
        }
    }
    else
    {
        sLog.outError("%s attempt taxi to (Path %u node %u)",
                      m_owner->GetGuidStr().c_str(), path, pathnode);
    }
}

void MotionMaster::MoveTaxiFlight()
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
    {
        TaxiPathNodeList const& path = m_owner->ToPlayer()->m_taxi.GetTaxiPath();
        if (path.size())
        {
            uint32 foundPath = 0;
            std::stringstream debugString;
            debugString << m_owner->GetGuidStr().c_str() << " multiple taxi to ";
            for (uint32 nodeIndex = 0; nodeIndex < path.size(); ++nodeIndex)
            {
                if (path[nodeIndex].path != foundPath)
                {
                    foundPath = path[nodeIndex].path;
                    if (foundPath < sTaxiPathNodesByPath.size())
                        debugString << "(Path " << foundPath << ")";
                    else
                    {
                        sLog.outError("%s attempt taxi to (nonexistent Path %u)",
                            m_owner->GetGuidStr().c_str(), foundPath);
                        return;
                    }
                }
            }
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, debugString.str().c_str());
            FlightPathMovementGenerator* mgen = new FlightPathMovementGenerator(path);
            Mutate(mgen);
        }
        else
        {
            sLog.outError("%s attempt taxi on an empty path", m_owner->GetGuidStr().c_str());
        }
    }
    else
    {
        sLog.outError("%s attempt taxi multi path", m_owner->GetGuidStr().c_str());
    }
}

void MotionMaster::MoveDistract(uint32 timer)
{
    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "%s distracted (timer: %u)", m_owner->GetGuidStr().c_str(), timer);
    DistractMovementGenerator* mgen = new DistractMovementGenerator(timer);
    Mutate(mgen);
}

void MotionMaster::Mutate(MovementGenerator *m)
{
    if (!empty())
    {
        switch (top()->GetMovementGeneratorType())
        {
            // HomeMovement is not that important, delete it if meanwhile a new comes
            case HOME_MOTION_TYPE:
            // DistractMovement interrupted by any other movement
            case DISTRACT_MOTION_TYPE:
                MovementExpired(false);
            default:
                break;
        }

        if (!empty())
            top()->Interrupt(*m_owner);
    }

    m->Initialize(*m_owner);
    push(m);
}

void MotionMaster::propagateSpeedChange()
{
    Impl::container_type::iterator it = Impl::c.begin();
    for (; it != end(); ++it)
        (*it)->unitSpeedChanged();
}

uint32 MotionMaster::getLastReachedWaypoint() const
{
    for (Impl::container_type::const_reverse_iterator rItr = Impl::c.rbegin(); rItr != Impl::c.rend(); ++rItr)
        if ((*rItr)->GetMovementGeneratorType() == WAYPOINT_MOTION_TYPE)
            return (static_cast<WaypointMovementGenerator<Creature>*>(*rItr))->getLastReachedWaypoint();
    return 0;
}

MovementGeneratorType MotionMaster::GetCurrentMovementGeneratorType() const
{
    if (empty())
        return IDLE_MOTION_TYPE;

    return top()->GetMovementGeneratorType();
}

bool MotionMaster::GetDestination(float &x, float &y, float &z)
{
    // Often used in motion gen, lock target movespline while checking in case
    // they are async updating their spline too. Don't blocking lock, otherwise
    // we deadlock if the owner is already locked and checking the user of
    // this function at the same time (interlocked deadlock). This is not a critical
    // function that MUST succeed, so better to fail if we cannot acquire the
    // lock. Example deadlock (same timestamp):
    //  2017-09-16 02:06:32 Targeted UpdateAsync::Acquiring movespline lock for Unit Pet (Petnumber: 87 Guid: 21) in map (0, 6) thread 3156
    //  2017-09-16 02:06:32 MotionMaster::Acquiring movespline lock for Unit Pet (Petnumber: 93 Guid: 22) in map (0, 6) thread 3156
    //  ...
    //  2017-09-16 02:06:32 Targeted UpdateAsync::Acquiring movespline lock for Unit Pet (Petnumber: 93 Guid: 22) in map (0, 6) thread 11156
    //  2017-09-16 02:06:32 MotionMaster::Acquiring movespline lock for Unit Pet (Petnumber: 87 Guid :21) in map (0, 6) thread 11156

    ACE_Guard<ACE_Thread_Mutex> guard(m_owner->asyncMovesplineLock, false);
    if (!guard.locked())
        return false;

    if (m_owner->movespline->Finalized())
        return false;

    const G3D::Vector3& dest = m_owner->movespline->FinalDestination();
    x = dest.x;
    y = dest.y;
    z = dest.z;
    return true;
}

void MotionMaster::UpdateFinalDistanceToTarget(float fDistance)
{
    if (!empty())
        top()->UpdateFinalDistance(fDistance);
}

void MotionMaster::MoveJump(float x, float y, float z, float horizontalSpeed, float max_height, uint32 id)
{
    // MOVE JUMP DOESN'T EXIST IN 1.12
    /*Movement::MoveSplineInit init(*m_owner);
    init.MoveTo(x,y,z);
    init.SetParabolic(max_height, 0, true);
    init.SetVelocity(horizontalSpeed);
    // TODO: Effet moche. Ameliorer !
    init.SetFall();
    init.Launch();
    Mutate(new EffectMovementGenerator(id));*/
}

void MotionMaster::MoveCharge(Unit* target, uint32 delay, bool triggerAutoAttack)
{
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
        Mutate(new ChargeMovementGenerator<Player>(*(m_owner->ToPlayer()), *target, delay, triggerAutoAttack));
    else
        Mutate(new ChargeMovementGenerator<Creature>(*(m_owner->ToCreature()), *target, delay, triggerAutoAttack));
}

void MotionMaster::ClearType(MovementGeneratorType moveType)
{
    for (iterator it = begin(); it != end();)
    {
        if ((*it)->GetMovementGeneratorType() == moveType)
        {
            (*it)->Finalize(*m_owner);
            erase(it);
            it = begin();
        }
        else
            ++it;
    }
}
