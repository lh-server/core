DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180505221750');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180505221750');
-- Add your query below.


-- Update waypoint command texts.
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (220, 'Cannot find waypoint id %u for %s (in path %i, loaded from %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (221, 'Last Waypoint not found for %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (222, '%s has no path or path empty, path-id %i (loaded from %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (223, 'Creature (GUID: %u) No waypoints found - This is a MaNGOS db problem (single float).', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (224, 'Cannot access %s on map, maybe you are too far away from its spawn location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (225, 'Creature (GUID: %u) not found', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (226, 'You must select a visual waypoint.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (227, 'No visual waypoints found', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (228, 'Could not create visual waypoint with creatureID: %d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (229, 'All visual waypoints removed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (230, 'Could not add waypoint %u to %s (pathId %i stored by %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (231, 'No GUID provided.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (232, 'No waypoint number provided.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (233, 'Argument required for \'%s\'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (234, 'Added Waypoint %u to %s (PathId %i, path stored by %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (235, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (236, 'Waypoint changed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (237, 'Waypoint %s modified.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (238, 'WP export successfull.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (239, 'No waypoints found inside the database.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (240, 'File imported.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (241, 'Waypoint removed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (242, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (243, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (244, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (245, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (246, 'Waypoint %u for %s (from pathId %i, stored by %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (247, ' Waittime: %d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (248, ' Orientation: %f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (249, ' ScriptId: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (250, 'ScriptID set to non-existing id %u, add it to DBScriptsEngine and reload the table.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (251, 'UNUSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (252, 'AIScriptName: %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
