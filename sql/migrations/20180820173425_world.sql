DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180820173425');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180820173425');
-- Add your query below.

UPDATE `gameobject` SET `position_z`=3.727536 WHERE `guid`=3440;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
