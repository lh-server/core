DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180426223835');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180426223835');
-- Add your query below.


-- This Imp can have it's AI auto assigned now.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=416;

-- Fix wrong Summon Imp spell being used by Burning Blade Summoner.
DELETE FROM `creature_ai_scripts` WHERE `id`=466802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (466802, 0, 15, 11939, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blade Summoner - Cast Spell Summon Imp');

-- Fix Imp Minion summoned by various creatures not behaving like a pet.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1292201, 12922, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1292201, 0, 0, 'Imp Minion - Cast Fireball on Aggro (Not Really Needed)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292201, 0, 15, 20801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Imp Minion - Cast Fireball');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=12922;

-- Fix Hukku's Imp not behaving like a pet.
DELETE FROM `creature_ai_events` WHERE `creature_id`=8658;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (865801, 8658, 0, 4, 0, 100, 0, 0, 0, 0, 0, 865801, 0, 0, 'Hukku\'s Imp - Cast Fireball on Aggro (Not Really Needed)');
DELETE FROM `creature_ai_scripts` WHERE `id`=865801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (865801, 0, 15, 11762, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hukku\'s Imp - Cast Fireball');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=8658;

-- Removing not needed event for Tamed Battleboar.
DELETE FROM `creature_ai_events` WHERE `creature_id`=4535;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (453501, 4535, 0, 4, 0, 100, 0, 0, 0, 0, 0, 453501, 0, 0, 'Tamed Battleboar - Cast Rushing Charge on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (453502);

-- Fix mana for Hukku's Succubus.
UPDATE `creature_template` SET `minmana`=1923, `maxmana`=1923 WHERE `entry`=8657;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
