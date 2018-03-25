DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180325230521');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180325230521');
-- Add your query below.

UPDATE `gameobject` SET `spawntimesecsmin`='300', `spawntimesecsmax`='300' WHERE `id`=19535 and `spawntimesecsmin`='900';
UPDATE `gameobject` SET `spawntimesecsmin`='1', `spawntimesecsmax`='1' WHERE `id`=124072;
UPDATE `gameobject` SET `spawntimesecsmin`='300', `spawntimesecsmax`='300' WHERE `id`=128196;
UPDATE `gameobject` SET `spawntimesecsmin`='10', `spawntimesecsmax`='10' WHERE `id`=130126;
UPDATE `gameobject` SET `spawntimesecsmin`='160', `spawntimesecsmax`='160' WHERE `id`=144050;
UPDATE `gameobject` SET `spawntimesecsmin`='2', `spawntimesecsmax`='2' WHERE `id`=176117;
UPDATE `gameobject` SET `spawntimesecsmin`='300', `spawntimesecsmax`='300' WHERE `id`=176152;
UPDATE `gameobject` SET `spawntimesecsmin`='2', `spawntimesecsmax`='2' WHERE `id`=177045;
UPDATE `gameobject` SET `spawntimesecsmin`='2', `spawntimesecsmax`='2' WHERE `id`=176591;
UPDATE `gameobject` SET `spawntimesecsmin`='2', `spawntimesecsmax`='2' WHERE `id`=176865;
UPDATE `gameobject` SET `spawntimesecsmin`='500', `spawntimesecsmax`='500' WHERE `id`=176750;
UPDATE `gameobject` SET `spawntimesecsmin`='50', `spawntimesecsmax`='50' WHERE `id`=177793;
UPDATE `gameobject` SET `spawntimesecsmin`='300', `spawntimesecsmax`='300' WHERE `id`=178324;
UPDATE `gameobject` SET `spawntimesecsmin`='2', `spawntimesecsmax`='2' WHERE `id`=181913;
UPDATE `gameobject` SET `spawntimesecsmin`='300', `spawntimesecsmax`='300' WHERE `id`=180217;
UPDATE `gameobject` SET `spawntimesecsmin`='180', `spawntimesecsmax`='180' WHERE `id`=180583;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
