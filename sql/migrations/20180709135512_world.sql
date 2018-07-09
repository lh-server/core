DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180709135512');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180709135512');
-- Add your query below.


-- Demonic Rune
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellid_1`, `spellcharges_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`) VALUES 
('12662', '6', '7', 'Demonic Rune', '22952', '2', '2400', '600', '50', '20', '0', '16666', '-1', '1153', '120000', '0', '0', '1', '2');
UPDATE `item_template` SET `Quality`='1' WHERE `entry`=12662 AND `patch`=0;

-- Dark Rune
UPDATE `item_template` SET `patch`='6' WHERE  `entry`=20520 AND `patch`=0;

-- Pristine Black Diamond
UPDATE `item_template` SET `patch`='1' WHERE  `entry`=18335 AND `patch`=0;

-- Soul Shard bags
UPDATE `item_template` SET `patch`='7' WHERE `entry` IN (21371,21342,22244,30063,22243,21340,21341,21358);

-- Enchanting and herb bags
UPDATE `item_template` SET `patch`='8' WHERE `entry` IN (22246,22248,22249,22250,22251,22252,22308,22307,22309,22310,22312);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
