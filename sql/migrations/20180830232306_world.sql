DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180830232306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180830232306');
-- Add your query below.

-- Add Technician in Firemaw room's left alcove group to pull with the rest of the group.
INSERT INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('84558', '84570', '0', '0', '46');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
