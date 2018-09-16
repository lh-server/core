
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180912224336');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180912224336');
-- Add your query below.


-- Goldthorn undergroundx2
UPDATE `gameobject` SET `position_z`=115.631760 WHERE `guid`=50240;
UPDATE `gameobject` SET `position_z`=32.193901 WHERE `guid`=8802;
-- Goldthorn floating
UPDATE `gameobject` SET `position_z`=89.186569 WHERE `guid`=8699;
-- Arthas' tear floatingx2
UPDATE `gameobject` SET `position_z`=55.442844 WHERE `guid`=16022;
UPDATE `gameobject` SET `position_z`=59.530209 WHERE `guid`=15968;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
