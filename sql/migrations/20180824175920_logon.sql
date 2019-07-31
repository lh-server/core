DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180824175920');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180824175920');
-- Add your query below.

ALTER TABLE `account` ADD COLUMN `invite_id` INT DEFAULT NULL,
ADD UNIQUE INDEX `invite_id_UNIQUE` (`invite_id` ASC);

ALTER TABLE `account` 
ADD INDEX `invite_id_fk_idx` (`invite_id` ASC);
ALTER TABLE `account` 
ADD CONSTRAINT `invite_id_fk`
  FOREIGN KEY (`invite_id`)
  REFERENCES `invites` (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

CREATE TABLE `invites` (
  `id` int(11) NOT NULL,
  `generator` int(11) unsigned NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `generator_fk_idx` (`generator`),
  CONSTRAINT `generator_fk` FOREIGN KEY (`generator`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES ('816', 'Your account is in restricted mode and cannot use the auction house until you add an invite code to your account or reach level %u. Please see %s for details.');
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES ('817', 'Your account is in restricted mode and cannot send mail until you add an invite code to your account or reach level %u. Please see %s for details.');
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES ('818', 'Your account is in restricted mode and cannot invite players that do not have you on their friends list until you add an invite code to your account or reach level %u. Please see %s for details.');
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES ('819', 'Your account is in restricted mode and cannot whisper players that do not have you on their friends list until you add an invite code to your account or reach level %u. Please see %s for details.');
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES ('820', 'Your account is in restricted mode and may only receive but not send items through trading until you add an invite code to your account or reach level %u. Please see %s for details.');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
