/*
* Copyright (C) 2017-2018 Light's Hope <https://lightshope.org>
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

#include "PetEventAI.h"
#include "Pet.h"
#include "CreatureEventAI.h"

PetEventAI::PetEventAI(Creature* pCreature) : CreatureEventAI(pCreature)
{}

int PetEventAI::Permissible(const Creature *creature)
{
    if ((creature->GetAIName() == "PetEventAI") || (creature->IsPet() && (creature->GetAIName() == "EventAI")))
        return PERMIT_BASE_SPECIAL;

    return PERMIT_BASE_NO;
}

void PetEventAI::MoveInLineOfSight(Unit *pWho)
{
    if (!pWho)
        return;

    if (m_creature->getVictim())
        return;

    //Check for OOC LOS Event
    if (!m_bEmptyList)
        UpdateEventsOn_MoveInLineOfSight(pWho);

    if (m_creature->GetCharmInfo() && !m_creature->GetCharmInfo()->HasReactState(REACT_AGGRESSIVE))
        return;

    if (m_creature->GetDistanceZ(pWho) > CREATURE_Z_ATTACK_RANGE)
        return;

    if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack())
    {
        float attackRadius = m_creature->GetAttackDistance(pWho);
        if (m_creature->IsWithinDistInMap(pWho, attackRadius) && m_creature->IsHostileTo(pWho))
        {
            if (m_creature->IsWithinLOSInMap(pWho) && pWho->isInAccessablePlaceFor(m_creature))
                AttackStart(pWho);
        }
    }
}

void PetEventAI::AttackStart(Unit* pWho)
{
    if (!pWho)
        return;

    if (m_creature->IsPet() && !static_cast<Pet*>(m_creature)->IsEnabled())
        return;

    if (pWho == m_creature->GetCharmerOrOwner())
        return;

    if (m_creature->HasReactState(REACT_PASSIVE) && m_creature->GetCharmInfo() && !m_creature->GetCharmInfo()->IsCommandAttack())
        return;

    if (pWho->HasBreakableByDamageCrowdControlAura() && m_creature->GetCharmerOrOwner() && m_creature->GetCharmerOrOwner()->isAlive())
        return;

    if (m_creature->Attack(pWho, m_MeleeEnabled))
    {
        // Play sound to let the player know the pet is attacking something it picked on its own
        if (m_creature->HasReactState(REACT_AGGRESSIVE) && !m_creature->GetCharmInfo()->IsCommandAttack())
            m_creature->SendPetAIReaction();

        m_creature->AddThreat(pWho);
        m_creature->SetInCombatWith(pWho);
        pWho->SetInCombatWith(m_creature);

        // Flag owner for PvP if owner is player and target is flagged
        Unit* owner = m_creature->GetCharmerOrOwner();
        if (owner && owner->IsPlayer() && !owner->IsPvP())
        {
            Player* pOwner = owner->ToPlayer();
            if ((pWho->IsPlayer() && pWho->IsPvP() && !pOwner->IsInDuelWith(static_cast<Player*>(pWho))) || // PvP flagged players
                (pWho->IsCreature() && pWho->IsPvP()))                                           // PvP flagged creatures
            {
                pOwner->UpdatePvP(true);
                pOwner->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
            }
        }

        if (m_CombatMovementEnabled)
            m_creature->GetMotionMaster()->MoveChase(pWho);
    } 
}

void PetEventAI::AttackedBy(Unit* pAttacker)
{
    if (!m_creature->getVictim())
        AttackStart(pAttacker);

    if (Creature* pOwner = ToCreature(m_creature->GetCharmerOrOwner()))
    {
        pOwner->AddThreat(pAttacker);
        pOwner->SetInCombatWith(pAttacker);
    }
}

bool PetEventAI::FindTargetForAttack()
{
    Unit* pOwner = m_creature->GetCharmerOrOwner();

    if (!pOwner)
        return false;

    if (Unit * const pTarget = pOwner->getAttackerForHelper())
    {
        // Prevent pets from breaking CC effects
        if (!pTarget->HasBreakableByDamageCrowdControlAura())
        {
            AttackStart(pTarget);
            return true;
        } 
        else
        {
            // Main target is CC-ed, so pick another attacker.
            Unit::AttackerSet attackers = pOwner->getAttackers();
            for (Unit::AttackerSet::const_iterator itr = attackers.begin(); itr != attackers.end(); ++itr)
            {
                if ((*itr)->IsInMap(m_creature) && (*itr)->isTargetableForAttack() && !(*itr)->HasBreakableByDamageCrowdControlAura())
                {
                    AttackStart((*itr));
                    return true;
                }
            }
        }
    }
    return false;
}

void PetEventAI::UpdateAI(const uint32 uiDiff)
{
    bool Combat = m_creature->getVictim();

    //Must return if creature isn't alive. Normally select hostile target and get victim prevent this
    if (!m_creature->isAlive())
        return;

    Unit* pOwner = m_creature->GetCharmerOrOwner();
    bool hasAliveOwner = pOwner && pOwner->isAlive() && m_creature->GetCharmInfo();

    if (!Combat && hasAliveOwner && pOwner->isInCombat())
    {
        if (FindTargetForAttack())
            Combat = m_creature->getVictim();
    }

    if (!m_bEmptyList)
        UpdateEventsOn_UpdateAI(uiDiff, Combat);

    if (Combat)
    {
        if (!m_CreatureSpells.empty())
            DoSpellTemplateCasts(uiDiff);

        DoMeleeAttackIfReady();
    }
    else
    {
        if (m_creature->isInCombat())
            m_creature->OnLeaveCombat();

        if (hasAliveOwner && m_creature->GetCharmInfo()->HasCommandState(COMMAND_FOLLOW) && !m_creature->hasUnitState(UNIT_STAT_FOLLOW))
            m_creature->GetMotionMaster()->MoveFollow(m_creature->GetCharmerOrOwner(), PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
    }
}

void PetEventAI::OwnerAttackedBy(Unit* attacker)
{
    // Called when owner takes damage. This function helps keep pets from running off
    //  simply due to owner gaining aggro.
    if (!attacker)
        return;

    // Prevent pet from disengaging from current target
    if (m_creature->getVictim() && m_creature->getVictim()->isAlive())
        return;

    // If owner attacked by fire, attacker=owner. Don't attack our owner !
    if (!m_creature->IsValidAttackTarget(attacker))
        return;

    // Continue to evaluate and attack if necessary
    AttackStart(attacker);
}

void PetEventAI::OwnerAttacked(Unit* target)
{
    // Called when owner attacks something. Allows defensive pets to know
    //  that they need to assist

    // Target might be NULL if called from spell with invalid cast targets
    if (!target)
        return;

    // Prevent pet from disengaging from current target
    if (m_creature->getVictim() && m_creature->getVictim()->isAlive())
        return;

    if (!m_creature->IsValidAttackTarget(target))
        return;

    // Continue to evaluate and attack if necessary
    AttackStart(target);
}