/* Copyright (C) 2006 - 2011 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Boss_Flamegor
SD%Complete: 90
SDComment: Thrash is missing
SDCategory: Blackwing Lair
EndScriptData */

#include "scriptPCH.h"
#include "blackwing_lair.h"

enum
{
    EMOTE_GENERIC_WING_BUFFET   = -1469032,
    EMOTE_GENERIC_SHADOW_FLAME  = -1469033,
    EMOTE_GENERIC_FRENZY        = -1000002,

    SPELL_SHADOW_FLAME          = 22539,
    SPELL_WING_BUFFET           = 23339,
    SPELL_FRENZY                = 23342,                    // This spell periodically triggers fire nova
    SPELL_THRASH                = 3391,                     // TODO missing
};

struct boss_flamegorAI : public ScriptedAI
{
    boss_flamegorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiShadowFlameTimer;
    uint32 m_uiWingBuffetTimer;
    uint32 m_uiFrenzyTimer;

    void Reset()
    {
        m_uiShadowFlameTimer = 16000;                        // These times are probably wrong
        m_uiWingBuffetTimer = 30000;
        m_uiFrenzyTimer = 10000;
    }

    void Aggro(Unit* /*pWho*/)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FLAMEGOR, IN_PROGRESS);

        m_creature->SetInCombatWithZone();
    }

    void JustDied(Unit* /*pKiller*/)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FLAMEGOR, DONE);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FLAMEGOR, FAIL);
    }

    void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_WING_BUFFET)
        {
            if (!pCaster || pCaster->GetTypeId() != TYPEID_PLAYER)
                return;
            if (m_creature->getThreatManager().getThreat(pCaster))
                m_creature->getThreatManager().modifyThreatPercent(pCaster, -50);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Shadow Flame Timer
        if (m_uiShadowFlameTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SHADOW_FLAME) == CAST_OK)
            {
                DoScriptText(EMOTE_GENERIC_SHADOW_FLAME, m_creature);
                m_uiShadowFlameTimer = 16000;
            }
        }
        else
            m_uiShadowFlameTimer -= uiDiff;

        // Wing Buffet Timer
        if (m_uiWingBuffetTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_WING_BUFFET) == CAST_OK)
            {
                DoScriptText(EMOTE_GENERIC_WING_BUFFET, m_creature);
                m_uiWingBuffetTimer = 30000;
            }
        }
        else
            m_uiWingBuffetTimer -= uiDiff;

        // Frenzy Timer
        if (m_uiFrenzyTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
            {
                DoScriptText(EMOTE_GENERIC_FRENZY, m_creature);
                m_uiFrenzyTimer = 10000;
            }
        }
        else
            m_uiFrenzyTimer -= uiDiff;

        if (m_creature->isAttackReady() && !urand(0, 2))
            DoCastSpellIfCan(m_creature, SPELL_THRASH);

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_flamegor(Creature* pCreature)
{
    return new boss_flamegorAI(pCreature);
}

void AddSC_boss_flamegor()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_flamegor";
    newscript->GetAI = &GetAI_boss_flamegor;
    newscript->RegisterSelf();
}
