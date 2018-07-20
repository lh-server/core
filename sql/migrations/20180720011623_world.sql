DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180720011623');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180720011623');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `AttributesEx`, `Custom`, `Comment`) VALUES 
('5101', '-1', '256', 'Daze spell attribute'),
('5116', '-1', '256', 'Daze spell attribute'),
('12323', '-1', '256', 'Daze spell attribute'),
('13496', '-1', '256', 'Daze spell attribute'),
('17174', '-1', '256', 'Daze spell attribute'),
('22914', '-1', '256', 'Daze spell attribute'),
('23600', '-1', '256', 'Daze spell attribute'),
('26379', '-1', '256', 'Daze spell attribute'),
('27634', '-1', '256', 'Daze spell attribute');

UPDATE `spell_mod` SET `AttributesEx`='-1', `Custom`='256' WHERE `Id`=15571;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
