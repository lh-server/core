DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180328182759');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180328182759');
-- Add your query below.

UPDATE `creature_template` SET `flags_extra`='769' WHERE `entry`=16028;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
