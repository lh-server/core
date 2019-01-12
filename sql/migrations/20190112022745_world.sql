DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190112022745');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190112022745');
-- Add your query below.

UPDATE `creature_template`
    SET `flags_extra` = `flags_extra` | 0x00020000
    WHERE `entry` IN (
        12422, -- Death Talon Dragonspawn
        12460, -- Death Talon Wyrmguard
        12461, -- Death Talon Overseer
        12463, -- Death Talon Flamescale
        12464, -- Death Talon Wyrmkin
        12467, -- Death Talon Captain
        13996, -- Blackwing Technician
        12459, -- Blackwing Warlock
        12457, -- Blackwing Spellbinder
        15264 -- Anubisath Sentinel
    );

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
