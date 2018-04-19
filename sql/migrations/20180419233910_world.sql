DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180419233910');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180419233910');
-- Add your query below.


UPDATE `broadcast_text` SET `MaleText`='Rexxar, I have lost the Drakefire Amulet. Could another be created?', `FemaleText`='Rexxar, I have lost the Drakefire Amulet. Could another be created?' WHERE `ID`=9014;

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES 
('40000', '23', '11482', '1', '1'),        -- Has no Crystal Pylon User's Manual
('40001', '-1', '40000', '4321', '0'),     -- Quest complete and has item

('40002', '23', '17691', '1', '1'),
('40003', '8', '7162', '0', '0'),
('40004', '8', '7168', '0', '1'),
('40005', '-1', '40002', '40003', '0'),
('40006', '-1', '40004', '40005', '0'),     -- Stormpike Insignia R1

('40007', '23', '17900', '1', '1'),
('40008', '8', '7168', '0', '0'),
('40009', '8', '7169', '0', '1'),
('40010', '-1', '40007', '40008', '0'),
('40011', '-1', '40009', '40010', '0'),     -- Stormpike Insignia R2

('40012', '23', '17901', '1', '1'),
('40013', '8', '7169', '0', '0'),
('40014', '8', '7170', '0', '1'),
('40015', '-1', '40012', '40013', '0'),
('40016', '-1', '40014', '40015', '0'),     -- Stormpike Insignia R3

('40017', '23', '17902', '1', '1'),
('40018', '8', '7170', '0', '0'),
('40019', '8', '7171', '0', '1'),
('40020', '-1', '40017', '40018', '0'),
('40021', '-1', '40019', '40020', '0'),     -- Stormpike Insignia R4

('40022', '23', '17903', '1', '1'),
('40023', '8', '7171', '0', '0'),
('40024', '8', '7172', '0', '1'),
('40025', '-1', '40022', '40023', '0'),
('40026', '-1', '40024', '40025', '0'),     -- Stormpike Insignia R5

('40027', '23', '17904', '1', '1'),
('40028', '8', '7172', '0', '0'),
('40029', '-1', '40027', '40028', '0'),     -- Stormpike Insignia R6

('40030', '23', '17690', '1', '1'),
('40031', '8', '7161', '0', '0'),
('40032', '8', '7163', '0', '1'),
('40033', '-1', '40030', '40031', '0'),
('40034', '-1', '40032', '40033', '0'),     -- Frostwolf Insignia R1

('40035', '23', '17905', '1', '1'),
('40036', '8', '7163', '0', '0'),
('40037', '8', '7164', '0', '1'),
('40038', '-1', '40035', '40036', '0'),
('40039', '-1', '40037', '40038', '0'),     -- Frostwolf Insignia R2

('40040', '23', '17906', '1', '1'),
('40041', '8', '7164', '0', '0'),
('40042', '8', '7165', '0', '1'),
('40043', '-1', '40040', '40041', '0'),
('40044', '-1', '40042', '40043', '0'),     -- Frostwolf Insignia R3

('40045', '23', '17907', '1', '1'),
('40046', '8', '7165', '0', '0'),
('40047', '8', '7166', '0', '1'),
('40048', '-1', '40045', '40046', '0'),
('40049', '-1', '40047', '40048', '0'),     -- Frostwolf Insignia R4

('40050', '23', '17908', '1', '1'),
('40051', '8', '7166', '0', '0'),
('40052', '8', '7167', '0', '1'),
('40053', '-1', '40050', '40051', '0'),
('40054', '-1', '40052', '40053', '0'),     -- Frostwolf Insignia R5

('40055', '23', '17909', '1', '1'),
('40056', '8', '7167', '0', '0'),
('40057', '-1', '40055', '40056', '0'),     -- Frostwolf Insignia R6

('40058', '8', '6502', '0', '0'),
('40059', '8', '6602', '0', '0'),
('40060', '23', '16309', '1', '1'),
('40061', '-1', '40058', '40060', '0'),     -- Drakefire Amulet Alliance
('40062', '-1', '40059', '40060', '0');     -- Drakefire Amulet Horde

UPDATE `creature_template` SET `gossip_menu_id`='5441' WHERE `entry`=13840;
UPDATE `creature_template` SET `gossip_menu_id`='10929', `ScriptName`='' WHERE `entry`=10929;
UPDATE `creature_template` SET `gossip_menu_id`='10182' WHERE  `entry`=10182;

DELETE FROM `npc_gossip` WHERE `npc_guid` IN (16575,29113);

REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
('2184', '3', 'I lost my Crystal Pylon User\'s Manual and need another one.', '5191', '1', '1', '2187', '2184', '40001'),
('5442', '0', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40000', '40006'),
('5442', '1', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40001', '40011'),
('5442', '2', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40002', '40016'),
('5442', '3', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40003', '40021'),
('5442', '4', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40004', '40026'),
('5442', '5', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40005', '40029'),
('5441', '0', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40006', '40034'),
('5441', '1', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40007', '40039'),
('5441', '2', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40008', '40044'),
('5441', '3', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40009', '40049'),
('5441', '4', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40010', '40054'),
('5441', '5', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40011', '40057'),
('10929', '0', 'Haleh, I have lost the Drakefire Amulet. Could you fashion another?', '9016', '1', '1', '-1', '10929', '40061'),
('10182', '0', 'Rexxar, I have lost the Drakefire Amulet. Could another be created?', '9014', '1', '1', '-1', '10929', '40062');

REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES 
('2187', '2838'),
('5441', '6475'),
('10929', '6534'),
('10182', '6533');

DELETE FROM `gossip_scripts` WHERE `id` IN (2184,40000,40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2184, 0, 15, 15211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Crystal Pylon User\'s Manual'),
(40000, 0, 15, 22114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R1'),
(40001, 0, 15, 22115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R2'),
(40002, 0, 15, 22116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R3'),
(40003, 0, 15, 22117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R4'),
(40004, 0, 15, 22118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R5'),
(40005, 0, 15, 22119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R6'),
(40006, 0, 15, 22108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R1'),
(40007, 0, 15, 22109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R2'),
(40008, 0, 15, 22110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R3'),
(40009, 0, 15, 22111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R4'),
(40010, 0, 15, 22112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R5'),
(40011, 0, 15, 22113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R6'),
(10929, 0, 15, 22207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Drakefire Amulet');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
