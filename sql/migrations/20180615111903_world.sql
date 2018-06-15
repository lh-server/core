DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180615111903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180615111903');
-- Add your query below.


-- ERROR:Table 'reference_loot_template' entry 30211 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=30211;

-- ERROR:Table 'reference_loot_template' entry 30412 isn't reference id and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=30412;

-- These spells do not need an entry in this table. They already learn riding.
-- Paladin Horse 40
DELETE FROM `spell_learn_spell` WHERE `entry`=13819;
-- Paladin Horse 60
DELETE FROM `spell_learn_spell` WHERE `entry`=23214;
-- Warlock Horse 40
UPDATE `quest_template` SET `RewSpellCast`=1710 WHERE `RewSpellCast`=5785;
DELETE FROM `spell_learn_spell` WHERE `entry`=5784;
-- Warlock Horse 60
DELETE FROM `spell_learn_spell` WHERE `entry`=23161;

-- Add a way to define minimum target level for spells.
ALTER TABLE `spell_template`
	ADD COLUMN `minTargetLevel` INT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Custom Field' AFTER `startRecoveryTime`,
	CHANGE COLUMN `maxTargetLevel` `maxTargetLevel` INT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `minTargetLevel`,
	CHANGE COLUMN `customFlags` `customFlags` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Custom Field' AFTER `requiredAuraVision`;

-- Raptor Punch
-- https://classicdb.ch/?item=5342#comments
UPDATE `spell_template` SET `minTargetLevel`=8 WHERE `ID`=6114;
-- Senggin Root
-- https://classicdb.ch/?item=3448#comments
UPDATE `spell_template` SET `minTargetLevel`=5 WHERE `ID`=2639;
-- Furbolg Medicine Pouch
-- https://web.archive.org/web/20070102103440/http://wow.allakhazam.com/db/item.html?witem=16768
UPDATE `spell_template` SET `minTargetLevel`=50 WHERE `ID`=20631;

-- These items are duplicates of existing ones with a custom id.
DELETE FROM `item_template` WHERE `entry` > 26000;

-- This npc is not a vendor.
DELETE FROM `npc_vendor` WHERE `entry`=4453;

-- Wing Commander Mulverick had wrong equipment.
DELETE FROM `creature_equip_template` WHERE `entry`=13181;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13181, 13625, 0, 11021);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
