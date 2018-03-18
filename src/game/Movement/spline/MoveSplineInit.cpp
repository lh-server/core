/*
 * Copyright (C) 2005-2013 MaNGOS <http://getmangos.com/>
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

#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "packet_builder.h"
#include "Unit.h"
#include "Transport.h"
#include "ObjectAccessor.h"

namespace Movement
{
UnitMoveType SelectSpeedType(uint32 moveFlags)
{
    if (moveFlags & MOVEFLAG_SWIMMING)
    {
        if (moveFlags & MOVEFLAG_BACKWARD /*&& speed_obj.swim >= speed_obj.swim_back*/)
            return MOVE_SWIM_BACK;
        else
            return MOVE_SWIM;
    }
    else if (moveFlags & MOVEFLAG_WALK_MODE)
    {
        // if ( speed_obj.run > speed_obj.walk )
        return MOVE_WALK;
    }
    else if (moveFlags & MOVEFLAG_BACKWARD /*&& speed_obj.run >= speed_obj.run_back*/)
        return MOVE_RUN_BACK;

    return MOVE_RUN;
}


void MoveSplineInit::Move(PathFinder const* pfinder)
{
    MovebyPath(pfinder->getPath());
    if (pfinder->GetTransport())
        SetTransport(pfinder->GetTransport()->GetGUIDLow());
    if (pfinder->getPathType() & PATHFIND_FLYPATH)
        SetFly();
}

int32 MoveSplineInit::Launch()
{
    float realSpeedRun = 0.0f;
    MoveSpline& move_spline = *unit.movespline;

    Transport* newTransport = NULL;
    if (args.transportGuid)
        newTransport = HashMapHolder<Transport>::Find(ObjectGuid(HIGHGUID_MO_TRANSPORT, args.transportGuid));
    Vector3 real_position(unit.GetPositionX(), unit.GetPositionY(), unit.GetPositionZ());
    // there is a big chance that current position is unknown if current state is not finalized, need compute it
    // this also allows calculate spline position and update map position in much greater intervals
    if (!move_spline.Finalized())
    {
        real_position = move_spline.ComputePosition();
        Transport* oldTransport = NULL;
        if (move_spline.GetTransportGuid())
            oldTransport = HashMapHolder<Transport>::Find(ObjectGuid(HIGHGUID_MO_TRANSPORT, move_spline.GetTransportGuid()));
        if (oldTransport)
            oldTransport->CalculatePassengerPosition(real_position.x, real_position.y, real_position.z);
    }
    if (newTransport)
        newTransport->CalculatePassengerOffset(real_position.x, real_position.y, real_position.z);

    if (args.path.empty())
    {
        // should i do the things that user should do?
        MoveTo(real_position);
    }

    // corrent first vertex
    args.path[0] = real_position;
    uint32 moveFlags = unit.m_movementInfo.GetMovementFlags();
    uint32 oldMoveFlags = moveFlags;
    if (args.flags.done)
    {
        args.flags = MoveSplineFlag::Done;
        moveFlags &= ~(MOVEFLAG_SPLINE_ENABLED | MOVEFLAG_MASK_MOVING);
    }
    else
    {
        moveFlags |= (MOVEFLAG_SPLINE_ENABLED | MOVEFLAG_FORWARD);

        if (args.flags.runmode)
            moveFlags &= ~MOVEFLAG_WALK_MODE;
        else
            moveFlags |= MOVEFLAG_WALK_MODE;
    }

    if (newTransport)
        moveFlags |= MOVEFLAG_ONTRANSPORT;
    else
        moveFlags &= ~MOVEFLAG_ONTRANSPORT;

    if (args.velocity == 0.f)
        realSpeedRun = args.velocity = unit.GetSpeed(SelectSpeedType(moveFlags));
    else
        realSpeedRun = unit.GetSpeed(MOVE_RUN);

    if (!args.Validate(&unit))
        return 0;

    unit.m_movementInfo.SetMovementFlags((MovementFlags)moveFlags);
    move_spline.SetMovementOrigin(movementType);
    move_spline.Initialize(args);
    
    WorldPacket data(SMSG_MONSTER_MOVE, 64);
    data << unit.GetPackGUID();

    if (newTransport)
    {
        data.SetOpcode(SMSG_MONSTER_MOVE_TRANSPORT);
        data << newTransport->GetPackGUID();
    }

    if (unit.GetTransport() && unit.GetTransport() != newTransport)
        unit.GetTransport()->RemovePassenger(&unit);
    if (newTransport && unit.GetTransport() != newTransport)
        newTransport->AddPassenger(&unit);

    // Stop packet
    if (args.flags.done)
    {
        data << real_position.x << real_position.y << real_position.z;
        data << move_spline.GetId();
        data << uint8(1); // MonsterMoveStop=1
    }
    else
        move_spline.setLastPointSent(PacketBuilder::WriteMonsterMove(move_spline, data));
    // Compress data or not ?
    bool compress = false;
    if (!args.flags.done && args.velocity > 4 * realSpeedRun)
        compress = true;
    else if ((data.wpos() + 2) > 0x10)
        compress = true;
    else if (oldMoveFlags & MOVEFLAG_ROOT)
        compress = true;
    // Since packet size is stored with an uint8, packet size is limited for compressed packets
    if ((data.wpos() + 2) > 0xFF)
        compress = false;

    MovementData mvtData(compress ? NULL : &unit);
    // Nostalrius: client has a hardcoded limit to spline movement speed : 4*runSpeed.
    // We need to fix this, in case of charges for example (if character has movement slowing effects)
    if (args.velocity > 4 * realSpeedRun && !args.flags.done) // From client
        mvtData.SetUnitSpeed(SMSG_SPLINE_SET_RUN_SPEED, unit.GetObjectGuid(), args.velocity);
    if (oldMoveFlags & MOVEFLAG_ROOT)
        mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_UNROOT, unit.GetObjectGuid());
    if (oldMoveFlags & MOVEFLAG_WALK_MODE && !(moveFlags & MOVEFLAG_WALK_MODE)) // Switch to run mode
        mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_SET_RUN_MODE, unit.GetObjectGuid());
    if (moveFlags & MOVEFLAG_WALK_MODE && !(oldMoveFlags & MOVEFLAG_WALK_MODE)) // Switch to walk mode
        mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_SET_WALK_MODE, unit.GetObjectGuid());

    // Clear client root here, after we've added it to the packet - STATE SHOULD NOT BE USED
    unit.clearUnitState(UNIT_STAT_CLIENT_ROOT);
        
    mvtData.AddPacket(data);
    // Do not forget to restore velocity after movement !
    if (args.velocity > 4 * realSpeedRun && !args.flags.done)
        mvtData.SetUnitSpeed(SMSG_SPLINE_SET_RUN_SPEED, unit.GetObjectGuid(), realSpeedRun);
    // Restore correct walk mode for players
    // Won't be able to properly restore in case of 2 consecutive splines
    // Whatever it was before or during the spline, the client will continue in run mode, this could suffice
    /*if (unit.GetTypeId() == TYPEID_PLAYER && (moveFlags & MOVEFLAG_WALK_MODE) != (oldMoveFlags & MOVEFLAG_WALK_MODE))
        mvtData.SetSplineOpcode(oldMoveFlags & MOVEFLAG_WALK_MODE ? SMSG_SPLINE_MOVE_SET_WALK_MODE : SMSG_SPLINE_MOVE_SET_RUN_MODE, unit.GetObjectGuid());*/
    if (compress)
    {
        WorldPacket data2;
        if (mvtData.BuildPacket(data2)) {
            unit.SendMovementMessageToSet(std::move(data2), true);
        }
        else {
            sLog.outError("[MoveSplineInit] Unable to compress move packet, move spline not sent");
        }
    }
    return move_spline.Duration();
}

MoveSplineInit::MoveSplineInit(Unit& m, const char* mvtType) : unit(m), movementType(mvtType)
{
    // mix existing state into new
    args.flags.runmode = !unit.m_movementInfo.HasMovementFlag(MOVEFLAG_WALK_MODE);
    args.flags.flying = unit.m_movementInfo.HasMovementFlag((MovementFlags)(MOVEFLAG_FLYING | MOVEFLAG_LEVITATING));
}

void MoveSplineInit::SetFacingGUID(uint64 guid)
{
    args.flags.EnableFacingTarget();
    args.facing.target = guid;
}

void MoveSplineInit::SetFacing(float angle)
{
    args.facing.angle = G3D::wrap(angle, 0.f, (float)G3D::twoPi());
    args.flags.EnableFacingAngle();
}
}
