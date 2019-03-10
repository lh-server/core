DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190216094441');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190216094441');
-- Add your query below.

-- Cannot vendor or disenchant any AQ20 quest rewards
UPDATE `item_template` SET `BuyPrice` = 0, `SellPrice` = 0, `DisenchantID` = 0 WHERE `entry` IN (
        21408, 21409, 21407, -- Unending Life
        21403, 21401, 21402, -- Unseen Path
        21414, 21413, 21415, -- Vaulted Secrets
        21395, 21397, 21396, -- Eternal Justice
        21410, 21411, 21412, -- Infinite Wisdom
        21405, 21406, 21404, -- Veiled Shadows
        21400, 21398, 21399, -- Gathering Storm
        21416, 21417, 21418, -- Unspoken Names
        21394, 21392, 21393  -- Unyielding Strength
    );

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
