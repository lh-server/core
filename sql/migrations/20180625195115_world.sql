DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180625195115');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180625195115');
-- Add your query below.

-- Fix tons of creatures with the right walk and run speed
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=3; -- Flesh Eater - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6; -- Kobold Vermin - speed walk was 0.63
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6; -- Kobold Vermin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=30; -- Forest Spider - speed walk was 0.39
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=30; -- Forest Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=36; -- Harvest Golem - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=38; -- Defias Thug - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=38; -- Defias Thug - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=40; -- Kobold Miner - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=40; -- Kobold Miner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=43; -- Mine Spider - speed walk was 0.53
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=43; -- Mine Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=46; -- Murloc Forager - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=46; -- Murloc Forager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=48; -- Skeletal Warrior - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=54; -- Corina Steele - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=60; -- Ruklar the Trapper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=66; -- Tharynn Bouden - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=68; -- Stormwind City Guard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=69; -- Timber Wolf - speed walk was 0.64
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=69; -- Timber Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=74; -- Kurran Steele - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=78; -- Janos Hammerknuckle - speed walk was 0.93
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=79; -- Narg the Taskmaster - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=80; -- Kobold Laborer - speed walk was 0.78
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=80; -- Kobold Laborer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE  `entry`=89; -- Infernal - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.45714 WHERE  `entry`=89; -- Infernal - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=94; -- Defias Cutpurse - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=94; -- Defias Cutpurse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=95; -- Defias Smuggler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=97; -- Riverpaw Runt - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=97; -- Riverpaw Runt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=98; -- Riverpaw Taskmaster - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=100; -- Gruff Swiftbite - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=103; -- Garrick Padfoot - speed walk was 0.93
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=103; -- Garrick Padfoot - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=113; -- Stonetusk Boar - speed walk was 0.58
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=113; -- Stonetusk Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=114; -- Harvest Watcher - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=115; -- Harvest Reaper - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=116; -- Defias Bandit - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=116; -- Defias Bandit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=117; -- Riverpaw Gnoll - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=118; -- Prowler - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=118; -- Prowler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=119; -- Longsnout - speed walk was 0.73
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=121; -- Defias Pathstalker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=122; -- Defias Highwayman - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=123; -- Riverpaw Mongrel - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=123; -- Riverpaw Mongrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=124; -- Riverpaw Brute - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=125; -- Riverpaw Overseer - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=125; -- Riverpaw Overseer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=126; -- Murloc Coastrunner - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=126; -- Murloc Coastrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=127; -- Murloc Tidehunter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=151; -- Brog Hamfist - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=152; -- Brother Danil - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=154; -- Greater Fleshripper - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=157; -- Goretusk - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=171; -- Murloc Warrior - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=171; -- Murloc Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=190; -- Dermot Johns - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=196; -- Eagan Peltskinner - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=197; -- Marshal McBride - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=198; -- Khelden Bremen - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=199; -- Young Fleshripper - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=202; -- Skeletal Horror - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=203; -- Skeletal Mage - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=205; -- Nightbane Dark Runner - speed walk was 0.99
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=205; -- Nightbane Dark Runner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=210; -- Bone Chewer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=213; -- Starving Dire Wolf - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=215; -- Defias Night Runner - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=217; -- Venom Web Spider - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=218; -- Grave Robber - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=222; -- Nillen Andemar - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=223; -- Dan Golthas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=225; -- Gavin Gnarltree - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=226; -- Morg Gnarltree - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=227; -- Mabel Solaj - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=228; -- Avette Fellwood - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=233; -- Farmer Saldean - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=235; -- Salma Saldean - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=237; -- Farmer Furlbrow - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=238; -- Verna Furlbrow - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=239; -- Grimbooze Thunderbrew - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=240; -- Marshal Dughan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=241; -- Remy "Two Times" - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=244; -- Ma Stonefield - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=246; -- "Auntie" Bernice Stonefield - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=247; -- Billy Maclure - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=248; -- Gramma Stonefield - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=250; -- Pa Maclure - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=251; -- Maybell Maclure - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=252; -- Tommy Joe Stonefield - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=253; -- William Pestle - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=255; -- Gerard Tiller - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=257; -- Kobold Worker - speed walk was 0.78
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=257; -- Kobold Worker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=258; -- Joshua Maclure - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=263; -- Lord Ello Ebonlocke - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=264; -- Commander Althea Ebonlocke - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=265; -- Madame Eva - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=266; -- Wiley the Black - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=267; -- Clerk Daltry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=268; -- Sirra Von'Indi - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=269; -- Role Dreuger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=270; -- Councilman Millstipe - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=271; -- Ambassador Berrybuck - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=272; -- Chef Grual - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=273; -- Tavernkeep Smitts - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=274; -- Barkeep Hann - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=275; -- Whit Wantmal - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=276; -- Viktori Prism'Antras - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=277; -- Roberto Pupellyverbos - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=278; -- Sara Timberlain - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=279; -- Morgan Pestle - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=285; -- Murloc - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=285; -- Murloc - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=288; -- Jitters - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=289; -- Abercrombie - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=294; -- Marshal Haggard - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=295; -- Innkeeper Farley - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=297; -- Caretaker Folsom - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=299; -- Young Wolf - speed walk was 0.63
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=299; -- Young Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=302; -- Blind Mary - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=308; -- Black Stallion - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=311; -- Sven Yorgen - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=313; -- Theocritus - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=2.07 WHERE  `entry`=314; -- Eliza - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=325; -- Hogan Ference - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=327; -- Goldtooth - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=327; -- Goldtooth - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=328; -- Zaldimar Wefhellt - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1.9 WHERE  `entry`=329; -- Earth Elemental - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=330; -- Princess - speed walk was 0.72
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=330; -- Princess - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=334; -- Gath'Ilzogg - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=335; -- Singe - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=341; -- Foreman Oslow - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=342; -- Martie Jainrose - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=343; -- Chef Breanna - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=344; -- Magistrate Solomon - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=345; -- Bellygrub - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=346; -- Barkeep Daniels - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=347; -- Grizzle Halfmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=348; -- Zem Leeward - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=349; -- Corporal Keeshan - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=349; -- Corporal Keeshan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=356; -- Black Wolf - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=356; -- Black Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=374; -- Cog Glitzspinner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=375; -- Priestess Anetta - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=377; -- Priestess Josetta - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=379; -- Darcy - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=381; -- Dockmaster Baren - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=382; -- Marshal Marris - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=383; -- Jason Mathers - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=384; -- Katie Hunter - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=385; -- Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=390; -- Porcine Entourage - speed walk was 0.62
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=390; -- Porcine Entourage - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=391; -- Old Murk-Eye - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=392; -- Captain Grayson - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=395; -- Markus - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=397; -- Morganth - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=412; -- Stitches - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=412; -- Stitches - speed run was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=415; -- Verner Osgood - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=417; -- Felhunter - speed walk was 1.3
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=422; -- Murloc Flesheater - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=423; -- Redridge Mongrel - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=423; -- Redridge Mongrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=424; -- Redridge Poacher - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=424; -- Redridge Poacher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=426; -- Redridge Brute - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=428; -- Dire Condor - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=429; -- Shadowhide Darkweaver - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=430; -- Redridge Mystic - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=431; -- Shadowhide Slayer - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=432; -- Shadowhide Brute - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=433; -- Shadowhide Gnoll - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=433; -- Shadowhide Gnoll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=434; -- Rabid Shadowhide Gnoll - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=434; -- Rabid Shadowhide Gnoll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=435; -- Blackrock Champion - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=436; -- Blackrock Shadowcaster - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=437; -- Blackrock Renegade - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=440; -- Blackrock Grunt - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=441; -- Black Dragon Whelp - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=442; -- Tarantula - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=445; -- Redridge Alpha - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=446; -- Redridge Basher - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=448; -- Hogger - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=449; -- Defias Knuckleduster - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=450; -- Defias Renegade Mage - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=452; -- Riverpaw Bandit - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=452; -- Riverpaw Bandit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=453; -- Riverpaw Mystic - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=454; -- Young Goretusk - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=456; -- Murloc Minor Oracle - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=458; -- Murloc Hunter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=459; -- Drusilla La Salle - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=460; -- Alamar Grimm - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=462; -- Vultros - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=464; -- Guard Parker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=465; -- Barkeep Dobbins - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=466; -- General Marcus Jonathan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=467; -- The Defias Traitor - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.89286 WHERE  `entry`=467; -- The Defias Traitor - speed run was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=468; -- Town Crier - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=469; -- Lieutenant Doren - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=471; -- Mother Fang - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=471; -- Mother Fang - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=472; -- Fedfennel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=473; -- Morgan the Collector - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=473; -- Morgan the Collector - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=474; -- Defias Rogue Wizard - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=474; -- Defias Rogue Wizard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=475; -- Kobold Tunneler - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=475; -- Kobold Tunneler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=476; -- Kobold Geomancer - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=476; -- Kobold Geomancer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=478; -- Riverpaw Outrunner - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=478; -- Riverpaw Outrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=480; -- Rusty Harvest Golem - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=480; -- Rusty Harvest Golem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=481; -- Defias Footpad - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=482; -- Elling Trias - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=483; -- Elaine Trias - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=485; -- Blackrock Outrunner - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=486; -- Tharil'zun - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=487; -- Protector Bialon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=488; -- Protector Weaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=489; -- Protector Dutfield - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=490; -- Protector Gariel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=491; -- Quartermaster Lewis - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=494; -- Watcher Bukouris - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=495; -- Watcher Keefer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=499; -- Watcher Paige - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=500; -- Riverpaw Scout - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=500; -- Riverpaw Scout - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=501; -- Riverpaw Herbalist - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=502; -- Benny Blaanco - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=503; -- Lord Malathrom - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=504; -- Defias Trapper - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=505; -- Greater Tarantula - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=506; -- Sergeant Brashclaw - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=506; -- Sergeant Brashclaw - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=511; -- Insane Ghoul - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=513; -- Murloc Netter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=514; -- Smith Argus - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=515; -- Murloc Raider - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=517; -- Murloc Oracle - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=518; -- Yowler - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=518; -- Yowler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=519; -- Slark - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=520; -- Brack - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=522; -- Mor'Ladim - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=524; -- Rockhide Boar - speed walk was 0.72
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=524; -- Rockhide Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=525; -- Mangy Wolf - speed walk was 0.68
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=525; -- Mangy Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=531; -- Skeletal Fiend - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=533; -- Nightbane Shadow Weaver - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=539; -- Pygmy Venom Web Spider - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=543; -- Nalesette Wildbringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=544; -- Murloc Nightcrawler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=545; -- Murloc Tidecaller - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=547; -- Great Goretusk - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=548; -- Murloc Minor Tidecaller - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=550; -- Defias Messenger - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=565; -- Rabid Dire Wolf - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=568; -- Shadowhide Warrior - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=569; -- Green Recluse - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=570; -- Brain Eater - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=572; -- Leprithus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=574; -- Naraxis - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.9 WHERE  `entry`=575; -- Fire Elemental - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=576; -- Watcher Ladimore - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=578; -- Murloc Scout - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=579; -- Shadowhide Assassin - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=579; -- Shadowhide Assassin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=580; -- Redridge Drudger - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=580; -- Redridge Drudger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=582; -- Old Blanchy - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=582; -- Old Blanchy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=583; -- Defias Ambusher - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=583; -- Defias Ambusher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=584; -- Kazon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=589; -- Defias Pillager - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=590; -- Defias Looter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=594; -- Defias Henchman - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=596; -- Brainwashed Noble - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=598; -- Defias Miner - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=599; -- Marisa du'Paige - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.65 WHERE  `entry`=603; -- Grimtooth - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=604; -- Plague Spreader - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=615; -- Blackrock Tracker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=619; -- Defias Conjurer - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=620; -- Chicken - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=620; -- Chicken - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=623; -- Skeletal Miner - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=624; -- Undead Excavator - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=625; -- Undead Dynamiter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=626; -- Foreman Thistlenettle - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=628; -- Black Ravager - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=633; -- Elaine Carevin - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.7 WHERE  `entry`=636; -- Defias Blackguard - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.8 WHERE  `entry`=636; -- Defias Blackguard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.45 WHERE  `entry`=643; -- Sneed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=656; -- Wilder Thistlenettle - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=658; -- Sten Stoutarm - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=12 WHERE  `entry`=659; -- El Pollo Grande - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=661; -- Jonathan Carevin - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=663; -- Calor - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=664; -- Benjamin Carevin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=680; -- Mosh'Ogg Lord - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=684; -- Shadowmaw Panther - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=688; -- Stone Maw Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=689; -- Crystal Spine Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=690; -- Cold Eye Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=691; -- Lesser Water Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=698; -- Bloodscalp Tiger - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=703; -- Lieutenant Fangore - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=704; -- Ragged Timber Wolf - speed walk was 0.64
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=704; -- Ragged Timber Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=705; -- Ragged Young Wolf - speed walk was 0.63
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=705; -- Ragged Young Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=706; -- Frostmane Troll Whelp - speed walk was 0.69
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=706; -- Frostmane Troll Whelp - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=707; -- Rockjaw Trogg - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=707; -- Rockjaw Trogg - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=708; -- Small Crag Boar - speed walk was 0.56
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=708; -- Small Crag Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=711; -- Ardo Dirtpaw - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=712; -- Redridge Thrasher - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=713; -- Balir Frosthammer - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=715; -- Hemet Nesingwary - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=716; -- Barnil Stonepot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=717; -- Ajeck Rouack - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=718; -- Sir S. J. Erlgadin - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=721; -- Rabbit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.65 WHERE  `entry`=723; -- Mosh'Ogg Butcher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=724; -- Burly Rockjaw Trogg - speed walk was 0.64
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=724; -- Burly Rockjaw Trogg - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=727; -- Ironforge Mountaineer - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=729; -- Sin'Dall - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=732; -- Murloc Lurker - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=732; -- Murloc Lurker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=733; -- Sergeant Yohwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=734; -- Corporal Bluth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=735; -- Murloc Streamrunner - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=735; -- Murloc Streamrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=737; -- Kebok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=738; -- Private Thorsen - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.02857 WHERE  `entry`=738; -- Private Thorsen - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=739; -- Brother Nimetz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=740; -- Adolescent Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=741; -- Dreaming Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=742; -- Green Wyrmkin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=743; -- Wyrmkin Dreamwalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=744; -- Green Scalebane - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=745; -- Scalebane Captain - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=746; -- Elder Dragonkin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=747; -- Marsh Murloc - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=750; -- Marsh Inkspewer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=751; -- Marsh Flesheater - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=752; -- Marsh Oracle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=755; -- Lost One Mudlurker - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=756; -- Skullsplitter Panther - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=757; -- Lost One Fisherman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=760; -- Lost One Muckdweller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=764; -- Swampwalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=766; -- Tangled Horror - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=767; -- Swamp Jaguar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=768; -- Shadow Panther - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=768; -- Shadow Panther - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=769; -- Deathstrike Tarantula - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=770; -- Corporal Kaleb - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=771; -- Commander Felstrom - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=773; -- Krazek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=777; -- Amy Davenport - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=785; -- Skeletal Warder - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=786; -- Grelin Whitebeard - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=787; -- Skeletal Healer - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=789; -- Kimberly Hiett - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=790; -- Karen Taylor - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=791; -- Lindsay Ashlock - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=793; -- Kara Adams - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=794; -- Matt - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=795; -- Mark - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=796; -- Joshua - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=797; -- Bo - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=798; -- Solomon - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=798; -- Solomon - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=799; -- Kevin - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=799; -- Kevin - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=800; -- Kyle - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=800; -- Kyle - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=801; -- Eric - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=801; -- Eric - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=802; -- Jay - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=802; -- Jay - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=804; -- Dana - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=805; -- Cameron - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=806; -- John - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=807; -- Lisa - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=808; -- Grik'nir the Cold - speed walk was 0.84
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=808; -- Grik'nir the Cold - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=810; -- Aaron - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=811; -- Jose - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=812; -- Alma Jainrose - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=815; -- Bookie Herod - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=818; -- Mai'Zoth - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=819; -- Servant of Ilgalar - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=820; -- Scout Riell - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=821; -- Captain Danuvin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=822; -- Young Forest Bear - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=822; -- Young Forest Bear - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=823; -- Deputy Willem - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=824; -- Defias Digger - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=826; -- Watcher Jan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=827; -- Watcher Mocarski - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=828; -- Watcher Petras - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=829; -- Adlin Pridedrift - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=830; -- Sand Crawler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=831; -- Sea Crawler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=832; -- Dust Devil - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=833; -- Coyote Packleader - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=834; -- Coyote - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=836; -- Durnan Furcutter - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=837; -- Branstock Khalder - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=840; -- Watcher Backus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=842; -- Lumberjack - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=843; -- Gina MacGregor - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=844; -- Antonio Perelli - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=846; -- Rotten Ghoul - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=849; -- Rachel - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=851; -- Hannah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=857; -- Donal Osgood - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=858; -- Sorrow Spinner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=861; -- Stonard Scout - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=863; -- Stonard Hunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=864; -- Stonard Orc - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=865; -- Stonard Wayfinder - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=866; -- Stonard Grunt - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=867; -- Stonard Cartographer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=868; -- Stonard Shaman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=869; -- Protector Dorana - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=870; -- Protector Deni - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=874; -- Protector Korelor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=876; -- Protector Leick - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=878; -- Scout Galiaan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=880; -- Erlan Drudgemoor - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=880; -- Erlan Drudgemoor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=881; -- Surena Caledon - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=881; -- Surena Caledon - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=883; -- Deer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=885; -- Watcher Keller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=886; -- Watcher Hartin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=887; -- Watcher Jordan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=888; -- Watcher Dodds - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=889; -- Splinter Fist Ogre - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=890; -- Fawn - speed walk was 0.54
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=890; -- Fawn - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=891; -- Splinter Fist Fire Weaver - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=892; -- Splinter Fist Taskmaster - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=893; -- Lars - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=894; -- Homer Stonefield - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=895; -- Thorgas Grimson - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=896; -- Veldan Lightfoot - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=898; -- Nightbane Worgen - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=900; -- Bailiff Conacher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=903; -- Guard Howe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=906; -- Maximillian Crowe - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=908; -- Flora Silverwind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=909; -- Defias Night Blade - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=910; -- Defias Enchanter - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=911; -- Llane Beshere - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=912; -- Thran Khorman - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=913; -- Lyria Du Lac - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=914; -- Ander Germaine - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=915; -- Jorik Kerridan - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=916; -- Solm Hargrin - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=917; -- Keryn Sylvius - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=918; -- Osborne the Night Man - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=922; -- Silt Crawler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=923; -- Young Black Ravager - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=925; -- Brother Sammuel - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=926; -- Bromos Grummner - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=927; -- Brother Wilhelm - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=928; -- Lord Grayson Shadowbreaker - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=930; -- Black Widow Hatchling - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=944; -- Marryk Nurribit - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=945; -- Rybrad Coldbank - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=946; -- Frostmane Novice - speed walk was 0.69
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=946; -- Frostmane Novice - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=947; -- Rohh the Silent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=948; -- Rotted One - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=949; -- Carrion Recluse - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=951; -- Brother Paxton - speed walk was 1.06
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=952; -- Brother Neals - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=955; -- Sergeant De Vries - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=956; -- Dorin Songblade - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=957; -- Dane Lindgren - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=958; -- Dawn Brightstar - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=959; -- Morley Eberlein - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=960; -- Gunder Thornbush - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=963; -- Deputy Rainer - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=980; -- Grimnal - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=981; -- Hartash - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=982; -- Thultash - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=983; -- Thultazor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=984; -- Thralosh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=985; -- Malosh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=986; -- Haromm - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=987; -- Ogromm - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=988; -- Kartosh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=989; -- Banalash - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=999; -- Watcher Royce - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1001; -- Watcher Hutchins - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1007; -- Mosshide Gnoll - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1008; -- Mosshide Mongrel - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1008; -- Mosshide Mongrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1009; -- Mosshide Mistweaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1010; -- Mosshide Fenrunner - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1010; -- Mosshide Fenrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1011; -- Mosshide Trapper - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1011; -- Mosshide Trapper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1012; -- Mosshide Brute - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1013; -- Mosshide Mystic - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1013; -- Mosshide Mystic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1014; -- Mosshide Alpha - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1015; -- Highland Raptor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1016; -- Highland Lashtail - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1017; -- Highland Scytheclaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1020; -- Mottled Raptor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1021; -- Mottled Screecher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1022; -- Mottled Scytheclaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1023; -- Mottled Razormaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1024; -- Bluegill Murloc - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1025; -- Bluegill Puddlejumper - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1025; -- Bluegill Puddlejumper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1026; -- Bluegill Forager - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1027; -- Bluegill Warrior - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1028; -- Bluegill Muckdweller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1030; -- Black Slime - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1031; -- Crimson Ooze - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1032; -- Black Ooze - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1033; -- Monstrous Ooze - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1034; -- Dragonmaw Raider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1035; -- Dragonmaw Swamprunner - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1035; -- Dragonmaw Swamprunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1036; -- Dragonmaw Centurion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.54 WHERE  `entry`=1037; -- Dragonmaw Battlemaster - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1038; -- Dragonmaw Shadowwarder - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1039; -- Fen Dweller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1040; -- Fen Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1041; -- Fen Lord - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1042; -- Red Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1043; -- Lost Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1044; -- Flamesnorting Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1051; -- Dark Iron Dwarf - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1052; -- Dark Iron Saboteur - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1057; -- Dragonmaw Bonewarder - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=1063; -- Jade - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1064; -- Grom'gol Grunt - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1064; -- Grom'gol Grunt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1065; -- Riverpaw Shaman - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1068; -- Gorn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1069; -- Crimson Whelp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1070; -- Deputy Feldon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1071; -- Longbraid the Grim - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1072; -- Roggo Harlbarrow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1073; -- Ashlan Stonesmirk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1074; -- Motley Garmason - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1075; -- Rhag Garmason - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1082; -- Sawtooth Crocolisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1083; -- Murloc Shorestriker - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1084; -- Young Sawtooth Crocolisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1087; -- Sawtooth Snapper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1088; -- Monstrous Crawler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1089; -- Mountaineer Cobbleflint - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1090; -- Mountaineer Wallbang - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1091; -- Mountaineer Gravelgaw - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1092; -- Captain Rugelfuss - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1093; -- Chief Engineer Hinderweir VII - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1095; -- Venture Co. Workboss - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1098; -- Watcher Merant - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1099; -- Watcher Gelwin - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1100; -- Watcher Selkin - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1101; -- Watcher Thayer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1103; -- Eldrin - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1104; -- Grundel Harkin - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1105; -- Jern Hornhelm - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1109; -- Fleshripper - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1110; -- Skeletal Raider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1111; -- Leech Stalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=1112; -- Leech Widow - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1115; -- Rockjaw Skullthumper - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1115; -- Rockjaw Skullthumper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1116; -- Rockjaw Ambusher - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1116; -- Rockjaw Ambusher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1117; -- Rockjaw Bonesnapper - speed walk was 0.82
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1118; -- Rockjaw Backbreaker - speed walk was 0.89
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1120; -- Frostmane Troll - speed walk was 0.77
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1120; -- Frostmane Troll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1121; -- Frostmane Snowstrider - speed walk was 0.77
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1121; -- Frostmane Snowstrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1122; -- Frostmane Hideskinner - speed walk was 0.87
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1122; -- Frostmane Hideskinner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1123; -- Frostmane Headhunter - speed walk was 0.77
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1123; -- Frostmane Headhunter - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1124; -- Frostmane Shadowcaster - speed walk was 0.87
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1124; -- Frostmane Shadowcaster - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1125; -- Crag Boar - speed walk was 0.58
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1125; -- Crag Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1126; -- Large Crag Boar - speed walk was 0.72
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1126; -- Large Crag Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1127; -- Elder Crag Boar - speed walk was 0.67
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1127; -- Elder Crag Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1128; -- Young Black Bear - speed walk was 0.59
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1128; -- Young Black Bear - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1129; -- Black Bear - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1129; -- Black Bear - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1131; -- Winter Wolf - speed walk was 0.7
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1131; -- Winter Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1132; -- Timber - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1133; -- Starving Winter Wolf - speed walk was 0.7
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1133; -- Starving Winter Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1134; -- Young Wendigo - speed walk was 0.53
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1134; -- Young Wendigo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1135; -- Wendigo - speed walk was 0.67
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1135; -- Wendigo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1137; -- Edan the Howler - speed walk was 1.16
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1137; -- Edan the Howler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1138; -- Snow Tracker Wolf - speed walk was 0.7
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1138; -- Snow Tracker Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1139; -- Magistrate Bluntnose - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1141; -- Angus Stern - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1146; -- Vharr - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1147; -- Hragran - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1148; -- Nerrist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1149; -- Uthok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1153; -- Torren Squarejaw - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1161; -- Stonesplinter Trogg - speed walk was 0.85
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1162; -- Stonesplinter Scout - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1164; -- Stonesplinter Bonesnapper - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1165; -- Stonesplinter Geomancer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1166; -- Stonesplinter Seer - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1167; -- Stonesplinter Digger - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1172; -- Tunnel Rat Vermin - speed walk was 0.69
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1173; -- Tunnel Rat Scout - speed walk was 0.84
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1174; -- Tunnel Rat Geomancer - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1175; -- Tunnel Rat Digger - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1176; -- Tunnel Rat Forager - speed walk was 0.84
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1179; -- Mo'grosh Enforcer - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1182; -- Brother Anton - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1184; -- Cliff Lurker - speed walk was 0.56
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1185; -- Wood Lurker - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1186; -- Elder Black Bear - speed walk was 0.78
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1188; -- Grizzled Black Bear - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1189; -- Black Bear Patriarch - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1190; -- Mountain Boar - speed walk was 0.68
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1191; -- Mangy Mountain Boar - speed walk was 0.79
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1192; -- Elder Mountain Boar - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1193; -- Loch Frenzy - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1194; -- Mountain Buzzard - speed walk was 0.85
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1195; -- Forest Lurker - speed walk was 0.53
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1195; -- Forest Lurker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1196; -- Ice Claw Bear - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1196; -- Ice Claw Bear - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1197; -- Stonesplinter Shaman - speed walk was 0.86
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1199; -- Juvenile Snow Leopard - speed walk was 0.68
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1199; -- Juvenile Snow Leopard - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1201; -- Snow Leopard - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1201; -- Snow Leopard - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1202; -- Tunnel Rat Kobold - speed walk was 0.69
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1205; -- Grawmug - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1206; -- Gnasher - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1207; -- Brawler - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1211; -- Leper Gnome - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1211; -- Leper Gnome - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1212; -- Bishop Farthing - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1213; -- Godric Rothgar - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1215; -- Alchemist Mallory - speed walk was 1.06
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1216; -- Shore Crawler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1217; -- Glorin Steelbrow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1218; -- Herbalist Pomeroy - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1222; -- Dark Iron Sapper - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1224; -- Young Threshadon - speed walk was 0.78
UPDATE `creature_template` SET `speed_walk`=1.89 WHERE  `entry`=1225; -- Ol' Sooty - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1226; -- Maxan Anvol - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1228; -- Magis Sparkmantle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1229; -- Granis Swiftaxe - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1231; -- Grif Wildheart - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1232; -- Azar Stronghammer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1234; -- Hogral Bakkan - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1236; -- Kobold Digger - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1237; -- Kazan Mogosh - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1238; -- Gamili Frosthide - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1239; -- First Mate Fitzsimmons - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1240; -- Boran Ironclink - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1241; -- Tognus Flintfire - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1242; -- Karl Boran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1243; -- Hegnar Rumbleshot - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1244; -- Rethiel the Greenwarden - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1245; -- Kogan Forgestone - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1246; -- Vosur Brakthel - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1247; -- Innkeeper Belm - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1249; -- Quartermaster Hudson - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1250; -- Drake Lindgren - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1251; -- Splinter Fist Firemonger - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1252; -- Senir Whitebeard - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1253; -- Father Gavin - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1254; -- Foreman Stonebrow - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1255; -- Prospector Gehn - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1256; -- Quarrymaster Thesten - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1257; -- Keldric Boucher - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1258; -- Black Ravager Mastiff - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1259; -- Gobbler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=1260; -- Great Father Arctikus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1261; -- Veron Amberstill - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1263; -- Yarlyn Amberstill - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1263; -- Yarlyn Amberstill - speed run was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1265; -- Rudra Amberstill - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1267; -- Ragnar Thunderbrew - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1268; -- Ozzie Togglevolt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1269; -- Razzle Sprysprocket - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1270; -- Fetid Corpse - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1273; -- Grawn Thromwyn - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1274; -- Senator Barin Redstone - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1275; -- Kyra Boucher - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1276; -- Mountaineer Brokk - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1277; -- Mountaineer Ganin - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1278; -- Mountaineer Stenn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1279; -- Mountaineer Flint - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=1279; -- Mountaineer Flint - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1280; -- Mountaineer Droken - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1281; -- Mountaineer Zaren - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1282; -- Mountaineer Veek - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1283; -- Mountaineer Kalmir - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1285; -- Thurman Mullby - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1286; -- Edna Mullby - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1287; -- Marda Weller - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1289; -- Gunther Weller - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1291; -- Carla Granger - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1292; -- Maris Granger - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1294; -- Aldric Moore - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1295; -- Lara Moore - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1296; -- Felder Stover - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1297; -- Lina Stover - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1298; -- Frederick Stover - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1299; -- Lisbeth Schneider - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1300; -- Lawrence Schneider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1301; -- Julia Gallina - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1302; -- Bernard Gump - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1303; -- Felicia Gump - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1304; -- Darian Singh - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1305; -- Jarel Moor - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1307; -- Charys Yserian - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1308; -- Owen Vaughn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1309; -- Wynne Larson - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1310; -- Evan Larson - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1311; -- Joachim Brenlow - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1312; -- Ardwyn Cailen - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1313; -- Maria Lumere - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1314; -- Duncan Cullen - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1315; -- Allan Hafgan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1317; -- Lucan Cordell - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1318; -- Jessara Cordell - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1319; -- Bryan Cross - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1320; -- Seoman Griffith - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1321; -- Alyssa Griffith - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1322; -- Maxton Strang - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1323; -- Osric Strang - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1324; -- Heinrich Stone - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1325; -- Jasper Fel - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1326; -- Sloan McCoy - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1327; -- Reese Langston - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1328; -- Elly Langston - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1329; -- Mountaineer Naarh - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1330; -- Mountaineer Tyraw - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1331; -- Mountaineer Luxst - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1332; -- Mountaineer Morran - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1333; -- Gerik Koen - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1334; -- Mountaineer Hammerfall - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1335; -- Mountaineer Yuttha - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1336; -- Mountaineer Zwarn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1337; -- Mountaineer Gwarth - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1338; -- Mountaineer Dalk - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1339; -- Mayda Thane - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1340; -- Mountaineer Kadrell - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1341; -- Wilhelm Strang - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1342; -- Mountaineer Rockgar - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1343; -- Mountaineer Stormpike - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1346; -- Georgio Bolero - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1347; -- Alexandra Bolero - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1348; -- Gregory Ardus - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1349; -- Agustus Moulaine - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1350; -- Theresa Moulaine - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1351; -- Brother Cassius - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1352; -- Fluffy - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1352; -- Fluffy - speed run was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1354; -- Apprentice Soren - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1355; -- Cook Ghilm - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1356; -- Prospector Stormpike - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1358; -- Miner Grothor - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1360; -- Miner Grumnal - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1362; -- Gothor Brumn - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1366; -- Adam - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1367; -- Billy - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1368; -- Justin - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1370; -- Brandon - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1371; -- Roman - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1373; -- Jarven Thunderbrew - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1374; -- Rejold Barleybrew - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1375; -- Marleth Barleybrew - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1376; -- Beldin Steelgrill - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1377; -- Pilot Stonegear - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1378; -- Pilot Bellowfiz - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1381; -- Krakk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1382; -- Mudduk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1383; -- Snarl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1385; -- Brawn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1386; -- Rogvar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1387; -- Thysta - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1395; -- Ol' Beasley - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1397; -- Frostmane Seer - speed walk was 0.77
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1397; -- Frostmane Seer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=1399; -- Magosh - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1400; -- Wetlands Crocolisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1402; -- Topper McNabb - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1404; -- Kragg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1405; -- Morris Lawry - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1407; -- Sranda - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1411; -- Ian Strom - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1412; -- Squirrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1413; -- Janey Anship - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1414; -- Lisan Pierce - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1415; -- Suzanne - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1416; -- Grimand Elmore - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1417; -- Young Wetlands Crocolisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1418; -- Bluegill Raider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1419; -- Fizzles - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1419; -- Fizzles - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1420; -- Toad - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1420; -- Toad - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1422; -- Corporal Sethman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1423; -- Stormwind Guard - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1424; -- Master Digger - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.83 WHERE  `entry`=1425; -- Grizlak - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1426; -- Riverpaw Miner - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1426; -- Riverpaw Miner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1427; -- Harlan Bagley - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1428; -- Rema Schneider - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1429; -- Thurman Schneider - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1430; -- Tomas - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1431; -- Suzetta Gallina - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1432; -- Renato Gallina - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1433; -- Corbett Schneider - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1434; -- Menethil Sentry - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1435; -- Zardeth of the Black Claw - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1436; -- Watcher Cutford - speed walk was 1.13
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1437; -- Thomas Booker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1439; -- Lord Baurles K. Wishock - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1440; -- Milton Sheaf - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1441; -- Brak Durnad - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1442; -- Helgrum the Swift - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1443; -- Fel'zerul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1444; -- Brother Kristoff - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1445; -- Jesse Halloran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1446; -- Regina Halloran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1447; -- Gimlok Rumdnul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1448; -- Neal Allen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1449; -- Witch Doctor Unbagwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1450; -- Brahnmar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1451; -- Camerick Jongleur - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1452; -- Gruham Rumdnul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1453; -- Dewin Shimmerdawn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1454; -- Jennabink Powerseam - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1456; -- Kersok Prond - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1457; -- Samor Festivus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1458; -- Telurinon Moonshadow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1459; -- Naela Trance - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1460; -- Unger Statforth - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1461; -- Murndan Derth - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1462; -- Edwina Monzor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1463; -- Falkan Armonis - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1464; -- Innkeeper Helbrek - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1465; -- Drac Roughcut - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1466; -- Gretta Finespindle - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1469; -- Vrok Blunderblast - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1470; -- Ghak Healtouch - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1471; -- Jannos Ironwill - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1472; -- Morgg Stormshot - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1473; -- Kali Healtouch - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1474; -- Rann Flamespinner - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=2.19 WHERE  `entry`=1475; -- Menethil Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1476; -- Hargin Mundar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1477; -- Christoph Faral - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1478; -- Aedis Brom - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1479; -- Timothy Clark - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1480; -- Caitlin Grassman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1481; -- Bart Tidewater - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1482; -- Andrea Halloran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1483; -- Murphy West - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1484; -- Derina Rumdnul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1488; -- Zanzil Zombie - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1489; -- Zanzil Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=1494; -- Negolash - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1495; -- Deathguard Linnea - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1496; -- Deathguard Dillinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1497; -- Gunther Arcanus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1498; -- Bethor Iceshard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1499; -- Magistrate Sevren - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1500; -- Coleman Farthing - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1501; -- Mindless Zombie - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1501; -- Mindless Zombie - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1502; -- Wretched Zombie - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1502; -- Wretched Zombie - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1504; -- Young Night Web Spider - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1504; -- Young Night Web Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1505; -- Night Web Spider - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1505; -- Night Web Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1506; -- Scarlet Convert - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1506; -- Scarlet Convert - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1508; -- Young Scavenger - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1508; -- Young Scavenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1509; -- Ragged Scavenger - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1509; -- Ragged Scavenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1512; -- Duskbat - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1512; -- Duskbat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1513; -- Mangy Duskbat - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1513; -- Mangy Duskbat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1515; -- Executor Zygand - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=1515; -- Executor Zygand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1516; -- Konda - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1518; -- Apothecary Johaan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1519; -- Deathguard Simmer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1520; -- Rattlecage Soldier - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1520; -- Rattlecage Soldier - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1521; -- Gretchen Dedmar - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1522; -- Darkeye Bonecaster - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1522; -- Darkeye Bonecaster - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1523; -- Cracked Skull Soldier - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1523; -- Cracked Skull Soldier - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1525; -- Rotting Dead - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1525; -- Rotting Dead - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1526; -- Ravaged Corpse - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1526; -- Ravaged Corpse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1527; -- Hungering Dead - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1527; -- Hungering Dead - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1528; -- Shambling Horror - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1528; -- Shambling Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1529; -- Bleeding Horror - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1529; -- Bleeding Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1530; -- Rotting Ancestor - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1531; -- Lost Soul - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1531; -- Lost Soul - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1532; -- Wandering Spirit - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1534; -- Wailing Ancestor - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1534; -- Wailing Ancestor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1535; -- Scarlet Warrior - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1535; -- Scarlet Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1536; -- Scarlet Missionary - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1536; -- Scarlet Missionary - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1537; -- Scarlet Zealot - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1537; -- Scarlet Zealot - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1538; -- Scarlet Friar - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1538; -- Scarlet Friar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1540; -- Scarlet Vanguard - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1543; -- Vile Fin Puddlejumper - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1544; -- Vile Fin Minor Oracle - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1544; -- Vile Fin Minor Oracle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1545; -- Vile Fin Muckdweller - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1545; -- Vile Fin Muckdweller - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1547; -- Decrepit Darkhound - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1547; -- Decrepit Darkhound - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1548; -- Cursed Darkhound - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1548; -- Cursed Darkhound - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1549; -- Ravenous Darkhound - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1549; -- Ravenous Darkhound - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1550; -- Thrashtail Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1551; -- Ironjaw Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=1552; -- Scale Belly - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1553; -- Greater Duskbat - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1553; -- Greater Duskbat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1554; -- Vampiric Duskbat - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1554; -- Vampiric Duskbat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1555; -- Vicious Night Web Spider - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1555; -- Vicious Night Web Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1560; -- Yvette Farthing - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1568; -- Undertaker Mordo - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1569; -- Shadow Priest Sarvis - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1570; -- Executor Arren - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1571; -- Shellei Brondir - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1632; -- Adele Fielder - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1645; -- Quartermaster Hicks - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1646; -- Baros Alexston - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1650; -- Terry Palin - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1651; -- Lee Brown - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1652; -- Deathguard Burgess - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1655; -- Nissa Agamand - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1655; -- Nissa Agamand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1657; -- Devlin Agamand - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1657; -- Devlin Agamand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1658; -- Captain Dargol - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1661; -- Novice Elreth - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1662; -- Captain Perrine - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1662; -- Captain Perrine - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1664; -- Captain Vachon - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1668; -- William MacGregor - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1669; -- Defias Profiteer - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1670; -- Mike Miller - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1671; -- Lamar Veisilli - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1672; -- Lohgan Eva - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1673; -- Alyssa Eva - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1674; -- Rot Hide Gnoll - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1674; -- Rot Hide Gnoll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1675; -- Rot Hide Mongrel - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1675; -- Rot Hide Mongrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1676; -- Finbus Geargrind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1678; -- Vernon Hale - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1679; -- Avarus Kharag - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1680; -- Matthew Hooper - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1681; -- Brock Stoneseeker - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1682; -- Yanni Stoutheart - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1683; -- Warg Deepwater - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1684; -- Khara Deepwater - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1688; -- Night Web Matriarch - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1688; -- Night Web Matriarch - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1689; -- Scarred Crag Boar - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1689; -- Scarred Crag Boar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1690; -- Thrawn Boltar - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1691; -- Kreg Bilmn - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1692; -- Golorn Frostbeard - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1693; -- Loch Crocolisk - speed walk was 0.84
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1694; -- Loslor Rudge - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1695; -- Rendow - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1697; -- Keeg Gibn - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1698; -- Frast Dokner - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1699; -- Gremlock Pilsnor - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1700; -- Paxton Ganter - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1701; -- Dank Drizzlecut - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1702; -- Bronk Guzzlegear - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1703; -- Uthrar Threx - speed walk was 1.04
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=1713; -- Elder Shadowmaw Panther - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1718; -- Rockjaw Raider - speed walk was 0.64
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1718; -- Rockjaw Raider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1719; -- Warden Thelwater - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=1720; -- Bruegal Ironknuckle - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1721; -- Nikova Raskol - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1725; -- Defias Watchman - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1726; -- Defias Magician - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1727; -- Defias Worker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1733; -- Zggi - speed walk was 0.47
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1735; -- Deathguard Abraham - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1736; -- Deathguard Randolph - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1736; -- Deathguard Randolph - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1737; -- Deathguard Oliver - speed walk was 1.23
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1737; -- Deathguard Oliver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1738; -- Deathguard Terrence - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1739; -- Deathguard Phillip - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1739; -- Deathguard Phillip - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1740; -- Deathguard Saltain - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1740; -- Deathguard Saltain - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1741; -- Deathguard Bartrand - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1741; -- Deathguard Bartrand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1742; -- Deathguard Bartholomew - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1743; -- Deathguard Lawrence - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1744; -- Deathguard Mort - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1745; -- Deathguard Morris - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1746; -- Deathguard Cyrus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1747; -- Anduin Wrynn - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=1748; -- Highlord Bolvar Fordragon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1751; -- Mithras Ironhill - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1752; -- Caledra Dawnbreeze - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1753; -- Maggot Eye - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1753; -- Maggot Eye - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1754; -- Lord Gregor Lescovar - speed walk was 1.13
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1765; -- Worg - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1766; -- Mottled Worg - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1767; -- Vile Fin Shredder - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1768; -- Vile Fin Tidehunter - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1769; -- Moonrage Whitescalp - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1770; -- Moonrage Darkrunner - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1770; -- Moonrage Darkrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1772; -- Rot Hide Gladerunner - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=1772; -- Rot Hide Gladerunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1773; -- Rot Hide Mystic - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1775; -- Zun'dartha - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1776; -- Magtoor - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=1776; -- Magtoor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1777; -- Dakk Blunderblast - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1778; -- Ferocious Grizzled Bear - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1779; -- Moonrage Glutton - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1782; -- Moonrage Darksoul - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1783; -- Skeletal Flayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1784; -- Skeletal Sorcerer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1785; -- Skeletal Terror - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1787; -- Skeletal Executioner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1788; -- Skeletal Warlord - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1789; -- Skeletal Acolyte - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1791; -- Slavering Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1793; -- Rotting Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1794; -- Soulless Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1795; -- Searing Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1796; -- Freezing Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1797; -- Giant Grizzled Bear - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=1800; -- Cold Wraith - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=1801; -- Blood Wraith - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1802; -- Hungering Wraith - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1804; -- Wailing Death - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1805; -- Flesh Golem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1806; -- Vile Slime - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=1809; -- Carrion Vulture - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=1809; -- Carrion Vulture - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1812; -- Rotting Behemoth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1816; -- Diseased Grizzly - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1817; -- Diseased Wolf - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1821; -- Carrion Lurker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1822; -- Venom Mist Lurker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1824; -- Plague Lurker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1826; -- Scarlet Mage - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1831; -- Scarlet Hunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1833; -- Scarlet Knight - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1835; -- Scarlet Invoker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=1837; -- Scarlet Judge - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=1838; -- Scarlet Interrogator - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=1839; -- Scarlet High Clerist - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=1840; -- Grand Inquisitor Isillien - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=1841; -- Scarlet Executioner - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=1842; -- Highlord Taelan Fordring - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=1842; -- Highlord Taelan Fordring - speed run was 1.34286
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=1843; -- Foreman Jerris - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=1844; -- Foreman Marcrid - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=1851; -- The Husk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1852; -- Araj the Summoner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1854; -- High Priest Thel'danis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1855; -- Tirion Fordring - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1860; -- Voidwalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1865; -- Ravenclaw Raider - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1866; -- Ravenclaw Slave - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1867; -- Dalaran Apprentice - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1868; -- Ravenclaw Servant - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1869; -- Ravenclaw Champion - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=1870; -- Hand of Ravenclaw - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1872; -- Tharek Blackstone - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1884; -- Scarlet Lumberjack - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=1885; -- Scarlet Smith - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1888; -- Dalaran Watcher - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1889; -- Dalaran Wizard - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1890; -- Rattlecage Skeleton - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1890; -- Rattlecage Skeleton - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1891; -- Pyrewood Watcher - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1894; -- Pyrewood Sentry - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1896; -- Moonrage Elder - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1901; -- Kelstrum Stonebreaker - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1908; -- Vile Fin Oracle - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1909; -- Vile Fin Lakestalker - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1910; -- Muad - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1910; -- Muad - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1912; -- Dalaran Protector - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1913; -- Dalaran Warder - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1914; -- Dalaran Mage - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1916; -- Stephen Bhartec - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1916; -- Stephen Bhartec - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1917; -- Daniel Ulfman - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1917; -- Daniel Ulfman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1918; -- Karrel Grayves - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1918; -- Karrel Grayves - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1919; -- Samuel Fipps - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1919; -- Samuel Fipps - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1921; -- Combat Dummy - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=1921; -- Combat Dummy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1922; -- Gray Forest Wolf - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1922; -- Gray Forest Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1923; -- Bloodsnout Worg - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1924; -- Moonrage Bloodhowler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1931; -- Captured Scarlet Zealot - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1933; -- Sheep - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1933; -- Sheep - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1934; -- Tirisfal Farmer - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1934; -- Tirisfal Farmer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1935; -- Tirisfal Farmhand - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1935; -- Tirisfal Farmhand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1936; -- Farmer Solliden - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=1936; -- Farmer Solliden - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1937; -- Apothecary Renferrel - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1938; -- Dalar Dawnweaver - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1939; -- Rot Hide Brute - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1940; -- Rot Hide Plague Weaver - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1941; -- Rot Hide Graverobber - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1941; -- Rot Hide Graverobber - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=1943; -- Raging Rot Hide - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1949; -- Servant of Azora - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1950; -- Rane Yorick - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1951; -- Quinn Yorick - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1952; -- High Executor Hadrec - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1953; -- Lake Skulker - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1954; -- Elder Lake Skulker - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1955; -- Lake Creeper - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=1956; -- Elder Lake Creeper - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1957; -- Vile Fin Shorecreeper - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1958; -- Vile Fin Tidecaller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1959; -- Mountaineer Barleybrew - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1960; -- Pilot Hammerfoot - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1963; -- Vidra Hearthstove - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1965; -- Mountaineer Thalos - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=1971; -- Ivar the Foul - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1975; -- Eastvale Lumberjack - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1977; -- Senator Mehr Stonehallow - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1983; -- Nightlash - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1984; -- Young Thistle Boar - speed walk was 0.55
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1984; -- Young Thistle Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1985; -- Thistle Boar - speed walk was 0.68
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1985; -- Thistle Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1986; -- Webwood Spider - speed walk was 1.12
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1986; -- Webwood Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1988; -- Grell - speed walk was 0.78
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1988; -- Grell - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1989; -- Grellkin - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1989; -- Grellkin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1992; -- Tarindrella - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1994; -- Githyiss the Vile - speed walk was 0.65
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1994; -- Githyiss the Vile - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1995; -- Strigid Owl - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1996; -- Strigid Screecher - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1997; -- Strigid Hunter - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1998; -- Webwood Lurker - speed walk was 0.51
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1998; -- Webwood Lurker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=1999; -- Webwood Venomfang - speed walk was 0.67
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=1999; -- Webwood Venomfang - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2000; -- Webwood Silkspinner - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2000; -- Webwood Silkspinner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2006; -- Gnarlpine Ursa - speed walk was 0.86
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2006; -- Gnarlpine Ursa - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2007; -- Gnarlpine Gardener - speed walk was 0.86
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2007; -- Gnarlpine Gardener - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2009; -- Gnarlpine Shaman - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2009; -- Gnarlpine Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2010; -- Gnarlpine Defender - speed walk was 1.06
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2010; -- Gnarlpine Defender - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2011; -- Gnarlpine Augur - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2011; -- Gnarlpine Augur - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2012; -- Gnarlpine Pathfinder - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2012; -- Gnarlpine Pathfinder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=2015; -- Bloodfeather Harpy - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2015; -- Bloodfeather Harpy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=2017; -- Bloodfeather Rogue - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2017; -- Bloodfeather Rogue - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=2018; -- Bloodfeather Sorceress - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2018; -- Bloodfeather Sorceress - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2022; -- Timberling - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2025; -- Timberling Bark Ripper - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2025; -- Timberling Bark Ripper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2027; -- Timberling Trampler - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2027; -- Timberling Trampler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2029; -- Timberling Mire Beast - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2029; -- Timberling Mire Beast - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2031; -- Young Nightsaber - speed walk was 0.63
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2031; -- Young Nightsaber - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2032; -- Mangy Nightsaber - speed walk was 0.64
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2032; -- Mangy Nightsaber - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=2041; -- Ancient Protector - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2042; -- Nightsaber - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2042; -- Nightsaber - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2043; -- Nightsaber Stalker - speed walk was 0.82
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2044; -- Forlorn Spirit - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2046; -- Andrew Krighton - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2050; -- Raleigh Andrean - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2055; -- Master Apothecary Faranell - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2060; -- Councilman Smithers - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2061; -- Councilman Thatcher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2062; -- Councilman Hendricks - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2063; -- Councilman Wilhelm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2064; -- Councilman Hartin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2065; -- Councilman Cooper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2066; -- Councilman Higarth - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2067; -- Councilman Brunswick - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2068; -- Lord Mayor Morrison - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2069; -- Moonstalker - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=2069; -- Moonstalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2070; -- Moonstalker Runt - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=2070; -- Moonstalker Runt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2071; -- Moonstalker Matriarch - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2077; -- Melithar Staghelm - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2078; -- Athridas Bearmantle - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2079; -- Conservator Ilthalaine - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2082; -- Gilshalan Windwalker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2083; -- Syral Bladeleaf - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2084; -- Natheril Raincaller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2086; -- Valstag Ironjaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2089; -- Giant Wetlands Crocolisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2090; -- Ma'ruk Wyrmscale - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2091; -- Chieftain Nek'rosh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2092; -- Pilot Longbeard - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2093; -- Einar Stonegrip - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2094; -- James Halloran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2096; -- Tarrel Rockweaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2097; -- Harlo Barnaby - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2098; -- Ram - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2098; -- Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2099; -- Maiden's Virtue Crewman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2102; -- Dragonmaw Grunt - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2103; -- Dragonmaw Scout - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2104; -- Captain Stoutfist - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2105; -- Mountaineer Dokkin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2108; -- Garneg Charskull - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2110; -- Black Rat - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=2110; -- Black Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2111; -- Sida - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2112; -- Farrin Daris - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2113; -- Archibald Kava - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2114; -- Faruza - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2115; -- Joshua Kien - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2116; -- Blacksmith Rand - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2117; -- Harold Raims - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2118; -- Abigail Shiel - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2119; -- Dannal Stern - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2121; -- Shadow Priest Allister - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2122; -- David Trias - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2123; -- Dark Cleric Duesten - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2124; -- Isabella - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2126; -- Maximillion - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2127; -- Rupert Boch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2128; -- Cain Firesong - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2129; -- Dark Cleric Beryl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2130; -- Marion Call - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2131; -- Austil de Mon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2132; -- Carolai Anise - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2134; -- Mrs. Winters - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2135; -- Abe Winters - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2136; -- Oliver Dwor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2137; -- Eliza Callen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2140; -- Edwin Harly - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2142; -- Watcher Callahan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2150; -- Zenn Foulhoof - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2151; -- Moon Priestess Amara - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=2151; -- Moon Priestess Amara - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2152; -- Gnarlpine Ambusher - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2152; -- Gnarlpine Ambusher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2153; -- Terl Arakor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.33 WHERE  `entry`=2159; -- Gravelflint Bonesnapper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2162; -- Agal - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2162; -- Agal - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2163; -- Thistle Bear - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2164; -- Rabid Thistle Bear - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2165; -- Grizzled Thistle Bear - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=2166; -- Oakenscowl - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2167; -- Blackwood Pathfinder - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=2167; -- Blackwood Pathfinder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2168; -- Blackwood Warrior - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=2168; -- Blackwood Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2169; -- Blackwood Totemic - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=2169; -- Blackwood Totemic - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2172; -- Strider Clutchmother - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2174; -- Coastal Frenzy - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2176; -- Cursed Highborne - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=2177; -- Writhing Highborne - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2181; -- Stormscale Myrmidon - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2182; -- Stormscale Sorceress - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2183; -- Stormscale Warrior - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2185; -- Darkshore Thresher - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2186; -- Carnivous the Breaker - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=2186; -- Carnivous the Breaker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2187; -- Elder Darkshore Thresher - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2189; -- Vile Sprite - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2190; -- Wild Grell - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.83 WHERE  `entry`=2191; -- Licillin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2198; -- Crier Goodman - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2201; -- Greymist Raider - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2202; -- Greymist Coastrunner - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=2202; -- Greymist Coastrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2203; -- Greymist Seer - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2204; -- Greymist Netter - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2205; -- Greymist Warrior - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2206; -- Greymist Hunter - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2207; -- Greymist Oracle - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2208; -- Greymist Tidehunter - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2209; -- Deathguard Gavin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2210; -- Deathguard Royann - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2211; -- Captured Mountaineer - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2212; -- Deth'ryll Satyr - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2214; -- Deathstalker Lesh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2215; -- High Executor Darthalia - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2216; -- Apothecary Lydon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2224; -- Wind Rider - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2225; -- Zora Guthrek - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2226; -- Karos Razok - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2227; -- Sharlindra - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2228; -- Lieutenant Farren Orinelle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2229; -- Krusk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2230; -- Umpi - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2231; -- Pygmy Tide Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2232; -- Tide Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2233; -- Encrusted Tide Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2234; -- Young Reef Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2235; -- Reef Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2236; -- Raging Reef Crawler - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2237; -- Moonstalker Sire - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2238; -- Tog'thar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2239; -- Drull - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2240; -- Syndicate Footpad - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2241; -- Syndicate Thief - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2242; -- Syndicate Spy - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2243; -- Syndicate Sentry - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2244; -- Syndicate Shadow Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2245; -- Syndicate Saboteur - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2247; -- Syndicate Enforcer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2248; -- Cave Yeti - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2249; -- Ferocious Yeti - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2252; -- Crushridge Ogre - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2253; -- Crushridge Brute - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=2258; -- Stone Fury - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2260; -- Syndicate Rogue - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2261; -- Syndicate Watchman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2263; -- Marshal Redpath - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2264; -- Hillsbrad Tailor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2265; -- Hillsbrad Apprentice Blacksmith - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2266; -- Hillsbrad Farmer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2267; -- Hillsbrad Peasant - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2268; -- Hillsbrad Footman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2269; -- Hillsbrad Miner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2270; -- Hillsbrad Sentry - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2271; -- Dalaran Shield Guard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2272; -- Dalaran Theurgist - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2276; -- Magistrate Henry Maleb - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2277; -- Loremaster Dibbs - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2278; -- Melisara - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2284; -- Captured Farmer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2285; -- Count Remington Ridgewell - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2299; -- Borgus Stoutarm - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=2302; -- Aethalas - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2303; -- Lyranne Feathersong - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2305; -- Foreman Bonds - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2307; -- Caretaker Caice - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2308; -- Andrew Brownell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2309; -- Thomas Arlento - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2310; -- Jamie Nore - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2311; -- Doreen Beltis - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2314; -- Sahvan Bloodshadow - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2315; -- Maquell Ebonwood - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2316; -- Gol'dir - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2318; -- Argus Shadow Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2319; -- Syndicate Wizard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2321; -- Foreststrider Fledgling - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2322; -- Foreststrider - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2323; -- Giant Foreststrider - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2324; -- Blackwood Windtalker - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=2324; -- Blackwood Windtalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2326; -- Thamner Pol - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2327; -- Shaina Fuller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2329; -- Michelle Belle - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2330; -- Karlee Chaddis - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2331; -- Paige Chaddis - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2334; -- Event Generator 001 - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2335; -- Magistrate Burnside - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2338; -- Twilight Disciple - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2339; -- Twilight Thug - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2347; -- Wild Gryphon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2348; -- Elder Moss Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2349; -- Giant Moss Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2350; -- Forest Moss Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2351; -- Gray Bear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2352; -- Innkeeper Anderson - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2354; -- Vicious Gray Bear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2356; -- Elder Gray Bear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2357; -- Merideth Carlson - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2358; -- Dalaran Summoner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=2359; -- Elemental Slave - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2360; -- Hillsbrad Farmhand - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2361; -- Tamara Armstrong - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2362; -- Hemmit Armstrong - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2363; -- Apprentice Honeywell - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2364; -- Neema - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2365; -- Bront Coldcleave - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2366; -- Barkeep Kelly - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2367; -- Donald Rabonne - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2368; -- Daggerspine Shorestalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2369; -- Daggerspine Shorehunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2370; -- Daggerspine Screamer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2371; -- Daggerspine Siren - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2372; -- Mudsnout Gnoll - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=2372; -- Mudsnout Gnoll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=2373; -- Mudsnout Shaman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2374; -- Torn Fin Muckdweller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2375; -- Torn Fin Coastrunner - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=2375; -- Torn Fin Coastrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2376; -- Torn Fin Oracle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2377; -- Torn Fin Tidehunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2378; -- Kundric Zanden - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2379; -- Caretaker Smithers - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2380; -- Nandar Branson - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2381; -- Micha Yance - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2382; -- Darren Malvew - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2383; -- Lindea Rabonne - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2384; -- Starving Mountain Lion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2385; -- Feral Mountain Lion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2386; -- Southshore Guard - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=2386; -- Southshore Guard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2387; -- Hillsbrad Councilman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2388; -- Innkeeper Shay - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2389; -- Zarise - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2390; -- Aranae Venomblood - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2391; -- Serge Hinott - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2392; -- Delia Verana - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2393; -- Christoph Jeffcoat - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2394; -- Mallen Swain - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2395; -- Vinna Wayne - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2396; -- Hans Zandin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2397; -- Derak Nightfall - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2398; -- Tara Coldgaze - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2399; -- Daryl Stack - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2400; -- Craig Hewitt - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2401; -- Kayren Soothallow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2402; -- Shara Blazen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2405; -- Tarren Mill Deathguard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2406; -- Mountain Lion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2407; -- Hulking Mountain Lion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2408; -- Snapjaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2410; -- Magus Wordeen Voidglare - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2411; -- Ricter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2412; -- Alina - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2414; -- Kegan Darkmar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2415; -- Warden Belamoore - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2418; -- Deathguard Samsa - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2419; -- Deathguard Humbert - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2425; -- Varimathras - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2427; -- Jailor Eston - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2428; -- Jailor Marlgen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2429; -- Novice Thaivand - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2430; -- Chef Jessen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2431; -- Jailor Borhuin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2432; -- Darla Harris - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=2433; -- Helcular's Remains - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2436; -- Farmer Kent - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2437; -- Keeper Bel'varil - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2438; -- Bartolo Ginsetti - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2439; -- Major Samuelson - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2440; -- Drunken Footpad - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2442; -- Cow - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2442; -- Cow - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2448; -- Clerk Horrace Whitesteed - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2450; -- Miner Hackett - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2451; -- Farmer Kalaba - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.58 WHERE  `entry`=2452; -- Skhowl - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2453; -- Lo'Grosh - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2455; -- Olivia Burnside - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2456; -- Newton Burnside - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2457; -- John Burnside - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2458; -- Randolph Montague - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2459; -- Mortimer Montague - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2460; -- Barnum Stonemantle - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2461; -- Bailey Stonemantle - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2464; -- Commander Aggro'gosh - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2465; -- Far Seer Mok'thardin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2466; -- Mountaineer Grugelm - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2468; -- Mountaineer Thar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2469; -- Mountaineer Rharen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2470; -- Watcher Fraizer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2473; -- Granistad - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2474; -- Kurdros - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2476; -- Large Loch Crocolisk - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=2477; -- Gradok - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=2478; -- Haren Swifthoof - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2481; -- Bliztik - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2482; -- Zarena Cromwind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2483; -- Jaquilina Dramet - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2485; -- Larimaine Purdue - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2486; -- Fin Fizracket - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2487; -- Fleet Master Seahorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2488; -- Deeg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2490; -- First Mate Crazz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2491; -- Whiskey Slim - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2492; -- Lexington Mortaim - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2493; -- Dizzy One-Eye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2494; -- Privateer Bloads - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2495; -- Drizzlik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2496; -- Baron Revilgaz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2497; -- Nimboya - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2498; -- Crank Fizzlebub - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2499; -- Markel Smythe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2500; -- Captain Hecklebury Smotts - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2501; -- "Sea Wolf" MacKinley - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2502; -- "Shaky" Phillipe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2503; -- Hillsbrad Foreman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2504; -- Donyal Tovald - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2505; -- Saltwater Snapjaw - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2506; -- Mountaineer Harn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2507; -- Mountaineer Uthan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2508; -- Mountaineer Wuar - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2509; -- Mountaineer Cragg - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2510; -- Mountaineer Ozmok - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2511; -- Mountaineer Bludd - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2512; -- Mountaineer Roghan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2513; -- Mountaineer Janha - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2514; -- Mountaineer Modax - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2515; -- Mountaineer Fazgard - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2516; -- Mountaineer Kamdar - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2517; -- Mountaineer Langarr - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2518; -- Mountaineer Swarth - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2519; -- Kin'weelay - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2522; -- Jaguero Stalker - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2524; -- Mountaineer Haggis - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2525; -- Mountaineer Barn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2526; -- Mountaineer Morlic - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2527; -- Mountaineer Angst - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2528; -- Mountaineer Haggil - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2529; -- Son of Arugal - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2530; -- Yenniku - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=2535; -- Maury "Club Foot" Wilkins - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=2536; -- Jon-Jon the Crow - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=2537; -- Chucky "Ten Thumbs" - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=2540; -- Dalaran Serpent - speed walk was 0.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2542; -- Catelyn the Blade - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2543; -- Archmage Ansirem Runeweaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2545; -- "Pretty Boy" Duncan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2546; -- Fleet Master Firallon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2552; -- Witherbark Troll - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2553; -- Witherbark Shadowcaster - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2554; -- Witherbark Axe Thrower - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2555; -- Witherbark Witch Doctor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2556; -- Witherbark Headhunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2557; -- Witherbark Shadow Hunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2558; -- Witherbark Berserker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2559; -- Highland Strider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2560; -- Highland Thrasher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2561; -- Highland Fleshstalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2562; -- Boulderfist Ogre - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2563; -- Plains Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2564; -- Boulderfist Enforcer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2565; -- Giant Plains Creeper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2566; -- Boulderfist Brute - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2567; -- Boulderfist Magus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2569; -- Boulderfist Mauler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2570; -- Boulderfist Shaman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2571; -- Boulderfist Lord - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2572; -- Drywhisker Kobold - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2577; -- Dark Iron Shadowcaster - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2578; -- Young Mesa Buzzard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2579; -- Mesa Buzzard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2580; -- Elder Mesa Buzzard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2581; -- Dabyrie Militia - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2582; -- Dabyrie Laborer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2583; -- Stromgarde Troll Hunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2584; -- Stromgarde Defender - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2585; -- Stromgarde Vindicator - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2586; -- Syndicate Highwayman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2587; -- Syndicate Pathstalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=2587; -- Syndicate Pathstalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2588; -- Syndicate Prowler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2589; -- Syndicate Mercenary - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2590; -- Syndicate Conjuror - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2591; -- Syndicate Magus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=2592; -- Rumbling Exile - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2594; -- Sprogger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2595; -- Daggerspine Raider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2596; -- Daggerspine Sorceress - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2597; -- Lord Falconcrest - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.61 WHERE  `entry`=2598; -- Darbel Montrose - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2599; -- Otto - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2600; -- Singer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.67 WHERE  `entry`=2601; -- Foulbelly - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.59 WHERE  `entry`=2604; -- Molok the Crusher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.61 WHERE  `entry`=2605; -- Zalas Witherbark - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2606; -- Nimar the Slayer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2607; -- Prince Galen Trollbane - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2608; -- Commander Amaren - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2610; -- Shakes O'Breen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=2611; -- Fozruk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2612; -- Lieutenant Valorcall - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2612; -- Lieutenant Valorcall - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2616; -- Privateer Groy - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2618; -- Hammerfall Peon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2619; -- Hammerfall Grunt - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2620; -- Prairie Dog - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2620; -- Prairie Dog - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2621; -- Hammerfall Guardian - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2622; -- Sly Garrett - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=2623; -- Spirit of Old - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2624; -- Gazban - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2625; -- Viznik Goldgrubber - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2626; -- Old Man Heming - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2627; -- Grarnik Goodstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2628; -- Dalaran Worker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2630; -- Earthbind Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=2630; -- Earthbind Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2636; -- Blackwater Deckhand - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2639; -- Vilebranch Axe Thrower - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2640; -- Vilebranch Witch Doctor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2641; -- Vilebranch Headhunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2642; -- Vilebranch Shadowcaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2643; -- Vilebranch Berserker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2644; -- Vilebranch Hideskinner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2645; -- Vilebranch Shadow Hunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2646; -- Vilebranch Blood Drinker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2647; -- Vilebranch Soul Eater - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2648; -- Vilebranch Aman'zasi Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2649; -- Witherbark Scalper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2650; -- Witherbark Zealot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2651; -- Witherbark Hideskinner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2652; -- Witherbark Venomblood - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2653; -- Witherbark Sadist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2654; -- Witherbark Caller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2655; -- Green Sludge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2656; -- Jade Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2657; -- Trained Razorbeak - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=2657; -- Trained Razorbeak - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2658; -- Razorbeak Gryphon - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=2658; -- Razorbeak Gryphon - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2659; -- Razorbeak Skylord - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=2659; -- Razorbeak Skylord - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2663; -- Narkk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2664; -- Kelsey Yance - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2668; -- Danielle Zipstitch - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2669; -- Sheri Zipstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2670; -- Xizk Goodstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2671; -- Mechanical Squirrel - speed walk was 1.29
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2672; -- Cowardly Crosby - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=2673; -- Target Dummy - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2679; -- Wenna Silkbeard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2680; -- Vilebranch Wolf Pup - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2681; -- Vilebranch Raiding Wolf - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2681; -- Vilebranch Raiding Wolf - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2682; -- Fradd Swiftgear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2685; -- Mazk Snipeshot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2686; -- Witherbark Broodguard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2687; -- Gnaz Blunderflame - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2691; -- Highvale Outrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=2691; -- Highvale Outrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2692; -- Highvale Scout - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2693; -- Highvale Marksman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2694; -- Highvale Ranger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2695; -- Sara Balloo - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2696; -- Foggy MacKreel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2697; -- Clyde Ranthal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2698; -- George Candarte - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2699; -- Rikqiz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2700; -- Captain Nials - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2703; -- Zengu - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2704; -- Hanashi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2705; -- Brewmeister Bilger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2706; -- Tor'gan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=2707; -- Shadra - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2708; -- Archmage Malin - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2711; -- Phin Odelic - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2712; -- Quae - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2713; -- Kinelory - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=2713; -- Kinelory - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2714; -- Forsaken Courier - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2719; -- Dustbelcher Lord - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2720; -- Dustbelcher Ogre Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2721; -- Forsaken Bodyguard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2727; -- Crag Coyote - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2729; -- Elder Crag Coyote - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2731; -- Ridge Stalker - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2732; -- Ridge Huntress - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2732; -- Ridge Huntress - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2733; -- Apothecary Jorell - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2734; -- Ridge Stalker Patriarch - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=2735; -- Lesser Rock Elemental - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=2736; -- Greater Rock Elemental - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2737; -- Durtham Greldon - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2738; -- Stromgarde Cavalryman - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=2738; -- Stromgarde Cavalryman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2742; -- Shadowforge Chanter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2743; -- Shadowforge Warrior - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.62 WHERE  `entry`=2744; -- Shadowforge Commander - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=15546; -- Hive'Zara Swarmer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.27 WHERE  `entry`=2749; -- Siege Golem - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.59 WHERE  `entry`=2751; -- War Golem - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=2753; -- Barnabus - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2753; -- Barnabus - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=2.17 WHERE  `entry`=2754; -- Anathemus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=2755; -- Myzrael - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=2757; -- Blacklash - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=2759; -- Hematus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2760; -- Burning Exile - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2761; -- Cresting Exile - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=2761; -- Cresting Exile - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2762; -- Thundering Exile - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=2763; -- Thenan - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2764; -- Sleeby - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2765; -- Znort - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2766; -- Lolo the Lookout - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2767; -- First Mate Nilzlix - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2768; -- Professor Phizzlethorpe - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2769; -- Captain Steelgut - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2770; -- Tallow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2771; -- Drum Fel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2772; -- Korin Fel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2773; -- Or'Kalar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2774; -- Doctor Draxlegauge - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=2775; -- Daggerspine Marauder - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2778; -- Deckhand Moishe - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2780; -- Caretaker Nevlin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2781; -- Caretaker Weston - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2782; -- Caretaker Alaric - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2783; -- Marez Cowl - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2786; -- Gerrig Bonegrip - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2787; -- Zaruk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2788; -- Apprentice Kryten - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2789; -- Skuerto - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2790; -- Grand Mason Marblesten - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2792; -- Gor'mul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2793; -- Kor'gresh Coldrage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2795; -- Lenny "Fingers" McCoy - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2796; -- Faelyssa - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2798; -- Pand Stonebinder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=2801; -- Tresa MacGregor - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2803; -- Malygen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2804; -- Kurden Bloodclaw - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2805; -- Deneb Walker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2808; -- Vikki Lonsav - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2810; -- Hammon Karwn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2812; -- Drovnar Strongbrew - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2814; -- Narj Deepslice - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2816; -- Androd Fadran - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2818; -- Slagg - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2819; -- Tunkk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2820; -- Graud - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2821; -- Keena - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2829; -- Starving Buzzard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2831; -- Giant Buzzard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2832; -- Nixxrax Fillamug - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2834; -- Myizz Luckycatch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2835; -- Cedrik Prose - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2836; -- Brikk Keencraft - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2837; -- Jaxin Chong - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2838; -- Crazk Sparks - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2839; -- Haren Kanmae - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2840; -- Kizz Bluntstrike - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2842; -- Wigcik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2843; -- Jutak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2844; -- Hurklor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2845; -- Fargon Mortalak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2846; -- Blixrez Goodstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2847; -- Jansen Underwood - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2848; -- Glyx Brewright - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2849; -- Qixdi Goodstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=2850; -- Broken Tooth - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=2850; -- Broken Tooth - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2851; -- Urda - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2855; -- Snang - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2856; -- Angrun - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2857; -- Thund - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2858; -- Gringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2859; -- Gyll - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2861; -- Gorrik - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2878; -- Peria Lamenur - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2879; -- Karrina Mekenda - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2908; -- Grawl - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=16059; -- Theldren - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2911; -- Archaeologist Flagongut - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2912; -- Chief Archaeologist Greywhisker - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2913; -- Archaeologist Hollee - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2914; -- Snake - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2914; -- Snake - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2916; -- Historian Karnik - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2918; -- Advisor Belgrum - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2920; -- Lucien Tosselwrench - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2921; -- Lotwil Veriatus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2922; -- Servo - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2923; -- Mangy Silvermane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2924; -- Silvermane Wolf - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2925; -- Silvermane Howler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2926; -- Silvermane Stalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2927; -- Vicious Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2928; -- Primitive Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2929; -- Savage Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2930; -- Sentinel Glynda Nal'Shea - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2932; -- Magregan Deepshadow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2934; -- Keeper Bel'dugur - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.18 WHERE  `entry`=2937; -- Dagun the Ravenous - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2941; -- Lanie Reed - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2947; -- Harken Windtotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2948; -- Mull Thunderhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2952; -- Bristleback Quilboar - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2952; -- Bristleback Quilboar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2953; -- Bristleback Shaman - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2953; -- Bristleback Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2954; -- Bristleback Battleboar - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2954; -- Bristleback Battleboar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2955; -- Plainstrider - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2955; -- Plainstrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2956; -- Adult Plainstrider - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2957; -- Elder Plainstrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2958; -- Prairie Wolf - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2959; -- Prairie Stalker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2960; -- Prairie Wolf Alpha - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2961; -- Mountain Cougar - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2961; -- Mountain Cougar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=2964; -- Windfury Sorceress - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2964; -- Windfury Sorceress - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=2965; -- Windfury Matriarch - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2966; -- Battleboar - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2966; -- Battleboar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2967; -- Galak Centaur - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2967; -- Galak Centaur - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=2968; -- Galak Outrunner - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2968; -- Galak Outrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2969; -- Wiry Swoop - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=2969; -- Wiry Swoop - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2970; -- Swoop - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2970; -- Swoop - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2971; -- Taloned Swoop - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2971; -- Taloned Swoop - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2972; -- Kodo Calf - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2972; -- Kodo Calf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2973; -- Kodo Bull - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2974; -- Kodo Matriarch - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2976; -- Venture Co. Laborer - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2976; -- Venture Co. Laborer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2977; -- Venture Co. Taskmaster - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2977; -- Venture Co. Taskmaster - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2978; -- Venture Co. Worker - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2978; -- Venture Co. Worker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2979; -- Venture Co. Supervisor - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=2979; -- Venture Co. Supervisor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2980; -- Grull Hawkwind - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2981; -- Chief Hawkwind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.75 WHERE  `entry`=2983; -- The Plains Vision - speed walk was 1.8
UPDATE `creature_template` SET `speed_run`=0.75 WHERE  `entry`=2983; -- The Plains Vision - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2985; -- Ruul Eagletalon - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2986; -- Dorn Plainstalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2987; -- Eyahn Eagletalon - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2988; -- Morin Cloudstalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2991; -- Greatmother Hawkwind - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2993; -- Baine Bloodhoof - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2994; -- Ancestral Spirit - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2995; -- Tal - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2996; -- Torn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2997; -- Jyn Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2998; -- Karn Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2999; -- Taur Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3000; -- Gibbert - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3001; -- Brek Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3002; -- Kurm Stonehoof - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3003; -- Fyr Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3004; -- Tepa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3005; -- Mahu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3007; -- Una - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3008; -- Mak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3009; -- Bena Winterhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3010; -- Mani Winterhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3011; -- Teg Dawnstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3012; -- Nata Dawnstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3013; -- Komin Winterhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3014; -- Nida Winterhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3015; -- Kuna Thunderhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3016; -- Tand - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3017; -- Nan Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3018; -- Hogor Thunderhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3019; -- Delgo Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3020; -- Etu Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3021; -- Kard Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3022; -- Sunn Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3023; -- Sura Wildmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3024; -- Tah Winterhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3025; -- Kaga Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3026; -- Aska Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3027; -- Naal Mistrunner - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3028; -- Kah Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3029; -- Sewa Mistrunner - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3030; -- Siln Skychaser - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3031; -- Tigor Skychaser - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3032; -- Beram Skychaser - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3033; -- Turak Runetotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3034; -- Sheal Runetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3035; -- Flatland Cougar - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3035; -- Flatland Cougar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3036; -- Kym Wildmane - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3037; -- Sheza Wildmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3038; -- Kary Thunderhorn - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3039; -- Holt Thunderhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3040; -- Urek Thunderhorn - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3041; -- Torm Ragetotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3042; -- Sark Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3043; -- Ker Ragetotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3044; -- Miles Welsh - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3045; -- Malakai Cross - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3046; -- Father Cobb - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3047; -- Archmage Shymm - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3048; -- Ursyn Ghull - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3049; -- Thurston Xane - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3050; -- Veren Tallstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3052; -- Skorn Whitecloud - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3053; -- Synge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3054; -- Zarlman Two-Moons - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3055; -- Maur Raincaller - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3058; -- Arra'chea - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3059; -- Harutt Thunderhorn - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3060; -- Gart Mistrunner - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3061; -- Lanka Farshot - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3062; -- Meela Dawnstrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3063; -- Krang Stonehoof - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3064; -- Gennia Runetotem - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3065; -- Yaw Sharpmane - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3066; -- Narm Skychaser - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3067; -- Pyall Silentstride - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3068; -- Mazzranache - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3068; -- Mazzranache - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3069; -- Chaw Stronghide - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3072; -- Kawnie Softbreeze - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3073; -- Marjak Keenblade - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3074; -- Varia Hardhide - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3075; -- Bronk Steelrage - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3076; -- Moorat Longstride - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3077; -- Mahnott Roughwound - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3078; -- Kennah Hawkseye - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3079; -- Varg Windwhisper - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3080; -- Harant Ironbrace - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3081; -- Wunna Darkmane - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3085; -- Gloria Femmel - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3086; -- Gretchen Vogel - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3087; -- Crystal Boughman - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3088; -- Henry Chapal - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3089; -- Sherman Femmel - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3090; -- Gerald Crawley - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3091; -- Franklin Hamar - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3092; -- Tagain - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3093; -- Grod - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=3094; -- Unseen - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3095; -- Fela - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3096; -- Captured Servant of Azora - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3097; -- Bernard Brubaker - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3098; -- Mottled Boar - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3098; -- Mottled Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3099; -- Dire Mottled Boar - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3099; -- Dire Mottled Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3100; -- Elder Mottled Boar - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3100; -- Elder Mottled Boar - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3101; -- Vile Familiar - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3101; -- Vile Familiar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3102; -- Felstalker - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3102; -- Felstalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3103; -- Makrura Clacker - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3103; -- Makrura Clacker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3104; -- Makrura Shellhide - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3104; -- Makrura Shellhide - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3105; -- Makrura Snapclaw - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3105; -- Makrura Snapclaw - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3106; -- Pygmy Surf Crawler - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3106; -- Pygmy Surf Crawler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3107; -- Surf Crawler - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3107; -- Surf Crawler - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3108; -- Encrusted Surf Crawler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3110; -- Dreadmaw Crocolisk - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3113; -- Razormane Dustrunner - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3113; -- Razormane Dustrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3114; -- Razormane Battleguard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3115; -- Dustwind Harpy - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3115; -- Dustwind Harpy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3116; -- Dustwind Pillager - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3116; -- Dustwind Pillager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3117; -- Dustwind Savage - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3117; -- Dustwind Savage - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3118; -- Dustwind Storm Witch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3121; -- Durotar Tiger - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3122; -- Bloodtalon Taillasher - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3122; -- Bloodtalon Taillasher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3123; -- Bloodtalon Scythemaw - speed walk was 0.96
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3123; -- Bloodtalon Scythemaw - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3124; -- Scorpid Worker - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3124; -- Scorpid Worker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3125; -- Clattering Scorpid - speed walk was 0.92
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3125; -- Clattering Scorpid - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3126; -- Armored Scorpid - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3126; -- Armored Scorpid - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3127; -- Venomtail Scorpid - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3130; -- Thunder Lizard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3133; -- Herble Baubbletump - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3134; -- Kzixx - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3135; -- Malissa - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3136; -- Clarise Gnarltree - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3137; -- Matt Johnson - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3138; -- Scott Carevin - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3139; -- Gar'Thok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3140; -- Lar Prowltusk - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3142; -- Orgnil Soulscar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3143; -- Gornek - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3144; -- Eitrigg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3145; -- Zureetha Fargaze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3149; -- Nez'raz - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3149; -- Nez'raz - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3150; -- Hin Denburg - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3153; -- Frang - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3154; -- Jen'shan - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3155; -- Rwag - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3156; -- Nartok - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3157; -- Shikrik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3158; -- Duokna - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3159; -- Kzan Thornslash - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3160; -- Huklah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3161; -- Rarc - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3162; -- Burdrak Harglhelm - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3163; -- Uhgar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3164; -- Jark - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3165; -- Ghrawt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3166; -- Cutac - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3167; -- Wuark - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3168; -- Flakk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3169; -- Tarshaw Jaggedscar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3170; -- Kaplak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3171; -- Thotar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3172; -- Dhugru Gorelust - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3173; -- Swart - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3174; -- Dwukk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3175; -- Krunn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3177; -- Turuk Amberstill - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3178; -- Stuart Fleming - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3179; -- Harold Riggs - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3181; -- Fremal Doohickey - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3182; -- Junder Brokk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3183; -- Yarrog Baneshadow - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3184; -- Miao'zan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3185; -- Mishiki - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3186; -- K'waii - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3187; -- Tai'tasi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3188; -- Master Gadrin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3189; -- Kor'ghan - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3190; -- Rhinag - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3191; -- Cook Torka - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3194; -- Vel'rin Fang - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3195; -- Burning Blade Thug - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3195; -- Burning Blade Thug - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3197; -- Burning Blade Fanatic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3206; -- Voodoo Troll - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3206; -- Voodoo Troll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3207; -- Hexed Troll - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=3207; -- Hexed Troll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3209; -- Brave Windfeather - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3212; -- Brave Ironhorn - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3215; -- Brave Strongbash - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3216; -- Neeru Fireblade - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3217; -- Brave Dawneagle - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3218; -- Brave Swiftwind - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3219; -- Brave Leaping Deer - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3220; -- Brave Darksky - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3221; -- Brave Rockhorn - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3222; -- Brave Wildrunner - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3223; -- Brave Rainchaser - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3224; -- Brave Cloudmane - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3229; -- "Squealer" Thornmantle - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3229; -- "Squealer" Thornmantle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3230; -- Nazgrel - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3232; -- Bristleback Interloper - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3232; -- Bristleback Interloper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3233; -- Lorekeeper Raintotem - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3234; -- Lost Barrens Kodo - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3235; -- Greater Barrens Kodo - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3236; -- Barrens Kodo - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3237; -- Wooly Kodo - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3238; -- Stormhide - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3239; -- Thunderhead - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3240; -- Stormsnout - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3241; -- Savannah Patriarch - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3241; -- Savannah Patriarch - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3242; -- Zhevra Runner - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=3242; -- Zhevra Runner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3243; -- Savannah Highmane - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3243; -- Savannah Highmane - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3244; -- Greater Plainstrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3245; -- Ornery Plainstrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3246; -- Fleeting Plainstrider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3247; -- Thunderhawk Hatchling - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3248; -- Barrens Giraffe - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3249; -- Greater Thunderhawk - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3249; -- Greater Thunderhawk - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3250; -- Silithid Creeper - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3251; -- Silithid Grub - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3252; -- Silithid Swarmer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=3253; -- Silithid Harvester - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3254; -- Sunscale Lashtail - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3255; -- Sunscale Screecher - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3256; -- Sunscale Scytheclaw - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3258; -- Bristleback Hunter - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3260; -- Bristleback Water Seeker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3261; -- Bristleback Thornweaver - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3263; -- Bristleback Geomancer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3265; -- Razormane Hunter - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3266; -- Razormane Defender - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3267; -- Razormane Water Seeker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3268; -- Razormane Thornweaver - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3269; -- Razormane Geomancer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3271; -- Razormane Mystic - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3272; -- Kolkar Wrangler - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3273; -- Kolkar Stormer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3274; -- Kolkar Pack Runner - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3275; -- Kolkar Marauder - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3276; -- Witchwing Harpy - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3277; -- Witchwing Roguefeather - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3278; -- Witchwing Slayer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3279; -- Witchwing Ambusher - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3280; -- Witchwing Windcaller - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3281; -- Sarkoth - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3281; -- Sarkoth - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3282; -- Venture Co. Mercenary - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3283; -- Venture Co. Enforcer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3284; -- Venture Co. Drudger - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3285; -- Venture Co. Peon - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3286; -- Venture Co. Overseer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3287; -- Hana'zua - speed walk was 0.78
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3290; -- Deek Fizzlebizz - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3291; -- Greishan Ironstove - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3292; -- Brewmaster Drohn - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3293; -- Rezlak - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3294; -- Ophek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3297; -- Sen'jin Watcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3298; -- Gabrielle Chase - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3300; -- Adder - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3300; -- Adder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3304; -- Master Vornal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3305; -- Grisha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3306; -- Keldas - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3309; -- Karus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3312; -- Olvia - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3313; -- Trak'gen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3314; -- Urtharo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3315; -- Tor'phan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3316; -- Handor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3317; -- Ollanus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3318; -- Koma - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3319; -- Sana - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3320; -- Soran - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3321; -- Morgum - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3322; -- Kaja - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3323; -- Horthus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3324; -- Grol'dar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3325; -- Mirket - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3326; -- Zevrost - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3327; -- Gest - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3328; -- Ormok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3329; -- Kor'jus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3330; -- Muragus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3331; -- Kareth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3332; -- Lumak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3333; -- Shankys - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3334; -- Rekkul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3335; -- Hagrus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3336; -- Takrin Pathseeker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3337; -- Kargal Battlescar - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3338; -- Sergra Darkthorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3339; -- Captain Thalo'thas Brightsun - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3341; -- Gann Stonespire - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3342; -- Shan'ti - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3344; -- Kardris Dreamseeker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3345; -- Godan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3346; -- Kithas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3347; -- Yelmak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3348; -- Kor'geld - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3349; -- Ukra'nor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3350; -- Asoran - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3351; -- Magenius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3352; -- Ormak Grimshot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3353; -- Grezz Ragefist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3354; -- Sorek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3355; -- Saru Steelfury - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3356; -- Sumi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3357; -- Makaru - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3358; -- Gorina - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3359; -- Kiro - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3360; -- Koru - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3361; -- Shoma - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3362; -- Ogunaro Wolfrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3363; -- Magar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3364; -- Borya - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3365; -- Karolek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3366; -- Tamar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3368; -- Borstan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3369; -- Gotri - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3370; -- Urtrun Clanbringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3373; -- Arnok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3374; -- Bael'dun Excavator - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3375; -- Bael'dun Foreman - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3376; -- Bael'dun Soldier - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3377; -- Bael'dun Rifleman - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3378; -- Bael'dun Officer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3379; -- Burning Blade Bruiser - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3380; -- Burning Blade Acolyte - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3381; -- Southsea Brigand - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3382; -- Southsea Cannoneer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3383; -- Southsea Cutthroat - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3384; -- Southsea Privateer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3385; -- Theramore Marine - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3386; -- Theramore Preserver - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3387; -- Jorn Skyseer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3388; -- Mahren Skyseer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3389; -- Regthar Deathgate - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3390; -- Apothecary Helbrim - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3391; -- Gazlowe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3392; -- Prospector Khazgorm - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3394; -- Barak Kodobane - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3396; -- Hezrul Bloodmark - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3397; -- Kolkar Bloodcharger - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3399; -- Zamja - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3400; -- Xen'to - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3401; -- Shenthul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3402; -- Zando'zan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3403; -- Sian'tsu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3404; -- Jandi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3405; -- Zeal'aya - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3406; -- Xor'juul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3407; -- Sian'dur - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3408; -- Zel'mak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3409; -- Zendo'jian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3410; -- Jin'sora - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3412; -- Nogg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3413; -- Sovik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3414; -- General Twinbraid - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3415; -- Savannah Huntress - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3415; -- Savannah Huntress - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3416; -- Savannah Matriarch - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3416; -- Savannah Matriarch - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3418; -- Kirge Sternhorn - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3419; -- Apothecary Zamah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3421; -- Feegly the Exiled - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3424; -- Thunderhawk Cloudscraper - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3424; -- Thunderhawk Cloudscraper - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3425; -- Savannah Prowler - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3426; -- Zhevra Charger - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=3426; -- Zhevra Charger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3428; -- Korran - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3429; -- Thork - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3430; -- Mangletooth - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3431; -- Grenthar - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3432; -- Mankrik - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3433; -- Tatternack Steelforge - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3434; -- Nak - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3436; -- Kuz - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3441; -- Melor Stonehoof - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3442; -- Sputtervalve - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3443; -- Grub - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3444; -- Dig Rat - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3444; -- Dig Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3445; -- Supervisor Lugwizzle - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3446; -- Mebok Mizzyrix - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3447; -- Pawe Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3448; -- Tonga Runetotem - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3449; -- Darsok Swiftdagger - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.25 WHERE  `entry`=3450; -- Defias Companion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=3452; -- Serena Bloodfeather - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3453; -- Wharfmaster Dizzywig - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3456; -- Razormane Pathfinder - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3457; -- Razormane Stalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3458; -- Razormane Seer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3461; -- Oasis Snapjaw - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3463; -- Wandering Barrens Giraffe - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3464; -- Gazrog - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3466; -- Zhevra Courser - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=3466; -- Zhevra Courser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3467; -- Baron Longshore - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3470; -- Rathorian - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3471; -- Tinkerer Sniggles - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3472; -- Washte Pawne - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3472; -- Washte Pawne - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3474; -- Lakota'mani - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3476; -- Isha Awak - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3477; -- Hraq - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3478; -- Traugh - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3479; -- Nargal Deatheye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3480; -- Moorane Hearthgrain - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3481; -- Barg - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3482; -- Tari'qa - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3483; -- Jahan Hawkwing - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3484; -- Kil'hala - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3485; -- Wrahk - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3486; -- Halija Whitestrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3487; -- Kalyimah Stormcloud - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3488; -- Uthrok - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3489; -- Zargh - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3490; -- Hula'mahi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3491; -- Ironzar - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3492; -- Vexspindle - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3493; -- Grazlix - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3494; -- Tinkerwiz - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3495; -- Gagsprocket - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3496; -- Fuzruckle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3497; -- Kilxx - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3498; -- Jazzik - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3499; -- Ranik - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3500; -- Tarhus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3501; -- Horde Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3502; -- Ratchet Bruiser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3504; -- Gil - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3505; -- Pat - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3507; -- Andi - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3508; -- Mikey - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3509; -- Geoff - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3510; -- Twain - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3511; -- Steven - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3512; -- Jimmy - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3513; -- Miss Danna - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3514; -- Tenaron Stormgrip - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3515; -- Corithras Moonrage - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3517; -- Rellian Greenspyre - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3518; -- Thomas Miller - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3520; -- Ol' Emma - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3521; -- Ak'Zeloth - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3522; -- Constance Brisboise - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3523; -- Bowen Brisboise - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3529; -- Moonrage Armorer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3531; -- Moonrage Tailor - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3533; -- Moonrage Leatherworker - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=3535; -- Blackmoss the Fetid - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3536; -- Kris Legace - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3537; -- Zixil - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3538; -- Overwatch Mark I - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3539; -- Ott - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3540; -- Hal McAllister - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3541; -- Sarah Raycroft - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3542; -- Jaysin Lanyda - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3543; -- Robert Aebischer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3544; -- Jason Lemieux - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3546; -- Bernie Heisten - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3547; -- Hamlin Atkins - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3548; -- Selina Weston - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3549; -- Shelene Rhobart - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3550; -- Martine Tramblay - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3552; -- Alexandre Lefevre - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3553; -- Sebastian Meloche - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3554; -- Andrea Boynton - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3555; -- Johan Focht - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3556; -- Andrew Hilbert - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3557; -- Guillaume Sorouy - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=3560; -- Healing Ward - speed walk was 0.79
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3561; -- Kyrai - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3562; -- Alaindia - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3566; -- Flatland Prowler - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3566; -- Flatland Prowler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3567; -- Tallonkai Swiftroot - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3571; -- Teldrassil Sentinel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3572; -- Zizzek - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3573; -- Mana Spring Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=3573; -- Mana Spring Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3577; -- Dalaran Brewmaster - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3583; -- Barithras Moonshade - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.44 WHERE  `entry`=3586; -- Miner Johnson - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3587; -- Lyrai - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3588; -- Khardan Proudblade - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3589; -- Keina - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3590; -- Janna Brightmoon - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3591; -- Freja Nightwing - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3592; -- Andiss - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3593; -- Alyissia - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3594; -- Frahun Shadewhisper - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3595; -- Shanda - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3596; -- Ayanna Everstride - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3597; -- Mardant Strongoak - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3598; -- Kyra Windblade - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3599; -- Jannok Breezesong - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3600; -- Laurna Morninglight - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3601; -- Dazalar - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3602; -- Kal - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3603; -- Cyndra Kindwhisper - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3604; -- Malorne Bladeleaf - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3605; -- Nadyia Maneweaver - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3606; -- Alanna Raveneye - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3607; -- Androl Oakhand - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3609; -- Shalomon - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3610; -- Jeena Featherbow - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3611; -- Brannol Eaglemoon - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3612; -- Sinda - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3613; -- Meri Ironweave - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3614; -- Narret Shadowgrove - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3615; -- Devrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3616; -- Onu - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3619; -- Ghost Saber - speed walk was 1.04
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3619; -- Ghost Saber - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3620; -- Harruk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3621; -- Kurll - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3622; -- Grokor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3624; -- Zudd - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3626; -- Jenn Langston - speed walk was 0.93
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3626; -- Jenn Langston - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3627; -- Erich Lohan - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3628; -- Steven Lohan - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3629; -- David Langston - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3630; -- Deviate Coiler - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3630; -- Deviate Coiler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3631; -- Deviate Stinglash - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3631; -- Deviate Stinglash - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3632; -- Deviate Creeper - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3633; -- Deviate Slayer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3634; -- Deviate Stalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3636; -- Deviate Ravager - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3637; -- Deviate Guardian - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3638; -- Devouring Ectoplasm - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3639; -- Sentinel Tysha Moonblade - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3641; -- Deviate Lurker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3644; -- Cerellean Whiteclaw - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3649; -- Thundris Windweaver - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3650; -- Asterion - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3653; -- Kresh - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3657; -- Sentinel Elissa Starbreeze - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3661; -- Balthule Shadowstrike - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3663; -- Delgren the Purifier - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3665; -- Crane Operator Bigglefuzz - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3666; -- Wizbang Cranktoggle - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3669; -- Lord Cobrahn - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3670; -- Lord Pythas - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3671; -- Lady Anacondra - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.61 WHERE  `entry`=3672; -- Boahn - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3673; -- Lord Serpentis - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3674; -- Skum - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3678; -- Disciple of Naralex - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3679; -- Naralex - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3680; -- Serpentbloom Snake - speed walk was 0.68
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3680; -- Serpentbloom Snake - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3681; -- Wisp - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3682; -- Vrang Wildgore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3683; -- Kiknikle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3684; -- Pizznukle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3685; -- Harb Clawhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3688; -- Reban Freerunner - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3689; -- Laer Stepperunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3690; -- Kar Stormsinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3691; -- Raene Wolfrunner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3695; -- Grimclaw - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3700; -- Jadenvis Seawatcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3701; -- Tharnariun Treetender - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3702; -- Alanndarian Nightsong - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3703; -- Krulmoo Fullmoon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3704; -- Mahani - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3705; -- Gahroot - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3706; -- Tai'jin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3707; -- Ken'jai - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3708; -- Gruna - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3711; -- Wrathtail Myrmidon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3712; -- Wrathtail Razortail - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3713; -- Wrathtail Wave Rider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3715; -- Wrathtail Sea Witch - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3717; -- Wrathtail Sorceress - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3721; -- Mystlash Hydra - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3722; -- Mystlash Flayer - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3732; -- Forsaken Seeker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3733; -- Forsaken Herbalist - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3734; -- Forsaken Thug - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3737; -- Saltspittle Puddlejumper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3739; -- Saltspittle Warrior - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3740; -- Saltspittle Muckdweller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3742; -- Saltspittle Oracle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3743; -- Foulweald Warrior - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=3743; -- Foulweald Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3745; -- Foulweald Pathfinder - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=3745; -- Foulweald Pathfinder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3746; -- Foulweald Den Watcher - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=3746; -- Foulweald Den Watcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3748; -- Foulweald Shaman - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=3748; -- Foulweald Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3749; -- Foulweald Ursa - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=3749; -- Foulweald Ursa - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3750; -- Foulweald Totemic - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=3750; -- Foulweald Totemic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3758; -- Felmusk Satyr - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3765; -- Bleakheart Satyr - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3767; -- Bleakheart Trickster - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3770; -- Bleakheart Shadowstalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3771; -- Bleakheart Hellcaller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=3773; -- Akkrilus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3779; -- Syurana - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3780; -- Shadethicket Moss Eater - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3782; -- Shadethicket Stone Mover - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3784; -- Shadethicket Bark Ripper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3789; -- Terrowulf Fleshripper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3791; -- Terrowulf Shadow Weaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=3792; -- Terrowulf Packlord - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3797; -- Cenarion Protector - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=3797; -- Cenarion Protector - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3809; -- Ashenvale Bear - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3810; -- Elder Ashenvale Bear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3811; -- Giant Ashenvale Bear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3812; -- Clattering Crawler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3814; -- Spined Crawler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=3816; -- Wild Buck - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3816; -- Wild Buck - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=3817; -- Shadowhorn Stag - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3817; -- Shadowhorn Stag - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=3818; -- Elder Shadowhorn Stag - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3818; -- Elder Shadowhorn Stag - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3819; -- Wildthorn Stalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3820; -- Wildthorn Venomspitter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3821; -- Wildthorn Lurker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3823; -- Ghostpaw Runner - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3824; -- Ghostpaw Howler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3825; -- Ghostpaw Alpha - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=3833; -- Cenarion Vindicator - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3834; -- Crazed Ancient - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3835; -- Biletoad - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=3835; -- Biletoad - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3836; -- Mountaineer Pebblebitty - speed walk was 1.16
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=3836; -- Mountaineer Pebblebitty - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3841; -- Caylais Moonfeather - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3842; -- Brombar Higgleby - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3845; -- Shindrell Swiftfire - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3847; -- Orendil Broadleaf - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3848; -- Kayneth Stillwind - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3849; -- Deathstalker Adamant - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3850; -- Sorcerer Ashcrombe - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3851; -- Shadowfang Whitescalp - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3853; -- Shadowfang Moonwalker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3855; -- Shadowfang Darksoul - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3861; -- Bleak Worg - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=3861; -- Bleak Worg - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3862; -- Slavering Worg - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3863; -- Lupine Horror - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3864; -- Fel Steed - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=3864; -- Fel Steed - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=3865; -- Shadow Charger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3866; -- Vile Bat - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3868; -- Blood Seeker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=3872; -- Deathsworn Captain - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3873; -- Tormented Officer - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3877; -- Wailing Guardsman - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3880; -- Sentinel Melyria Frostshadow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3881; -- Grimtak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3882; -- Zlagk - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3883; -- Moodan Sungrain - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3884; -- Jhawna Oatwind - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3886; -- Razorclaw the Butcher - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3887; -- Baron Silverlaine - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3888; -- Korra - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3891; -- Teronis' Corpse - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3892; -- Relara Whitemoon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3894; -- Pelturas Whitemoon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3901; -- Illiyana - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=3903; -- Searing Totem III - speed walk was 0.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3908; -- Healing Stream Totem IV - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=3908; -- Healing Stream Totem IV - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3909; -- Healing Stream Totem V - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=3909; -- Healing Stream Totem V - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3914; -- Rethilgore - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3915; -- Dagri - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3915; -- Dagri - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3919; -- Withered Ancient - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3924; -- Thistlefur Shaman - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=3924; -- Thistlefur Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3925; -- Thistlefur Avenger - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=3925; -- Thistlefur Avenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3927; -- Wolf Master Nandos - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3928; -- Rotting Slime - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=3931; -- Shadethicket Oracle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3933; -- Hai'zan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3934; -- Innkeeper Boorand Plainswind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3935; -- Toddrick - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3936; -- Shandris Feathermoon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3937; -- Kira Songshine - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3939; -- Razormane Wolf - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3943; -- Ruuzel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3944; -- Wrathtail Priestess - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3945; -- Caravaneer Ruzzgot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3948; -- Honni Goldenoat - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3952; -- Aeolynn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3953; -- Tandaan Lightmane - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3954; -- Dalria - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3958; -- Lardan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3959; -- Nantar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3961; -- Maliynn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3962; -- Haljan Oakheart - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3967; -- Aayndia Floralwind - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3968; -- Sentry Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=3968; -- Sentry Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3969; -- Fahran Silentblade - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3970; -- Llana - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3974; -- Houndmaster Loksey - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3975; -- Herod - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=3975; -- Herod - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3976; -- Scarlet Commander Mograine - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3977; -- High Inquisitor Whitemane - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3978; -- Sage Truthseeker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3979; -- Librarian Mae Paledust - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3980; -- Raleigh the Devout - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3981; -- Vorrel Sengutz - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3982; -- Monika Sengutz - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3983; -- Interrogator Vishas - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3986; -- Sarilus Foulborne - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=3994; -- Keeper Albagorm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3996; -- Faldreas Goeth'Shael - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=4018; -- Antlered Courser - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=4019; -- Great Courser - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4022; -- Bloodfury Harpy - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4024; -- Bloodfury Slayer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4025; -- Bloodfury Ambusher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4026; -- Bloodfury Windcaller - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4027; -- Bloodfury Storm Witch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4034; -- Enraged Stone Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4034; -- Enraged Stone Spirit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4035; -- Furious Stone Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4035; -- Furious Stone Spirit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4041; -- Scorched Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4042; -- Singed Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4043; -- Galthuk - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4044; -- Blackened Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4046; -- Magatha Grimtotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4047; -- Zor Lonetree - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=4050; -- Cenarion Caretaker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4054; -- Laughing Sister - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4057; -- Son of Cenarius - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4063; -- Feeboz - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4064; -- Blackrock Scout - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4065; -- Blackrock Sentry - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4068; -- Serpent Messenger - speed walk was 0.53
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4068; -- Serpent Messenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4075; -- Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE  `entry`=4076; -- Roach - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4076; -- Roach - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4078; -- Collin Mauren - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4079; -- Sentinel Thenysil - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4081; -- Lomac Gearstrip - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4087; -- Arias'ta Bladesinger - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4088; -- Elanaria - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4089; -- Sildanair - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4090; -- Astarii Starseeker - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4091; -- Jandria - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4092; -- Lariia - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4093; -- Galak Wrangler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4094; -- Galak Scout - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4095; -- Galak Mauler - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4096; -- Galak Windchaser - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4097; -- Galak Stormer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4099; -- Galak Marauder - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4100; -- Screeching Harpy - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4101; -- Screeching Roguefeather - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=4104; -- Screeching Windcaller - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4107; -- Highperch Wyvern - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4109; -- Highperch Consort - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4117; -- Cloud Serpent - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4118; -- Venomous Cloud Serpent - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4119; -- Elder Cloud Serpent - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4120; -- Thundering Boulderkin - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4120; -- Thundering Boulderkin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4126; -- Crag Stalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4127; -- Hecklefang Hyena - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4128; -- Hecklefang Stalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4129; -- Hecklefang Snarler - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4138; -- Jeen'ra Nightrunner - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4146; -- Jocaste - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4147; -- Saltstone Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4150; -- Saltstone Gazer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4151; -- Saltstone Crystalhide - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4155; -- Idriana - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4156; -- Astaia - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4159; -- Me'lynn - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4161; -- Lysheana - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4163; -- Syurna - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4164; -- Cylania - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4165; -- Elissa Dumas - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4166; -- Gazelle - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4166; -- Gazelle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4167; -- Dendrythis - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4168; -- Elynna - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4169; -- Jaeana - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4170; -- Ellandrieth - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4171; -- Merelyssa - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4172; -- Anadyia - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4173; -- Landria - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4175; -- Vinasia - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4177; -- Melea - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4180; -- Ealyshia Dewwhisper - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4181; -- Fyrenna - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4182; -- Dalmond - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4183; -- Naram Longclaw - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4185; -- Shaldyn - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4186; -- Mavralyn - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4187; -- Harlon Thornguard - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4189; -- Valdaron - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4190; -- Kyndri - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4191; -- Allyndia - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4192; -- Taldan - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4193; -- Grondal Moonbreeze - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4194; -- Ullanna - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4195; -- Tiyani - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4196; -- Silithid Swarm - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4196; -- Silithid Swarm - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4200; -- Laird - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4203; -- Ariyell Skyshadow - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4204; -- Firodren Mooncaller - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4205; -- Dorion - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4208; -- Lairn - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4209; -- Garryeth - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4210; -- Alegorn - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4211; -- Dannelor - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4212; -- Telonis - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4213; -- Taladan - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4214; -- Erion Shadewhisper - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4215; -- Anishar - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4216; -- Chardryn - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4217; -- Mathrengyl Bearwalker - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4218; -- Denatharion - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4219; -- Fylerian Nightwing - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4220; -- Cyroen - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4221; -- Talaelar - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4222; -- Voloren - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4223; -- Fyldan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4225; -- Saenorion - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4226; -- Ulthir - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4228; -- Vaean - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4229; -- Mythrin'dir - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4230; -- Yldan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4231; -- Kieran - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4232; -- Glorandiir - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4233; -- Mythidan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4234; -- Andrus - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4235; -- Turian - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4236; -- Cyridan - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4240; -- Caynrus - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4241; -- Mydrannul - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4242; -- Frostsaber Companion - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4242; -- Frostsaber Companion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4244; -- Shadow - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4249; -- Pesterhide Snarler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4254; -- Geofram Bouldertoe - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4256; -- Golnir Bouldertoe - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4258; -- Bengus Deepforge - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4259; -- Thurgrum Deepforge - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4262; -- Darnassus Sentinel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4265; -- Nyoma - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4266; -- Danlyia - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4267; -- Daelyshia - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4274; -- Fenrus the Devourer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.03 WHERE  `entry`=4277; -- Eye of Kilrogg - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4277; -- Eye of Kilrogg - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4278; -- Commander Springvale - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4279; -- Odo the Blindwatcher - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4286; -- Scarlet Soldier - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4287; -- Scarlet Gallant - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4288; -- Scarlet Beastmaster - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4289; -- Scarlet Evoker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4290; -- Scarlet Guardsman - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4291; -- Scarlet Diviner - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4292; -- Scarlet Protector - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4294; -- Scarlet Sorcerer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4295; -- Scarlet Myrmidon - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4296; -- Scarlet Adept - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4297; -- Scarlet Conjuror - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4298; -- Scarlet Defender - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4299; -- Scarlet Chaplain - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4300; -- Scarlet Wizard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4301; -- Scarlet Centurion - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4302; -- Scarlet Champion - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4303; -- Scarlet Abbot - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4304; -- Scarlet Tracking Hound - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4305; -- Kriggon Talsone - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4306; -- Scarlet Torturer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4307; -- Heldan Galesong - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4308; -- Unfettered Spirit - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4309; -- Gorm Grimtotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4310; -- Cor Grimtotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4314; -- Gorkas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4316; -- Kolkar Packhound - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4317; -- Nyse - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4319; -- Thyssiana - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4321; -- Baldruc - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4323; -- Searing Hatchling - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4324; -- Searing Whelp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=4328; -- Firemane Scalebane - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=4329; -- Firemane Scout - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=4331; -- Firemane Ash Tail - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=4334; -- Firemane Flamecaller - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.46 WHERE  `entry`=4355; -- Bloodfen Scytheclaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=4358; -- Mirefin Puddlejumper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.28 WHERE  `entry`=4360; -- Mirefin Warrior - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4362; -- Mirefin Coastrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4364; -- Strashaz Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4366; -- Strashaz Serpent Guard - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4368; -- Strashaz Myrmidon - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4370; -- Strashaz Sorceress - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4371; -- Strashaz Siren - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=4374; -- Strashaz Hydra - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4382; -- Withervine Creeper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4385; -- Withervine Rager - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.125 WHERE  `entry`=4386; -- Withervine Bark Ripper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4387; -- Withervine Mire Beast - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.31 WHERE  `entry`=4392; -- Corrosive Swamp Ooze - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4397; -- Mudrock Spikeshell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=4398; -- Mudrock Burrower - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.02 WHERE  `entry`=4399; -- Mudrock Borer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=4400; -- Mudrock Snapjaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=4405; -- Muckshell Razorclaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4416; -- Defias Strip Miner - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4419; -- Race Master Kronkrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4420; -- Overlord Ramtusk - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4421; -- Charlga Razorflank - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4422; -- Agathelos the Raging - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4423; -- Darnassian Protector - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4424; -- Aggem Thorncurse - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4425; -- Blind Hunter - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4427; -- Ward Guardian - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4428; -- Death Speaker Jargba - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4429; -- Goblin Pit Crewman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4430; -- Gnome Pit Crewman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4435; -- Razorfen Warrior - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4436; -- Razorfen Quilguard - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4437; -- Razorfen Warden - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4438; -- Razorfen Spearhide - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4440; -- Razorfen Totemic - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4442; -- Razorfen Defender - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4444; -- Deathstalker Vincent - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4451; -- Auld Stonespire - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4452; -- Kravel Koalbeard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4453; -- Wizzle Brassbolts - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4454; -- Fizzle Brassbolts - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4455; -- Red Jack Flint - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4456; -- Fiora Longears - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4462; -- Blackrock Hunter - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4463; -- Blackrock Summoner - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4464; -- Blackrock Gladiator - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4465; -- Vilebranch Warrior - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4466; -- Vilebranch Scalper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4467; -- Vilebranch Soothsayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4468; -- Jade Sludge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4469; -- Emerald Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4472; -- Haunting Vision - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4474; -- Rotting Cadaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4475; -- Blighted Zombie - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4479; -- Fardel Dabyrie - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4480; -- Kenata Dabyrie - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4481; -- Marcel Dabyrie - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4483; -- Moktar Krin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4484; -- Feero Ironhand - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=4484; -- Feero Ironhand - speed run was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4485; -- Belgrom Rockmaul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4486; -- Genavie Callow - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4488; -- Parqual Fintallas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=4490; -- Grenka Bloodscreech - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4493; -- Scarlet Avenger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4495; -- Gnome Pit Boss - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4496; -- Goblin Pit Boss - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4498; -- Maurin Bonesplitter - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4499; -- Rok'Alim the Pounder - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4500; -- Overlord Mok'Morokk - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4501; -- Draz'Zilb - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4502; -- Tharg - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4503; -- Mudcrush Durtfeet - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4508; -- Willix the Importer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4510; -- Heralath Fallowbrook - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4511; -- Agam'ar - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4512; -- Rotting Agam'ar - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4514; -- Raging Agam'ar - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4515; -- Death's Head Acolyte - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4516; -- Death's Head Adept - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4517; -- Death's Head Priest - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4518; -- Death's Head Sage - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4519; -- Death's Head Seer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4521; -- Treshala Fallowbrook - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4522; -- Razorfen Dustweaver - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4523; -- Razorfen Groundshaker - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4525; -- Razorfen Earthbreaker - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4526; -- Wind Howler - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4528; -- Stone Rumbler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4530; -- Razorfen Handler - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4531; -- Razorfen Beast Trainer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4532; -- Razorfen Beastmaster - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4534; -- Tamed Hyena - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4535; -- Tamed Battleboar - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4538; -- Kraul Bat - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4539; -- Greater Kraul Bat - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4540; -- Scarlet Monk - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4541; -- Blood of Agamaggan - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4542; -- High Inquisitor Fairbanks - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4543; -- Bloodmage Thalnos - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4544; -- Krueg Skullsplitter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4549; -- William Montague - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4550; -- Ophelia Montague - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4551; -- Michael Garrett - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4552; -- Eunice Burch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4553; -- Ronald Burch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4554; -- Tawny Grisette - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4555; -- Eleanor Rusk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4556; -- Gordon Wendham - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4557; -- Louis Warren - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4558; -- Lauren Newcomb - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4559; -- Timothy Weldon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4560; -- Walter Ellingson - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4561; -- Daniel Bartlett - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4562; -- Thomas Mordan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4563; -- Kaal Soulreaper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4564; -- Luther Pickman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4565; -- Richard Kerwin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4566; -- Kaelystia Hatebringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4567; -- Pierce Shackleton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4568; -- Anastasia Hartwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4569; -- Charles Seaton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4570; -- Sydney Upton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4571; -- Morley Bates - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4573; -- Armand Cromwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4574; -- Lizbeth Cromwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4575; -- Hannah Akeley - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4576; -- Josef Gregorian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4577; -- Millie Gregorian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4578; -- Josephine Lister - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4580; -- Lucille Castleton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4581; -- Salazar Bloch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4582; -- Carolyn Ward - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4583; -- Miles Dexter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4584; -- Gregory Charles - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4585; -- Ezekiel Graves - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4586; -- Graham Van Talen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4587; -- Elizabeth Van Talen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4588; -- Arthur Moore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4589; -- Joseph Moore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4590; -- Jonathan Chambers - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4591; -- Mary Edras - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4592; -- Nathaniel Steenwick - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4593; -- Christoph Walker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4594; -- Angela Curthas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4595; -- Baltus Fowler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4596; -- James Van Brunt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4597; -- Samuel Van Brunt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4598; -- Brom Killian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4599; -- Sarah Killian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4600; -- Geoffrey Hartwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4601; -- Francis Eliot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4602; -- Benijah Fenner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4603; -- Nicholas Atwood - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4604; -- Abigail Sawyer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4605; -- Basil Frye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4606; -- Aelthalyste - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4607; -- Father Lankester - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4608; -- Father Lazarus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4609; -- Doctor Marsh - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4610; -- Algernon - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4611; -- Doctor Herbert Halsey - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4613; -- Christopher Drakul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4614; -- Martha Alliestar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4615; -- Katrina Alliestar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4616; -- Lavinia Crowe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4617; -- Thaddeus Webb - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4623; -- Quilguard Champion - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4624; -- Booty Bay Bruiser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4625; -- Death's Head Ward Keeper - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4627; -- Arugal's Voidwalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4630; -- Pozzik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4631; -- Wharfmaster Lozgil - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4632; -- Kolkar Centaur - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4632; -- Kolkar Centaur - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4633; -- Kolkar Scout - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4633; -- Kolkar Scout - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4635; -- Kolkar Windchaser - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4635; -- Kolkar Windchaser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4636; -- Kolkar Battle Lord - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4636; -- Kolkar Battle Lord - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4637; -- Kolkar Destroyer - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4637; -- Kolkar Destroyer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4646; -- Gelkis Outrunner - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4646; -- Gelkis Outrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4647; -- Gelkis Scout - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4647; -- Gelkis Scout - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4648; -- Gelkis Stamper - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4648; -- Gelkis Stamper - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4649; -- Gelkis Windchaser - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4649; -- Gelkis Windchaser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4651; -- Gelkis Earthcaller - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4651; -- Gelkis Earthcaller - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4652; -- Gelkis Mauler - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4652; -- Gelkis Mauler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=4653; -- Gelkis Marauder - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4653; -- Gelkis Marauder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=4661; -- Gelkis Rumbler - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=4661; -- Gelkis Rumbler - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4663; -- Burning Blade Augur - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4664; -- Burning Blade Reaver - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4665; -- Burning Blade Adept - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4666; -- Burning Blade Felsworn - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4667; -- Burning Blade Shadowmage - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4668; -- Burning Blade Summoner - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4676; -- Lesser Infernal - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4677; -- Doomwarder - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4678; -- Mana Eater - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4679; -- Nether Maiden - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4681; -- Mage Hunter - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4685; -- Ley Hunter - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4688; -- Bonepaw Hyena - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4689; -- Starving Bonepaw - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4690; -- Rabid Bonepaw - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4692; -- Dread Swoop - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4693; -- Dread Flyer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4695; -- Carrion Horror - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4696; -- Scorpashi Snapper - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4697; -- Scorpashi Lasher - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4699; -- Scorpashi Venomlash - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4700; -- Aged Kodo - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4701; -- Dying Kodo - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4702; -- Ancient Kodo - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4706; -- Razzeric - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4708; -- Shreev - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4709; -- Zamek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4721; -- Zangen Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4722; -- Rau Cliffrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4726; -- Raging Thunder Lizard - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4727; -- Elder Thunder Lizard - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4728; -- Gritjaw Basilisk - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4729; -- Hulking Gritjaw Basilisk - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=4729; -- Hulking Gritjaw Basilisk - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4730; -- Lelanai - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4731; -- Zachariah Post - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4732; -- Randal Hunter - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4752; -- Kildar - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=4752; -- Kildar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4753; -- Jartsam - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4772; -- Ultham Ironhorn - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4773; -- Velma Warnam - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4775; -- Felicia Doan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4779; -- Brown Ram - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=4779; -- Brown Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4782; -- Truk Wildbeard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4783; -- Dawnwatcher Selgorm - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4784; -- Argent Guard Manados - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4786; -- Dawnwatcher Shaedlass - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4788; -- Fallenroot Satyr - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4791; -- Nazeer Bloodpike - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4792; -- "Swamp Eye" Jarl - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4794; -- Morgan Stern - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4802; -- Blackfathom Tide Priestess - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4803; -- Blackfathom Oracle - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=4813; -- Twilight Shadowmage - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=4842; -- Earthcaller Halmgar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4844; -- Shadowforge Surveyor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4845; -- Shadowforge Ruffian - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4846; -- Shadowforge Digger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4851; -- Stonevault Rockchewer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5406; -- Palomino - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5406; -- Palomino - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4856; -- Stonevault Cave Hunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4861; -- Shrike Bat - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=4863; -- Jadespine Basilisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4872; -- Obsidian Golem - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4875; -- Turhaw - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4876; -- Jawn Highmesa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4877; -- Jandia - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4878; -- Montarr - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4879; -- Ogg'marr - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4880; -- "Stinky" Ignatz - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4883; -- Krak - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4884; -- Zulrg - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4885; -- Gregor MacVince - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4886; -- Hans Weston - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4888; -- Marie Holdston - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4889; -- Torq Ironblast - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4890; -- Piter Verance - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4891; -- Dwane Wertle - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4892; -- Jensen Farran - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4893; -- Bartender Lillian - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4894; -- Craig Nollward - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4895; -- Smiling Jim - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4896; -- Charity Mipsy - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4897; -- Helenia Olden - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4898; -- Brant Jasperbloom - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4899; -- Uma Bartulm - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4921; -- Guard Byron - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4926; -- Krog - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4941; -- Caz Twosprocket - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4943; -- Mosarn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4944; -- Captain Garran Vimes - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=4 WHERE  `entry`=4945; -- Goblin Drag Car - speed walk was 1
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE  `entry`=4945; -- Goblin Drag Car - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=4 WHERE  `entry`=4946; -- Gnome Drag Car - speed walk was 1
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE  `entry`=4946; -- Gnome Drag Car - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4948; -- Adjutant Tesoran - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4952; -- Theramore Combat Dummy - speed walk was 0.001
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=4952; -- Theramore Combat Dummy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4953; -- Moccasin - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=4953; -- Moccasin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4954; -- Uttnar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4959; -- Jorgen - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4960; -- Bishop DeLavey - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4961; -- Dashel Stonefist - speed walk was 1.06
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4962; -- Tapoke "Slim" Jahn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4963; -- Mikhail - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4964; -- Commander Samaul - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4965; -- Pained - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4966; -- Private Hendel - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4967; -- Archmage Tervosh - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4968; -- Lady Jaina Proudmoore - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=4968; -- Lady Jaina Proudmoore - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4969; -- Old Town Thug - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=4971; -- Slim's Friend - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4973; -- Guard Lasiter - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=2.26 WHERE  `entry`=4978; -- Aku'mai Servant - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4979; -- Theramore Guard - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4980; -- Paval Reethe - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4981; -- Ben Trias - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4982; -- Thomas - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4983; -- Ogron - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4984; -- Argos Nightwhisper - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=4996; -- Injured Stockade Guard - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5042; -- Nurse Lillian - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5043; -- Defias Rioter - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5048; -- Deviate Adder - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5049; -- Lyesa Steelbrow - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5052; -- Edward Remington - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5053; -- Deviate Crocolisk - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5054; -- Krumn - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5055; -- Deviate Lasher - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5056; -- Deviate Dreadfang - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5081; -- Connor Rivers - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5082; -- Vincent Hyal - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5083; -- Clerk Lendry - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5087; -- Do'gol - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5088; -- Falgran Hastil - speed walk was 1.13
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5089; -- Balos Jacken - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5091; -- Guard Kahil - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=5097; -- Lupine Delusion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5099; -- Soleil Stonemantle - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5100; -- Fillius Fizzlespinner - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5101; -- Bryllia Ironbrand - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5102; -- Dolman Steelfury - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5103; -- Grenil Steelfury - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5106; -- Bromiir Ormsen - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5107; -- Mangorn Flinthammer - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5108; -- Raena Flinthammer - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5109; -- Myra Tyrngaarde - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5110; -- Barim Jurgenstaad - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5111; -- Innkeeper Firebrew - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5112; -- Gwenna Firebrew - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5113; -- Kelv Sternhammer - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5115; -- Daera Brightspear - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5116; -- Olmin Burningbeard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5117; -- Regnus Thundergranite - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=5118; -- Brogun Stoneshield - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5119; -- Hegnar Swiftaxe - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5120; -- Brenwyn Wintersteel - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5121; -- Kelomir Ironhand - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5122; -- Skolmin Goldfury - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5123; -- Bretta Goldfury - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5124; -- Sognar Cliffbeard - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5125; -- Dolkin Craghelm - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5126; -- Olthran Craghelm - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5127; -- Fimble Finespindle - speed walk was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5128; -- Bombus Finespindle - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5129; -- Lissyphus Finespindle - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5130; -- Jondor Steelbrow - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5132; -- Pithwick - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5133; -- Harick Boulderdrum - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5137; -- Reyna Stonebranch - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5138; -- Gwina Stonebranch - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5140; -- Edris Barleybeard - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5141; -- Theodrus Frostbeard - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5142; -- Braenna Flintcrag - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5143; -- Toldren Deepiron - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5147; -- Valgar Highforge - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5148; -- Beldruk Doombrow - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5149; -- Brandur Ironhammer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5150; -- Nissa Firestone - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5151; -- Ginny Longberry - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5152; -- Bingus - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5153; -- Jormund Stonebrow - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5154; -- Poranna Snowbraid - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5155; -- Ingrys Stonebrow - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5156; -- Maeva Snowbraid - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5158; -- Tilli Thistlefuzz - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5159; -- Daryl Riknussun - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5160; -- Emrul Riknussun - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5161; -- Grimnur Stonebrand - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5162; -- Tansy Puddlefizz - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5163; -- Burbik Gearspanner - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5164; -- Grumnus Steelshaper - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5165; -- Hulfdan Blackbeard - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5166; -- Ormyr Flinteye - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5169; -- Tynnus Venomsprout - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5170; -- Hjoldir Stoneblade - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5175; -- Gearcutter Cogspinner - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5177; -- Tally Berryfizz - speed walk was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5178; -- Soolie Berryfizz - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5188; -- Garyl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5189; -- Thrumn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5190; -- Merill Pleasance - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5191; -- Shalumon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5193; -- Rebecca Laughlin - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5195; -- Brown Riding Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5198; -- Arctic Riding Wolf - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5198; -- Arctic Riding Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5202; -- Archery Target - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5202; -- Archery Target - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5204; -- Apothecary Zinge - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5224; -- Murk Slitherer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5225; -- Murk Spitter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5229; -- Gordunni Ogre - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5232; -- Gordunni Brute - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5234; -- Gordunni Mauler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5236; -- Gordunni Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5237; -- Gordunni Ogre Mage - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5238; -- Gordunni Battlemaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5239; -- Gordunni Mage-Lord - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5240; -- Gordunni Warlock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5241; -- Gordunni Warlord - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5243; -- Cursed Atal'ai - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5249; -- Woodpaw Mongrel - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=5249; -- Woodpaw Mongrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5251; -- Woodpaw Trapper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=5253; -- Woodpaw Brute - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5254; -- Woodpaw Mystic - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5255; -- Woodpaw Reaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=5255; -- Woodpaw Reaver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5256; -- Atal'ai Warrior - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=5258; -- Woodpaw Alpha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5260; -- Groddoc Ape - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5261; -- Enthralled Atal'ai - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5262; -- Groddoc Thunderer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5263; -- Mummified Atal'ai - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5268; -- Ironfur Bear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5272; -- Grizzled Ironfur Bear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5274; -- Ironfur Patriarch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5276; -- Sprite Dragon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=5277; -- Nightmare Scalebane - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5278; -- Sprite Darter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=5280; -- Nightmare Wyrmkin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=5283; -- Nightmare Wanderer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5286; -- Longtooth Runner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5287; -- Longtooth Howler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5288; -- Rabid Longtooth - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5291; -- Hakkari Frostwing - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5292; -- Feral Scar Yeti - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5300; -- Frayfeather Hippogryph - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5300; -- Frayfeather Hippogryph - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5304; -- Frayfeather Stagwing - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5304; -- Frayfeather Stagwing - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5307; -- Vale Screecher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5308; -- Rogue Vale Screecher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5327; -- Coast Crawl Snapclaw - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5328; -- Coast Crawl Deepseer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.16 WHERE  `entry`=5345; -- Diamond Head - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=5346; -- Bloodroar the Stalker - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=5347; -- Antilus the Soarer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.39 WHERE  `entry`=5352; -- Old Grizzlegut - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5353; -- Itharius - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2.9 WHERE  `entry`=5354; -- Gnarl Leafbrother - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5356; -- Snarler - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5356; -- Snarler - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5359; -- Shore Strider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5360; -- Deep Strider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5361; -- Wave Strider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=5362; -- Northspring Harpy - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=5363; -- Northspring Roguefeather - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5384; -- Brohann Caskbelly - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5385; -- Watcher Mahar Ba - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5386; -- Acolyte Dellis - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5387; -- High Explorer Magellas - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5388; -- Ingo Woolybush - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5389; -- Prospector Gunstan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5390; -- Sage Palerunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5392; -- Yarr Hammerstone - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5393; -- Quartermaster Lungertz - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5394; -- Neeka Bloodscar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5396; -- Captain Pentigast - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5397; -- Uthek the Wise - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=5399; -- Veyzhak the Cannibal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=5400; -- Zekkis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.52 WHERE  `entry`=5402; -- Khan Hratha - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5403; -- Riding White Stallion - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5403; -- Riding White Stallion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5404; -- Black Stallion - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5404; -- Black Stallion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5405; -- Pinto - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5405; -- Pinto - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5411; -- Krinkle Goodsteel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5413; -- Furen Longbeard - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5414; -- Apothecary Faustin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5416; -- Infiltrator Marksen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5418; -- Deathstalker Zraedus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5419; -- Glasshide Basilisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5420; -- Glasshide Gazer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5421; -- Glasshide Petrifier - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5422; -- Scorpid Hunter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5423; -- Scorpid Tail Lasher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5424; -- Scorpid Dunestalker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5425; -- Starving Blisterpaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5426; -- Blisterpaw Hyena - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5427; -- Rabid Blisterpaw - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=5428; -- Roc - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5428; -- Roc - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=5429; -- Fire Roc - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5429; -- Fire Roc - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=5430; -- Searing Roc - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5430; -- Searing Roc - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5431; -- Surf Glider - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=5432; -- Giant Surf Glider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5441; -- Hazzali Wasp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5450; -- Hazzali Stinger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5451; -- Hazzali Swarmer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5452; -- Hazzali Worker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5455; -- Centipaar Wasp - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5456; -- Centipaar Stinger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5457; -- Centipaar Swarmer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5458; -- Centipaar Worker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5459; -- Centipaar Tunneler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5460; -- Centipaar Sandreaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5461; -- Sea Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=5461; -- Sea Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5462; -- Sea Spray - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=5462; -- Sea Spray - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5464; -- Watchmaster Sorigal - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=5465; -- Land Rager - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=5466; -- Coast Strider - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5466; -- Coast Strider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=5469; -- Dune Smasher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=5470; -- Raging Dune Smasher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5471; -- Dunemaul Ogre - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5472; -- Dunemaul Enforcer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5473; -- Dunemaul Ogre Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5474; -- Dunemaul Brute - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5475; -- Dunemaul Warlock - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5476; -- Watcher Biggs - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5477; -- Noboru the Cudgel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5479; -- Wu Shen - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5480; -- Ilsa Corbin - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5481; -- Thistleshrub Dew Collector - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5482; -- Stephen Ryback - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5483; -- Erika Tate - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5484; -- Brother Benjamin - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5485; -- Thistleshrub Rootshaper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5489; -- Brother Joshua - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5490; -- Gnarled Thistleshrub - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5491; -- Arthur the Faithful - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5492; -- Katherine the Pure - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5493; -- Arnold Leland - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5494; -- Catherine Leland - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5495; -- Ursula Deline - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5496; -- Sandahl - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5497; -- Jennea Cannon - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5498; -- Elsharin - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5499; -- Lilyssia Nightbreeze - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5500; -- Tel'Athir - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5501; -- Kaerbrus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5502; -- Shylamiir - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5503; -- Eldraeith - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5504; -- Sheldras Moontree - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5505; -- Theridran - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5506; -- Maldryn - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5508; -- Strumner Flintheel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5509; -- Kathrum Axehand - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5510; -- Thulman Flintcrag - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5511; -- Therum Deepforge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5512; -- Kaita Deepforge - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5513; -- Gelman Stonehand - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5514; -- Brooke Stonebraid - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5515; -- Einris Brightspear - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5516; -- Ulfir Ironbeard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5517; -- Thorfin Stoneshield - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5518; -- Lilliam Sparkspindle - speed walk was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5519; -- Billibub Cogspinner - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5543; -- Clarice Foster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5546; -- Grunt Zuul - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5547; -- Grunt Tharlak - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5564; -- Simon Tanner - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5565; -- Jillian Tanner - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5566; -- Tannysa - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5567; -- Sellandus - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5568; -- Captured Leper Gnome - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5570; -- Bruuk Barleybeard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5591; -- Dar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5592; -- Tok'Kar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5593; -- Katar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5594; -- Alchemist Pestlezugg - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5598; -- Atal'ai Exile - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5599; -- Kon Yelloweyes - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5602; -- Khan Shaka - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5605; -- Tisa Martine - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5607; -- Roger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5608; -- Jamin - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5611; -- Barkeep Morag - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5612; -- Gimrizz Shadowcog - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5615; -- Wastewander Rogue - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5616; -- Wastewander Thief - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5617; -- Wastewander Shadow Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5618; -- Wastewander Bandit - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5620; -- Bartender Wental - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5623; -- Wastewander Assassin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5634; -- Rhapsody Shindigger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5635; -- Falstad Wildhammer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5636; -- Gryphon Master Talonaxe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5637; -- Roetten Stonehammer - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5638; -- Kreldig Ungor - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5639; -- Craven Drok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5640; -- Keldran - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5641; -- Takata Steelblade - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5642; -- Vahlarriel Demonslayer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5644; -- Dalinda Malem - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5645; -- Sandfury Hideskinner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5646; -- Sandfury Axe Thrower - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5647; -- Sandfury Firecaller - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5651; -- Patrick Garrett - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5652; -- Undercity Practice Dummy - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5666; -- Gunther's Visage - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5667; -- Venya Marthand - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5674; -- Practice Target - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5674; -- Practice Target - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5675; -- Carendin Halgar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5676; -- Summoned Voidwalker - speed walk was 0.77
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5677; -- Summoned Succubus - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5679; -- Lysta Bancroft - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5680; -- Male Human Captive - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5681; -- Female Human Captive - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5683; -- Comar Villard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=5685; -- Captive Ghoul - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5686; -- Captive Zombie - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5688; -- Innkeeper Renee - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5693; -- Godrick Farsan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5694; -- High Sorcerer Andromath - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5695; -- Vance Undergloom - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5697; -- Theresa - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5698; -- Joanna Whitehall - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5708; -- Spawn of Hakkar - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5709; -- Shade of Eranikus - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5718; -- Rothos - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5719; -- Morphaz - speed run was 1.4
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5720; -- Weaver - speed run was 1.4
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5721; -- Dreamscythe - speed run was 1.4
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5722; -- Hazzas - speed run was 1.4
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5724; -- Ageron Kargal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5725; -- Deathguard Lundmark - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5725; -- Deathguard Lundmark - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5727; -- Jezelle's Felsteed - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5727; -- Jezelle's Felsteed - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5728; -- Jezelle's Succubus - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5733; -- Apothecary Lycanus - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5734; -- Apothecary Keever - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5735; -- Caged Human Female - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5736; -- Caged Human Male - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5738; -- Caged Dwarf Male - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.9 WHERE  `entry`=5741; -- Caged Rabbit - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.9 WHERE  `entry`=5742; -- Caged Toad - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.9 WHERE  `entry`=5743; -- Caged Sheep - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5749; -- Kayla Smithe - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5750; -- Gina Lang - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5752; -- Corporal Melkins - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5753; -- Martha Strain - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5754; -- Zane Bradford - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5755; -- Deviate Viper - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5756; -- Deviate Venomwing - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5756; -- Deviate Venomwing - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5759; -- Nurse Neela - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5761; -- Deviate Shambler - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5763; -- Nightmare Ectoplasm - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5765; -- Ruzan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5766; -- Savannah Cub - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5767; -- Nalpak - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5768; -- Ebru - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5769; -- Arch Druid Hamuul Runetotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5770; -- Nara Wildmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5774; -- Riding Wolf - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5774; -- Riding Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5775; -- Verdan the Everliving - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5783; -- Kalldan Felmoon - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5784; -- Waldor - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=5785; -- Sister Hatelash - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5797; -- Aean Swiftriver - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5797; -- Aean Swiftriver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5798; -- Thora Feathermoon - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5798; -- Thora Feathermoon - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5799; -- Hannah Bladeleaf - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5799; -- Hannah Bladeleaf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5800; -- Marcus Bel - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=5800; -- Marcus Bel - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5807; -- The Rake - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=5809; -- Watch Commander Zalaphil - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5811; -- Kamari - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5812; -- Tumi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5814; -- Innkeeper Thulbek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5815; -- Kurgul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5816; -- Katis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5817; -- Shimra - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5819; -- Mirelle Tremayne - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5820; -- Gillian Moore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5821; -- Sheldon Von Croy - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.27 WHERE  `entry`=5827; -- Brontus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.33 WHERE  `entry`=5828; -- Humar the Pridelord - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5828; -- Humar the Pridelord - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5829; -- Snort the Heckler - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=5830; -- Sister Rathtalon - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5831; -- Swiftmane - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=5831; -- Swiftmane - speed run was 2.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5833; -- Margol the Rager - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5836; -- Engineer Whirleygig - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5839; -- Dark Iron Geologist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5840; -- Dark Iron Steamsmith - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=5841; -- Rocklance - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=5842; -- Takk the Leaper - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5843; -- Slave Worker - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=5843; -- Slave Worker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5844; -- Dark Iron Slaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5846; -- Dark Iron Taskmaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=5848; -- Malgin Barleybrew - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5850; -- Blazing Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5852; -- Inferno Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5853; -- Tempered War Golem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5854; -- Heavy War Golem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=5855; -- Magma Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5855; -- Magma Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5856; -- Glassweb Spider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5857; -- Searing Lava Spider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5858; -- Greater Lava Spider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5860; -- Twilight Dark Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5861; -- Twilight Fire Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5862; -- Twilight Geomancer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=5864; -- Swinegart Spearhide - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5871; -- Larhka - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5873; -- Stoneskin Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5873; -- Stoneskin Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5874; -- Strength of Earth Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5874; -- Strength of Earth Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5875; -- Gan'rul Bloodeye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5880; -- Un'Thuwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5882; -- Pephredo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5883; -- Enyo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5884; -- Mai'ah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5885; -- Deino - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5886; -- Gwyn Farrow - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5887; -- Canaga Earthcaller - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5888; -- Seer Ravenfeather - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5892; -- Searn Firewarder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5899; -- Brine - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5901; -- Islen Waterseer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5905; -- Prate Cloudseer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5906; -- Xanis Flameweaver - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5907; -- Kranal Fiss - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5909; -- Cazul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5910; -- Zankaja - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5911; -- Grunt Logmar - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.45 WHERE  `entry`=5912; -- Deviate Faerie Dragon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5913; -- Tremor Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5913; -- Tremor Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5914; -- Deviate Nightmare - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=5914; -- Deviate Nightmare - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5917; -- Clara Charles - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5921; -- Strength of Earth Totem II - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5921; -- Strength of Earth Totem II - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5924; -- Cleansing Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5924; -- Cleansing Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5925; -- Grounding Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5925; -- Grounding Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5929; -- Magma Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5929; -- Magma Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55 WHERE  `entry`=5934; -- Heartrazor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5935; -- Ironeye the Invincible - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5938; -- Uthan Stillwater - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5939; -- Vira Younghoof - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5940; -- Harn Longcast - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5942; -- Zansoa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5943; -- Rawrk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5944; -- Yonada - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5950; -- Flametongue Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=5950; -- Flametongue Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5951; -- Hare - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=5951; -- Hare - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5957; -- Birgitte Cranston - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5958; -- Thuul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5977; -- Dreadmaul Mauler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=5978; -- Dreadmaul Warlock - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5979; -- Wretched Lost One - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.63 WHERE  `entry`=5981; -- Portal Seeker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5982; -- Black Slayer - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5982; -- Black Slayer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5984; -- Starving Snickerfang - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5985; -- Snickerfang Hyena - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5988; -- Scorpok Stinger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5990; -- Redstone Basilisk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=5991; -- Redstone Crystalhide - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5992; -- Ashmane Boar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5993; -- Helboar - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=5993; -- Helboar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5994; -- Zayus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5996; -- Nethergarde Miner - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5997; -- Nethergarde Engineer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5998; -- Nethergarde Foreman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5999; -- Nethergarde Soldier - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6000; -- Nethergarde Cleric - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6001; -- Nethergarde Analyst - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6002; -- Nethergarde Riftwatcher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6003; -- Nethergarde Officer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6004; -- Shadowsworn Cultist - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6005; -- Shadowsworn Thug - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6006; -- Shadowsworn Adept - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6007; -- Shadowsworn Enforcer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6008; -- Shadowsworn Warlock - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6009; -- Shadowsworn Dreadweaver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6010; -- Felhound - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6011; -- Felguard Sentry - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6011; -- Felguard Sentry - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6012; -- Flametongue Totem II - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=6012; -- Flametongue Totem II - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6014; -- X'yera - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6015; -- Torta - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6018; -- Ur'kyo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=6021; -- Boar Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6026; -- Breyk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6027; -- Kitha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6030; -- Thorvald Deepforge - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6031; -- Tormus Deepforge - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6033; -- Lake Frenzy - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6034; -- Lotherias - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6035; -- Razorfen Stalker - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.125 WHERE  `entry`=6069; -- Maraudine Khan Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6086; -- Auberdine Sentinel - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6087; -- Astranaar Sentinel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6089; -- Harry Burlguard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6090; -- Bartleby - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6091; -- Dellylah - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6094; -- Byancie - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1.3 WHERE  `entry`=6109; -- Azuregos - speed walk was 1.65
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6112; -- Windfury Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=6112; -- Windfury Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6113; -- Vejrek - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6114; -- Muren Stormpike - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6116; -- Highborne Apparition - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=6117; -- Highborne Lichling - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=6118; -- Varo'then's Ghost - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6119; -- Tog Rustsprocket - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6120; -- Lago Blackwrench - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6121; -- Remen Marcot - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6122; -- Gakin the Darkbinder - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6132; -- Razorfen Servitor - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6142; -- Mathiel - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6145; -- School of Fish - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=6148; -- Cliff Walker - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6148; -- Cliff Walker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6166; -- Yorus Barleybrew - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6168; -- Roogug - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6171; -- Duthorian Rall - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6172; -- Henze Faulk - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6173; -- Gazin Tenorm - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6174; -- Stephanie Turner - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6175; -- John Turner - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6176; -- Bath'rah the Windwatcher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6177; -- Narm Faulk - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6178; -- Muiredon Battleforge - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6179; -- Tiza Battleforge - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6181; -- Jordan Stilwell - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6184; -- Timbermaw Pathfinder - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6184; -- Timbermaw Pathfinder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6185; -- Timbermaw Warrior - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6185; -- Timbermaw Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6186; -- Timbermaw Totemic - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6186; -- Timbermaw Totemic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6187; -- Timbermaw Den Watcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6187; -- Timbermaw Den Watcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6188; -- Timbermaw Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6188; -- Timbermaw Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6189; -- Timbermaw Ursa - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=6189; -- Timbermaw Ursa - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6190; -- Spitelash Warrior - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6206; -- Caverndeep Burrower - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6208; -- Caverndeep Invader - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.55 WHERE  `entry`=6209; -- Caverndeep Looter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6210; -- Caverndeep Pillager - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6211; -- Caverndeep Reaver - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6213; -- Irradiated Invader - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=6215; -- Chomper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6218; -- Irradiated Slime - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6219; -- Corrosive Lurker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6220; -- Irradiated Horror - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=6220; -- Irradiated Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6221; -- Addled Leper - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6223; -- Leprous Defender - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6224; -- Leprous Machinesmith - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6225; -- Mechano-Tank - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.82857 WHERE  `entry`=6225; -- Mechano-Tank - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.82857 WHERE  `entry`=6226; -- Mechano-Flamewalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.82857 WHERE  `entry`=6227; -- Mechano-Frostwalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6228; -- Dark Iron Ambassador - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6229; -- Crowd Pummeler 9-60 - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=6231; -- Techbot - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6232; -- Arcane Nullifier X-21 - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6233; -- Mechanized Sentry - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=6233; -- Mechanized Sentry - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6234; -- Mechanized Guardian - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=6234; -- Mechanized Guardian - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6235; -- Electrocutioner 6000 - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6237; -- Stockade Archer - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1.64 WHERE  `entry`=6239; -- Cyclonian - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6241; -- Bailor Stonehand - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6244; -- Takar the Seer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6247; -- Doan Karhan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6250; -- Crawler - speed walk was 0.83
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6251; -- Strahad Farsan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6252; -- Acolyte Magaz - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6253; -- Acolyte Fenrick - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6254; -- Acolyte Wytula - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6266; -- Menara Voidrender - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6267; -- Acolyte Porena - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6271; -- Mouse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6272; -- Innkeeper Janene - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6286; -- Zarrin - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6287; -- Radnaal Maneweaver - speed walk was 1.01
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6289; -- Rand Rhobart - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6290; -- Yonn Deepcut - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6291; -- Balthus Stoneflayer - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6292; -- Eladriel - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6293; -- Jorah Annison - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6294; -- Krom Stoutarm - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6295; -- Wilma Ranthal - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6297; -- Kurdram Stonehammer - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6298; -- Thelgrum Stonehammer - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6299; -- Delfrum Flintbeard - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6300; -- Elisa Steelhand - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6301; -- Gorbold Steelhand - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6306; -- Helene Peltskinner - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6328; -- Dannie Fizzwizzle - speed walk was 1.13
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6329; -- Irradiated Pillager - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6347; -- Young Wavethrasher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6367; -- Donni Anthania - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6368; -- Cat - speed walk was 0.45
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6368; -- Cat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6373; -- Dane Winslow - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6374; -- Cylina Darkheart - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=6375; -- Thunderhead Hippogryph - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6375; -- Thunderhead Hippogryph - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6376; -- Wren Darkspring - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6382; -- Jubahl Corpseseeker - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6387; -- Dranh - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6389; -- Deathguard Podrig - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6391; -- Holdout Warrior - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6392; -- Holdout Medic - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6393; -- Henen Ragetotem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6394; -- Ruga Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6395; -- Sergeant Rutger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6408; -- Ula'elek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6410; -- Orm Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6411; -- Velora Nitely - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6412; -- Skeleton - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6426; -- Anguished Dead - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6427; -- Haunting Phantasm - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6446; -- Therzok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6467; -- Mennet Carkad - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6487; -- Arcanist Doan - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=6488; -- Fallen Champion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.59 WHERE  `entry`=6489; -- Ironspine - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6490; -- Azshir the Sleepless - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6491; -- Spirit Healer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=6491; -- Spirit Healer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.7 WHERE  `entry`=6492; -- Rift Spawn - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=0.8 WHERE  `entry`=6492; -- Rift Spawn - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.54 WHERE  `entry`=6493; -- Illusionary Phantasm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6494; -- Tazan - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6496; -- Brivelthwerp - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6497; -- Astor Hadren - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=6498; -- Devilsaur - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=6498; -- Devilsaur - speed run was 2
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=6499; -- Ironhide Devilsaur - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=6499; -- Ironhide Devilsaur - speed run was 2
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=6500; -- Tyrant Devilsaur - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=6500; -- Tyrant Devilsaur - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6501; -- Stegodon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6502; -- Plated Stegodon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6503; -- Spiked Stegodon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6504; -- Thunderstomp Stegodon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6505; -- Ravasaur - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6506; -- Ravasaur Runner - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6506; -- Ravasaur Runner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6507; -- Ravasaur Hunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6508; -- Venomhide Ravasaur - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6509; -- Bloodpetal Lasher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6510; -- Bloodpetal Flayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6511; -- Bloodpetal Thresher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6512; -- Bloodpetal Trapper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6513; -- Un'Goro Stomper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6514; -- Un'Goro Gorilla - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6516; -- Un'Goro Thunderer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6517; -- Tar Beast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6518; -- Tar Lurker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6519; -- Tar Lord - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6520; -- Scorching Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6521; -- Living Blaze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6522; -- Andron Gant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6523; -- Dark Iron Rifleman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=6527; -- Tar Creeper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6546; -- Tabetha - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6547; -- Suffering Victim - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6548; -- Magus Tirth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6549; -- Demon of the Orb - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=6551; -- Gorishi Wasp - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6551; -- Gorishi Wasp - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6552; -- Gorishi Worker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6553; -- Gorishi Reaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=6554; -- Gorishi Stinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=6554; -- Gorishi Stinger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6555; -- Gorishi Tunneler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6556; -- Muculent Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6557; -- Primal Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6559; -- Glutinous Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6560; -- Stone Guardian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6566; -- Estelle Gendry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6567; -- Ghok'kah - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6568; -- Vizzklick - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6569; -- Gnoarn - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6570; -- Fenwick Thatros - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6574; -- Jun'ha - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6575; -- Scarlet Trainee - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=6575; -- Scarlet Trainee - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6576; -- Brienna Starglow - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6577; -- Bingles Blastenheimer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6579; -- Shoni the Shilent - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=6584; -- King Mosh - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=6584; -- King Mosh - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6606; -- Overseer Glibby - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=2.32 WHERE  `entry`=6646; -- Monnos the Elder - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=6647; -- Magister Hawkhelm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=6648; -- Antilos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=6649; -- Lady Sesspira - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=6650; -- General Fangferror - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.63 WHERE  `entry`=6652; -- Master Feardred - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6653; -- Huge Toad - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6653; -- Huge Toad - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6668; -- Lord Cyrik Blackforge - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6669; -- The Threshwackonator 4100 - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6706; -- Baritanas Skyriver - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6727; -- Innkeeper Brianna - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6728; -- Narnie - speed walk was 0.45
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6728; -- Narnie - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=6729; -- Morridune - speed walk was 1.06
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=6729; -- Morridune - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6730; -- Jinky Twizzlefixxit - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6734; -- Innkeeper Hearthstove - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6735; -- Innkeeper Saelienne - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6736; -- Innkeeper Keldamyr - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6737; -- Innkeeper Shaussiy - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6738; -- Innkeeper Kimlya - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6739; -- Innkeeper Bates - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6740; -- Innkeeper Allison - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6741; -- Innkeeper Norman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6746; -- Innkeeper Pala - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6747; -- Innkeeper Kauth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6749; -- Erma - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6766; -- Ravenholdt Guard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6774; -- Falkhaan Isenstrider - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6775; -- Antur Fallow - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6776; -- Magrin Rivermane - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6778; -- Melika Isenstrider - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6780; -- Porthannius - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6781; -- Melarith - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6782; -- Hands Springsprocket - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6784; -- Calvin Montague - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6785; -- Ratslin Maime - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6786; -- Ukor - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6790; -- Innkeeper Trelayne - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6791; -- Innkeeper Wiley - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6806; -- Tannok Frosthammer - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6807; -- Innkeeper Skindle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6846; -- Defias Dockmaster - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6868; -- Jarkal Mossmeld - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.7 WHERE  `entry`=6886; -- Onin MacHammar - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.8 WHERE  `entry`=6886; -- Onin MacHammar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6887; -- Yalda - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6912; -- Remains of a Paladin - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6927; -- Defias Dockworker - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=6927; -- Defias Dockworker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6928; -- Innkeeper Grosk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6929; -- Innkeeper Gryshka - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6930; -- Innkeeper Karakul - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6946; -- Renzik "The Shiv" - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6966; -- Lucius - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6986; -- Dran Droffers - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=6987; -- Malton Droffers - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7010; -- Zilzibin Drumlore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=7016; -- Lady Vespira - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7025; -- Blackrock Soldier - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7026; -- Blackrock Sorcerer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7027; -- Blackrock Slayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7028; -- Blackrock Warlock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7029; -- Blackrock Battlemaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=7031; -- Obsidian Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=7032; -- Greater Obsidian Elemental - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7033; -- Firegut Ogre - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7034; -- Firegut Ogre Mage - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7035; -- Firegut Brute - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7036; -- Thaurissan Spy - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7037; -- Thaurissan Firewalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7038; -- Thaurissan Agent - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7039; -- War Reaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7040; -- Black Dragonspawn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7041; -- Black Wyrmkin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7042; -- Flamescale Dragonspawn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7043; -- Flamescale Wyrmkin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7044; -- Black Drake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7045; -- Scalding Drake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7046; -- Searscale Drake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7047; -- Black Broodling - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7047; -- Black Broodling - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7048; -- Scalding Broodling - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7048; -- Scalding Broodling - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7049; -- Flamescale Broodling - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7049; -- Flamescale Broodling - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7050; -- Defias Drone - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7051; -- Malformed Defias Drone - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7052; -- Defias Tower Patroller - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7053; -- Klaven Mortwake - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7055; -- Blackrock Worg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7056; -- Defias Tower Sentry - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7067; -- Venture Co. Drone - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7071; -- Cursed Paladin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7068; -- Condemned Acolyte - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7078; -- Cleft Scorpid - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7079; -- Viscous Fallout - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=7079; -- Viscous Fallout - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7086; -- Cursed Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7087; -- Killian Hagey - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7088; -- Thuwd - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7089; -- Mooranta - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=7091; -- Shadowforge Ambusher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7092; -- Tainted Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7093; -- Vile Ooze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7097; -- Ironbeak Owl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7098; -- Ironbeak Screecher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7099; -- Ironbeak Hunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7100; -- Warpwood Moss Flayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7101; -- Warpwood Shredder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7104; -- Dessecus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7111; -- Jadefire Hellcaller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7114; -- Jaedenar Enforcer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7118; -- Jaedenar Darkweaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7120; -- Jaedenar Warlock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7126; -- Jaedenar Hunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7132; -- Toxic Horror - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=7132; -- Toxic Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7136; -- Infernal Sentry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7137; -- Immolatus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7138; -- Irontree Wanderer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7139; -- Irontree Stomper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7149; -- Withered Protector - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7156; -- Deadwood Den Watcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7156; -- Deadwood Den Watcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7157; -- Deadwood Avenger - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7157; -- Deadwood Avenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7158; -- Deadwood Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7158; -- Deadwood Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7161; -- Wrenix the Wretched - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7166; -- Wrenix's Gizmotronic Apparatus - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=7170; -- Thragomm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=7172; -- Lore Keeper of Norgannon - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7175; -- Stonevault Ambusher - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=16452; -- Necro Knight Guardian - speed walk was 1.5
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7208; -- Noarm - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=2.2 WHERE  `entry`=16451; -- Deathknight Vindicator - speed walk was 1.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16451; -- Deathknight Vindicator - speed run was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7230; -- Shayis Steelfury - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7231; -- Kelgruk Bloodaxe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7232; -- Borgus Steelhand - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=7269; -- Scarab - speed walk was 0.35
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7269; -- Scarab - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7273; -- Gahz'rilla - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7273; -- Gahz'rilla - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.02 WHERE  `entry`=7276; -- Zul'Farrak Dead Hero - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=7286; -- Zul'Farrak Zombie - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7292; -- Dinita Stonemantle - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=7293; -- Drayl - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=7293; -- Drayl - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7295; -- Shailiea - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7296; -- Corand - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7298; -- Demnul Farmountain - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7311; -- Uthel'nay - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7313; -- Priestess A'moora - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7315; -- Darnath Bladesinger - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7316; -- Sister Aquinne - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7318; -- Rageclaw - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7327; -- Withered Warrior - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7328; -- Withered Reaver - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7329; -- Withered Quilguard - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7332; -- Withered Spearhide - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7333; -- Withered Battle Boar - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7334; -- Battle Boar Horror - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7335; -- Death's Head Geomancer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7337; -- Death's Head Necromancer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7341; -- Skeletal Frostweaver - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7342; -- Skeletal Summoner - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7343; -- Splinterbone Skeleton - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7344; -- Splinterbone Warrior - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7345; -- Splinterbone Captain - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7346; -- Splinterbone Centurion - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=7347; -- Boneflayer Ghoul - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=7348; -- Thorn Eater Ghoul - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7349; -- Tomb Fiend - speed walk was 0.56
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7352; -- Frozen Soul - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7353; -- Freezing Spirit - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.62 WHERE  `entry`=7356; -- Plaguemaw the Rotting - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7357; -- Mordresh Fire Eye - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7358; -- Amnennar the Coldbringer - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7363; -- Kum'isha the Collector - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7368; -- Stoneskin Totem VI - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7368; -- Stoneskin Totem VI - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7369; -- Deadwind Brute - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.13 WHERE  `entry`=7371; -- Deadwind Mauler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7372; -- Deadwind Warlock - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=7376; -- Sky Shadow - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7376; -- Sky Shadow - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7379; -- Deadwind Ogre Mage - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7380; -- Siamese Cat - speed walk was 0.45
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7383; -- Black Tabby Cat - speed walk was 0.45
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7386; -- White Kitten - speed walk was 0.32
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7387; -- Green Wing Macaw - speed walk was 0.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7391; -- Hyacinth Macaw - speed walk was 0.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7392; -- Prairie Chicken - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7394; -- Ancona Chicken - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE  `entry`=7395; -- Cockroach - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7402; -- Searing Totem VI - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7402; -- Searing Totem VI - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7403; -- Strength of Earth Totem IV - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7403; -- Strength of Earth Totem IV - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7404; -- Galak Flame Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7405; -- Deadly Cleft Scorpid - speed walk was 1.06
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7406; -- Oglethorpe Obnoticus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7407; -- Chief Engineer Bilgewhizzle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7408; -- Spigot Operator Luglunket - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.21 WHERE  `entry`=7411; -- Spirit of Sathrah - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7414; -- Mana Spring Totem II - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7414; -- Mana Spring Totem II - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7416; -- Mana Spring Totem IV - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7416; -- Mana Spring Totem IV - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7423; -- Flametongue Totem III - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7423; -- Flametongue Totem III - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=7428; -- Frostmaul Giant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=7429; -- Frostmaul Preserver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7430; -- Frostsaber Cub - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7431; -- Frostsaber - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7432; -- Frostsaber Stalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7433; -- Frostsaber Huntress - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=7434; -- Frostsaber Pride Watcher - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7435; -- Cobalt Wyrmkin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=7436; -- Cobalt Scalebane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7438; -- Winterfall Ursa - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7438; -- Winterfall Ursa - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7439; -- Winterfall Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7439; -- Winterfall Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7440; -- Winterfall Den Watcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7440; -- Winterfall Den Watcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7441; -- Winterfall Totemic - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7441; -- Winterfall Totemic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=7442; -- Winterfall Pathfinder - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7442; -- Winterfall Pathfinder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7443; -- Shardtooth Mauler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7444; -- Shardtooth Bear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7445; -- Elder Shardtooth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7446; -- Rabid Shardtooth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7447; -- Fledgling Chillwind - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7447; -- Fledgling Chillwind - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7448; -- Chillwind Chimaera - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7448; -- Chillwind Chimaera - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=7449; -- Chillwind Ravager - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7449; -- Chillwind Ravager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7450; -- Ragged Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7451; -- Raging Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7452; -- Crazed Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7453; -- Moontouched Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7454; -- Berserk Owlbeast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7455; -- Winterspring Owl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7456; -- Winterspring Screecher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7457; -- Rogue Ice Thistle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7458; -- Ice Thistle Yeti - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7459; -- Ice Thistle Matriarch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7460; -- Ice Thistle Patriarch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7469; -- Nature Resistance Totem III - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7469; -- Nature Resistance Totem III - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7484; -- Windfury Totem III - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=7484; -- Windfury Totem III - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7485; -- Nargatt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7489; -- Silverpine Deathguard - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7505; -- Bloodmage Drazial - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7506; -- Bloodmage Lynnore - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7523; -- Suffering Highborne - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7524; -- Anguished Highborne - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7543; -- Dark Whelpling - speed walk was 0.5
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7544; -- Crimson Whelpling - speed walk was 0.45
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=7545; -- Emerald Whelpling - speed walk was 0.45
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7549; -- Tree Frog - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7550; -- Wood Frog - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7555; -- Hawk Owl - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7560; -- Snowshoe Rabbit - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7562; -- Brown Snake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7564; -- Marin Noggenfogger - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7565; -- Black Kingsnake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7566; -- Scarlet Snake - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7567; -- Crimson Snake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7568; -- Ribbon Snake - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7569; -- Green Water Snake - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=7572; -- Fallen Hero of the Horde - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7583; -- Sprinkle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7584; -- Wandering Forest Walker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7623; -- Dispatch Commander Ruag - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7643; -- Bengor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=7664; -- Razelikh the Defiler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7668; -- Servant of Razelikh - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7670; -- Servant of Allistarj - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7671; -- Servant of Sevine - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7683; -- Alessandro Luca - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7714; -- Innkeeper Byula - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7724; -- Senior Surveyor Fizzledowser - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7725; -- Grimtotem Raider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7726; -- Grimtotem Naturalist - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=7726; -- Grimtotem Naturalist - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7727; -- Grimtotem Shaman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=7732; -- Dupe Bug - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7733; -- Innkeeper Fizzgrimble - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=7734; -- Ilifar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=7735; -- Felcular - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7736; -- Innkeeper Shyria - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7737; -- Innkeeper Greul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7740; -- Gracina Spiritmight - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7744; -- Innkeeper Thulfram - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7750; -- Corporal Thund Splithoof - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7763; -- Curgle Cranklehop - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7764; -- Troyas Moonbreeze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=7765; -- Rockbiter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7766; -- Tyrion - speed walk was 1.29
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=7768; -- Witherbark Bloodling - speed walk was 0.42
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=7769; -- Hazzali Parasite - speed walk was 0.35
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7773; -- Marli Wishrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7775; -- Gregan Brewspewer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7776; -- Talo Thornhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7777; -- Rok Orhan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7778; -- Doran Steelwing - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7780; -- Rin'ji - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=7784; -- Homing Robot OOX-17/TN - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE  `entry`=7784; -- Homing Robot OOX-17/TN - speed run was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7785; -- Ward of Zum'rah - speed walk was 0.82
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7787; -- Sandfury Slave - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7788; -- Sandfury Drudge - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=7789; -- Sandfury Cretin - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE  `entry`=7789; -- Sandfury Cretin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7790; -- Orokk Omosh - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7792; -- Aturk the Anvil - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7793; -- Ox - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7794; -- McGavan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7798; -- Hank the Hammer - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7799; -- Gimblethorn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7800; -- Mekgineer Thermaplugg - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7801; -- Gilveradin Sunchaser - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7802; -- Galvan the Ancient - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7803; -- Scorpid Duneburrower - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7804; -- Trenton Lighthammer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=7806; -- Homing Robot OOX-09/HL - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=7806; -- Homing Robot OOX-09/HL - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7808; -- Marauding Owlbeast - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7823; -- Bera Stonehammer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7824; -- Bulkrek Ragefist - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7825; -- Oran Snakewrithe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7826; -- Ambassador Ardalan - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7843; -- Gnomeregan Evacuee - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7846; -- Teremus the Devourer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7847; -- Caliph Scorpidsting - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=7849; -- Mobile Alert System - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE  `entry`=7849; -- Mobile Alert System - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7850; -- Kernobee - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7851; -- Nethergarde Elite - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7852; -- Pratt McGrubben - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7853; -- Scooty - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7854; -- Jangdor Swiftstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7855; -- Southsea Pirate - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7856; -- Southsea Freebooter - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7857; -- Southsea Dock Worker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7858; -- Southsea Swashbuckler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7865; -- Wildhammer Sentry - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7866; -- Peter Galen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7868; -- Sarah Tanner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7869; -- Brumn Winterhoof - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7870; -- Caryssia Moonhunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7871; -- Se'Jib - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7872; -- Death's Head Cultist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7873; -- Razorfen Battleguard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7874; -- Razorfen Thornweaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7875; -- Hadoken Swiftstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7876; -- Tran'rek - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7877; -- Latronicus Moonspear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7878; -- Vestia Moonspear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7879; -- Quintis Jonespyre - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7880; -- Ginro Hearthkindle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7881; -- Stoley - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7882; -- Security Chief Bilgewhizzle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7883; -- Andre Firebeard - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=7883; -- Andre Firebeard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7884; -- Fraggar Thundermantle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7897; -- Alarm-a-bomb 2600 - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=7897; -- Alarm-a-bomb 2600 - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7900; -- Angelas Moonbreeze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7903; -- Jewel - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7904; -- Jacob - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7907; -- Daryn Lightwind - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7916; -- Erelas Ambersky - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7917; -- Brother Sarno - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7936; -- Lyon Mountainheart - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=7939; -- Feathermoon Sentinel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7941; -- Mardrack Greenwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7942; -- Faralorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7943; -- Harklane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7945; -- Savanne - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7946; -- Brannock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7947; -- Vivianna - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7948; -- Kylanna Windwhisper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7949; -- Xylinnia Starshine - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7952; -- Zjolnir - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7953; -- Xar'Ti - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7976; -- Thalgus Thunderfist - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7977; -- Gammerita - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7978; -- Bimble Longberry - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7996; -- Qiaga the Keeper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7997; -- Captured Sprite Darter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7998; -- Blastmaster Emi Shortfuse - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8015; -- Ashenvale Sentinel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8016; -- Barrens Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8018; -- Guthrum Thunderfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8019; -- Fyldren Moonfeather - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8020; -- Shyn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8021; -- Orwin Gizzmick - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8022; -- Thadius Grimshade - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=8023; -- Sharpbeak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=8024; -- Sharpbeak's Father - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=8025; -- Sharpbeak's Mother - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8026; -- Thyn'tel Bladeweaver - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=8035; -- Dark Iron Land Mine - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=8075; -- Edana Hatetalon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8095; -- Sul'lithuz Sandcrawler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8115; -- Witch Doctor Uzer'i - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8118; -- Lillian Singh - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8119; -- Zikkel - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8120; -- Sul'lithuz Abomination - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8123; -- Rickle Goldgrubber - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8124; -- Qizzik - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8125; -- Dirge Quikcleave - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8126; -- Nixx Sprocketspring - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8128; -- Pikkle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8129; -- Wrinkle Goodsteel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8130; -- Sul'lithuz Hatchling - speed walk was 0.31
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8131; -- Blizrik Buckshot - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8137; -- Gikkix - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8138; -- Sul'lithuz Broodling - speed walk was 0.68
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8139; -- Jabbey - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8140; -- Brother Karman - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8141; -- Captain Evencane - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8142; -- Jannos Lighthoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8143; -- Loorana - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8144; -- Kulleg Stonehorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8145; -- Sheendra Tallgrass - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8146; -- Ruw - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8147; -- Camp Mojache Brave - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8150; -- Janet Hommers - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8151; -- Nijel's Point Guard - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8153; -- Narv Hidecrafter - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8155; -- Kargath Grunt - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8155; -- Kargath Grunt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.41 WHERE  `entry`=8156; -- Servant of Antu'sul - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8157; -- Logannas - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8158; -- Bronk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8159; -- Worb Strongstitch - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8160; -- Nioma - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8161; -- Harggan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8176; -- Gharash - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8177; -- Rartar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8178; -- Nina Lightbrew - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8179; -- Greater Healing Ward - speed walk was 0.82
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=8179; -- Greater Healing Ward - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8196; -- Occulus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8197; -- Chronalis - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8198; -- Tick - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=8201; -- Omgorn the Lost - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=8202; -- Cyclok the Mad - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=8203; -- Kregg Keelhaul - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.47 WHERE  `entry`=8204; -- Soriid the Devourer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.9 WHERE  `entry`=8205; -- Haarka the Ravenous - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.17 WHERE  `entry`=8207; -- Greater Firebird - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=8211; -- Old Cliff Jumper - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=8212; -- The Reak - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=8213; -- Ironback - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=8214; -- Jalinde Summerdrake - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=8215; -- Grimungous - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8216; -- Retherokk the Berserker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=8217; -- Mith'rethis the Enchanter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8256; -- Curator Thorius - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8257; -- Oozeling - speed walk was 0.61
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8276; -- Soaring Razorbeak - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=8276; -- Soaring Razorbeak - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8277; -- Rekk'tilac - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=8278; -- Smoldar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=8280; -- Shleipnarr - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8282; -- Highlord Mastrogonde - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8284; -- Dorius Stonetender - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=8284; -- Dorius Stonetender - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=8297; -- Magronos the Unyielding - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.76 WHERE  `entry`=8299; -- Spiteflayer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.5 WHERE  `entry`=8300; -- Ravage - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.6 WHERE  `entry`=8301; -- Clack the Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=8302; -- Deatheye - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.22 WHERE  `entry`=8303; -- Grunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8305; -- Kixxle - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8306; -- Duhng - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8307; -- Tarban Hearthgrain - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8310; -- Watcher Wollpert - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8311; -- Slime Maggot - speed walk was 0.35
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=8317; -- Atal'ai Deathwalker's Spirit - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=8317; -- Atal'ai Deathwalker's Spirit - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8318; -- Atal'ai Slave - speed walk was 0.6
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8319; -- Nightmare Whelp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8320; -- Sprok - speed walk was 1.07
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=8336; -- Hakkari Sapper - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8356; -- Chesmu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8357; -- Atepa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8358; -- Hewa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8359; -- Ahanu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8360; -- Elki - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8361; -- Chepi - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8362; -- Kuruk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8363; -- Shadi Mistrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8364; -- Pakwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8376; -- Mechanical Chicken - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=8384; -- Deep Lurker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8385; -- Mura Runetotem - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8390; -- Chemist Cuely - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=8391; -- Lathoric the Black - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8393; -- Thersa Windsong - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8398; -- Ohanko - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8399; -- Nyrill - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8400; -- Obsidion - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8401; -- Halpa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8402; -- Enslaved Archaeologist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8403; -- Jeremiah Payson - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8404; -- Xan'tish - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8416; -- Felix Whindlebolt - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8417; -- Dying Archaeologist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8418; -- Falla Sagewind - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8419; -- Twilight Idolater - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8436; -- Zamael Lunthistle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8437; -- Hakkari Minion - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8439; -- Nilith Lokrav - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=8441; -- Raze - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8442; -- Shadowsilk Poacher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=4.28 WHERE  `entry`=8443; -- Avatar of Hakkar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8444; -- Trade Master Kovic - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8447; -- Clunk - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=8447; -- Clunk - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8477; -- Skeletal Servant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8479; -- Kalaran Windblade - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=2 WHERE  `entry`=8480; -- Kalaran the Deceiver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8496; -- Liv Rizzlefix - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=8497; -- Nightmare Suppressor - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=8503; -- Gibblewilt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=8504; -- Dark Iron Sentry - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8506; -- Eranikus the Chained - speed walk was 0.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8507; -- Tymor - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8508; -- Gretta Ganter - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8509; -- Squire Maltrake - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8516; -- Belnistrasz - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8517; -- Xiggs Fuselighter - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8519; -- Blighted Surge - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=8519; -- Blighted Surge - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8520; -- Plague Ravager - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=8520; -- Plague Ravager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8521; -- Blighted Horror - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=8521; -- Blighted Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8522; -- Plague Monstrosity - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=8522; -- Plague Monstrosity - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=8523; -- Scourge Soldier - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8524; -- Cursed Mage - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=8525; -- Scourge Warder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8526; -- Dark Caster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=8527; -- Scourge Guard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8528; -- Dread Weaver - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=8529; -- Scourge Champion - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=8530; -- Cannibal Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=8531; -- Gibbering Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=8532; -- Diseased Flayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=8534; -- Putrid Gargoyle - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8534; -- Putrid Gargoyle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=8535; -- Putrid Shrieker - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8535; -- Putrid Shrieker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8538; -- Unseen Servant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8539; -- Eyeless Watcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8540; -- Torn Screamer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8541; -- Hate Shrieker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8542; -- Death Singer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8543; -- Stitched Horror - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8546; -- Dark Adept - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8547; -- Death Cultist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8548; -- Vile Tutor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8551; -- Dark Summoner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8553; -- Necromancer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8554; -- Chief Sharptusk Thornmantle - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=8554; -- Chief Sharptusk Thornmantle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8555; -- Crypt Stalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8556; -- Crypt Walker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8557; -- Crypt Horror - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8558; -- Crypt Slayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8560; -- Mossflayer Scout - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8561; -- Mossflayer Shadowhunter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8562; -- Mossflayer Cannibal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8563; -- Woodsman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8564; -- Ranger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8565; -- Pathstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8566; -- Dark Iron Lookout - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8567; -- Glutton - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8576; -- Ag'tor Bloodfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8579; -- Yeh'kinya - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=8580; -- Atal'alarion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8582; -- Kadrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8583; -- Dirania Silvershine - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8586; -- Haggrum Bloodfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8587; -- Jediga - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8596; -- Plaguehound Runt - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8596; -- Plaguehound Runt - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8597; -- Plaguehound - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8598; -- Frenzied Plaguehound - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8600; -- Plaguebat - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8601; -- Noxious Plaguebat - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8602; -- Monstrous Plaguebat - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8603; -- Carrion Grub - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8605; -- Carrion Devourer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8606; -- Living Decay - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8607; -- Rotting Sludge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8609; -- Alexandra Constantine - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8610; -- Kroum - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8611; -- Idol Room Spawner - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8617; -- Zalashji - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8636; -- Morta'gya the Keeper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8637; -- Dark Iron Watchman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8656; -- Hukku's Voidwalker - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8657; -- Hukku's Succubus - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8658; -- Hukku's Imp - speed walk was 0.61
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8659; -- Jes'rimon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8661; -- Auctioneer Beardo - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8662; -- Idol Oven Fire Target - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8664; -- Saern Priderunner - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8665; -- Shylenai - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8666; -- Lil Timmy - speed walk was 0.74
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8667; -- Gusting Vortex - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8669; -- Auctioneer Tolon - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8670; -- Auctioneer Chilton - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8671; -- Auctioneer Buckler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8672; -- Auctioneer Leeka - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8673; -- Auctioneer Thathung - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8674; -- Auctioneer Stampi - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8675; -- Felbeast - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8679; -- Knaz Blunderflame - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8681; -- Outfitter Eric - speed walk was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8696; -- Henry Stern - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8719; -- Auctioneer Fitch - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8720; -- Auctioneer Redmuse - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8721; -- Auctioneer Epitwee - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8722; -- Auctioneer Gullem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8723; -- Auctioneer Golothas - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8724; -- Auctioneer Wabang - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8736; -- Buzzek Bracketswing - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8737; -- Linken - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8738; -- Vazario Linkgrease - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=8759; -- Mosshoof Runner - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8759; -- Mosshoof Runner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8762; -- Timberweb Recluse - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8767; -- Sah'rhee - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=8816; -- Deathly Usher - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2.72 WHERE  `entry`=8836; -- Battle Chicken - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8876; -- Sandfury Acolyte - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8877; -- Sandfury Zealot - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8878; -- Muuran - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8879; -- Royal Historian Archesonus - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8881; -- Riding Ram - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=8881; -- Riding Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8882; -- Riding Tiger - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=8882; -- Riding Tiger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8883; -- Riding Horse - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=8883; -- Riding Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8884; -- Skeletal Mount - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=8884; -- Skeletal Mount - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8885; -- Riding Raptor - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=8885; -- Riding Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8886; -- Deviate Python - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8888; -- Franclorn Forgewright - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8889; -- Anvilrage Overseer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8890; -- Anvilrage Warden - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8891; -- Anvilrage Guardsman - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8896; -- Shadowforge Peasant - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8897; -- Doomforge Craftsman - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8899; -- Doomforge Dragoon - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8900; -- Doomforge Arcanasmith - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8901; -- Anvilrage Reservist - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8902; -- Shadowforge Citizen - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8903; -- Anvilrage Captain - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8904; -- Shadowforge Senator - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8905; -- Warbringer Construct - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8906; -- Ragereaver Golem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8907; -- Wrath Hammer Construct - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8908; -- Molten War Golem - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8909; -- Fireguard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8910; -- Blazing Fireguard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8911; -- Fireguard Destroyer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8912; -- Twilight's Hammer Torturer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8913; -- Twilight Emissary - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8914; -- Twilight Bodyguard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8915; -- Twilight's Hammer Ambassador - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8916; -- Arena Spectator - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8917; -- Quarry Slave - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8920; -- Weapon Technician - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8921; -- Bloodhound - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8921; -- Bloodhound - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8922; -- Bloodhound Mastiff - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=8924; -- The Behemoth - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8925; -- Dredge Worm - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8926; -- Deep Stinger - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8927; -- Dark Screecher - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8928; -- Burrowing Thundersnout - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8929; -- Princess Moira Bronzebeard - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8931; -- Innkeeper Heather - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8933; -- Cave Creeper - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8934; -- Christopher Hewen - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.91 WHERE  `entry`=8937; -- Pet Bomb - speed walk was 0.6
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8956; -- Angerclaw Bear - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8957; -- Angerclaw Grizzly - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8958; -- Angerclaw Mauler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8959; -- Felpaw Wolf - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8959; -- Felpaw Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8960; -- Felpaw Scavenger - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8960; -- Felpaw Scavenger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8961; -- Felpaw Ravager - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=8961; -- Felpaw Ravager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8962; -- Hilary - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8963; -- Effsee - speed walk was 0.45
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8964; -- Blackrock Drake - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE  `entry`=8964; -- Blackrock Drake - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8965; -- Shawn - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=2.7 WHERE  `entry`=8976; -- Hematos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=8977; -- Krom'Grul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=8981; -- Malfunctioning Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8982; -- Ironhand Guardian - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8983; -- Golem Lord Argelmach - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8997; -- Gershala Nightwhisper - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=9016; -- Bael'Gar - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9017; -- Lord Incendius - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9018; -- High Interrogator Gerstahn - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9019; -- Emperor Dagran Thaurissan - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9020; -- Commander Gor'shak - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9021; -- Kharan Mighthammer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9022; -- Dughal Stormwing - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9023; -- Marshal Windsor - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=9023; -- Marshal Windsor - speed run was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9024; -- Pyromancer Loregrain - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=9025; -- Lord Roccor - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9026; -- Overmaster Pyron - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9027; -- Gorosh the Dervish - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=9028; -- Grizzle - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9030; -- Ok'thor the Breaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9033; -- General Angerforge - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9034; -- Hate'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9035; -- Anger'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9036; -- Vile'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9037; -- Gloom'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9038; -- Seeth'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9039; -- Doom'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9040; -- Dope'rel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9041; -- Warder Stilgiss - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9042; -- Verek - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9043; -- Scarshield Grunt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9044; -- Scarshield Sentry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9046; -- Scarshield Quartermaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9047; -- Jenal - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9056; -- Fineous Darkvire - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9076; -- Ghede - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9077; -- Warlord Goretooth - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9078; -- Shadowmage Vivian Lagrave - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9079; -- Hierophant Theodora Mulvadania - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9080; -- Lexlort - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9081; -- Galamav the Marksman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=9082; -- Thal'trak Proudtusk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=9083; -- Razal'blade - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.471429 WHERE  `entry`=9083; -- Razal'blade - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=9084; -- Thunderheart - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.471429 WHERE  `entry`=9084; -- Thunderheart - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=9085; -- Initiate Amakkar - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.471429 WHERE  `entry`=9085; -- Initiate Amakkar - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=9086; -- Grunt Gargal - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.471429 WHERE  `entry`=9086; -- Grunt Gargal - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9087; -- Bashana Runetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=9096; -- Rage Talon Dragonspawn - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9096; -- Rage Talon Dragonspawn - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9099; -- Sraaz - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9116; -- Eridan Bluewind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9118; -- Larion - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9119; -- Muigin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9156; -- Ambassador Flamelash - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9157; -- Bloodpetal Pest - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9162; -- Young Diemetradon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9163; -- Diemetradon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9164; -- Elder Diemetradon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=9165; -- Fledgling Pterrordax - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9165; -- Fledgling Pterrordax - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=9166; -- Pterrordax - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9166; -- Pterrordax - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=9167; -- Frenzied Pterrordax - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9167; -- Frenzied Pterrordax - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9176; -- Gor'tesh - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9177; -- Oralius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9178; -- Burning Spirit - speed walk was 1.07
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=9178; -- Burning Spirit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9196; -- Highlord Omokk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9197; -- Spirestone Battle Mage - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9198; -- Spirestone Mystic - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9199; -- Spirestone Enforcer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9200; -- Spirestone Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9201; -- Spirestone Ogre Magus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9216; -- Spirestone Warlord - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9217; -- Spirestone Lord Magus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9218; -- Spirestone Battle Lord - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9219; -- Spirestone Butcher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9236; -- Shadow Hunter Vosh'gajin - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9238; -- Quentin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=9268; -- Smolderthorn Berserker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9270; -- Williden Marshal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9271; -- Hol'anyee Marshal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9272; -- Spark Nilminer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.32 WHERE  `entry`=9273; -- Petra Grossen - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.82857 WHERE  `entry`=9273; -- Petra Grossen - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.32 WHERE  `entry`=9274; -- Dadanga - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.82857 WHERE  `entry`=9274; -- Dadanga - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9296; -- Milly Osworth - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE  `entry`=9297; -- Enraged Wyvern - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9298; -- Donova Snowden - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9316; -- Wenikee Boltbucket - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9317; -- Rilli Greasygob - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9318; -- Incendosaur - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9319; -- Houndmaster Grebmar - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9356; -- Innkeeper Shul'kar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9376; -- Blazerunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=9396; -- Ground Pounder - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9398; -- Twilight's Hammer Executioner - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9416; -- Scarshield Worg - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9437; -- Dark Keeper Vorfalk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9438; -- Dark Keeper Bethek - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9439; -- Dark Keeper Uggel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9441; -- Dark Keeper Zimrel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9442; -- Dark Keeper Ofgut - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9443; -- Dark Keeper Pelver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9445; -- Dark Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9447; -- Scarlet Warder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9448; -- Scarlet Praetorian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9449; -- Scarlet Cleric - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9450; -- Scarlet Curate - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9452; -- Scarlet Enchanter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=9459; -- Cyrus Therepentous - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9460; -- Gadgetzan Bruiser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=9461; -- Frenzied Black Drake - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=9462; -- Chieftain Bloodmaw - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=9462; -- Chieftain Bloodmaw - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9465; -- Golhine the Hooded - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9467; -- Miblon Snarltooth - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=9467; -- Miblon Snarltooth - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.89 WHERE  `entry`=9477; -- Cloned Ooze - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=9498; -- Gorishi Grub - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9499; -- Plugger Spazzring - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=0.72 WHERE  `entry`=9500; -- Mistress Nagmara - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=9500; -- Mistress Nagmara - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9501; -- Innkeeper Adegwa - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9502; -- Phalanx - speed walk was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=9503; -- Private Rocknot - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=9503; -- Private Rocknot - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9517; -- Shadow Lord Fel'dan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9518; -- Rakaiah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9520; -- Grark Lorkrub - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=9520; -- Grark Lorkrub - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=9521; -- Enraged Felbat - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=9522; -- Blackrock Ambusher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=9524; -- Kolkar Invader - speed walk was 1.22
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE  `entry`=9526; -- Enraged Gryphon - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9528; -- Arathandris Silversky - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9536; -- Maxwort Uberglint - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9540; -- Enohar Thunderbrew - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9543; -- Ribbly Screwspigot - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9544; -- Yuka Screwspigot - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9548; -- Cawind Trueaim - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9551; -- Starn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9552; -- Zanara - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9553; -- Nadia Vernon - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9555; -- Mu'uta - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9558; -- Grimble - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9559; -- Grizzlowe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9560; -- Marshal Maxwell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9561; -- Jalinda Sprig - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9562; -- Helendis Riverhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9563; -- Ragged John - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9564; -- Frezza - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9565; -- Mayara Brightwing - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=9568; -- Overlord Wyrmthalak - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.9 WHERE  `entry`=16157; -- Doom Touched Warrior - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=15043; -- Zulian Crocolisk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9584; -- Jalane Ayrole - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=9596; -- Bannok Grimaxe - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9600; -- Parrot - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=9602; -- Hahk'Zor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9604; -- Gorgon'och - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9618; -- Karna Remtravel - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9619; -- Torwa Pathfinder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9622; -- U'cha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=9623; -- A-Me 01 - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9656; -- Pet Bombling - speed walk was 0.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9657; -- Lil' Smoky - speed walk was 0.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9660; -- Agnar Beastamer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9662; -- Sprite Darter Hatchling - speed walk was 0.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9676; -- Tink Sprocketwhistle - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9677; -- Ograbisi - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9678; -- Shill Dinger - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9679; -- Tobias Seecher - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9680; -- Crest Killer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9681; -- Jaz - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.7 WHERE  `entry`=9682; -- Marshal Reginald Windsor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9683; -- Lar'korwi Mate - speed walk was 1.19
UPDATE `creature_template` SET `speed_run`=1.21429 WHERE  `entry`=9683; -- Lar'korwi Mate - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=9684; -- Lar'korwi - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.21429 WHERE  `entry`=9684; -- Lar'korwi - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9690; -- Ember Worg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9691; -- Venomtip Scorpid - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9694; -- Slavering Ember Worg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9695; -- Deathlash Scorpid - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9696; -- Bloodaxe Worg - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9697; -- Giant Ember Worg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9698; -- Firetail Scorpid - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9699; -- Fire Beetle - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=9699; -- Fire Beetle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9700; -- Lava Crab - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=9700; -- Lava Crab - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9701; -- Spire Scorpid - speed walk was 0.75
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9706; -- Yorba Screwspigot - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=9718; -- Ghok Bashguud - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9776; -- Flamekin Spitter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9777; -- Flamekin Sprite - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9778; -- Flamekin Torcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9779; -- Flamekin Rager - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9796; -- Galgar - speed walk was 0.95
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9816; -- Pyroguard Emberseer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9836; -- Mathredis Firestar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9856; -- Auctioneer Grimful - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9857; -- Auctioneer Grizzlin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9858; -- Auctioneer Kresky - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9860; -- Salia - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9861; -- Moora - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9862; -- Jaedenar Legionnaire - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9862; -- Jaedenar Legionnaire - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9878; -- Entropic Beast - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9878; -- Entropic Beast - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9879; -- Entropic Horror - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=9879; -- Entropic Horror - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9937; -- Common Kitten - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=9938; -- Magmus - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9956; -- Shadowforge Flame Keeper - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9976; -- Tharlidun - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9977; -- Sylista - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9978; -- Wesley - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9979; -- Sarah Goode - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9980; -- Shelby Stoneflint - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9981; -- Sikwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9982; -- Penny - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9983; -- Kelsuwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9984; -- Ulbrek Firehand - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9985; -- Laziphus - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9986; -- Shyrka Wolfrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9987; -- Shoja'my - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9988; -- Xon'cha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9989; -- Lina Hearthstove - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9990; -- Lanti'gah - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9996; -- Winna Hazzard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9997; -- Spraggle Frock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9998; -- Shizzle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=9999; -- Ringo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10016; -- Tainted Rat - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=10016; -- Tainted Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE  `entry`=10017; -- Tainted Cockroach - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=10017; -- Tainted Cockroach - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10038; -- Night Watch Guard - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10038; -- Night Watch Guard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10045; -- Kirk Maxwell - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10046; -- Bethaine Flinthammer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10047; -- Michael - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10049; -- Hekkru - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10050; -- Seikwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10051; -- Seriadne - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10052; -- Maluressian - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10053; -- Anya Maulray - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10054; -- Bulrug - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10055; -- Morganus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10056; -- Alassin - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10057; -- Theodore Mont Claire - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10058; -- Greth - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10059; -- Antarius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10060; -- Grimestack - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10061; -- Killium Bouldertoe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10062; -- Steven Black - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10063; -- Reggifuz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10076; -- High Priestess of Thaurissan - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=10077; -- Deathmaw - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10077; -- Deathmaw - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10079; -- Brave Moonhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10083; -- Rage Talon Flamescale - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10083; -- Rage Talon Flamescale - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10085; -- Jaelysia - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10086; -- Hesuwa Thunderhorn - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10088; -- Xao'tsu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10089; -- Silvaria - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10090; -- Belia Thundergranite - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10116; -- Slave - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10117; -- Tortured Slave - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10118; -- Nessa Shadowsong - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10119; -- Volchan - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10119; -- Volchan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10136; -- Chemist Fuely - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10158; -- Moonkin - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10161; -- Rookery Whelp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10176; -- Kaltunk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10181; -- Lady Sylvanas Windrunner - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=10181; -- Lady Sylvanas Windrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10182; -- Rexxar - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=10183; -- Moonflare Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1.29 WHERE  `entry`=10184; -- Onyxia - speed run was 1.28571
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10196; -- General Colbatann - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=10200; -- Rak'shiri - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10200; -- Rak'shiri - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=10202; -- Azurous - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10204; -- Misha - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10216; -- Gubber Blump - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10218; -- Superior Healing Ward - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=10218; -- Superior Healing Ward - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10219; -- Gwennyth Bly'Leggonde - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10221; -- Bloodaxe Worg Pup - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10258; -- Rookery Guardian - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10258; -- Rookery Guardian - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10259; -- Worg Pup - speed walk was 0.36
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10260; -- Kibler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10262; -- Opus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10263; -- Burning Felguard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=10264; -- Solakar Flamewreath - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10266; -- Ug'thok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10267; -- Tinkee Steamboil - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10268; -- Gizrul the Slavener - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10276; -- Rotgath Stonebeard - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10277; -- Groum Stonebeard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10278; -- Thrag Stonehoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10293; -- Dulciea Frostmoon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=10296; -- Vaelan - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10300; -- Ranshalla - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10301; -- Jaron Stoneshaper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10302; -- Krakle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10303; -- Storm Shadowhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10304; -- Aurora Skycaller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10305; -- Umi Rumplesnicker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10307; -- Witch Doctor Mau'ari - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55 WHERE  `entry`=10323; -- Murkdeep - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=10340; -- Vaelastrasz the Red - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10356; -- Bayne - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10357; -- Ressan the Needler - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10358; -- Fellicent's Shade - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10360; -- Kergul Bloodaxe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10361; -- Gruul Darkblade - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10363; -- General Drakkisath - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=10363; -- General Drakkisath - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10366; -- Rage Talon Dragon Guard - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10366; -- Rage Talon Dragon Guard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10369; -- Trayexir - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.14 WHERE  `entry`=10370; -- Xur'gyl - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10370; -- Xur'gyl - speed run was 0
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10371; -- Rage Talon Captain - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10371; -- Rage Talon Captain - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10372; -- Rage Talon Fire Tongue - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10372; -- Rage Talon Fire Tongue - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10375; -- Spire Spiderling - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=10376; -- Crystal Fang - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10377; -- Elu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10378; -- Omusa Thunderhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10380; -- Sanuye Runetotem - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10381; -- Ravaged Cadaver - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10382; -- Mangled Cadaver - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=0.7 WHERE  `entry`=10383; -- Broken Cadaver - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10387; -- Vengeful Phantom - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=10388; -- Spiteful Phantom - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=10389; -- Wrath Phantom - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10390; -- Skeletal Guardian - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10391; -- Skeletal Berserker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10394; -- Black Guard Sentry - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10398; -- Thuzadin Shadowcaster - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10400; -- Thuzadin Necromancer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10406; -- Ghoul Ravener - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10407; -- Fleshflayer Ghoul - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10408; -- Rockwing Gargoyle - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10408; -- Rockwing Gargoyle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10409; -- Rockwing Screecher - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10412; -- Crypt Crawler - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10413; -- Crypt Beast - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10414; -- Patchwork Horror - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=10415; -- Ash'ari Crystal - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10416; -- Bile Spewer - speed walk was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10417; -- Venom Belcher - speed walk was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10418; -- Crimson Guardsman - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10419; -- Crimson Conjuror - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10420; -- Crimson Initiate - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10421; -- Crimson Defender - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10422; -- Crimson Sorcerer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10423; -- Crimson Priest - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10424; -- Crimson Gallant - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10425; -- Crimson Battle Mage - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10426; -- Crimson Inquisitor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10427; -- Pao'ka Swiftmountain - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10428; -- Motega Firemane - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10429; -- Warchief Rend Blackhand - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10431; -- Gregor Greystone - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10432; -- Vectus - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10433; -- Marduk Blackpool - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=10435; -- Magistrate Barthilas - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10436; -- Baroness Anastari - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10438; -- Maleki the Pallid - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10439; -- Ramstein the Gorger - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10441; -- Plagued Rat - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10442; -- Chromatic Whelp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10447; -- Chromatic Dragonspawn - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10460; -- Prospector Ironboot - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10461; -- Plagued Insect - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10463; -- Shrieking Banshee - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10464; -- Wailing Banshee - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10467; -- Mana Tide Totem - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=10467; -- Mana Tide Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10468; -- Felnok Steelspring - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10469; -- Scholomance Adept - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10470; -- Scholomance Neophyte - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10471; -- Scholomance Acolyte - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10475; -- Scholomance Student - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10477; -- Scholomance Necromancer - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=10478; -- Splintered Skeleton - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=10479; -- Skulking Corpse - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10480; -- Unstable Corpse - speed walk was 0.6
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE  `entry`=10480; -- Unstable Corpse - speed run was 0.6
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10481; -- Reanimated Corpse - speed walk was 0.6
UPDATE `creature_template` SET `speed_run`=0.428571 WHERE  `entry`=10481; -- Reanimated Corpse - speed run was 0.6
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10485; -- Risen Aberration - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=10485; -- Risen Aberration - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10486; -- Risen Warrior - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10487; -- Risen Protector - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10488; -- Risen Construct - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=10488; -- Risen Construct - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10489; -- Risen Guard - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10495; -- Diseased Ghoul - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=10497; -- Ragged Ghoul - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10498; -- Spectral Tutor - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10499; -- Spectral Researcher - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10500; -- Spectral Teacher - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10503; -- Jandice Barov - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=10506; -- Kirtonos the Herald - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=10507; -- The Ravenian - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10516; -- The Unforgiven - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10537; -- Cliffwatcher Longhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10538; -- Vaelastrasz - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10539; -- Hagar Lightninghoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10540; -- Vol'jin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10541; -- Krakle's Thermometer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10556; -- Lazy Peon - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10557; -- Flametongue Totem IV - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=10557; -- Flametongue Totem IV - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10558; -- Hearthsinger Forresten - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10559; -- Lady Vespia - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=10577; -- Crypt Scarab - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10578; -- Bom'bay - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10580; -- Fetid Zombie - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10581; -- Young Arikara - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=10584; -- Urok Doomhowl - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10598; -- Smolderweb Hatchling - speed walk was 0.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10599; -- Hulfnar Stonetotem - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10600; -- Thontek Rumblehoof - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=10601; -- Urok Enforcer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=10602; -- Urok Ogre Magus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10604; -- Huntress Nhemai - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=10604; -- Huntress Nhemai - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10605; -- Scarlet Medic - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10606; -- Huntress Yaeliura - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=10606; -- Huntress Yaeliura - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10610; -- Angus - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10611; -- Shorty - speed walk was 0.77
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10616; -- Supervisor Raelen - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10636; -- Pack Kodo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10637; -- Malyfous Darkhammer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10638; -- Kanati Greycloud - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=10641; -- Branch Snapper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.6 WHERE  `entry`=10643; -- Mugglefin - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10644; -- Mist Howler - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10645; -- Thalia Amberhide - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10646; -- Lakota Windsong - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10665; -- Junior Apothecary Holland - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10666; -- Gordo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10667; -- Chromie - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.43 WHERE  `entry`=10676; -- Raider Jhash - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10678; -- Plagued Hatchling - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1.43 WHERE  `entry`=10682; -- Raider Kerr - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10683; -- Rookery Hatcher - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10683; -- Rookery Hatcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10685; -- Swine - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=10685; -- Swine - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10696; -- Refuge Pointe Defender - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.65 WHERE  `entry`=10697; -- Bile Slime - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10698; -- Summoned Zombie - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=10699; -- Carrion Scarab - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10716; -- Belfry Bat - speed walk was 0.36
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE  `entry`=10716; -- Belfry Bat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10721; -- Novice Warrior - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=10737; -- Shy-Rotam - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10737; -- Shy-Rotam - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=10738; -- High Chief Winterfall - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=10738; -- High Chief Winterfall - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=10740; -- Awbee - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=10741; -- Sian-Rotam - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10741; -- Sian-Rotam - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=10756; -- Scalding Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=10757; -- Boiling Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10776; -- Finkle Einhorn - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10778; -- Janice Felstone - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10779; -- Infected Squirrel - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=10779; -- Infected Squirrel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10780; -- Infected Deer - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=10780; -- Infected Deer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10781; -- Royal Overseer Bauhaus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10782; -- Royal Factor Bathrilor - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10801; -- Jabbering Ghoul - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10803; -- Rifleman Wheeler - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10804; -- Rifleman Middlecamp - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10805; -- Spotter Klemmy - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10806; -- Ursius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=10807; -- Brumeran - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=10807; -- Brumeran - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=10808; -- Timmy the Cruel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10811; -- Archivist Galford - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=10813; -- Balnazzar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=10814; -- Chromatic Elite Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10816; -- Wandering Skeleton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=10817; -- Duggan Wildhammer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10821; -- Hed'mush the Rotting - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=10822; -- Warlord Thresh'jin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=10823; -- Zul'Brin Warpbranch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10825; -- Gish the Unmoving - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10827; -- Deathspeaker Selendre - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10828; -- High General Abbendis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10837; -- High Executor Derrington - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10838; -- Commander Ashlam Valorfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10839; -- Argent Officer Garush - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10840; -- Argent Officer Pureheart - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10856; -- Argent Quartermaster Hasana - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10857; -- Argent Quartermaster Lightspark - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.5 WHERE  `entry`=10876; -- Undead Scarab - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10877; -- Courier Hammerfall - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10878; -- Herald Moonstalker - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10879; -- Harbinger Balthazad - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10881; -- Bluff Runner Windstrider - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=10882; -- Arikara - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10882; -- Arikara - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10897; -- Sindrayl - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10902; -- Andorhal Tower One - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10903; -- Andorhal Tower Two - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10904; -- Andorhal Tower Three - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10905; -- Andorhal Tower Four - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=10916; -- Winterfall Runner - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=10916; -- Winterfall Runner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10920; -- Kelek Skykeeper - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10921; -- Taronn Redfeather - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10922; -- Greta Mosshoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10923; -- Tenell Leafrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10924; -- Ivy Leafrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10925; -- Rotting Worm - speed walk was 0.37
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10926; -- Pamela Redpath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10927; -- Marlene Redpath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10928; -- Succubus Minion - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10937; -- Captain Redpath - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10938; -- Redpath the Corrupted - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=10939; -- Marduk the Black - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10941; -- Wizlo Bearingshiner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=10943; -- Decrepit Guardian - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10944; -- Davil Lightfire - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=10946; -- Horgus the Ravager - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=10949; -- Silver Hand Disciple - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=10953; -- Servant of Horgus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=10954; -- Bloodletter - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10976; -- Jeziba - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10977; -- Quixxil - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10978; -- Legacki - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10979; -- Scarlet Hound - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10981; -- Frostwolf - speed run was 2.42857
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=10983; -- Winterax Troll - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=10984; -- Winterax Berserker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=10986; -- Snowblind Harpy - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.89 WHERE  `entry`=10988; -- Kodo Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=10990; -- Alterac Ram - speed run was 2.11
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=10991; -- Wildpaw Gnoll - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11017; -- Roxxik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11019; -- Jessir Moonbow - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11020; -- Remains of Trey Lightforge - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11022; -- Alexi Barov - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11023; -- Weldon Barov - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11024; -- Della - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11024; -- Della - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11025; -- Mukdrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11026; -- Sprite Jumpsprocket - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=11027; -- Illusory Wraith - speed walk was 1.21
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11028; -- Jemma Quikswitch - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11029; -- Trixie Quikswitch - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=11030; -- Mindless Undead - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11031; -- Franklin Lloyd - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11032; -- Malor the Zealous - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11033; -- Smokey LaRue - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11034; -- Lord Maxwell Tyrosus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11035; -- Betina Bigglezink - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11036; -- Leonid Barthalomew the Revered - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11037; -- Jenna Lemkenilli - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11038; -- Caretaker Alen - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11039; -- Duke Nicholas Zverenhoff - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11040; -- Watcher Brownell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11041; -- Milla Fairancora - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11042; -- Sylvanna Forestmoon - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11043; -- Crimson Monk - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11044; -- Doctor Martin Felben - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11046; -- Whuut - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11047; -- Kray - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11048; -- Victor Ward - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11049; -- Rhiannon Davis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11050; -- Trianna - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11051; -- Vhan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11052; -- Timothy Worthington - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11053; -- High Priestess MacDonnell - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11054; -- Crimson Rifleman - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11055; -- Shadow Priestess Vandis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11056; -- Alchemist Arbington - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11057; -- Apothecary Dithers - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11063; -- Carlin Redpath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11065; -- Thonys Pillarstone - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11066; -- Jhag - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11067; -- Malcomb Wynn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11068; -- Betty Quin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11069; -- Jenova Stoneshield - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11070; -- Lalina Summermoon - speed walk was 1.06
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11071; -- Mot Dawnstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11072; -- Kitta Firewind - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=11075; -- Cauldron Lord Bilemaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.89 WHERE  `entry`=11076; -- Cauldron Lord Razarch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=11077; -- Cauldron Lord Malvinious - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=11078; -- Cauldron Lord Soulwrath - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11079; -- Wynd Nightchaser - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11081; -- Faldron - speed walk was 1.09
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11083; -- Darianna - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11084; -- Tarn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11096; -- Randal Worth - speed walk was 1.04
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11097; -- Drakk Stonehand - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11098; -- Hahrana Ironhide - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11102; -- Argent Rider - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=11102; -- Argent Rider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11103; -- Innkeeper Lyshaerya - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11104; -- Shelgrayn - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11105; -- Aboda - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11106; -- Innkeeper Sikewa - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11116; -- Innkeeper Abeqwa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11117; -- Awenasa - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11118; -- Innkeeper Vizzie - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11119; -- Azzleby - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=11120; -- Crimson Hammersmith - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=11121; -- Black Guard Swordsmith - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.25 WHERE  `entry`=11122; -- Restless Soul - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.55 WHERE  `entry`=11136; -- Freed Soul - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11137; -- Xai'ander - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11138; -- Maethrya - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11139; -- Yugrek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11140; -- Egan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=11141; -- Spirit of Trey Lightforge - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=11143; -- Postmaster Malown - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11145; -- Myolor Sunderfury - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11146; -- Ironus Coldsteel - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11152; -- The Scourge Cauldron - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11156; -- Green Skeletal Warhorse - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=11156; -- Green Skeletal Warhorse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11176; -- Krathok Moltenfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11177; -- Okothos Ironrager - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11178; -- Borgosh Corebender - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11180; -- Bloodvenom Post Brave - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11181; -- Shi'alune - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11182; -- Nixxrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11183; -- Blixxrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11184; -- Wixxrak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11185; -- Xizzer Fizzbolt - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11186; -- Lunnix Sprocketslip - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11187; -- Himmik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11188; -- Evie Whirlbrew - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11189; -- Qia - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11190; -- Everlook Bruiser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11191; -- Lilith the Lithe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11192; -- Kilram - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11193; -- Seril Scourgebane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11194; -- Argent Defender - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11198; -- Broken Exile - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=11198; -- Broken Exile - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11216; -- Eva Sarkhoff - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11217; -- Lucien Sarkhoff - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11218; -- Kerlonian Evershade - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11218; -- Kerlonian Evershade - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11219; -- Liladris Moonriver - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11236; -- Blood Parrot - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11256; -- Manifestation of Water - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11257; -- Scholomance Handler - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11259; -- Nataka Longhorn - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11260; -- Northshire Peasant - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11261; -- Doctor Theolen Krastinov - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.07 WHERE  `entry`=11262; -- Onyxian Whelp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=11263; -- Spectral Projection - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11276; -- Azshara Sentinel - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=11284; -- Dark Shade - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11288; -- Spectral Betrayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11288; -- Spectral Betrayer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11289; -- Spectral Defender - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11289; -- Spectral Defender - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11290; -- Mossflayer Zombie - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11291; -- Unliving Mossflayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11318; -- Ragefire Trogg - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11319; -- Ragefire Shaman - speed walk was 0.98
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11320; -- Earthborer - speed walk was 0.7
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=11321; -- Molten Elemental - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11325; -- Panda Cub - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11326; -- Mini Diablo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11327; -- Zergling - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11328; -- Eastvale Peasant - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11338; -- Hakkari Shadowcaster - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11339; -- Hakkari Shadow Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11340; -- Hakkari Blood Priest - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11347; -- Zealot Lor'Khan - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11348; -- Zealot Zath - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11350; -- Gurubashi Axe Thrower - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11351; -- Gurubashi Headhunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11352; -- Gurubashi Berserker - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11352; -- Gurubashi Berserker - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11353; -- Gurubashi Blood Drinker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11356; -- Gurubashi Champion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11357; -- Son of Hakkar - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11357; -- Son of Hakkar - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11359; -- Soulflayer - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11359; -- Soulflayer - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11360; -- Zulian Cub - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11360; -- Zulian Cub - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11361; -- Zulian Tiger - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11361; -- Zulian Tiger - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11365; -- Zulian Panther - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11365; -- Zulian Panther - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11368; -- Bloodseeker Bat - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11368; -- Bloodseeker Bat - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11370; -- Razzashi Broodwidow - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11371; -- Razzashi Serpent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11372; -- Razzashi Adder - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11373; -- Razzashi Cobra - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11374; -- Hooktooth Frenzy - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11378; -- Foreman Thazz'ril - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11380; -- Jin'do the Hexxer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11382; -- Bloodlord Mandokir - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11382; -- Bloodlord Mandokir - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11387; -- Sandfury Speaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11388; -- Witherbark Speaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11389; -- Bloodscalp Speaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11390; -- Skullsplitter Speaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11391; -- Vilebranch Speaker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11397; -- Nara Meideros - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11401; -- Priestess Alathea - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11406; -- High Priest Rohan - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11407; -- Var'jun - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11438; -- Bibbly F'utzbuckle - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.25 WHERE  `entry`=11439; -- Illusion of Jandice Barov - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=11440; -- Gordok Enforcer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11441; -- Gordok Brute - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=4.15 WHERE  `entry`=11444; -- Gordok Mage-Lord - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=11445; -- Gordok Captain - speed walk was 1.8
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11446; -- Gordok Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.58 WHERE  `entry`=11447; -- Mushgog - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11448; -- Gordok Warlock - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11450; -- Gordok Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=11459; -- Ironbark Protector - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=11460; -- Alzzin's Minion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=11466; -- Highborne Summoner - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=11467; -- Tsu'zee - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=11471; -- Eldreth Apparition - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.833334 WHERE  `entry`=11473; -- Eldreth Spectre - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11473; -- Eldreth Spectre - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=11475; -- Eldreth Phantasm - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=11484; -- Residual Monstrosity - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11491; -- Old Ironbark - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11492; -- Alzzin the Wildshaper - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=8.9 WHERE  `entry`=11496; -- Immol'thar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=11497; -- The Razza - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.58 WHERE  `entry`=11498; -- Skarr the Unbreakable - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.58 WHERE  `entry`=11501; -- King Gordok - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11501; -- King Gordok - speed run was 1.3
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11502; -- Ragnaros - speed walk was 0
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11516; -- Timbermaw Warder - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11516; -- Timbermaw Warder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=11521; -- Kodo Apparition - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11536; -- Quartermaster Miranda Breechlock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11546; -- Jack Sterling - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11548; -- Loh'atu - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11551; -- Necrofiend - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11552; -- Timbermaw Mystic - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11552; -- Timbermaw Mystic - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11553; -- Timbermaw Woodbender - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11553; -- Timbermaw Woodbender - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11554; -- Grazle - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11554; -- Grazle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11555; -- Gorn One Eye - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11555; -- Gorn One Eye - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11556; -- Salfa - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11556; -- Salfa - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11557; -- Meilosh - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11557; -- Meilosh - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=11558; -- Kernda - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=11558; -- Kernda - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=11560; -- Magrami Spectre - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11562; -- Drysnap Crawler - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11563; -- Drysnap Pincer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11564; -- Gizelton Caravan Kodo - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=11564; -- Gizelton Caravan Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11576; -- Whirlwind Ripper - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11577; -- Whirlwind Stormwalker - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11578; -- Whirlwind Shredder - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=3.9 WHERE  `entry`=11583; -- Nefarian - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11596; -- Smeed Scrabblescrew - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11608; -- Bardu Sharpeye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11609; -- Alexia Ironknife - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11615; -- Mickey Levine - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11616; -- Nathaniel Dumah - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11620; -- Spectral Marauder - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11620; -- Spectral Marauder - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11621; -- Spectral Corpse - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11621; -- Spectral Corpse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11622; -- Rattlegore - speed walk was 1.15
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=11622; -- Rattlegore - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11624; -- Taiga Wisemane - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11625; -- Cork Gizelton - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11625; -- Cork Gizelton - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11626; -- Rigger Gizelton - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=11626; -- Rigger Gizelton - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11629; -- Jessica Redpath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11656; -- Warsong Peon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=11658; -- Molten Giant - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11658; -- Molten Giant - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=11659; -- Molten Destroyer - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11659; -- Molten Destroyer - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11661; -- Flamewaker - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11662; -- Flamewaker Priest - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11663; -- Flamewaker Healer - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11664; -- Flamewaker Elite - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=11665; -- Lava Annihilator - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=11665; -- Lava Annihilator - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11666; -- Firewalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11667; -- Flameguard - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11668; -- Firelord - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11669; -- Flame Imp - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11671; -- Core Hound - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11671; -- Core Hound - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=11672; -- Core Rager - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=11673; -- Ancient Core Hound - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=11673; -- Ancient Core Hound - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=11675; -- Snowblind Windcaller - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=11677; -- Taskmaster Snivvle - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=11678; -- Snowblind Ambusher - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=11679; -- Winterax Witch Doctor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11680; -- Horde Scout - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11681; -- Horde Deforester - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11682; -- Warsong Grunt - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11684; -- Warsong Shredder - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2.51 WHERE  `entry`=11688; -- Cursed Centaur - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=11698; -- Hive'Ashi Stinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11698; -- Hive'Ashi Stinger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11700; -- Sarin Starlight - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11701; -- Mor'vek - speed walk was 1.26
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=11701; -- Mor'vek - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11703; -- Graw Cornerstone - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11704; -- Kriss Goldenlight - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11706; -- Adon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11709; -- Jareth Wildwoods - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11710; -- Mirador - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=11710; -- Mirador - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.33 WHERE  `entry`=11714; -- Marosh the Devious - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11715; -- Talendria - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11717; -- Bethan Bluewater - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11718; -- Sar Browneye - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11721; -- Hive'Ashi Worker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11722; -- Hive'Ashi Defender - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11723; -- Hive'Ashi Sandstalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=11724; -- Hive'Ashi Swarmer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11724; -- Hive'Ashi Swarmer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11735; -- Stonelash Scorpid - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11736; -- Stonelash Pincer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11737; -- Stonelash Flayer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11738; -- Sand Skitterer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11738; -- Sand Skitterer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11739; -- Rock Stalker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11740; -- Dredge Striker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11741; -- Dredge Crusher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=11744; -- Dust Stormer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=11744; -- Dust Stormer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=11745; -- Cyclone Warrior - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=11746; -- Desert Rumbler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11748; -- Samantha Swifthoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11749; -- Feran Strongwind - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11750; -- Ganoosh - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11751; -- Rilan Howard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11752; -- Blaise Montgomery - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11753; -- Gogo - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11754; -- Meggi Peppinrocker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11755; -- Harlo Wigglesworth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11756; -- Quinn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11757; -- Umaron Stragarelm - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11758; -- Andi Lynn - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=11783; -- Theradrim Shardling - speed walk was 1.6
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=11784; -- Theradrim Guardian - speed walk was 1.6
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11789; -- Deep Borer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11790; -- Putridus Satyr - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11791; -- Putridus Trickster - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11792; -- Putridus Shadowstalker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11793; -- Celebrian Dryad - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11794; -- Sister of Celebrian - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11799; -- Tajarri - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11804; -- Twilight Keeper Havunth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11805; -- Jarund Stoutstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11806; -- Sentinel Onaeya - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11807; -- Tristane Shadowstone - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11808; -- Grum Redbeard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11810; -- Howin Kindfeather - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11811; -- Narain Soothfancy - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11812; -- Claira Kindfeather - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11813; -- Kerr Ironsight - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11814; -- Kali Remik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11817; -- Krah'ranik - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11818; -- Orik'ando - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11819; -- Jory Zaga - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11820; -- Locke Okarr - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11823; -- Vark Battlescar - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11824; -- Erik Felixe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11825; -- Paige Felixe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11826; -- Kristy Grant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11827; -- Kimberly Grant - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11828; -- Kelly Grant - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11830; -- Hakkari Priest - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=11831; -- Hakkari Witch Doctor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=11832; -- Keeper Remulos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11833; -- Rahauro - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11835; -- Theodore Griffs - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=11837; -- Wildpaw Shaman - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=11838; -- Wildpaw Mystic - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=11839; -- Wildpaw Brute - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE  `entry`=11840; -- Wildpaw Alpha - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.42 WHERE  `entry`=11857; -- Makaba Flathoof - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.51 WHERE  `entry`=11859; -- Doomguard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11868; -- Sayoc - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11869; -- Ansekhwa - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11870; -- Archibald - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11871; -- Grinning Dog - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11871; -- Grinning Dog - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11872; -- Myranda the Hag - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=11873; -- Spectral Attendant - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11874; -- Masat T'andr - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=11874; -- Masat T'andr - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11877; -- Roon Wildmane - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11878; -- Nathanos Blightcaller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11880; -- Twilight Avenger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11881; -- Twilight Geolord - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11882; -- Twilight Stonecaller - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11885; -- Blighthound - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11896; -- Borelgore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11899; -- Shardi - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11916; -- Imelda - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.43 WHERE  `entry`=11920; -- Goggeroc - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11936; -- Artist Renfray - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.47 WHERE  `entry`=11937; -- Demon Portal Guardian - speed walk was 1.17
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11940; -- Merissa Stilwell - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11941; -- Yori Crackhelm - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11942; -- Orenthil Whisperwind - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11943; -- Magga - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11944; -- Vorn Skyseer - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11945; -- Claire Willower - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11979; -- Kim Bridenbecker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=11981; -- Flamegor - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11981; -- Flamegor - speed run was 1.55
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=11982; -- Magmadar - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=11983; -- Firemaw - speed run was 1.55
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=11988; -- Golemagg the Incinerator - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=11988; -- Golemagg the Incinerator - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11994; -- Rob Bridenbecker - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11996; -- Ashley Bridenbecker - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=11996; -- Ashley Bridenbecker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12017; -- Broodlord Lashlayer - speed walk was 1.18
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12018; -- Majordomo Executus - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12027; -- Tukk - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12028; -- Lah'Mawhani - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12030; -- Malux - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12033; -- Wulan - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12034; -- Koiter - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=12034; -- Koiter - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=12037; -- Ursol'lok - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12045; -- Hae'Wilani - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=12046; -- Gor'marok the Ravager - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=12048; -- Alliance Sentinel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12051; -- Frostwolf Legionnaire - speed walk was 1.26
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=12056; -- Baron Geddon - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=12057; -- Garr - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12057; -- Garr - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=12076; -- Lava Elemental - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12076; -- Lava Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12098; -- Sulfuron Harbinger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=12099; -- Firesworn - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12099; -- Firesworn - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=12100; -- Lava Reaver - speed walk was 1.3
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12100; -- Lava Reaver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=12101; -- Lava Surger - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=12101; -- Lava Surger - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12118; -- Lucifron - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12119; -- Flamewaker Protector - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.5 WHERE  `entry`=12121; -- Drakan - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE  `entry`=12121; -- Drakan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=12124; -- Great Shark - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=12125; -- Mammoth Shark - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=12126; -- Lord Tirion Fordring - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=12128; -- Crimson Elite - speed walk was 0.59
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12129; -- Onyxian Warder - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12136; -- Snurk Bucksquick - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12137; -- Squibby Overspeck - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.97 WHERE  `entry`=12138; -- Lunaclaw - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12143; -- Son of Flame - speed walk was 1.04286
UPDATE `creature_template` SET `speed_walk`=0.97 WHERE  `entry`=12144; -- Lunaclaw Spirit - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12150; -- Riding Kodo (Purple) - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12150; -- Riding Kodo (Purple) - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12156; -- Winterax Axe Thrower - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=12157; -- Winterax Shadow Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=12158; -- Winterax Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=12159; -- Korrak the Bloodrager - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12160; -- Shadowglen Sentinel - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12198; -- Martin Lindsey - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12201; -- Princess Theradras - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12202; -- Human Skull - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=12203; -- Landslide - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=12204; -- Spitelash Raider - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=12205; -- Spitelash Witch - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=12206; -- Primordial Behemoth - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12207; -- Thessala Hydra - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12216; -- Poison Sprite - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12217; -- Corruptor - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12218; -- Vile Larva - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12219; -- Barbed Lasher - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12220; -- Constrictor Vine - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12221; -- Noxious Slime - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=0.3 WHERE  `entry`=12222; -- Creeping Sludge - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=0.4 WHERE  `entry`=12222; -- Creeping Sludge - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=12223; -- Cavern Lurker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=12224; -- Cavern Shambler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=12225; -- Celebras the Cursed - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12236; -- Lord Vyletongue - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=12237; -- Meshlok the Harvester - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=12238; -- Zaetar's Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=12242; -- Spirit of Maraudos - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=12243; -- Spirit of Veng - speed walk was 0.8
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12244; -- Mark of Detonation (NW) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12246; -- Super-Seller 680 - speed walk was 1.02
UPDATE `creature_template` SET `speed_run`=0.885714 WHERE  `entry`=12246; -- Super-Seller 680 - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12247; -- Scourge Structure - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12249; -- Mark of Detonation (SW) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=12250; -- Zaeldarr the Outcast - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12251; -- Mark of Detonation (CLS) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12252; -- Mark of Detonation (CRS) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12254; -- Mark of Detonation (NESH) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12255; -- Mark of Detonation (NE) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12256; -- Mark of Detonation (SE) - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12258; -- Razorlash - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12259; -- Gehennas - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=12261; -- Infected Mossflayer - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE  `entry`=12262; -- Ziggurat Protector - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12263; -- Slaughterhouse Protector - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=12264; -- Shazzrah - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12265; -- Lava Spawn - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12276; -- Hive'Zora Egg - speed walk was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12296; -- Sickly Gazelle - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=12296; -- Sickly Gazelle - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12298; -- Sickly Deer - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=12298; -- Sickly Deer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12336; -- Brother Crowley - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12337; -- Crimson Courier - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12337; -- Crimson Courier - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12338; -- Shadowprey Guardian - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=12339; -- Demetria - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12340; -- Drulzegar Skraghook - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12341; -- Blue Skeletal Horse - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12341; -- Blue Skeletal Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12342; -- Brown Skeletal Horse - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12342; -- Brown Skeletal Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12343; -- Red Skeletal Horse - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12343; -- Red Skeletal Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12346; -- Emerald Riding Raptor - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12346; -- Emerald Riding Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12349; -- Turquoise Riding Raptor - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12349; -- Turquoise Riding Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12350; -- Violet Riding Raptor - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12350; -- Violet Riding Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12351; -- Dire Riding Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12353; -- Timber Riding Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12354; -- Brown Riding Kodo - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12354; -- Brown Riding Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12355; -- Gray Riding Kodo - speed walk was 0.98
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12355; -- Gray Riding Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12358; -- Riding Striped Frostsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12359; -- Riding Spotted Frostsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12360; -- Riding Striped Nightsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12363; -- Blue Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12363; -- Blue Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12365; -- Red Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12365; -- Red Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12366; -- Unpainted Mechanostrider X - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12366; -- Unpainted Mechanostrider X - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12367; -- Green Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12367; -- Green Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12372; -- Brown Ram - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12372; -- Brown Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12373; -- Gray Ram - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12373; -- Gray Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12374; -- White Riding Ram Mount - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12374; -- White Riding Ram Mount - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12375; -- Chestnut Mare - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12375; -- Chestnut Mare - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12376; -- Brown Horse - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12376; -- Brown Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=12377; -- Wailing Spectre - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=12378; -- Damned Soul - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=12381; -- Ley Sprite - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12383; -- Nibbles - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=12383; -- Nibbles - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12384; -- Augustus the Touched - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.09 WHERE  `entry`=12397; -- Lord Kazzak - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12416; -- Blackwing Legionnaire - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=12416; -- Blackwing Legionnaire - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12419; -- Lifelike Toad - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12420; -- Blackwing Mage - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=12420; -- Blackwing Mage - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=12422; -- Death Talon Dragonspawn - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=12422; -- Death Talon Dragonspawn - speed run was 0.9
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12425; -- Flint Shadowmore - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12427; -- Mountaineer Dolf - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12430; -- Grunt Kor'ja - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12435; -- Razorgore the Untamed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12458; -- Blackwing Taskmaster - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12463; -- Death Talon Flamescale - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12464; -- Death Talon Seether - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12465; -- Death Talon Wyrmkin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12468; -- Death Talon Hatcher - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=12473; -- Arcanite Dragonling - speed walk was 1.13
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12477; -- Verdantine Boughguard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12478; -- Verdantine Oracle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=12479; -- Verdantine Tree Warder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12480; -- Melris Malagan - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12481; -- Justine Demalier - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12576; -- Grish Longrunner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12577; -- Jarrodenus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12578; -- Mishellena - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12596; -- Bibilfaz Featherwhistle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12617; -- Khaelyn Steelwing - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12636; -- Georgia - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12656; -- Thamarian - speed walk was 0.94
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12658; -- Adam Lind - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12676; -- Sharptalon - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12716; -- Decedra Willham - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12718; -- Gurda Ragescar - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12738; -- Nori Pridedrift - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=12739; -- Onyxia's Elite Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12740; -- Faustron - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=3.9 WHERE  `entry`=12756; -- Lady Onyxia - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12776; -- Hraug - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12778; -- Lieutenant Rachel Vaccar - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12779; -- Archmage Gaiman - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12780; -- Sergeant Major Skyshadow - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12781; -- Master Sergeant Biggins - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12783; -- Lieutenant Karter - speed walk was 1.23
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12783; -- Lieutenant Karter - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12784; -- Lieutenant Jackspring - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12785; -- Sergeant Major Clate - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12786; -- Guard Quine - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12787; -- Guard Hammon - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12788; -- Legionnaire Teena - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12789; -- Blood Guard Hini'wana - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12790; -- Advisor Willington - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12791; -- Chieftain Earthbind - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12794; -- Stone Guard Zarg - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12796; -- Raider Bork - speed walk was 1.23
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12796; -- Raider Bork - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12797; -- Grunt Korf - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12798; -- Grunt Bek'rah - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12807; -- Greshka - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=0.5 WHERE  `entry`=12856; -- Ashenvale Outrunner - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE  `entry`=12856; -- Ashenvale Outrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12858; -- Torek - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=12858; -- Torek - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12859; -- Splintertree Raider - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=12859; -- Splintertree Raider - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12862; -- Warsong Scout - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12864; -- Warsong Outrider - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12864; -- Warsong Outrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12865; -- Ambassador Malcin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12866; -- Myriam Moonsinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12867; -- Kuray'bin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.52 WHERE  `entry`=12876; -- Baron Aquanis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12896; -- Silverwing Sentinel - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12897; -- Silverwing Warrior - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=2.68 WHERE  `entry`=12900; -- Somnus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12903; -- Splintertree Guard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12919; -- Nat Pagle - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12920; -- Doctor Gregory Victor - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12922; -- Imp Minion - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12923; -- Injured Soldier - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12924; -- Badly Injured Soldier - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12939; -- Doctor Gustaf VanHowzen - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12941; -- Jase Farlane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12942; -- Leonard Porter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12943; -- Werg Thickblade - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12944; -- Lokhtos Darkbargainer - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12956; -- Zannok Hidepiercer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12959; -- Nergal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12960; -- Christi Galvanis - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12996; -- Mounted Ironforge Mountaineer - speed walk was 1.08
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=12996; -- Mounted Ironforge Mountaineer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12997; -- Monty - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12998; -- Dwarven Farmer - speed walk was 0.99
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12999; -- World Invisible Trigger ( DO NOT DELETE) - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13000; -- Gnome Engineer - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=13016; -- Deeprun Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13018; -- Nipsy - speed walk was 1.12
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13019; -- Burning Blade Seer - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13020; -- Vaelastrasz the Corrupt - speed walk was 1.18
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=13021; -- Warpwood Crusher - speed walk was 1.5
UPDATE `creature_template` SET `speed_walk`=1.23 WHERE  `entry`=13036; -- Gordok Mastiff - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13076; -- Dun Morogh Mountaineer - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1.54 WHERE  `entry`=13082; -- Milton Beats - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13086; -- Aggi Rumblestomp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13087; -- Coldmine Invader - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13088; -- Masha Swiftcut - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=13098; -- Irondeep Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13118; -- Crimson Bodyguard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13137; -- Lieutenant Rugba - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13138; -- Lieutenant Spencer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=13139; -- Commander Randolph - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13140; -- Commander Dardosh - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13141; -- Deeprot Stomper - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13142; -- Deeprot Tangler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13143; -- Lieutenant Stronghoof - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13144; -- Lieutenant Vol'talar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.54 WHERE  `entry`=13145; -- Lieutenant Grummus - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.54 WHERE  `entry`=13146; -- Lieutenant Murp - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13147; -- Lieutenant Lewis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=13149; -- Syndicate Brigand - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13150; -- Syndicate Agent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13151; -- Syndicate Master Ryson - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13152; -- Commander Malgor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=13153; -- Commander Mulfort - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=13154; -- Commander Louis Philips - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13155; -- Deathstalker Agent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13159; -- James Clark - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13177; -- Vahgruk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=4.8 WHERE  `entry`=13178; -- War Rider - speed walk was 1
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE  `entry`=13178; -- War Rider - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13179; -- Wing Commander Guse - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13217; -- Thanthaldis Snowgleam - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13219; -- Jekyll Flandring - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13220; -- Layo Starstrike - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13221; -- Ryson's Eye in the Sky - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2 WHERE  `entry`=13236; -- Primalist Thurloga - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13256; -- Lokholar the Ice Lord - speed walk was 3.54
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13256; -- Lokholar the Ice Lord - speed run was 3.54
UPDATE `creature_template` SET `speed_walk`=3.53 WHERE  `entry`=13278; -- Duke Hydraxis - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=13280; -- Hydrospawn - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13282; -- Noxxion - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=13282; -- Noxxion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13283; -- Lord Tony Romano - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13296; -- Lieutenant Largent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13297; -- Lieutenant Stouthandle - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13298; -- Lieutenant Greywand - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13299; -- Lieutenant Lonadin - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13300; -- Lieutenant Mancuso - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13317; -- Coldmine Miner - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13318; -- Commander Mortimer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13319; -- Commander Duffy - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13320; -- Commander Karl Philips - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=13322; -- Hydraxian Honor Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13323; -- Subterranean Diemetradon - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13324; -- Seasoned Guardsman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13325; -- Seasoned Mountaineer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13327; -- Seasoned Sentinel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13333; -- Veteran Guardsman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13335; -- Veteran Mountaineer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13336; -- Veteran Sentinel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13338; -- Core Rat - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE  `entry`=13338; -- Core Rat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13356; -- Stormpike Mine Layer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13357; -- Frostwolf Mine Layer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13359; -- Frostwolf Bowman - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13358; -- Stormpike Bowman - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13377; -- Master Engineer Zinfizzlex - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13378; -- Frostwolf Shredder Unit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=13396; -- Irondeep Miner - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13416; -- Stormpike Shredder Unit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13417; -- Sagorne Creststrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=5.39 WHERE  `entry`=13419; -- Ivus the Forest Lord - speed walk was 3.54
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13424; -- Champion Guardsman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13426; -- Champion Mountaineer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13427; -- Champion Sentinel - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13440; -- Frostwolf Wolf Rider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13441; -- Frostwolf Wolf Rider Commander - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=13446; -- Field Marshal Teravaine - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13446; -- Field Marshal Teravaine - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13449; -- Warmaster Garrick - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13449; -- Warmaster Garrick - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13476; -- Balai Lok'Wein - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13524; -- Stormpike Commando - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13524; -- Stormpike Commando - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13525; -- Seasoned Commando - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13525; -- Seasoned Commando - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13526; -- Veteran Commando - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13526; -- Veteran Commando - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13527; -- Champion Commando - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13527; -- Champion Commando - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13528; -- Frostwolf Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13528; -- Frostwolf Reaver - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13529; -- Seasoned Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13529; -- Seasoned Reaver - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=13530; -- Veteran Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13530; -- Veteran Reaver - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=13531; -- Champion Reaver - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13531; -- Champion Reaver - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13533; -- Spewed Larva - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=13535; -- Veteran Coldmine Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13536; -- Champion Coldmine Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=13538; -- Veteran Coldmine Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13539; -- Champion Coldmine Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13540; -- Seasoned Irondeep Explorer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=13541; -- Veteran Irondeep Explorer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13542; -- Champion Irondeep Explorer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13543; -- Seasoned Irondeep Raider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13544; -- Veteran Irondeep Raider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=13545; -- Champion Irondeep Raider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.73 WHERE  `entry`=13547; -- Veteran Coldmine Explorer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13548; -- Champion Coldmine Explorer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13549; -- Seasoned Coldmine Invader - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=13550; -- Veteran Coldmine Invader - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13551; -- Champion Coldmine Invader - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=13552; -- Seasoned Irondeep Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=13553; -- Veteran Irondeep Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=13554; -- Champion Irondeep Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13555; -- Seasoned Irondeep Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=13556; -- Veteran Irondeep Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=13557; -- Champion Irondeep Surveyor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13576; -- Stormpike Ram Rider - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=13577; -- Stormpike Ram Rider Commander - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13596; -- Rotgrip - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=13596; -- Rotgrip - speed run was 2.42857
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13597; -- Frostwolf Explosives Expert - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13598; -- Stormpike Explosives Expert - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13599; -- Stolid Snapjaw - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13601; -- Tinkerer Gizlock - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=13602; -- The Abominable Greench - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13616; -- Frostwolf Stable Master - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=13618; -- Stabled Frostwolf - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13656; -- Willow - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=13676; -- Stabled Alterac Ram - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.66 WHERE  `entry`=13696; -- Noxxious Scion - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=13698; -- Keeper Marandis - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13699; -- Selendra - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=13716; -- Celebras the Redeemed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13737; -- Marandis' Sister - speed walk was 1.02
UPDATE `creature_template` SET `speed_walk`=2.52 WHERE  `entry`=13738; -- Veng - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.51 WHERE  `entry`=13739; -- Maraudos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.52 WHERE  `entry`=13740; -- Magra - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.52 WHERE  `entry`=13741; -- Gelk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.52 WHERE  `entry`=13742; -- Kolk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13743; -- Corrupt Force of Nature - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13756; -- PvP Graveyard Credit Marker - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=13756; -- PvP Graveyard Credit Marker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13776; -- Corporal Teeka Bloodsnarl - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13777; -- Sergeant Durgen Stormpike - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13778; -- PvP Tower Credit Marker - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=13778; -- PvP Tower Credit Marker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13796; -- PvP Mine Credit Marker - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=13796; -- PvP Mine Credit Marker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13816; -- Prospector Stonehewer - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13817; -- Voggah Deathgrip - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13840; -- Warmaster Laggrond - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13841; -- Lieutenant Haggerdin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13842; -- Frostwolf Ambassador Rokhstrom - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13843; -- Lieutenant Rotimer - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=8 WHERE  `entry`=13876; -- Mekgineer Trigger - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE  `entry`=13876; -- Mekgineer Trigger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13916; -- Dire Maul Crystal Totem - speed walk was 1.22
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13917; -- Izzy Coppergrab - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13936; -- Ravenholdt - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=13956; -- Winterax Mystic - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=13957; -- Winterax Warrior - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13958; -- Winterax Seer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=13959; -- Alterac Yeti - speed walk was 0.77
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14020; -- Chromaggus - speed run was 1.95
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14022; -- Corrupted Red Whelp - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14023; -- Corrupted Green Whelp - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14024; -- Corrupted Blue Whelp - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14025; -- Corrupted Bronze Whelp - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14026; -- Trigger Guse - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14027; -- Trigger Mulverick - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14028; -- Trigger Jeztor - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14029; -- Trigger Ichman - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14030; -- Trigger Slidore - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14031; -- Trigger Vipore - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14041; -- Haggle - speed walk was 1.17
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE  `entry`=14121; -- Deeprun Diver - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14123; -- Steeljaw Snapper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14182; -- Bounty Hunter Kolark - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14183; -- Artilleryman Sheldonore - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.59 WHERE  `entry`=14221; -- Gravis Slipknot - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14222; -- Araga - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.55 WHERE  `entry`=14223; -- Cranky Benj - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.64 WHERE  `entry`=14224; -- 7:XT - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.56 WHERE  `entry`=14225; -- Prince Kellen - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.86 WHERE  `entry`=14226; -- Kaskk - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14227; -- Hissperak - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE  `entry`=14227; -- Hissperak - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.12 WHERE  `entry`=14228; -- Giggler - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=14229; -- Accursed Slitherblade - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=14231; -- Drogoth the Roamer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.85 WHERE  `entry`=14233; -- Ripscale - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14234; -- Hayoc - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=14241; -- Ironbark the Redeemed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.18 WHERE  `entry`=14268; -- Lord Condar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=14269; -- Seeker Aqualon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14270; -- Squiddic - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14271; -- Ribchaser - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=14272; -- Snarlflare - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1.52 WHERE  `entry`=14275; -- Tamra Stormpike - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14276; -- Scargil - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=14276; -- Scargil - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14277; -- Lady Zephris - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14280; -- Big Samras - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.49 WHERE  `entry`=14281; -- Jimmy the Bleeder - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14283; -- Stormpike Owl - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14284; -- Stormpike Battleguard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14285; -- Frostwolf Battleguard - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14301; -- Brinna Valanaar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14305; -- Human Orphan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=14308; -- Ferra - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14321; -- Guard Fengus - speed walk was 1.9
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14322; -- Stomper Kreeg - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.53 WHERE  `entry`=14323; -- Guard Slip'kik - speed walk was 1.9
UPDATE `creature_template` SET `speed_walk`=2.14 WHERE  `entry`=14324; -- Cho'Rush the Observer - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14324; -- Cho'Rush the Observer - speed run was 1.3
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=14325; -- Captain Kromcrush - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14326; -- Guard Mol'dar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14338; -- Knot Thimblejack - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14339; -- Death Howl - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14340; -- Alshirr Banebreath - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=14342; -- Ragepaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.72 WHERE  `entry`=14343; -- Olm the Wise - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.45 WHERE  `entry`=14344; -- Mongress - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=14345; -- The Ongar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14347; -- Highlord Demitrian - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14351; -- Gordok Bushwacker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.65 WHERE  `entry`=14353; -- Mizzle the Crafty - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE  `entry`=14354; -- Pusillin - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14355; -- Azj'Tordin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14356; -- Sawfin Frenzy - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14357; -- Lake Thresher - speed walk was 0.95
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14361; -- Shen'dralar Wisp - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=14364; -- Shen'dralar Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14367; -- Thief Catcher Thunderbrew - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14373; -- Sage Korolusk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14374; -- Scholar Runethorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14378; -- Huntress Skymane - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14379; -- Huntress Ravenoak - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14380; -- Huntress Leafrunner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14387; -- Lothos Riftwaker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14389; -- Netherwalker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14392; -- Overlord Runthak - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=3.2 WHERE  `entry`=14399; -- Arcane Torrent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=14402; -- Seeker Cromwell - speed walk was 1.16
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=14403; -- Seeker Nahr - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=14404; -- Seeker Thompson - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14421; -- Brown Prairie Dog - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=14421; -- Brown Prairie Dog - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=14424; -- Mirelow - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.52 WHERE  `entry`=14427; -- Gibblesnik - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.75 WHERE  `entry`=14428; -- Uruson - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.52 WHERE  `entry`=14429; -- Grimmaw - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE  `entry`=14431; -- Fury Shelda - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=14431; -- Fury Shelda - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.34 WHERE  `entry`=14432; -- Threggil - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.3 WHERE  `entry`=14435; -- Prince Thunderaan - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14436; -- Mor'zul Bloodbringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14437; -- Gorzeeki Wildeyes - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14438; -- Officer Pomeroy - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14440; -- Hunter Sagewind - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14441; -- Hunter Ragetotem - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14442; -- Hunter Thunderhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14444; -- Orcish Orphan - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14444; -- Orcish Orphan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE  `entry`=14445; -- Lord Captain Wyrmak - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=14448; -- Molt Thorn - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14450; -- Orphan Matron Nightingale - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14451; -- Orphan Matron Battlewail - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.3 WHERE  `entry`=14452; -- Enslaved Doomguard Commander - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.49 WHERE  `entry`=14454; -- The Windreaver - speed walk was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=14457; -- Princess Tempestria - speed walk was 1.14
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=14458; -- Watery Invader - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=3.54 WHERE  `entry`=14461; -- Baron Charr - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=2.16 WHERE  `entry`=14462; -- Thundering Invader - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=14464; -- Avalanchion - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=0.01 WHERE  `entry`=14465; -- Alliance Battle Standard - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.01 WHERE  `entry`=14466; -- Horde Battle Standard - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14467; -- Kroshius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14469; -- Niby the Almighty - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14470; -- Impsy - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=14471; -- Setis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.78 WHERE  `entry`=14474; -- Zora - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.25 WHERE  `entry`=14476; -- Krellack - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=14478; -- Huricanian - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=14478; -- Huricanian - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14480; -- Alowicious Czervik - speed walk was 0.96
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14481; -- Emmithue Smails - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=3.07 WHERE  `entry`=14483; -- Dread Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.21 WHERE  `entry`=14484; -- Injured Peasant - speed walk was 0.17
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14484; -- Injured Peasant - speed run was 0.17
UPDATE `creature_template` SET `speed_walk`=1.21 WHERE  `entry`=14485; -- Plagued Peasant - speed walk was 0.17
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14485; -- Plagued Peasant - speed run was 0.17
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=14487; -- Gluggle - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=14488; -- Roloch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=3.31 WHERE  `entry`=14490; -- Rippa - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.64 WHERE  `entry`=14492; -- Verifonix - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14494; -- Eris Havenfire - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14496; -- Stormwind Orphan - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14497; -- Shellene - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14499; -- Horde Orphan - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14499; -- Horde Orphan - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=14502; -- Xorothian Dreadsteed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=14503; -- The Cleaner - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14503; -- The Cleaner - speed run was 2.6
UPDATE `creature_template` SET `speed_walk`=3.61 WHERE  `entry`=14506; -- Lord Hel'nurath - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14507; -- High Priest Venoxis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14509; -- High Priest Thekal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14510; -- High Priestess Mar'li - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=14511; -- Shadowed Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=14512; -- Corrupted Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14513; -- Malicious Spirit - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=14516; -- Death Knight Darkreaver - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14517; -- High Priestess Jeklik - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14518; -- Aspect of Banality - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14519; -- Aspect of Corruption - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14520; -- Aspect of Malice - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14521; -- Aspect of Shadow - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14523; -- Ulathek - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14524; -- Vartrus the Ancient - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14525; -- Stoma the Ancient - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=14526; -- Hastat the Ancient - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14527; -- Simone the Inconspicuous - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14528; -- Precious - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14529; -- Franklin the Friendly - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=3.51 WHERE  `entry`=14530; -- Solenor the Slayer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14531; -- Artorius the Amiable - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14532; -- Razzashi Venombrood - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.63 WHERE  `entry`=14533; -- Simone the Seductress - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14534; -- Klinfran the Crazed - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14535; -- Artorius the Doombringer - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14535; -- Artorius the Doombringer - speed run was 1.025
UPDATE `creature_template` SET `speed_walk`=4.41 WHERE  `entry`=14538; -- Precious the Devourer - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14539; -- Swift Timber Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14540; -- Swift Brown Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14541; -- Swift Gray Wolf - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14542; -- Great White Kodo - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14542; -- Great White Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14543; -- Swift Olive Raptor - speed walk was 0.78
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14543; -- Swift Olive Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14544; -- Swift Orange Raptor - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14544; -- Swift Orange Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14545; -- Swift Blue Raptor - speed walk was 0.78
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14545; -- Swift Blue Raptor - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14546; -- Swift Brown Ram - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14546; -- Swift Brown Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14547; -- Swift White Ram - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14547; -- Swift White Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14548; -- Swift Gray Ram - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14548; -- Swift Gray Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14549; -- Great Brown Kodo - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14549; -- Great Brown Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14550; -- Great Gray Kodo - speed walk was 0.94
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14550; -- Great Gray Kodo - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14551; -- Swift Yellow Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14551; -- Swift Yellow Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14552; -- Swift White Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14552; -- Swift White Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14553; -- Swift Green Mechanostrider - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14553; -- Swift Green Mechanostrider - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14555; -- Swift Mistsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14556; -- Swift Frostsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=14557; -- Swift Dawnsaber - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14558; -- Purple Skeletal Warhorse - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14558; -- Purple Skeletal Warhorse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14559; -- Swift Palomino - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14559; -- Swift Palomino - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14560; -- Swift White Steed - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14560; -- Swift White Steed - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14561; -- Swift Brown Steed - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14561; -- Swift Brown Steed - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14566; -- Ancient Equine Spirit - speed walk was 1.26
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14566; -- Ancient Equine Spirit - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14567; -- Derotain Mudsipper - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=14568; -- Darkreaver's Fallen Charger - speed walk was 1.26
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14601; -- Ebonroc - speed run was 1.55
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=14602; -- Swift Stormsaber - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14621; -- Overseer Maltorius - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14622; -- Thorium Brotherhood Lookout - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14624; -- Master Smith Burninate - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14625; -- Overseer Oilfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14626; -- Taskmaster Scrange - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14627; -- Hansel Heavyhands - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14628; -- Evonice Sootsmoker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14634; -- Lookout Captain Lolo Longstriker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14637; -- Zorbin Fandazzle - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14645; -- Warsong Gulch Herald - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14646; -- Stratholme Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14718; -- Horde Laborer - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14722; -- Clavicus Knavingham - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14723; -- Mistina Steelshield - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14724; -- Bubulo Acerbus - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14725; -- Raedon Duskstriker - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14726; -- Rashona Straglash - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14727; -- Vehena - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14728; -- Rumstag Proudstrider - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14729; -- Ralston Farnsley - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14730; -- Revantusk Watcher - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14731; -- Lard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14732; -- PvP CTF Credit Marker - speed walk was 1.26
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE  `entry`=14732; -- PvP CTF Credit Marker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14734; -- Revantusk Drummer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14736; -- Primal Torntusk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14737; -- Smith Slagtree - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14738; -- Otho Moji'ko - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14739; -- Mystic Yayo'jin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14740; -- Katoom the Angler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14741; -- Huntsman Markhor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14742; -- Zap Farflinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14743; -- Jhordy Lapforge - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=14748; -- Vilebranch Kidnapper - speed walk was 1.19
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14750; -- Gurubashi Bat Rider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.01 WHERE  `entry`=14751; -- Frostwolf Battle Standard - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14752; -- Stormpike Battle Standard - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14752; -- Stormpike Battle Standard - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14754; -- Kelm Hargunth - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14758; -- Zul'Gurub Trigger - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14762; -- Dun Baldar North Marshal - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14763; -- Dun Baldar South Marshal - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14764; -- Icewing Marshal - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14765; -- Stonehearth Marshal - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14766; -- Iceblood Marshal - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14766; -- Iceblood Marshal - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14767; -- Tower Point Marshal - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14767; -- Tower Point Marshal - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14768; -- East Frostwolf Marshal - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14768; -- East Frostwolf Marshal - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14769; -- West Frostwolf Marshal - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14769; -- West Frostwolf Marshal - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14770; -- Dun Baldar North Warmaster - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14770; -- Dun Baldar North Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14771; -- Dun Baldar South Warmaster - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14771; -- Dun Baldar South Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14772; -- East Frostwolf Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14773; -- Iceblood Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14774; -- Icewing Warmaster - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14774; -- Icewing Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14775; -- Stonehearth Warmaster - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14775; -- Stonehearth Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14776; -- Tower Point Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14777; -- West Frostwolf Warmaster - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14781; -- Captain Shatterskull - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14821; -- Razzashi Raptor - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14822; -- Sayge - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14823; -- Silas Darkmoon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14825; -- Withered Mistress - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14826; -- Sacrificed Troll - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14827; -- Burth - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14828; -- Gelvas Grimegate - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14829; -- Yebb Neblegear - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14832; -- Kerri Hicks - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14833; -- Chronos - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14834; -- Hakkar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14841; -- Rinling - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14842; -- Melnan Darkstone - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14843; -- Kruban Darkblade - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14844; -- Sylannia - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14845; -- Stamp Thunderhorn - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14846; -- Lhara - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14847; -- Professor Thaddeus Paleo - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14848; -- Herald - speed walk was 0.92
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14849; -- Darkmoon Faire Carnie - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14850; -- Gruk - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14850; -- Gruk - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14857; -- Erk - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14857; -- Erk - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14859; -- Guard Taruc - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14860; -- Flik - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14861; -- Blood Steward of Kirtonos - speed walk was 1.15
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14864; -- Khaz Modan Ram - speed walk was 0.93
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE  `entry`=14864; -- Khaz Modan Ram - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14867; -- Jubjub - speed walk was 0.93
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14868; -- Hornsley - speed walk was 0.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14869; -- Pygmy Cockatrice - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14871; -- Morja - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14872; -- Trok - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14873; -- Okla - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14873; -- Okla - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14874; -- Karu - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=14874; -- Karu - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14878; -- Jubling - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14880; -- Razzashi Skitterer - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=14881; -- Spider - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14882; -- Atal'ai Mistress - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=14883; -- Voodoo Slave - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.69 WHERE  `entry`=14884; -- Parasitic Serpent - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=14887; -- Ysondre - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=14888; -- Lethon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=14889; -- Emeriss - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=14890; -- Taerar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14892; -- Fang - speed walk was 0.97
UPDATE `creature_template` SET `speed_run`=1.25714 WHERE  `entry`=14894; -- Swarm of bees - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14901; -- Peon - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=14902; -- Jin'rokh the Breaker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14905; -- Falthir the Sightless - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14909; -- Pooka - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14943; -- Guse's War Rider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14944; -- Jeztor's War Rider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14945; -- Mulverick's War Rider - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14946; -- Slidore's Gryphon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14947; -- Ichman's Gryphon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=14948; -- Vipore's Gryphon - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14961; -- Mirvyna Jinglepocket - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14962; -- Dillord Copperpinch - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14964; -- Hecht Copperpinch - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14965; -- Frenzied Bloodseeker Bat - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14983; -- Field Marshal Oslight - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14984; -- Sergeant Maclear - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1.95 WHERE  `entry`=14986; -- Shade of Jin'do - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE  `entry`=14987; -- Powerful Healing Ward - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14987; -- Powerful Healing Ward - speed run was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14988; -- Ohgan - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14990; -- Defilers Emissary - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14991; -- League of Arathor Emissary - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15006; -- Deze Snowbane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15007; -- Sir Malory Wheeler - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15011; -- Wagner Hammerstrike - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15012; -- Javnir Nashak - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15021; -- Deathmaster Dwire - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15022; -- Deathstalker Mortis - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15041; -- Spawn of Mar'li - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=15042; -- Zanza the Restless - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15045; -- Arathi Farmer - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15046; -- Forsaken Farmer - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=15062; -- Arathi Lumberjack - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15063; -- Arathi Blacksmith - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15064; -- Forsaken Blacksmith - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15065; -- Lady - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15066; -- Cleo - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=15067; -- Zulian Stalker - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15067; -- Zulian Stalker - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15068; -- Zulian Guardian - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15071; -- Underfoot - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15072; -- Spike - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15074; -- Arathi Miner - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15075; -- Forsaken Miner - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15076; -- Zandalarian Emissary - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15077; -- Riggle Bassbait - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15078; -- Jang - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15079; -- Fishbot 5000 - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15080; -- Servant of the Hand - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15082; -- Gri'lek - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15083; -- Hazza'rah - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15084; -- Renataki - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15086; -- Arathi Stablehand - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15087; -- Forsaken Stablehand - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15089; -- Forsaken Lumberjack - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=15091; -- Zul'Gurub Panther Trigger - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15101; -- Zulian Prowler - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15102; -- Silverwing Emissary - speed walk was 1.03
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15105; -- Warsong Emissary - speed walk was 1.08
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15106; -- Frostwolf Emissary - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15107; -- Arathi Horse - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=15107; -- Arathi Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15108; -- Forsaken Horse - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=15108; -- Forsaken Horse - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.32 WHERE  `entry`=15111; -- Mad Servant - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE  `entry`=15112; -- Brain Wash Totem - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15112; -- Brain Wash Totem - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15113; -- Honored Hero - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=2.28 WHERE  `entry`=15114; -- Gahz'ranka - speed walk was 1.35
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15115; -- Honored Ancestor - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15116; -- Grinkle - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15119; -- Barrus - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15124; -- Targot Jinglepocket - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15125; -- Kosco Copperpinch - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15126; -- Rutherford Twing - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15127; -- Samuel Hawke - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15128; -- Defiler Elite - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15130; -- League of Arathor Elite - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15136; -- Hammerfall Elite - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=15137; -- Menethil Elite - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=15146; -- Mad Voidwalker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15162; -- Scarlet Inquisitor - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15163; -- Nightmare Illusion - speed run was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15164; -- Mulgore Trigger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15165; -- Haughty Modiste - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15174; -- Calandrath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15175; -- Khur Hornstriker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15176; -- Vargus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15177; -- Cloud Skydancer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15178; -- Runk Windtamer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15179; -- Mishta - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15180; -- Baristolth of the Shifting Sands - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15181; -- Commander Mar'alith - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15182; -- Vish Kozus - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15183; -- Geologist Larksbane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15184; -- Cenarion Hold Infantry - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15184; -- Cenarion Hold Infantry - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15185; -- Brood of Nozdormu - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE  `entry`=15185; -- Brood of Nozdormu - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15187; -- Cenarion Emissary Jademoon - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15188; -- Cenarion Emissary Blackhoof - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15189; -- Beetix Ficklespragg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15190; -- Noggle Ficklespragg - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15191; -- Windcaller Proudhorn - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15192; -- Anachronos - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=15192; -- Anachronos - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=15195; -- Wickerman Guardian - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=15197; -- Darkcaller Yanka - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.76 WHERE  `entry`=15199; -- Sergeant Hartman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15203; -- Prince Skaldrenox - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15204; -- High Marshal Whirlaxis - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15205; -- Baron Kazum - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=15206; -- The Duke of Cynders - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=15207; -- The Duke of Fathoms - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=15208; -- The Duke of Shards - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=15209; -- Crimson Templar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.77 WHERE  `entry`=15211; -- Azure Templar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=15212; -- Hoary Templar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15218; -- Faire Cannon Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.81 WHERE  `entry`=15220; -- The Duke of Zephyrs - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.27 WHERE  `entry`=15224; -- Dream Fog - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15224; -- Dream Fog - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1.26 WHERE  `entry`=15261; -- Spirit Shade - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15261; -- Spirit Shade - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15270; -- Huum Wildmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15282; -- Aurel Goldleaf - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15303; -- Maxima Blastenheimer - speed walk was 1.11
UPDATE `creature_template` SET `speed_walk`=1.82 WHERE  `entry`=15305; -- Lord Skwol - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15306; -- Bor Wildmane - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=15307; -- Earthen Templar - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15315; -- Mylini Frostmoon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15350; -- Horde Warbringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15351; -- Alliance Brigadier General - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15363; -- Spirit Totem - speed walk was 1.11
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=15363; -- Spirit Totem - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15659; -- Auctioneer Jaxon - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15675; -- Auctioneer Stockton - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15676; -- Auctioneer Yarly - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15678; -- Auctioneer Silva'las - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15679; -- Auctioneer Cazarez - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15682; -- Auctioneer Cain - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15683; -- Auctioneer Naxxremis - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15684; -- Auctioneer Tricket - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15686; -- Auctioneer Rhyker - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE  `entry`=14862; -- Emissary Roman'khan - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14862; -- Emissary Roman'khan - speed run was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15229; -- Vekniss Soldier - speed walk was 3.4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15229; -- Vekniss Soldier - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15230; -- Vekniss Warrior - speed walk was 3.8
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15230; -- Vekniss Warrior - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15233; -- Vekniss Guardian - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15233; -- Vekniss Guardian - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15235; -- Vekniss Stinger - speed run was 1.4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15236; -- Vekniss Wasp - speed run was 1.4
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=15240; -- Vekniss Hive Crawler - speed walk was 1.6
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15240; -- Vekniss Hive Crawler - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15246; -- Qiraji Mindslayer - speed walk was 2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15247; -- Qiraji Brainwasher - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15249; -- Qiraji Lasher - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15250; -- Qiraji Slayer - speed walk was 2
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15252; -- Qiraji Champion - speed walk was 2
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15262; -- Obsidian Eradicator - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15262; -- Obsidian Eradicator - speed run was 1.4
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15263; -- The Prophet Skeram - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15264; -- Anubisath Sentinel - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15275; -- Emperor Vek'nilash - speed run was 1.8
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15276; -- Emperor Vek'lor - speed run was 1.8
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15277; -- Anubisath Defender - speed walk was 1.4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15277; -- Anubisath Defender - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15286; -- Xil'xix - speed run was 1.24
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15288; -- Aluntir - speed run was 1.24
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15290; -- Arakis - speed run was 1.24
UPDATE `creature_template` SET `speed_walk`=2.5 WHERE  `entry`=15299; -- Viscidus - speed walk was 3
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15299; -- Viscidus - speed run was 3
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15300; -- Vekniss Drone - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15312; -- Obsidian Nullifier - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15316; -- Qiraji Scarab - speed walk was 0.91
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15318; -- Hive'Zara Drone - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15319; -- Hive'Zara Collector - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15320; -- Hive'Zara Soldier - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15323; -- Hive'Zara Sandstalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15325; -- Hive'Zara Wasp - speed run was 1.4
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15327; -- Hive'Zara Stinger - speed run was 1.4
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15335; -- Flesh Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15335; -- Flesh Hunter - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15336; -- Hive'Zara Tail Lasher - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15338; -- Obsidian Destroyer - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15339; -- Ossirian the Unscarred - speed run was 1
UPDATE `creature_template` SET `speed_walk`=2.3 WHERE  `entry`=15340; -- Moam - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=15341; -- General Rajaxx - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15343; -- Qiraji Swarmguard - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=15343; -- Qiraji Swarmguard - speed run was 2
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15344; -- Swarmguard Needler - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=15344; -- Swarmguard Needler - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=15348; -- Kurinnaxx - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15355; -- Anubisath Guardian - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15369; -- Ayamiss the Hunter - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=15369; -- Ayamiss the Hunter - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=15370; -- Buru the Gorger - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE  `entry`=15370; -- Buru the Gorger - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15378; -- Merithra of the Dream - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15379; -- Caelestrasz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15380; -- Arygos - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=15381; -- Anachronos the Ancient - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15384; -- OLDWorld Trigger (DO NOT DELETE) - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15385; -- Colonel Zerran - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15386; -- Major Yeggeth - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15387; -- Qiraji Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15388; -- Major Pakkon - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15389; -- Captain Drenn - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15390; -- Captain Xurrem - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15391; -- Captain Qeez - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15392; -- Captain Tuubid - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=15428; -- Sand Vortex - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.57143 WHERE  `entry`=15428; -- Sand Vortex - speed run was 0.5
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15461; -- Shrieker Scarab - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15462; -- Spitting Scarab - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=15491; -- Eranikus, Tyrant of the Dream - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15502; -- Andorgos - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15503; -- Kandrostrasz - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15504; -- Vethsera - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15505; -- Canal Frenzy - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15509; -- Princess Huhuran - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15510; -- Fankriss the Unyielding - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15510; -- Fankriss the Unyielding - speed run was 2.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15511; -- Lord Kri - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15516; -- Battleguard Sartura - speed walk was 6
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15516; -- Battleguard Sartura - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=2.1 WHERE  `entry`=15517; -- Ouro - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15521; -- Hive'Zara Hatchling - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15527; -- Mana Fiend - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15537; -- Anubisath Warrior - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15538; -- Anubisath Swarmguard - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15538; -- Anubisath Swarmguard - speed run was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15543; -- Princess Yauj - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15544; -- Vem - speed walk was 4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15544; -- Vem - speed run was 2.14286
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15555; -- Hive'Zara Larva - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15589; -- Eye of C'Thun - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15620; -- Hive'Regal Hunter-Killer - speed walk was 2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15620; -- Hive'Regal Hunter-Killer - speed run was 2
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15630; -- Spawn of Fankriss - speed walk was 1.4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15630; -- Spawn of Fankriss - speed run was 1.71429
UPDATE `creature_template` SET `speed_walk`=1.79 WHERE  `entry`=15667; -- Glob of Viscidus - speed walk was 0.335625
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15667; -- Glob of Viscidus - speed run was 0.335625
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15727; -- C'Thun - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.74 WHERE  `entry`=15818; -- Lieutenant General Nokhor - speed walk was 1.14
UPDATE `creature_template` SET `speed_walk`=8.8 WHERE  `entry`=15740; -- Colossus of Zora - speed walk was 1.24286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15740; -- Colossus of Zora - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15852; -- Orgrimmar Elite Shieldguard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15853; -- Orgrimmar Elite Infantryman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15854; -- Orgrimmar Elite Cavalryman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.23 WHERE  `entry`=15857; -- Stormwind Cavalryman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.23 WHERE  `entry`=15858; -- Stormwind Infantryman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.23 WHERE  `entry`=15859; -- Stormwind Archmage - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.25 WHERE  `entry`=15862; -- Ironforge Cavalryman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15866; -- High Commander Lynore Windstryke - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15868; -- Highlord Leoric Von Zeldig - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15869; -- Malagav the Tactician - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15870; -- Duke August Foehammer - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=15904; -- Tentacle Portal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.1 WHERE  `entry`=15910; -- Giant Tentacle Portal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15962; -- Vekniss Hatchling - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15962; -- Vekniss Hatchling - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15964; -- Buru Egg Trigger - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE  `entry`=15984; -- Sartura's Royal Guard - speed walk was 6
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15984; -- Sartura's Royal Guard - speed run was 2.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16146; -- Deathknight - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE  `entry`=16149; -- Spectral Horse - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16156; -- Dark Touched Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=16163; -- Deathknight Cavalier - speed run was 1.28
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=15974; -- Dread Creeper - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16165; -- Necro Knight - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16167; -- Bony Construct - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE  `entry`=16168; -- Stoneskin Gargoyle - speed run was 1.5
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16193; -- Skeletal Smith - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=16236; -- Eye Stalk - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=16243; -- Plague Slime - speed walk was 1
UPDATE `creature_template` SET `speed_run`=0.285714 WHERE  `entry`=16243; -- Plague Slime - speed run was 0.35
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16244; -- Infectious Ghoul - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16297; -- Mutated Grub - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16297; -- Mutated Grub - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=16390; -- Deathchill Servant - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16446; -- Plagued Gargoyle - speed run was 1.5
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16447; -- Plagued Ghoul - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.833332 WHERE  `entry`=16698; -- Corpse Scarab - speed walk was 3
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16698; -- Corpse Scarab - speed run was 1.5
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE  `entry`=16998; -- Mr. Bigglesworth - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=16127; -- Spectral Trainee - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16018; -- Bile Retcher - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=15975; -- Carrion Spinner - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=16024; -- Embalming Slime - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16024; -- Embalming Slime - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=15930; -- Feugen - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16036; -- Frenzied Bat - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15953; -- Grand Widow Faerlina - speed run was 1.4
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=16062; -- Highlord Mograine - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16062; -- Highlord Mograine - speed run was 1.65
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15977; -- Poisonous Skitterer - speed walk was 3.5
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=15977; -- Poisonous Skitterer - speed run was 1.75
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16065; -- Lady Blaumeux - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16065; -- Lady Blaumeux - speed run was 1.65
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=15952; -- Maexxna - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15952; -- Maexxna - speed run was 1.65
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15954; -- Noth the Plaguebringer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=2 WHERE  `entry`=16028; -- Patchwerk - speed walk was 1.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16028; -- Patchwerk - speed run was 1.5
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16017; -- Patchwork Golem - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16034; -- Plague Beast - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16037; -- Plagued Bat - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=15989; -- Sapphiron - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16164; -- Shade of Naxxramas - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16063; -- Sir Zeliek - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16063; -- Sir Zeliek - speed run was 1.65
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=15929; -- Stalagg - speed walk was 1.65
UPDATE `creature_template` SET `speed_walk`=1.68 WHERE  `entry`=15928; -- Thaddius - speed walk was 1.65
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16064; -- Thane Korth'azz - speed walk was 1.65
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16064; -- Thane Korth'azz - speed run was 1.65
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=15976; -- Venom Stalker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16113; -- Father Inigo Montoy - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16145; -- Deathknight Captain - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16112; -- Korfax, Champion of the Light - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16115; -- Commander Eligor Dawnbringer - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16116; -- Archmage Angela Dosantos - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16131; -- Rohan the Assassin - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16132; -- Huntsman Leopold - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16133; -- Mataus the Wrathcaster - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16134; -- Rimblat Earthshatter - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16135; -- Rayne - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16061; -- Instructor Razuvious - speed run was 1.5
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15714; -- Yellow Qiraji Battle Tank - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15715; -- Green Qiraji Battle Tank - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15716; -- Red Qiraji Battle Tank - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15713; -- Blue Qiraji Battle Tank - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16012; -- Mokvar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16013; -- Deliana - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16014; -- Mux Manascrambler - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16031; -- Ysida Harmon - speed walk was 1.24
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16032; -- Falrin Treeshaper - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE  `entry`=16043; -- Magma Lord Bokk - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16044; -- Mor Grayhoof Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16045; -- Isalien Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16046; -- Jarien and Sothos Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16047; -- Kormok Trigger - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16048; -- Lord Valthalak Trigger - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16079; -- Theldren Trigger - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16114; -- Scarlet Commander Marjhan - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16376; -- Craftsman Wilhelm - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10583; -- Gryfe - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16227; -- Bragok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16080; -- Mor Grayhoof - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE  `entry`=16097; -- Isalien - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16101; -- Jarien - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16102; -- Sothos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16103; -- Spirit of Jarien - speed walk was 0
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16104; -- Spirit of Sothos - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.15 WHERE  `entry`=16118; -- Kormok - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15540; -- Windcaller Kaldon - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=15702; -- Senior Sergeant Taiga - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15614; -- J.D. Shadesong - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15498; -- Windcaller Yessendra - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15722; -- Squire Leoren Mal'derath - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15499; -- Warden Haro - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16543; -- Garon Hutchins - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15677; -- Auctioneer Graves - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15681; -- Auctioneer O'reely - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15500; -- Keyl Swiftclaw - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16091; -- Dirk Thunderwood - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1.25 WHERE  `entry`=16431; -- Cracked Necrotic Crystal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.25 WHERE  `entry`=16531; -- Faint Necrotic Crystal - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16387; -- Atiesh - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16387; -- Atiesh - speed run was 2.54286
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=16361; -- Commander Thomas Helleran - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15666; -- Black Qiraji Battle Tank - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15665; -- Reindeer Mount - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=15524; -- Reindeer Mount - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15186; -- Murky - speed walk was 0.75
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15324; -- Qiraji Gladiator - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15595; -- Elder Moonstrike - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15597; -- Elder Moonwarden - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15599; -- Elder Bladesing - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15601; -- Elder Starweave - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15604; -- Elder Morningdew - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15605; -- Elder Riversong - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15607; -- Elder Farwhisper - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15871; -- Elder Bronzebeard - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15586; -- Elder Dreamseer - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15584; -- Elder Skyseer - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15583; -- Elder Thunderhorn - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15582; -- Elder Windtotem - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15581; -- Elder Grimtotem - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15578; -- Elder Wildmane - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15573; -- Elder Ragetotem - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15570; -- Elder Primestone - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15569; -- Elder Goldwell - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15568; -- Elder Graveborn - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15567; -- Elder Ironband - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15565; -- Elder Stormbrow - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15562; -- Elder Hammershout - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=0.94 WHERE  `entry`=15561; -- Elder Obsidian - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15549; -- Elder Morndeep - speed walk was 1.25
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10668; -- Beaten Corpse - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1.66667 WHERE  `entry`=7228; -- Ironaya - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE  `entry`=2748; -- Archaedas - speed walk was 1
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE  `entry`=6907; -- Eric "The Swift" - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2909; -- Hammertoe Grez - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15419; -- Kania - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE  `entry`=15395; -- Nafien - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE  `entry`=15395; -- Nafien - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17255; -- Hippogryph Hatchling - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17255; -- Hippogryph Hatchling - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16547; -- Speedy - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16143; -- Shadow of Doom - speed walk was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17696; -- <TXT>Northpass Capture Quest Doodad - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17689; -- <TXT>Crown Guard Capture Quest Doodad - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17690; -- <TXT>Eastwall Capture Quest Doodad - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15541; -- Twilight Marauder Morna - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=15541; -- Twilight Marauder Morna - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17698; -- <TXT>Plaguewood Capture Quest Doodad - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15464; -- Strength of Earth Totem V - speed walk was 0.01
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=15464; -- Strength of Earth Totem V - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=7689; -- Riding Tiger (BlackSpotted) - speed walk was 0.91
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16042; -- Lord Valthalak - speed walk was 1.22
UPDATE `creature_template` SET `speed_run`=0.800002 WHERE  `entry`=16428; -- Unstoppable Abomination - speed run was 0.8
UPDATE `creature_template` SET `speed_walk`=0.25 WHERE  `entry`=16427; -- Soldier of the Frozen Wastes - speed walk was 0.35
UPDATE `creature_template` SET `speed_run`=0.285715 WHERE  `entry`=16427; -- Soldier of the Frozen Wastes - speed run was 0.35
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16549; -- Whiskers the Rat - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16212; -- Dispatch Commander Metz - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE  `entry`=16212; -- Dispatch Commander Metz - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16548; -- Mr. Wiggles - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16094; -- Durik - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2943; -- Ransin Donner - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5047; -- Ellaercia - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7951; -- Zas'Tysh - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=10445; -- Selina Dourman - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12793; -- Brave Stonehide - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15621; -- Yauj Brood - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15624; -- Forest Wisp - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15763; -- Officer Porterhouse - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15764; -- Officer Ironbeard - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15766; -- Officer Maloof - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15891; -- Lunar Festival Herald - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15892; -- Lunar Festival Emissary - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15895; -- Lunar Festival Harbinger - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15898; -- Lunar Festival Vendor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16069; -- Gurky - speed walk was 0.75
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16070; -- Garel Redrock - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16076; -- Tharl Stonebleeder - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16090; -- Rousch - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16096; -- Steamwheedle Bruiser - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16117; -- Plagued Swine - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16225; -- Pack Mule - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=16225; -- Pack Mule - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16228; -- Argent Dawn Infantry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16229; -- Injured Argent Dawn Infantry - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16256; -- Jessica Chambers - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16283; -- Packmaster Stonebruiser - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16399; -- Bloodsail Traitor - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16416; -- Bronn Fitzwrench - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16417; -- Rumsen Fizzlebrack - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16418; -- Mupsi Shacklefridd - speed walk was 0.97
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16592; -- Midsummer Bonfire - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3837; -- Riding Hippogryph - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=541; -- Riding Gryphon - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3574; -- Riding Bat - speed walk was 1.07
UPDATE `creature_template` SET `speed_walk`=1.125 WHERE  `entry`=19405; -- Steam Tonk - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=19405; -- Steam Tonk - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17066; -- Ribbon Pole Debug Target - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17069; -- Emissary Whitebeard - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17072; -- Emissary Gormok - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17074; -- Cenarion Scout - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17108; -- Forsaken Raider - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17108; -- Forsaken Raider - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17111; -- Captured Jaguar - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17111; -- Captured Jaguar - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17112; -- Captured Tarantula - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17112; -- Captured Tarantula - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17113; -- Captured Crocolisk - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17113; -- Captured Crocolisk - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17115; -- Cursed Lost One - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17115; -- Cursed Lost One - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17124; -- Captured Tarantula Trigger - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17124; -- Captured Tarantula Trigger - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17125; -- Captured Jaguar Trigger - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17125; -- Captured Jaguar Trigger - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1.05 WHERE  `entry`=17126; -- Captured Crocolisk Trigger - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17126; -- Captured Crocolisk Trigger - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17598; -- Renn'az - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17645; -- Infernal Relay - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17645; -- Infernal Relay - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15214; -- Invisible Stalker - speed walk was 0.75
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15520; -- O'Reily - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4346; -- Noxious Flayer - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4347; -- Noxious Reaver - speed run was 1.42857
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=4348; -- Noxious Shredder - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5983; -- Bonepicker - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=5983; -- Bonepicker - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=8887; -- A tormented voice - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15454; -- Anachronos Quest Trigger Invisible - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15545; -- Cenarion Outrider - speed walk was 1.25
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=15553; -- Doctor Weavil's Flying Machine - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15693; -- Jonathan the Revelator - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15694; -- Stormwind Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15719; -- Thunder Bluff Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15801; -- GONG BOY DND DNR - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE  `entry`=15896; -- C'Thun Portal - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15905; -- Darnassus Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15906; -- Ironforge Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15907; -- Undercity Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15908; -- Orgrimmar Reveler - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15961; -- Lunar Festival Sentinel - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE  `entry`=15961; -- Lunar Festival Sentinel - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=16057; -- Rotting Maggot - speed walk was 0.55
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16057; -- Rotting Maggot - speed run was 0.63
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16284; -- Argent Medic - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE  `entry`=16286; -- Spore - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16286; -- Spore - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16378; -- Argent Sentry - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE  `entry`=16378; -- Argent Sentry - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16983; -- Plagued Champion - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=16984; -- Plagued Warrior - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17081; -- Scout Bloodfist - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17082; -- Rifleman Torrig - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=510; -- Water Elemental - speed walk was 1.125
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=510; -- Water Elemental - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17252; -- Felguard - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15476; -- Scorpion - speed walk was 1.05
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=15476; -- Scorpion - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=15477; -- Herbalist Proudfeather - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.71 WHERE  `entry`=15508; -- Batrider Pele'keiki - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=15515; -- Skinner Jamani - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16232; -- Caravan Mule - speed walk was 1.125
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE  `entry`=16232; -- Caravan Mule - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16254; -- Field Marshal Chambers - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16379; -- Spirit of the Damned - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16380; -- Bone Witch - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16383; -- Flameshocker - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16385; -- Lightning Totem - speed walk was 0.00001
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16385; -- Lightning Totem - speed run was 0.00001
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16394; -- Pallid Horror - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16394; -- Pallid Horror - speed run was 1.14
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16396; -- Stormwind Elite Guard - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.125 WHERE  `entry`=16474; -- Blizzard - speed walk was 0.8
UPDATE `creature_template` SET `speed_run`=0.428571 WHERE  `entry`=16474; -- Blizzard - speed run was 0.8
UPDATE `creature_template` SET `speed_walk`=0.0001 WHERE  `entry`=16697; -- Void Zone - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16781; -- Midsummer Celebrant - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17209; -- William Kielar - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17635; -- Lordaeron Commander - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17647; -- Lordaeron Soldier - speed walk was 1.1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17794; -- Alliance Tower Buffer - speed walk was 1.125
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=17794; -- Alliance Tower Buffer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17795; -- Horde Tower Buffer - speed walk was 1.1
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE  `entry`=17795; -- Horde Tower Buffer - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17804; -- Squire Rowe - speed walk was 1.125
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14761; -- Creeping Doom - speed walk was 0.33
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=14761; -- Creeping Doom - speed run was 0.33
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15466; -- Minion of Omen - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=15475; -- Beetle - speed run was 1.14286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15571; -- Maws - speed run was 2
UPDATE `creature_template` SET `speed_walk`=4.94 WHERE  `entry`=15744; -- Imperial Qiraji Destroyer - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15744; -- Imperial Qiraji Destroyer - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=8.8 WHERE  `entry`=15742; -- Colossus of Ashi - speed walk was 1.24286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15742; -- Colossus of Ashi - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=8.8 WHERE  `entry`=15741; -- Colossus of Regal - speed walk was 1.24286
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15741; -- Colossus of Regal - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=15855; -- Tauren Rifleman - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=15856; -- Tauren Primalist - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE  `entry`=16056; -- Diseased Maggot - speed walk was 0.55
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16056; -- Diseased Maggot - speed run was 0.63
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16142; -- Bile Sludge - speed run was 0.4
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16861; -- Death Lord - speed run was 1.28
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=5918; -- Owl Form - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=2454; -- Skeletal Fiend (Enraged Form) - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7552; -- Island Frog - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=15729; -- Father Winter's Helper (BIG) gm - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15729; -- Father Winter's Helper (BIG) gm - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12428; -- Deathguard Kel - speed walk was 0.9
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=12758; -- Onyxia Trigger - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14635; -- Sleepy Dark Iron Worker - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=14636; -- Chambermaid Pillaclencher - speed walk was 1.2
UPDATE `creature_template` SET `speed_walk`=1.36 WHERE  `entry`=15711; -- Black Qiraji Battle Tank - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=4.5 WHERE  `entry`=15743; -- Colossal Anubisath Warbringer - speed walk was 1.24
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15743; -- Colossal Anubisath Warbringer - speed run was 1.24286
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=15902; -- Giant Spotlight - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15957; -- Ouro Spawner - speed run was 1.42857
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=16027; -- Living Poison - speed walk was 0.375
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE  `entry`=16027; -- Living Poison - speed run was 0.375
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE  `entry`=16030; -- Maggot - speed run was 0.857143
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16382; -- Patchwork Terror - speed walk was 0.9
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16382; -- Patchwork Terror - speed run was 1.14
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE  `entry`=16419; -- Ghost of Naxxramas - speed walk was 0.5
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16419; -- Ghost of Naxxramas - speed run was 0.5
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16775; -- Spirit of Mograine - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.48 WHERE  `entry`=16788; -- Festival Flamekeeper - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15803; -- Tranquil Air Totem - speed walk was 0
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=15803; -- Tranquil Air Totem - speed run was 0
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15925; -- Toxic Slime - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1 WHERE  `entry`=15478; -- Kaldorei Elite - speed run was 1.14286
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=15547; -- Vam - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE  `entry`=15547; -- Vam - speed run was 1.2
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=10989; -- Alterac Tamed Ram - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10989; -- Alterac Tamed Ram - speed run was 2.11
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=10985; -- Tamed Frostwolf - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=10985; -- Tamed Frostwolf - speed run was 2.42857
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=364; -- Slime - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14061; -- Phase Lasher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14062; -- Phase Lasher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14063; -- Phase Lasher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=14184; -- Phase Lasher - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=11500; -- Trigger Tribute - speed walk was 1.27
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=16785; -- Plague Slime - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16785; -- Plague Slime - speed run was 0.35
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=16784; -- Plague Slime - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16784; -- Plague Slime - speed run was 0.35
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=16783; -- Plague Slime - speed walk was 1
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=16783; -- Plague Slime - speed run was 0.35
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=10819; -- Baron Bloodbane - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE  `entry`=17286; -- Invisible Man - speed walk was 1
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=17025; -- Sapphiron's Wing buffet - speed walk was 1.2
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE  `entry`=17025; -- Sapphiron's Wing buffet - speed run was 1.1486
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7068; -- Condemned Acolyte - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=7071; -- Cursed Paladin - speed walk was 1.05
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12785; -- Sergeant Major Clate - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12784; -- Lieutenant Jackspring - speed walk was 1.26
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=12794; -- Stone Guard Zarg - speed walk was 1.23
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=13601; -- Tinkerer Gizlock - speed walk was 1.2

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
