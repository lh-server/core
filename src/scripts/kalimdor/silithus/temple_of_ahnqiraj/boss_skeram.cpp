/* ScriptData
SDName: Boss_Skeram
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

#define SAY_AGGRO_1                 -1531000
#define SAY_AGGRO_2                 -1531001
#define SAY_AGGRO_3                 -1531002
#define SAY_SLAY_1                  -1531003
#define SAY_SLAY_2                  -1531004
#define SAY_SLAY_3                  -1531005
#define SAY_SPLIT                   -1531006
#define SAY_DEATH                   -1531007

#define SPELL_ARCANE_EXPLOSION      26192
#define SPELL_EARTH_SHOCK           26194

#define SPELL_TRUE_FULFILLMENT      785
#define FULFILLMENT_RANGE           90.0f
#define SPELL_TF_HASTE              2313
#define SPELL_TF_MOD_HEAL           26525
#define SPELL_TF_IMMUNITY           26526
#define SPELL_TF_CANCEL             26589

#define SPELL_BLINK_0               4801
#define SPELL_BLINK_1               8195
#define SPELL_BLINK_2               20449

#define SPELL_SUMMON_IMAGES         747

/**
* Source videos for Skeram behaviour:
* https://www.youtube.com/watch?v=K-A9l8bL_Fw
* https://www.youtube.com/watch?v=q9XHXbFEniw
* https://www.youtube.com/watch?v=xh5wbv3yRH4
* https://www.youtube.com/watch?v=YpQwYIr1wFY
*
* Skeram's maximum health is 556509
* Skeram's illusions gain health each subsequent split
* Skeram mind controls the CLOSEST target, including tanks
* Skeram only casts Arcane Explosion if more than 4 targets are in melee range of him
* Earthshock is spammed on his current target if they are not in melee range
* Earthshock has a slight delay after teleports and splits before it is casted
* *** There is possibly a mechanic where Skeram is pacified for ~500ms after teleporting,
* however in the above videos he is seen to sometimes move immediately, and sometimes
* remain stationary ***
*
* ILLUSION HEALTH:
* https://www.youtube.com/watch?v=0-8zXfKmPvY (From 4.x when exact HP values were networked)
* This video puts the image percentages around 7.27%, 9.87% and 11.6% (or 7.5, 10 and 12.5)
* Estimating health from Vanilla based on % changes and spell damage, we can
* get values approximately 5% higher. eg. a Frostbolt damage of 700 reduces
* slightly less than 1% in the 2nd split, indicating it has slightly more than
* 70k health.
* From this, we can estimate that the illusions have 12.5%, 15% and 17.5% per split
*/
struct boss_skeramAI : public ScriptedAI
{
    boss_skeramAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        IsImage = false;
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ArcaneExplosion_Timer;
    uint32 EarthShock_Timer;
    uint32 FullFillment_Timer;
    uint32 Blink_Timer;

    float NextSplitPercent;

    Creature *ImageA, *ImageB;
    ObjectGuid ControlledPlayerGUID;

    bool IsImage;

    void Reset()
    {
        ArcaneExplosion_Timer = urand(6000, 8000);
        EarthShock_Timer = 1000;
        FullFillment_Timer = urand(10000, 15000);
        Blink_Timer = urand(15000, 20000);

        NextSplitPercent = 75.0f;

        m_creature->SetVisibility(VISIBILITY_ON);

        ImageA = nullptr;
        ImageA = nullptr;
        ControlledPlayerGUID.Clear();

        // The raised ledges around Skeram's platforms are a pathing nightmare, there is no
        // reasonable way to get onto them with our current implementation (imo Blizzard had
        // an mmap system that let them add invisible ramps for creatures). However, we can
        // obtain partial paths next to it. Normally, these are ignored, but we can set a
        // flag to allow them. They may put us out of LoS so allow autos through them too.
        m_creature->addUnitState(UNIT_STAT_ALLOW_INCOMPLETE_PATH | UNIT_STAT_ALLOW_LOS_ATTACK);
        m_creature->SetMeleeZReach(74.0f);
    }

    void CancelFulfillment()
    {
        if (Player* FulfilledPlayer = m_creature->GetMap()->GetPlayer(ControlledPlayerGUID))
        {
            FulfilledPlayer->RemoveAurasDueToSpellByCancel(SPELL_TRUE_FULFILLMENT);
            FulfilledPlayer->RemoveAurasDueToSpellByCancel(SPELL_TF_HASTE);
            FulfilledPlayer->RemoveAurasDueToSpellByCancel(SPELL_TF_MOD_HEAL);
            FulfilledPlayer->RemoveAurasDueToSpellByCancel(SPELL_TF_IMMUNITY);
        }
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // The bug trio have a larger than normal aggro radius
        if (pWho->GetTypeId() == TYPEID_PLAYER && !m_creature->isInCombat() && m_creature->IsWithinDistInMap(pWho, 28.0f, true) && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH))
        {
            AttackStart(pWho);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void KilledUnit(Unit* victim)
    {
        switch (urand(0,8))
        {
            case 0: DoScriptText(SAY_SLAY_1, m_creature); break;
            case 1: DoScriptText(SAY_SLAY_2, m_creature); break;
            case 2: DoScriptText(SAY_SLAY_3, m_creature); break;
        }
    }

    void JustDied(Unit* Killer)
    {
        if (IsImage)
        {
            CancelFulfillment();
            m_creature->ForcedDespawn();
            return;
        }
        // Leave up to 20s of instant casts as reward for vaniquishing the True Prophet
        DoScriptText(SAY_DEATH, m_creature);
        m_creature->SetRespawnDelay(7 * DAY);

        if (Player* player = Killer->GetCharmerOrOwnerPlayerOrPlayerItself())
            m_creature->GetMap()->BindToInstanceOrRaid(player, m_creature->GetRespawnTimeEx(), true);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, DONE);
    }

    void Aggro(Unit *who)
    {
        if (IsImage)
            return;

        if (m_pInstance && m_pInstance->GetData(TYPE_SKERAM) == IN_PROGRESS)
            return;

        switch (urand(0,2))
        {
            case 0: DoScriptText(SAY_AGGRO_1, m_creature); break;
            case 1: DoScriptText(SAY_AGGRO_2, m_creature); break;
            case 2: DoScriptText(SAY_AGGRO_3, m_creature); break;
        }

        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, IN_PROGRESS);
    }

    void JustReachedHome()
    {
        CancelFulfillment();

        if (IsImage)
            m_creature->DoKillUnit();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, FAIL);
    }

    void UpdateAI(const uint32 diff)
    {
        // Despawn Images instantly if the True Prophet died
        if (IsImage && m_pInstance && m_pInstance->GetData(TYPE_SKERAM) == DONE)
            m_creature->DoKillUnit();

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (ArcaneExplosion_Timer < diff)
        {
            // Only cast arcane explosion if there are more than 4 units within melee reach
            std::list<Player*> players;
            GetPlayersWithinRange(players, m_creature->GetMeleeReach());

            if (players.size() > 4)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ARCANE_EXPLOSION) == CAST_OK)
                    ArcaneExplosion_Timer = urand(6000, 14000);
            }
        }
        else ArcaneExplosion_Timer -= diff;

        //If we are within range, melee the target
        if (m_creature->IsWithinMeleeRange(m_creature->getVictim()))
            DoMeleeAttackIfReady();
        else
        // Target not in melee range. Spam Earthshock
        {
            if (EarthShock_Timer < diff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_EARTH_SHOCK) == CAST_OK)
                    EarthShock_Timer = 1000;
            }
            else
                EarthShock_Timer -= diff;
        }

        if (FullFillment_Timer < diff)
        {
            // Get closest target
            if (Player* target = GetNearestHostilePlayer(40.0f))
            {
                if (DoCastSpellIfCan(target, SPELL_TRUE_FULFILLMENT, CF_AURA_NOT_PRESENT) == CAST_OK)
                {
                    // Cancel buffs on previous victim
                    CancelFulfillment();

                    m_creature->CastSpell(target, SPELL_TF_HASTE, true);
                    m_creature->CastSpell(target, SPELL_TF_MOD_HEAL, true);
                    m_creature->CastSpell(target, SPELL_TF_IMMUNITY, true);

                    FullFillment_Timer = urand(20500, 25000);
                    ControlledPlayerGUID = target->GetObjectGuid();
                }
            }
        }
        else FullFillment_Timer -= diff;

        if (Blink_Timer < diff)
        {
            CastBlink(m_creature);
            Blink_Timer = urand(10000, 18000);
        }
        else
            Blink_Timer -= diff;

        // Summon 2 Images and teleport for every 25% hp lost
        if (!IsImage && m_creature->GetHealthPercent() < NextSplitPercent)
            if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_IMAGES) == CAST_OK)
            {
                if (NextSplitPercent < 26.0f)
                    DoScriptText(SAY_SPLIT, m_creature);

                NextSplitPercent -= 25.0f;
            }

    }

    void JustSummoned(Creature* skeramImage)
    {
        if (m_creature->GetEntry() != skeramImage->GetEntry())
            return;

        if (boss_skeramAI* imageAI = dynamic_cast<boss_skeramAI*>(skeramImage->AI()))
            imageAI->IsImage = true;

        float skeramPercent = m_creature->GetHealthPercent()/100.0f;

        // Set health to look like the True Prophet. Will have 12.5%, 15% and 17.5% of max Skeram HP.
        float percent = 0.2 * (1 - skeramPercent) + 0.1 * skeramPercent;
        float maxHealth = m_creature->GetMaxHealth() * percent / skeramPercent;

        skeramImage->SetMaxHealth(maxHealth);
        skeramImage->SetHealthPercent(skeramPercent*100.0f);
        skeramImage->SetInCombatWithZone();
        skeramImage->SetVisibility(VISIBILITY_OFF);

        // Set illusion mana to be the same as the real one
        skeramImage->SetPower(POWER_MANA, m_creature->GetPower(POWER_MANA));

        if (!ImageA)
            ImageA = skeramImage;
        else
        {
            ImageB = skeramImage;
            UnisonBlink();
        }
    }

    void UnisonBlink()
    // At least two images present. Blink self and newest two images
    {
        uint32 mask = 0x7;

        // Get Skeram ready for blink
        m_creature->RemoveAllAuras();
        ClearTargetIcon();
        m_creature->SetVisibility(VISIBILITY_OFF);

        CastBlink(ImageA, mask);
        CastBlink(ImageB, mask);
        CastBlink(m_creature, mask);

        ImageA = nullptr;
        ImageB = nullptr;
    }

    void CastBlink(Creature* caster)
    // Teleport to any of three positions
    {
        uint32 mask = 0x7;
        CastBlink(caster, mask);
    }

    void CastBlink(Creature* caster, uint32& choiceMask)
    // Teleport to a random position in mask
    // Can teleport to any position if mask = 0x7
    {
        uint32 position = urand(0,2);

        while (!(1 << position & choiceMask))                       // Bogo select
            position = urand(0, 2);

        choiceMask &= ~(1 << position);                             // Remove used position from mask

        DoStopAttack();

        // Blink to one of the three platforms
        switch (position)
        {
            case 0: caster->CastSpell(caster, SPELL_BLINK_0, true); break;
            case 1: caster->CastSpell(caster, SPELL_BLINK_1, true); break;
            case 2: caster->CastSpell(caster, SPELL_BLINK_2, true); break;
        }

        DoResetThreat();
        caster->SetVisibility(VISIBILITY_ON);
    }

};

CreatureAI* GetAI_boss_skeram(Creature* pCreature) { return new boss_skeramAI(pCreature); }

void AddSC_boss_skeram()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_skeram";
    newscript->GetAI = &GetAI_boss_skeram;
    newscript->RegisterSelf();
}
