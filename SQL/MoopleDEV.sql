SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(13) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(128) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `pic` varchar(26) DEFAULT NULL,
  `loggedin` tinyint(4) NOT NULL DEFAULT '0',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `banreason` text,
  `gm` tinyint(1) NOT NULL DEFAULT '0',
  `macs` tinytext,
  `nxCredit` int(11) DEFAULT NULL,
  `maplePoint` int(11) DEFAULT NULL,
  `nxPrepaid` int(11) DEFAULT NULL,
  `characterslots` tinyint(2) NOT NULL DEFAULT '5',
  `gender` tinyint(2) NOT NULL DEFAULT '10',
  `tempban` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `greason` tinyint(4) NOT NULL DEFAULT '0',
  `tos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ranking1` (`id`,`banned`,`gm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `alliance`
-- ----------------------------
DROP TABLE IF EXISTS `alliance`;
CREATE TABLE `alliance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(13) NOT NULL,
  `notice` varchar(128) NOT NULL DEFAULT '',
  `capacity` int(10) unsigned NOT NULL DEFAULT '2',
  `rank_title1` varchar(45) NOT NULL DEFAULT 'Master',
  `rank_title2` varchar(45) NOT NULL DEFAULT 'Jr.Master',
  `rank_title3` varchar(45) NOT NULL DEFAULT 'Member',
  `rank_title4` varchar(45) NOT NULL DEFAULT 'Member',
  `rank_title5` varchar(45) NOT NULL DEFAULT 'Member',
  `guild1` int(10) NOT NULL DEFAULT '-1',
  `guild2` int(10) NOT NULL DEFAULT '-1',
  `guild3` int(10) NOT NULL DEFAULT '-1',
  `guild4` int(10) NOT NULL DEFAULT '-1',
  `guild5` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alliance
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_replies`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_replies`;
CREATE TABLE `bbs_replies` (
  `replyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `threadid` int(10) unsigned NOT NULL,
  `postercid` int(10) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `content` varchar(26) NOT NULL DEFAULT '',
  PRIMARY KEY (`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bbs_replies
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_threads`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_threads`;
CREATE TABLE `bbs_threads` (
  `threadid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postercid` int(10) unsigned NOT NULL,
  `name` varchar(26) NOT NULL DEFAULT '',
  `timestamp` bigint(20) unsigned NOT NULL,
  `icon` smallint(5) unsigned NOT NULL,
  `replycount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `startpost` text NOT NULL,
  `guildid` int(10) unsigned NOT NULL,
  `localthreadid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`threadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bbs_threads
-- ----------------------------

-- ----------------------------
-- Table structure for `buddies`
-- ----------------------------
DROP TABLE IF EXISTS `buddies`;
CREATE TABLE `buddies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL,
  `buddyid` int(11) NOT NULL,
  `pending` tinyint(4) NOT NULL DEFAULT '0',
  `group` varchar(17) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `buddies_ibfk_1` (`characterid`),
  CONSTRAINT `buddies_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of buddies
-- ----------------------------

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `world` int(11) NOT NULL DEFAULT '0',
  `name` varchar(13) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '1',
  `exp` int(11) NOT NULL DEFAULT '0',
  `str` int(11) NOT NULL DEFAULT '12',
  `dex` int(11) NOT NULL DEFAULT '5',
  `luk` int(11) NOT NULL DEFAULT '4',
  `int` int(11) NOT NULL DEFAULT '4',
  `hp` int(11) NOT NULL DEFAULT '50',
  `mp` int(11) NOT NULL DEFAULT '5',
  `maxhp` int(11) NOT NULL DEFAULT '50',
  `maxmp` int(11) NOT NULL DEFAULT '5',
  `meso` int(11) NOT NULL DEFAULT '0',
  `hpMpUsed` int(11) unsigned NOT NULL DEFAULT '0',
  `job` int(11) NOT NULL DEFAULT '0',
  `skincolor` int(11) NOT NULL DEFAULT '0',
  `gender` int(11) NOT NULL DEFAULT '0',
  `fame` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `face` int(11) NOT NULL DEFAULT '0',
  `ap` int(11) NOT NULL DEFAULT '0',
  `sp` int(11) NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL DEFAULT '0',
  `spawnpoint` int(11) NOT NULL DEFAULT '0',
  `gm` tinyint(1) NOT NULL DEFAULT '0',
  `party` int(11) NOT NULL DEFAULT '0',
  `buddyCapacity` int(11) NOT NULL DEFAULT '25',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` int(10) unsigned NOT NULL DEFAULT '1',
  `rankMove` int(11) NOT NULL DEFAULT '0',
  `jobRank` int(10) unsigned NOT NULL DEFAULT '1',
  `jobRankMove` int(11) NOT NULL DEFAULT '0',
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildrank` int(10) unsigned NOT NULL DEFAULT '5',
  `messengerid` int(10) unsigned NOT NULL DEFAULT '0',
  `messengerposition` int(10) unsigned NOT NULL DEFAULT '4',
  `mountlevel` int(9) NOT NULL DEFAULT '1',
  `mountexp` int(9) NOT NULL DEFAULT '0',
  `mounttiredness` int(9) NOT NULL DEFAULT '0',
  `omokwins` int(11) NOT NULL DEFAULT '0',
  `omoklosses` int(11) NOT NULL DEFAULT '0',
  `omokties` int(11) NOT NULL DEFAULT '0',
  `matchcardwins` int(11) NOT NULL DEFAULT '0',
  `matchcardlosses` int(11) NOT NULL DEFAULT '0',
  `matchcardties` int(11) NOT NULL DEFAULT '0',
  `MerchantMesos` int(11) DEFAULT '0',
  `HasMerchant` tinyint(1) DEFAULT '0',
  `equipslots` int(11) NOT NULL DEFAULT '24',
  `useslots` int(11) NOT NULL DEFAULT '24',
  `setupslots` int(11) NOT NULL DEFAULT '24',
  `etcslots` int(11) NOT NULL DEFAULT '24',
  `familyId` int(11) NOT NULL DEFAULT '-1',
  `monsterbookcover` int(11) NOT NULL DEFAULT '0',
  `allianceRank` int(10) NOT NULL DEFAULT '5',
  `vanquisherStage` int(11) unsigned NOT NULL DEFAULT '0',
  `dojoPoints` int(11) unsigned NOT NULL DEFAULT '0',
  `lastDojoStage` int(10) unsigned NOT NULL DEFAULT '0',
  `finishedDojoTutorial` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vanquisherKills` int(11) unsigned NOT NULL DEFAULT '0',
  `summonValue` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `party` (`party`),
  KEY `ranking1` (`level`,`exp`),
  KEY `ranking2` (`gm`,`job`)
) ENGINE=InnoDB AUTO_INCREMENT=30000 DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- ----------------------------
-- Records of characters
-- ----------------------------

-- ----------------------------
-- Table structure for `cooldowns`
-- ----------------------------
DROP TABLE IF EXISTS `cooldowns`;
CREATE TABLE `cooldowns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  `length` bigint(20) unsigned NOT NULL,
  `StartTime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cooldowns
-- ----------------------------

-- ----------------------------
-- Table structure for `dueyitems`
-- ----------------------------
DROP TABLE IF EXISTS `dueyitems`;
CREATE TABLE `dueyitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PackageId` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `upgradeslots` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `str` int(11) DEFAULT '0',
  `dex` int(11) DEFAULT '0',
  `int` int(11) DEFAULT '0',
  `luk` int(11) DEFAULT '0',
  `hp` int(11) DEFAULT '0',
  `mp` int(11) DEFAULT '0',
  `watk` int(11) DEFAULT '0',
  `matk` int(11) DEFAULT '0',
  `wdef` int(11) DEFAULT '0',
  `mdef` int(11) DEFAULT '0',
  `acc` int(11) DEFAULT '0',
  `avoid` int(11) DEFAULT '0',
  `hands` int(11) DEFAULT '0',
  `speed` int(11) DEFAULT '0',
  `jump` int(11) DEFAULT '0',
  `owner` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PackageId` (`PackageId`),
  CONSTRAINT `dueyitems_ibfk_1` FOREIGN KEY (`PackageId`) REFERENCES `dueypackages` (`PackageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dueyitems
-- ----------------------------

-- ----------------------------
-- Table structure for `dueypackages`
-- ----------------------------
DROP TABLE IF EXISTS `dueypackages`;
CREATE TABLE `dueypackages` (
  `PackageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecieverId` int(10) unsigned NOT NULL,
  `SenderName` varchar(13) NOT NULL,
  `Mesos` int(10) unsigned DEFAULT '0',
  `TimeStamp` varchar(10) NOT NULL,
  `Checked` tinyint(1) unsigned DEFAULT '1',
  `Type` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`PackageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dueypackages
-- ----------------------------

-- ----------------------------
-- Table structure for `eventstats`
-- ----------------------------
DROP TABLE IF EXISTS `eventstats`;
CREATE TABLE `eventstats` (
  `characterid` int(11) unsigned NOT NULL,
  `name` varchar(11) NOT NULL DEFAULT '0' COMMENT '0',
  `info` int(11) NOT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of eventstats
-- ----------------------------

-- ----------------------------
-- Table structure for `famelog`
-- ----------------------------
DROP TABLE IF EXISTS `famelog`;
CREATE TABLE `famelog` (
  `famelogid` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL DEFAULT '0',
  `characterid_to` int(11) NOT NULL DEFAULT '0',
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`famelogid`),
  KEY `characterid` (`characterid`),
  CONSTRAINT `famelog_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of famelog
-- ----------------------------

-- ----------------------------
-- Table structure for `family_character`
-- ----------------------------
DROP TABLE IF EXISTS `family_character`;
CREATE TABLE `family_character` (
  `cid` int(11) NOT NULL,
  `familyid` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `reputation` int(11) NOT NULL,
  `todaysrep` int(11) NOT NULL,
  `totaljuniors` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `juniorsadded` int(11) NOT NULL,
  `totalreputation` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of family_character
-- ----------------------------

-- ----------------------------
-- Table structure for `gifts`
-- ----------------------------
DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to` int(11) NOT NULL,
  `from` varchar(13) NOT NULL,
  `message` tinytext NOT NULL,
  `sn` int(10) unsigned NOT NULL,
  `ringid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gifts_1` (`to`),
  CONSTRAINT `FK_gifts_1` FOREIGN KEY (`to`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gifts
-- ----------------------------

-- ----------------------------
-- Table structure for `gmlog`
-- ----------------------------
DROP TABLE IF EXISTS `gmlog`;
CREATE TABLE `gmlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `command` tinytext NOT NULL,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gmlog
-- ----------------------------

-- ----------------------------
-- Table structure for `guilds`
-- ----------------------------
DROP TABLE IF EXISTS `guilds`;
CREATE TABLE `guilds` (
  `guildid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leader` int(10) unsigned NOT NULL DEFAULT '0',
  `GP` int(10) unsigned NOT NULL DEFAULT '0',
  `logo` int(10) unsigned DEFAULT NULL,
  `logoColor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `rank1title` varchar(45) NOT NULL DEFAULT 'Master',
  `rank2title` varchar(45) NOT NULL DEFAULT 'Jr. Master',
  `rank3title` varchar(45) NOT NULL DEFAULT 'Member',
  `rank4title` varchar(45) NOT NULL DEFAULT 'Member',
  `rank5title` varchar(45) NOT NULL DEFAULT 'Member',
  `capacity` int(10) unsigned NOT NULL DEFAULT '10',
  `logoBG` int(10) unsigned DEFAULT NULL,
  `logoBGColor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `notice` varchar(101) DEFAULT NULL,
  `signature` int(11) NOT NULL DEFAULT '0',
  `allianceId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guilds
-- ----------------------------

-- ----------------------------
-- Table structure for `hiredmerchant`
-- ----------------------------
DROP TABLE IF EXISTS `hiredmerchant`;
CREATE TABLE `hiredmerchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `upgradeslots` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `str` int(11) DEFAULT '0',
  `dex` int(11) DEFAULT '0',
  `int` int(11) DEFAULT '0',
  `luk` int(11) DEFAULT '0',
  `hp` int(11) DEFAULT '0',
  `mp` int(11) DEFAULT '0',
  `watk` int(11) DEFAULT '0',
  `matk` int(11) DEFAULT '0',
  `wdef` int(11) DEFAULT '0',
  `mdef` int(11) DEFAULT '0',
  `acc` int(11) DEFAULT '0',
  `avoid` int(11) DEFAULT '0',
  `hands` int(11) DEFAULT '0',
  `speed` int(11) DEFAULT '0',
  `jump` int(11) DEFAULT '0',
  `owner` varchar(13) DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hiredmerchant
-- ----------------------------

-- ----------------------------
-- Table structure for `htsquads`
-- ----------------------------
DROP TABLE IF EXISTS `htsquads`;
CREATE TABLE `htsquads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel` int(10) unsigned NOT NULL,
  `leaderid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `members` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of htsquads
-- ----------------------------

-- ----------------------------
-- Table structure for `inventoryequipment`
-- ----------------------------
DROP TABLE IF EXISTS `inventoryequipment`;
CREATE TABLE `inventoryequipment` (
  `inventoryequipmentid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventoryitemid` int(10) unsigned NOT NULL DEFAULT '0',
  `upgradeslots` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `str` int(11) NOT NULL DEFAULT '0',
  `dex` int(11) NOT NULL DEFAULT '0',
  `int` int(11) NOT NULL DEFAULT '0',
  `luk` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `mp` int(11) NOT NULL DEFAULT '0',
  `watk` int(11) NOT NULL DEFAULT '0',
  `matk` int(11) NOT NULL DEFAULT '0',
  `wdef` int(11) NOT NULL DEFAULT '0',
  `mdef` int(11) NOT NULL DEFAULT '0',
  `acc` int(11) NOT NULL DEFAULT '0',
  `avoid` int(11) NOT NULL DEFAULT '0',
  `hands` int(11) NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `jump` int(11) NOT NULL DEFAULT '0',
  `locked` int(11) NOT NULL DEFAULT '0',
  `vicious` int(11) unsigned NOT NULL DEFAULT '0',
  `itemlevel` int(11) NOT NULL DEFAULT '1',
  `itemexp` int(11) unsigned NOT NULL DEFAULT '0',
  `ringid` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`inventoryequipmentid`),
  KEY `inventoryitemid` (`inventoryitemid`),
  CONSTRAINT `inventoryequipment_ibfk_1` FOREIGN KEY (`inventoryitemid`) REFERENCES `inventoryitems` (`inventoryitemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventoryequipment
-- ----------------------------

-- ----------------------------
-- Table structure for `inventoryitems`
-- ----------------------------
DROP TABLE IF EXISTS `inventoryitems`;
CREATE TABLE `inventoryitems` (
  `inventoryitemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `characterid` int(11) DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `itemid` int(11) NOT NULL DEFAULT '0',
  `inventorytype` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `owner` tinytext NOT NULL,
  `petid` int(11) NOT NULL DEFAULT '-1',
  `flag` int(11) NOT NULL,
  `expiration` bigint(20) NOT NULL DEFAULT '-1',
  `giftFrom` varchar(26) NOT NULL,
  PRIMARY KEY (`inventoryitemid`),
  KEY `FK_inventoryitems_1` (`characterid`),
  CONSTRAINT `FK_inventoryitems_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventoryitems
-- ----------------------------

-- ----------------------------
-- Table structure for `ipbans`
-- ----------------------------
DROP TABLE IF EXISTS `ipbans`;
CREATE TABLE `ipbans` (
  `ipbanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipbanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ipbans
-- ----------------------------

-- ----------------------------
-- Table structure for `iplog`
-- ----------------------------
DROP TABLE IF EXISTS `iplog`;
CREATE TABLE `iplog` (
  `iplogid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iplogid`),
  KEY `accountid` (`accountid`,`ip`),
  KEY `ip` (`ip`),
  CONSTRAINT `iplog_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iplog
-- ----------------------------

-- ----------------------------
-- Table structure for `keymap`
-- ----------------------------
DROP TABLE IF EXISTS `keymap`;
CREATE TABLE `keymap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL DEFAULT '0',
  `key` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keymap_ibfk_1` (`characterid`),
  CONSTRAINT `keymap_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keymap
-- ----------------------------

-- ----------------------------
-- Table structure for `macbans`
-- ----------------------------
DROP TABLE IF EXISTS `macbans`;
CREATE TABLE `macbans` (
  `macbanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mac` varchar(30) NOT NULL,
  PRIMARY KEY (`macbanid`),
  UNIQUE KEY `mac_2` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of macbans
-- ----------------------------

-- ----------------------------
-- Table structure for `macfilters`
-- ----------------------------
DROP TABLE IF EXISTS `macfilters`;
CREATE TABLE `macfilters` (
  `macfilterid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(30) NOT NULL,
  PRIMARY KEY (`macfilterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of macfilters
-- ----------------------------

-- ----------------------------
-- Table structure for `makercreatedata`
-- ----------------------------
DROP TABLE IF EXISTS `makercreatedata`;
CREATE TABLE `makercreatedata` (
  `id` tinyint(3) unsigned NOT NULL,
  `itemid` int(11) NOT NULL,
  `req_level` tinyint(3) unsigned NOT NULL,
  `req_maker_level` tinyint(3) unsigned NOT NULL,
  `req_meso` int(11) NOT NULL,
  `req_item` int(11) NOT NULL,
  `req_equip` int(11) NOT NULL,
  `catalyst` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `tuc` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of makercreatedata
-- ----------------------------
INSERT INTO `makercreatedata` VALUES ('0', '2040727', '50', '1', '50000', '0', '1122013', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '2041058', '50', '1', '50000', '0', '1122013', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001174', '45', '1', '0', '4031966', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001175', '50', '1', '0', '4031967', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001176', '55', '1', '0', '4031968', '0', '0', '10', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001177', '60', '1', '0', '4031969', '0', '0', '100', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001178', '65', '1', '0', '4031970', '0', '0', '5', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001179', '70', '1', '0', '4031971', '0', '0', '7', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001180', '75', '2', '0', '4031972', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001181', '80', '2', '0', '4031973', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001182', '85', '2', '0', '4031974', '0', '0', '6', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001183', '90', '2', '0', '4031975', '0', '0', '30', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001184', '95', '2', '0', '4031976', '0', '0', '2', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001185', '100', '2', '0', '4031977', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4001186', '105', '3', '0', '4031978', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4031980', '105', '2', '0', '4031979', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250000', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250001', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250002', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250100', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250101', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250102', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250200', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250201', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250202', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250300', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250301', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250302', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250400', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250401', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250402', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250500', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250501', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250502', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250600', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250601', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250602', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250700', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250701', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250702', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250800', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250801', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250802', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250900', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250901', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4250902', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251000', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251001', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251002', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251100', '45', '1', '100000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251101', '45', '1', '300000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251102', '45', '2', '500000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251300', '75', '2', '150000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251301', '75', '2', '450000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251302', '75', '3', '750000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251400', '75', '2', '150000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251401', '75', '2', '450000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('0', '4251402', '75', '3', '750000', '0', '0', '0', '1', '0');
INSERT INTO `makercreatedata` VALUES ('1', '1002022', '50', '1', '55000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002028', '45', '1', '50000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002029', '55', '1', '75000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002030', '65', '1', '85000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002084', '55', '1', '75000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002085', '45', '1', '45000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002086', '45', '1', '37500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002094', '65', '1', '85000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002095', '65', '1', '85000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002100', '50', '1', '55000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002101', '50', '1', '55000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1002338', '75', '2', '133000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002339', '75', '2', '133000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002340', '75', '2', '133000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002377', '95', '2', '168000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002378', '95', '2', '168000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002379', '95', '2', '168000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002528', '85', '2', '147000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002529', '85', '2', '147000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002530', '85', '2', '147000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002531', '85', '2', '147000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002532', '85', '2', '147000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1002551', '105', '3', '280000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1002776', '115', '3', '320000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1002790', '115', '3', '320000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1040087', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040088', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040089', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040090', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040091', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040092', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040093', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040102', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040103', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040104', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1040111', '85', '2', '112000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1040112', '85', '2', '112000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1040113', '85', '2', '112000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1040120', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1040121', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1040122', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041087', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041088', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041089', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041091', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041092', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041093', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041097', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041098', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041099', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1041119', '85', '2', '133000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041120', '85', '2', '133000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041121', '85', '2', '133000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041122', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041123', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1041124', '95', '2', '140000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1050080', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1050081', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1050082', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1050083', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1051077', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1051078', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1051079', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1051080', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1052075', '105', '3', '320000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1052155', '115', '3', '380000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1052160', '115', '3', '380000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1060076', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060077', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060078', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060079', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060080', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060081', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060082', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060090', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060091', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060092', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1060100', '85', '2', '98000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1060101', '85', '2', '98000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1060102', '85', '2', '98000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1060109', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1060110', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1060111', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061086', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061087', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061088', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061090', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061091', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061092', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061096', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061097', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061098', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1061118', '85', '2', '119000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061119', '85', '2', '119000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061120', '85', '2', '119000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061121', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061122', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1061123', '95', '2', '126000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072132', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072133', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072134', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072135', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072147', '55', '1', '35000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072148', '55', '1', '35000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072149', '55', '1', '35000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072154', '65', '1', '42500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072155', '65', '1', '42500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072156', '65', '1', '42500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1072196', '85', '2', '105000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072197', '85', '2', '105000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072198', '85', '2', '105000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072210', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072211', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072212', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072220', '95', '2', '126000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072221', '95', '2', '126000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072222', '95', '2', '126000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1072273', '105', '3', '210000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1072355', '115', '3', '240000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1072361', '115', '3', '240000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1082009', '45', '1', '45000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082010', '45', '1', '50000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082011', '45', '1', '55000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082059', '55', '1', '60000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082060', '55', '1', '65000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082061', '55', '1', '70000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082103', '65', '1', '75000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082104', '65', '1', '80000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082105', '65', '1', '85000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1082114', '75', '2', '147000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082115', '75', '2', '150500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082116', '75', '2', '154000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082117', '75', '2', '154000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082128', '85', '2', '168000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082129', '85', '2', '171500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082130', '85', '2', '175000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082139', '95', '2', '189000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082140', '95', '2', '192500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082141', '95', '2', '196000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1082168', '105', '3', '300000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1082234', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1082239', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1092004', '45', '1', '75000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092009', '55', '1', '90000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092010', '55', '1', '95000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092011', '55', '1', '95000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092015', '65', '1', '100000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092016', '65', '1', '105000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092017', '65', '1', '105000', '0', '0', '4130022', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1092023', '75', '2', '154000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092024', '75', '2', '161000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092025', '75', '2', '161000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092026', '85', '2', '168000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092027', '85', '2', '175000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092028', '85', '2', '175000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092036', '95', '2', '182000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092037', '95', '2', '189000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092038', '95', '2', '196000', '0', '0', '4130022', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1092058', '115', '3', '350000', '0', '0', '4130022', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1092060', '105', '3', '210000', '0', '0', '4130022', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1302010', '45', '1', '60000', '0', '0', '4130002', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1302011', '55', '1', '75000', '0', '0', '4130002', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1302012', '65', '1', '125000', '0', '0', '4130002', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1302018', '75', '2', '210000', '0', '0', '4130002', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1302023', '85', '2', '245000', '0', '0', '4130002', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1302056', '95', '2', '336000', '0', '0', '4130002', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1302059', '105', '3', '550000', '0', '0', '4130002', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1302081', '115', '3', '680000', '0', '0', '4130002', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1302086', '115', '3', '680000', '0', '0', '4130002', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1312008', '45', '1', '70000', '0', '0', '4130003', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1312009', '55', '1', '95000', '0', '0', '4130003', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1312010', '65', '1', '150000', '0', '0', '4130003', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1312011', '75', '2', '245000', '0', '0', '4130003', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1312015', '85', '2', '280000', '0', '0', '4130003', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1312030', '95', '2', '329000', '0', '0', '4130003', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1312031', '105', '3', '530000', '0', '0', '4130003', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1312037', '115', '3', '580000', '0', '0', '4130003', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1312038', '115', '3', '580000', '0', '0', '4130003', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1322017', '45', '1', '70000', '0', '0', '4130004', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1322018', '55', '1', '95000', '0', '0', '4130004', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1322019', '65', '1', '125000', '0', '0', '4130004', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1322020', '70', '1', '150000', '0', '0', '4130004', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1322028', '75', '2', '245000', '0', '0', '4130004', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1322029', '85', '2', '280000', '0', '0', '4130004', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1322045', '95', '2', '329000', '0', '0', '4130004', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1322052', '105', '3', '480000', '0', '0', '4130004', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1322060', '115', '3', '490000', '0', '0', '4130004', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1322061', '115', '3', '490000', '0', '0', '4130004', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1402003', '45', '1', '100000', '0', '0', '4130005', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1402004', '75', '2', '210000', '0', '0', '4130005', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1402005', '85', '2', '280000', '0', '0', '4130005', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1402011', '55', '1', '115000', '0', '0', '4130005', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1402012', '65', '1', '130000', '0', '0', '4130005', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1402015', '75', '2', '210000', '0', '0', '4130005', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1402016', '85', '2', '280000', '0', '0', '4130005', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1402035', '95', '2', '329000', '0', '0', '4130005', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1402036', '105', '3', '550000', '0', '0', '4130005', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1402046', '115', '3', '650000', '0', '0', '4130005', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1402047', '115', '3', '650000', '0', '0', '4130005', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1412003', '45', '1', '70000', '0', '0', '4130006', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1412007', '55', '1', '95000', '0', '0', '4130006', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1412008', '65', '1', '125000', '0', '0', '4130006', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1412009', '75', '2', '217000', '0', '0', '4130006', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1412010', '85', '2', '259000', '0', '0', '4130006', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1412021', '95', '2', '343000', '0', '0', '4130006', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1412026', '105', '3', '520000', '0', '0', '4130006', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1412033', '115', '3', '650000', '0', '0', '4130006', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1412034', '115', '3', '650000', '0', '0', '4130006', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1422005', '45', '1', '75000', '0', '0', '4130007', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1422009', '55', '1', '95000', '0', '0', '4130007', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1422010', '65', '1', '125000', '0', '0', '4130007', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1422012', '75', '2', '217000', '0', '0', '4130007', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1422013', '85', '2', '259000', '0', '0', '4130007', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1422027', '95', '2', '315000', '0', '0', '4130007', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1422028', '105', '3', '510000', '0', '0', '4130007', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1422037', '115', '3', '560000', '0', '0', '4130007', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1422038', '115', '3', '560000', '0', '0', '4130007', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1432004', '45', '1', '75000', '0', '0', '4130008', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1432006', '55', '1', '95000', '0', '0', '4130008', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1432007', '65', '1', '125000', '0', '0', '4130008', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1432010', '75', '2', '217000', '0', '0', '4130008', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1432011', '85', '2', '259000', '0', '0', '4130008', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1432030', '95', '2', '343000', '0', '0', '4130008', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1432038', '105', '3', '530000', '0', '0', '4130008', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1432047', '115', '3', '570000', '0', '0', '4130008', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1432049', '115', '3', '570000', '0', '0', '4130008', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1442005', '45', '1', '75000', '0', '0', '4130009', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1442008', '65', '1', '150000', '0', '0', '4130009', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1442010', '55', '1', '125000', '0', '0', '4130009', '1', '1');
INSERT INTO `makercreatedata` VALUES ('1', '1442019', '75', '2', '245000', '0', '0', '4130009', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1442020', '85', '2', '315000', '0', '0', '4130009', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1442044', '95', '2', '329000', '0', '0', '4130009', '1', '2');
INSERT INTO `makercreatedata` VALUES ('1', '1442045', '105', '3', '570000', '0', '0', '4130009', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1442063', '115', '3', '620000', '0', '0', '4130009', '1', '3');
INSERT INTO `makercreatedata` VALUES ('1', '1442067', '115', '3', '620000', '0', '0', '4130009', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1002215', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002216', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002217', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002218', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002242', '55', '1', '25000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002243', '55', '1', '25000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002244', '55', '1', '25000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002245', '55', '1', '25000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002246', '55', '1', '25000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002252', '65', '1', '40000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002253', '65', '1', '40000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002254', '65', '1', '40000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1002271', '75', '2', '66500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002272', '75', '2', '66500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002273', '75', '2', '66500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002274', '75', '2', '66500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002363', '85', '2', '77000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002364', '85', '2', '77000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002365', '85', '2', '77000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002366', '85', '2', '77000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002398', '95', '2', '87500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002399', '95', '2', '87500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002400', '95', '2', '87500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002401', '95', '2', '87500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1002773', '105', '3', '150000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1002777', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1002791', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1050045', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050046', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050047', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050048', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050049', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050053', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050054', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050055', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050056', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050067', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050068', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050069', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050070', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1050072', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050073', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050074', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050092', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050093', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050094', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050095', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050102', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050103', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050104', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1050105', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051030', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051031', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051032', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051033', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051034', '43', '1', '45000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051044', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051045', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051046', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051047', '53', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051052', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051053', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051054', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051055', '63', '1', '60000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1051056', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051057', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051058', '73', '2', '112000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051094', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051095', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051096', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051097', '83', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051101', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051102', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051103', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1051104', '93', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1052076', '103', '3', '290000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1052156', '115', '3', '340000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1052161', '115', '3', '340000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1072136', '55', '1', '30000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072137', '55', '1', '30000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072138', '55', '1', '30000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072139', '55', '1', '30000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072140', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072141', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072142', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072143', '45', '1', '27500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072157', '65', '1', '40000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072158', '65', '1', '40000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072159', '65', '1', '40000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072160', '65', '1', '40000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1072177', '75', '2', '70000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072178', '75', '2', '70000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072179', '75', '2', '70000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072206', '85', '2', '84000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072207', '85', '2', '84000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072208', '85', '2', '84000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072209', '85', '2', '84000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072223', '95', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072224', '95', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072225', '95', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072226', '95', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1072268', '105', '3', '180000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1072356', '115', '3', '220000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1072362', '115', '3', '220000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1082080', '45', '1', '50000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082081', '45', '1', '40000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082082', '45', '1', '45000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082086', '55', '1', '52500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082087', '55', '1', '57500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082088', '55', '1', '62500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082098', '65', '1', '70000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082099', '65', '1', '72500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082100', '65', '1', '75000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1082121', '75', '2', '140000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082122', '75', '2', '143500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082123', '75', '2', '147000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082131', '85', '2', '161000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082132', '85', '2', '164500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082133', '85', '2', '164500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082134', '85', '2', '168000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082151', '95', '2', '182000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082152', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082153', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082154', '95', '2', '189000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1082164', '105', '3', '300000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1082235', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1082240', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1092057', '115', '3', '350000', '0', '0', '4130022', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1372007', '43', '1', '100000', '0', '0', '4130010', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1372009', '83', '2', '227500', '0', '0', '4130010', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1372010', '93', '2', '252000', '0', '0', '4130010', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1372014', '53', '1', '115000', '0', '0', '4130010', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1372015', '63', '1', '130000', '0', '0', '4130010', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1372016', '73', '2', '203000', '0', '0', '4130010', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1372032', '103', '3', '460000', '0', '0', '4130010', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1372044', '115', '3', '510000', '0', '0', '4130010', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1372045', '115', '3', '510000', '0', '0', '4130010', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1382006', '50', '1', '75000', '0', '0', '4130011', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1382007', '60', '1', '100000', '0', '0', '4130011', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1382008', '80', '2', '217000', '0', '0', '4130011', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1382010', '70', '1', '125000', '0', '0', '4130011', '1', '1');
INSERT INTO `makercreatedata` VALUES ('2', '1382035', '90', '2', '266000', '0', '0', '4130011', '1', '2');
INSERT INTO `makercreatedata` VALUES ('2', '1382036', '105', '3', '470000', '0', '0', '4130011', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1382057', '115', '3', '520000', '0', '0', '4130011', '1', '3');
INSERT INTO `makercreatedata` VALUES ('2', '1382059', '115', '3', '520000', '0', '0', '4130011', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1002211', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002212', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002213', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002214', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002267', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002268', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002269', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002270', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002275', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002276', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002277', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002278', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002286', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002287', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002288', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002289', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1002402', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002403', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002404', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002405', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002406', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002407', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002408', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1002547', '105', '3', '150000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1002778', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1002792', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1050051', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050052', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050058', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050059', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050060', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050061', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050062', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050063', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050064', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1050075', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050076', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050077', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050078', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050088', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050089', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050090', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050091', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050106', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050107', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1050108', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051037', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051038', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051039', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051041', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051042', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051043', '55', '1', '52500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051062', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051063', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051064', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051065', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1051066', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051067', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051068', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051069', '75', '2', '98000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051082', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051083', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051084', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051085', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051105', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051106', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1051107', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1052071', '105', '3', '300000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1052157', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1052162', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1072122', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072123', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072124', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072125', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072144', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072145', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072146', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072164', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072165', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072166', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072167', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1072182', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072183', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072184', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072185', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072203', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072204', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072205', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072227', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072228', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072229', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1072269', '105', '3', '180000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1072357', '115', '3', '200000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1072363', '115', '3', '200000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1082083', '45', '1', '52500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082084', '45', '1', '42500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082085', '45', '1', '47500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082089', '55', '1', '55000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082090', '55', '1', '60000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082091', '55', '1', '65000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082106', '65', '1', '70000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082107', '65', '1', '75000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082108', '65', '1', '80000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1082109', '75', '2', '140000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082110', '75', '2', '143500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082111', '75', '2', '143500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082112', '75', '2', '147000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082125', '85', '2', '161000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082126', '85', '2', '164500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082127', '85', '2', '168000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082158', '95', '2', '182000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082159', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082160', '95', '2', '189000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1082163', '105', '3', '300000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1082236', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1082241', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1452004', '55', '1', '125000', '0', '0', '4130012', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1452008', '45', '1', '100000', '0', '0', '4130012', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1452009', '65', '1', '150000', '0', '0', '4130012', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1452010', '65', '1', '150000', '0', '0', '4130012', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1452011', '65', '1', '150000', '0', '0', '4130012', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1452012', '75', '2', '245000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452013', '75', '2', '245000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452014', '75', '2', '245000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452015', '75', '2', '245000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452017', '85', '2', '280000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452019', '95', '2', '315000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452020', '95', '2', '315000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452021', '95', '2', '315000', '0', '0', '4130012', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1452044', '105', '3', '500000', '0', '0', '4130012', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1452057', '115', '3', '550000', '0', '0', '4130012', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1452059', '115', '3', '550000', '0', '0', '4130012', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1462007', '45', '1', '85000', '0', '0', '4130013', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1462008', '55', '1', '120000', '0', '0', '4130013', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1462009', '65', '1', '150000', '0', '0', '4130013', '1', '1');
INSERT INTO `makercreatedata` VALUES ('4', '1462010', '75', '2', '245000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462011', '75', '2', '245000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462012', '75', '2', '245000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462013', '75', '2', '245000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462015', '95', '2', '315000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462016', '95', '2', '315000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462017', '95', '2', '315000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462018', '85', '2', '280000', '0', '0', '4130013', '1', '2');
INSERT INTO `makercreatedata` VALUES ('4', '1462039', '105', '3', '500000', '0', '0', '4130013', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1462050', '115', '3', '550000', '0', '0', '4130013', '1', '3');
INSERT INTO `makercreatedata` VALUES ('4', '1462051', '115', '3', '550000', '0', '0', '4130013', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1002207', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002208', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002209', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002210', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002247', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002248', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002249', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002281', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002282', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002283', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002284', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002285', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1002323', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002324', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002325', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002326', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002327', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002328', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002329', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002330', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002380', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002381', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002382', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002383', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1002550', '105', '3', '150000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1002779', '115', '3', '190000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1002793', '115', '3', '190000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1040094', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040095', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040096', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040097', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040098', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040099', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040100', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040105', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040106', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040107', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1040108', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040109', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040110', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040115', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040116', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040117', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1040118', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041077', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041078', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041079', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041080', '45', '1', '37500', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041094', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041095', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041096', '55', '1', '45000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041100', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041101', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041102', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041103', '65', '1', '50000', '0', '0', '4130019', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1041105', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041106', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041107', '75', '2', '98000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041115', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041116', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041117', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1041118', '85', '2', '126000', '0', '0', '4130019', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1050096', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1050097', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1050098', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1050099', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1051090', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1051091', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1051092', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1051093', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1052072', '105', '3', '300000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1052158', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1052163', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1060083', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060084', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060085', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060086', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060087', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060088', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060089', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060093', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060094', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060095', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1060097', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060098', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060099', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060104', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060105', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060106', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1060107', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061076', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061077', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061078', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061079', '45', '1', '30000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061093', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061094', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061095', '55', '1', '37500', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061099', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061100', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061101', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061102', '65', '1', '45000', '0', '0', '4130020', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1061104', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061105', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061106', '75', '2', '84000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061114', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061115', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061116', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1061117', '85', '2', '112000', '0', '0', '4130020', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072128', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072129', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072130', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072131', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072150', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072151', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072152', '55', '1', '35000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072161', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072162', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072163', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1072172', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072173', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072174', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072192', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072193', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072194', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072195', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072213', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072214', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072215', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072216', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1072272', '105', '3', '195000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1072358', '115', '3', '225000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1072364', '115', '3', '225000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1082065', '45', '1', '42500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082066', '45', '1', '47500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082067', '45', '1', '45000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082092', '55', '1', '55000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082093', '55', '1', '60000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082094', '55', '1', '65000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082095', '65', '1', '75000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082096', '65', '1', '80000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082097', '65', '1', '85000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1082118', '75', '2', '140000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082119', '75', '2', '143500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082120', '75', '2', '147000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082135', '95', '2', '182000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082136', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082137', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082138', '95', '2', '189000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082142', '85', '2', '150500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082143', '85', '2', '150500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082144', '85', '2', '150500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1082167', '105', '3', '300000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1082237', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1082242', '115', '3', '330000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1092059', '115', '3', '350000', '0', '0', '4130022', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332003', '45', '1', '110000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332015', '55', '1', '125000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332016', '45', '1', '110000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332017', '55', '1', '125000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332018', '65', '1', '140000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332019', '65', '1', '140000', '0', '0', '4130014', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1332022', '75', '2', '217000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332023', '75', '2', '217000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332026', '85', '2', '238000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332027', '85', '2', '238000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332049', '105', '3', '450000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332050', '105', '3', '450000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332051', '95', '2', '280000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332052', '95', '2', '280000', '0', '0', '4130014', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1332073', '115', '3', '500000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332074', '115', '3', '510000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332075', '115', '3', '500000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1332076', '115', '3', '500000', '0', '0', '4130014', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1472018', '45', '1', '50000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472019', '45', '1', '52500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472020', '45', '1', '52500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472021', '45', '1', '55000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472022', '55', '1', '125000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472023', '55', '1', '127500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472024', '55', '1', '127500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472025', '55', '1', '130000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472026', '65', '1', '150000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472027', '65', '1', '152500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472028', '65', '1', '152500', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472029', '65', '1', '155000', '0', '0', '4130015', '1', '1');
INSERT INTO `makercreatedata` VALUES ('8', '1472031', '75', '2', '280000', '0', '0', '4130015', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1472033', '85', '2', '315000', '0', '0', '4130015', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1472051', '105', '3', '570000', '0', '0', '4130015', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1472052', '105', '3', '570000', '0', '0', '4130015', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1472053', '95', '2', '357000', '0', '0', '4130015', '1', '2');
INSERT INTO `makercreatedata` VALUES ('8', '1472068', '115', '3', '630000', '0', '0', '4130015', '1', '3');
INSERT INTO `makercreatedata` VALUES ('8', '1472071', '115', '3', '630000', '0', '0', '4130015', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1002631', '45', '1', '20000', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1002634', '55', '1', '27500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1002637', '65', '1', '42500', '0', '0', '4130018', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1002640', '75', '2', '70000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1002643', '85', '2', '80500', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1002646', '95', '2', '91000', '0', '0', '4130018', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1002649', '105', '3', '150000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1002780', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1002794', '115', '3', '170000', '0', '0', '4130018', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1052116', '45', '1', '47500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1052119', '55', '1', '50000', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1052122', '65', '1', '57500', '0', '0', '4130021', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1052125', '75', '2', '126000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1052128', '85', '2', '140000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1052131', '95', '2', '168000', '0', '0', '4130021', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1052134', '105', '3', '300000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1052159', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1052164', '115', '3', '360000', '0', '0', '4130021', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1072303', '45', '1', '25000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1072306', '55', '1', '32500', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1072309', '65', '1', '45000', '0', '0', '4130001', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1072312', '75', '2', '77000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1072315', '85', '2', '98000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1072318', '95', '2', '119000', '0', '0', '4130001', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1072321', '105', '3', '180000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1072359', '115', '3', '200000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1072365', '115', '3', '200000', '0', '0', '4130001', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1082198', '45', '1', '42500', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1082201', '55', '1', '55000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1082204', '65', '1', '75000', '0', '0', '4130000', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1082207', '75', '2', '140000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1082210', '85', '2', '161000', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1082213', '95', '2', '185500', '0', '0', '4130000', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1082216', '105', '3', '300000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1082238', '115', '3', '335000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1082243', '115', '3', '335000', '0', '0', '4130000', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1482007', '45', '1', '65000', '0', '0', '4130016', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1482008', '55', '1', '120000', '0', '0', '4130016', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1482009', '65', '1', '150000', '0', '0', '4130016', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1482010', '75', '2', '245000', '0', '0', '4130016', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1482011', '85', '2', '273000', '0', '0', '4130016', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1482012', '95', '2', '308000', '0', '0', '4130016', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1482013', '105', '3', '510000', '0', '0', '4130016', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1482023', '115', '3', '560000', '0', '0', '4130016', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1482024', '115', '3', '560000', '0', '0', '4130016', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1492007', '45', '1', '70000', '0', '0', '4130017', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1492008', '55', '1', '125000', '0', '0', '4130017', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1492009', '65', '1', '155000', '0', '0', '4130017', '1', '1');
INSERT INTO `makercreatedata` VALUES ('16', '1492010', '75', '2', '245000', '0', '0', '4130017', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1492011', '85', '2', '280000', '0', '0', '4130017', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1492012', '95', '2', '315000', '0', '0', '4130017', '1', '2');
INSERT INTO `makercreatedata` VALUES ('16', '1492013', '105', '3', '520000', '0', '0', '4130017', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1492023', '115', '3', '570000', '0', '0', '4130017', '1', '3');
INSERT INTO `makercreatedata` VALUES ('16', '1492025', '115', '3', '570000', '0', '0', '4130017', '1', '3');

-- ----------------------------
-- Table structure for `makerrecipedata`
-- ----------------------------
DROP TABLE IF EXISTS `makerrecipedata`;
CREATE TABLE `makerrecipedata` (
  `itemid` int(11) NOT NULL,
  `req_item` int(11) NOT NULL,
  `count` smallint(6) NOT NULL,
  PRIMARY KEY (`itemid`,`req_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of makerrecipedata
-- ----------------------------
INSERT INTO `makerrecipedata` VALUES ('1002022', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1002022', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002028', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1002028', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002029', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1002029', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002030', '4007001', '7');
INSERT INTO `makerrecipedata` VALUES ('1002030', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002084', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1002084', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002085', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1002085', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002086', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002086', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002094', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1002094', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002095', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002095', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002100', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002100', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002101', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1002101', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002207', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1002207', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002208', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1002208', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002209', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1002209', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002210', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1002210', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002211', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1002211', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002212', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1002212', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002213', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1002213', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002214', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1002214', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002215', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1002215', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002216', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1002216', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002217', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1002217', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002218', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1002218', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002242', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1002242', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002243', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1002243', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002244', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1002244', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002245', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002245', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002246', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1002246', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002247', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1002247', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002248', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002248', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002249', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1002249', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002252', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1002252', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002253', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002253', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002254', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1002254', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002267', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1002267', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002268', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1002268', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002269', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002269', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002270', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1002270', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002271', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002271', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002272', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1002272', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002273', '4007005', '8');
INSERT INTO `makerrecipedata` VALUES ('1002273', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002274', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002274', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002275', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1002275', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002276', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1002276', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002277', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002277', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002278', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002278', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002281', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1002281', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002282', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002282', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002283', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1002283', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002284', '4007001', '7');
INSERT INTO `makerrecipedata` VALUES ('1002284', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002285', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1002285', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002286', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002286', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002287', '4007001', '4');
INSERT INTO `makerrecipedata` VALUES ('1002287', '4007004', '3');
INSERT INTO `makerrecipedata` VALUES ('1002287', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002288', '4007003', '7');
INSERT INTO `makerrecipedata` VALUES ('1002288', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002289', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1002289', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002323', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1002323', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002324', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1002324', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002325', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1002325', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002326', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1002326', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002327', '4007000', '8');
INSERT INTO `makerrecipedata` VALUES ('1002327', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002328', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002328', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002329', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1002329', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002330', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002330', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002338', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1002338', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002339', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1002339', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002340', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002340', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002363', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1002363', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002364', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1002364', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002365', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1002365', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002366', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1002366', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002377', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1002377', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002378', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1002378', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002379', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1002379', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002380', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1002380', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002381', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1002381', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002382', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1002382', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002383', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1002383', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002398', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1002398', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002399', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1002399', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002400', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1002400', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002401', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1002401', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002402', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1002402', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002403', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1002403', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002404', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1002404', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002405', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1002405', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002406', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1002406', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002407', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1002407', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002408', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1002408', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002528', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1002528', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002529', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1002529', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002530', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1002530', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002531', '4007001', '9');
INSERT INTO `makerrecipedata` VALUES ('1002531', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002532', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1002532', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002547', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1002547', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1002547', '4007006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002547', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002550', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1002550', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1002550', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1002550', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002551', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1002551', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1002551', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1002551', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002631', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002631', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1002634', '4007005', '6');
INSERT INTO `makerrecipedata` VALUES ('1002634', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1002637', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1002637', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1002640', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1002640', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1002643', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1002643', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1002646', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1002646', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1002649', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1002649', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1002649', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1002649', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002773', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1002773', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1002773', '4007004', '11');
INSERT INTO `makerrecipedata` VALUES ('1002773', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1002776', '4007001', '12');
INSERT INTO `makerrecipedata` VALUES ('1002776', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1002776', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1002776', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1002777', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1002777', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1002777', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1002777', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1002778', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1002778', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1002778', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1002778', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1002779', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1002779', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1002779', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1002779', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1002780', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1002780', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1002780', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1002780', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1002790', '4007001', '12');
INSERT INTO `makerrecipedata` VALUES ('1002790', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1002790', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002790', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1002791', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1002791', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1002791', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002791', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1002792', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1002792', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1002792', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002792', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1002793', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1002793', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1002793', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002793', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1002794', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1002794', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1002794', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1002794', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1040087', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1040087', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040088', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1040088', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040089', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1040089', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040090', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1040090', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040091', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1040091', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040092', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1040092', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040093', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1040093', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040094', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1040094', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040095', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1040095', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040096', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1040096', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040097', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1040097', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1040098', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040098', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040099', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1040099', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040100', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1040100', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1040102', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1040102', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040103', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040103', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040104', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1040104', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040105', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1040105', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040106', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040106', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040107', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1040107', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1040108', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1040108', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1040109', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1040109', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1040110', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1040110', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1040111', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1040111', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040112', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1040112', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040113', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1040113', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040115', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1040115', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040116', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1040116', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040117', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1040117', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040118', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1040118', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1040120', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1040120', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1040121', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1040121', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1040122', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1040122', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1041077', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1041077', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041078', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1041078', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041079', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1041079', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041080', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1041080', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041087', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1041087', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041088', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1041088', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041089', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1041089', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1041091', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1041091', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041092', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1041092', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041093', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1041093', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041094', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041094', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041095', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1041095', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041096', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1041096', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1041097', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041097', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041098', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1041098', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041099', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1041099', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041100', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1041100', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041101', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041101', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041102', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1041102', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041103', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1041103', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1041105', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1041105', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1041106', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1041106', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1041107', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1041107', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1041115', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1041115', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041116', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1041116', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041117', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1041117', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041118', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1041118', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041119', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1041119', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041120', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1041120', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041121', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1041121', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1041122', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1041122', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1041123', '4007005', '10');
INSERT INTO `makerrecipedata` VALUES ('1041123', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1041124', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1041124', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1050045', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1050045', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050046', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1050046', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050047', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1050047', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050048', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1050048', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050049', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1050049', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050051', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1050051', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050052', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1050052', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1050053', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1050053', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050054', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1050054', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050055', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1050055', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050056', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1050056', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050058', '4007005', '6');
INSERT INTO `makerrecipedata` VALUES ('1050058', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050059', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1050059', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050060', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1050060', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1050061', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1050061', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050062', '4007001', '4');
INSERT INTO `makerrecipedata` VALUES ('1050062', '4007004', '3');
INSERT INTO `makerrecipedata` VALUES ('1050062', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050063', '4007003', '7');
INSERT INTO `makerrecipedata` VALUES ('1050063', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050064', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1050064', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050067', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1050067', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050068', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1050068', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050069', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1050069', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050070', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1050070', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1050072', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1050072', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050073', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1050073', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050074', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1050074', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050075', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1050075', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050076', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1050076', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050077', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1050077', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050078', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1050078', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050080', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1050080', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050081', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1050081', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050082', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1050082', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050083', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1050083', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1050088', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1050088', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050089', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1050089', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050090', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1050090', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050091', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1050091', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050092', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1050092', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050093', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1050093', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050094', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1050094', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050095', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1050095', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1050096', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1050096', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050097', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1050097', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050098', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1050098', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050099', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1050099', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050102', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1050102', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050103', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1050103', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050104', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1050104', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050105', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1050105', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050106', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1050106', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050107', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1050107', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1050108', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1050108', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051030', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1051030', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051031', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1051031', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051032', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1051032', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051033', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1051033', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051034', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1051034', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051037', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1051037', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051038', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1051038', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051039', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1051039', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1051041', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1051041', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051042', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1051042', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051043', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1051043', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051044', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1051044', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051045', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1051045', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051046', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1051046', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051047', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1051047', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1051052', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1051052', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051053', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1051053', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051054', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1051054', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051055', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1051055', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051056', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1051056', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051057', '4007005', '8');
INSERT INTO `makerrecipedata` VALUES ('1051057', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051058', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1051058', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051062', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1051062', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051063', '4007001', '4');
INSERT INTO `makerrecipedata` VALUES ('1051063', '4007004', '3');
INSERT INTO `makerrecipedata` VALUES ('1051063', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051064', '4007003', '7');
INSERT INTO `makerrecipedata` VALUES ('1051064', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051065', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1051065', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1051066', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1051066', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051067', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1051067', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051068', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1051068', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051069', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1051069', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051077', '4007004', '8');
INSERT INTO `makerrecipedata` VALUES ('1051077', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051078', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1051078', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051079', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1051079', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051080', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1051080', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1051082', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1051082', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051083', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1051083', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051084', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1051084', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051085', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1051085', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051090', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1051090', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051091', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1051091', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051092', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1051092', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051093', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1051093', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051094', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1051094', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051095', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1051095', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051096', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1051096', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051097', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1051097', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1051101', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1051101', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051102', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1051102', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051103', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1051103', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051104', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1051104', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051105', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1051105', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051106', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1051106', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1051107', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1051107', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1052071', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1052071', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1052071', '4007006', '11');
INSERT INTO `makerrecipedata` VALUES ('1052071', '4260006', '22');
INSERT INTO `makerrecipedata` VALUES ('1052072', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1052072', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1052072', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1052072', '4260006', '22');
INSERT INTO `makerrecipedata` VALUES ('1052075', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1052075', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1052075', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1052075', '4260006', '22');
INSERT INTO `makerrecipedata` VALUES ('1052076', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1052076', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1052076', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1052076', '4260006', '22');
INSERT INTO `makerrecipedata` VALUES ('1052116', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1052116', '4260000', '10');
INSERT INTO `makerrecipedata` VALUES ('1052119', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1052119', '4260001', '12');
INSERT INTO `makerrecipedata` VALUES ('1052122', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1052122', '4260002', '14');
INSERT INTO `makerrecipedata` VALUES ('1052125', '4007001', '8');
INSERT INTO `makerrecipedata` VALUES ('1052125', '4260003', '16');
INSERT INTO `makerrecipedata` VALUES ('1052128', '4007001', '9');
INSERT INTO `makerrecipedata` VALUES ('1052128', '4260004', '18');
INSERT INTO `makerrecipedata` VALUES ('1052131', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1052131', '4260005', '20');
INSERT INTO `makerrecipedata` VALUES ('1052134', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1052134', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1052134', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1052134', '4260006', '22');
INSERT INTO `makerrecipedata` VALUES ('1052155', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052155', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1052155', '4260007', '4');
INSERT INTO `makerrecipedata` VALUES ('1052155', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1052156', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1052156', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1052156', '4260007', '4');
INSERT INTO `makerrecipedata` VALUES ('1052156', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1052157', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052157', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1052157', '4260007', '4');
INSERT INTO `makerrecipedata` VALUES ('1052157', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1052158', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052158', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1052158', '4260007', '4');
INSERT INTO `makerrecipedata` VALUES ('1052158', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1052159', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1052159', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1052159', '4260007', '4');
INSERT INTO `makerrecipedata` VALUES ('1052159', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1052160', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052160', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1052160', '4260007', '16');
INSERT INTO `makerrecipedata` VALUES ('1052160', '4260008', '8');
INSERT INTO `makerrecipedata` VALUES ('1052161', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1052161', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1052161', '4260007', '16');
INSERT INTO `makerrecipedata` VALUES ('1052161', '4260008', '8');
INSERT INTO `makerrecipedata` VALUES ('1052162', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052162', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1052162', '4260007', '16');
INSERT INTO `makerrecipedata` VALUES ('1052162', '4260008', '8');
INSERT INTO `makerrecipedata` VALUES ('1052163', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1052163', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1052163', '4260007', '16');
INSERT INTO `makerrecipedata` VALUES ('1052163', '4260008', '8');
INSERT INTO `makerrecipedata` VALUES ('1052164', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1052164', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1052164', '4260007', '16');
INSERT INTO `makerrecipedata` VALUES ('1052164', '4260008', '8');
INSERT INTO `makerrecipedata` VALUES ('1060076', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1060076', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060077', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1060077', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060078', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1060078', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060079', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1060079', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060080', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1060080', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060081', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1060081', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060082', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1060082', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060083', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1060083', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060084', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1060084', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060085', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1060085', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060086', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1060086', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1060087', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060087', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060088', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1060088', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060089', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1060089', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1060090', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1060090', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060091', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060091', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060092', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1060092', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060093', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1060093', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060094', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060094', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060095', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1060095', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1060097', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1060097', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1060098', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1060098', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1060099', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1060099', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1060100', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1060100', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060101', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1060101', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060102', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1060102', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060104', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1060104', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060105', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1060105', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060106', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1060106', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060107', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1060107', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1060109', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1060109', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1060110', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1060110', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1060111', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1060111', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1061076', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1061076', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061077', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1061077', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061078', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1061078', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061079', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1061079', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061086', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1061086', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061087', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1061087', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061088', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1061088', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1061090', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1061090', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061091', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1061091', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061092', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1061092', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061093', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061093', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061094', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1061094', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061095', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1061095', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1061096', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061096', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061097', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1061097', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061098', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1061098', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061099', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1061099', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061100', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061100', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061101', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1061101', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061102', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1061102', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1061104', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1061104', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1061105', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1061105', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1061106', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1061106', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1061114', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1061114', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061115', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1061115', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061116', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1061116', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061117', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1061117', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061118', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1061118', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061119', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1061119', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061120', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1061120', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1061121', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1061121', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1061122', '4007005', '10');
INSERT INTO `makerrecipedata` VALUES ('1061122', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1061123', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1061123', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072122', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072122', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072123', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1072123', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072124', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1072124', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072125', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1072125', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072128', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1072128', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072129', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1072129', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072130', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1072130', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072131', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1072131', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072132', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1072132', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072133', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1072133', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072134', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1072134', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072135', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1072135', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072136', '4007001', '3');
INSERT INTO `makerrecipedata` VALUES ('1072136', '4007006', '3');
INSERT INTO `makerrecipedata` VALUES ('1072136', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072137', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1072137', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072138', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1072138', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072139', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1072139', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072140', '4007001', '2');
INSERT INTO `makerrecipedata` VALUES ('1072140', '4007006', '3');
INSERT INTO `makerrecipedata` VALUES ('1072140', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072141', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1072141', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072142', '4007005', '5');
INSERT INTO `makerrecipedata` VALUES ('1072142', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072143', '4007003', '5');
INSERT INTO `makerrecipedata` VALUES ('1072143', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072144', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1072144', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072145', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1072145', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072146', '4007003', '6');
INSERT INTO `makerrecipedata` VALUES ('1072146', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072147', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1072147', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072148', '4007005', '6');
INSERT INTO `makerrecipedata` VALUES ('1072148', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072149', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1072149', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072150', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1072150', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072151', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1072151', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072152', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1072152', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072154', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072154', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072155', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1072155', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072156', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1072156', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072157', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072157', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072158', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1072158', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072159', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1072159', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072160', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1072160', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072161', '4007005', '7');
INSERT INTO `makerrecipedata` VALUES ('1072161', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072162', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072162', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072163', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1072163', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072164', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072164', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072165', '4007001', '4');
INSERT INTO `makerrecipedata` VALUES ('1072165', '4007004', '3');
INSERT INTO `makerrecipedata` VALUES ('1072165', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072166', '4007003', '7');
INSERT INTO `makerrecipedata` VALUES ('1072166', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072167', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1072167', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072172', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072172', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072173', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1072173', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072174', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072174', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072177', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072177', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072178', '4007005', '8');
INSERT INTO `makerrecipedata` VALUES ('1072178', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072179', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072179', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072182', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1072182', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072183', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1072183', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072184', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072184', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072185', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072185', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072192', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1072192', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072193', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1072193', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072194', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1072194', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072195', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1072195', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072196', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1072196', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072197', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1072197', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072198', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1072198', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072203', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1072203', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072204', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1072204', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072205', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1072205', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072206', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1072206', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072207', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1072207', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072208', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1072208', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072209', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1072209', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072210', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1072210', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072211', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1072211', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072212', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072212', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072213', '4007001', '10');
INSERT INTO `makerrecipedata` VALUES ('1072213', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072214', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1072214', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072215', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1072215', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072216', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1072216', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072220', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1072220', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072221', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1072221', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072222', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1072222', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072223', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1072223', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072224', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1072224', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072225', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1072225', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072226', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1072226', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072227', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1072227', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072228', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1072228', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072229', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1072229', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072268', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1072268', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1072268', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1072268', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072269', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1072269', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1072269', '4007006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072269', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072272', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1072272', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1072272', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1072272', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072273', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1072273', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1072273', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1072273', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072303', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072303', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1072306', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1072306', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1072309', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1072309', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1072312', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1072312', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1072315', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1072315', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1072318', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1072318', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1072321', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1072321', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1072321', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1072321', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1072355', '4007007', '12');
INSERT INTO `makerrecipedata` VALUES ('1072355', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1072355', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1072355', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1072356', '4007004', '12');
INSERT INTO `makerrecipedata` VALUES ('1072356', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1072356', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1072356', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1072357', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1072357', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1072357', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1072357', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1072358', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1072358', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1072358', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1072358', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1072359', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1072359', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1072359', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1072359', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1072361', '4007007', '12');
INSERT INTO `makerrecipedata` VALUES ('1072361', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1072361', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072361', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1072362', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1072362', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072362', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1072363', '4007004', '12');
INSERT INTO `makerrecipedata` VALUES ('1072363', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1072363', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072363', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1072364', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1072364', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1072364', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072364', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1072365', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1072365', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1072365', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1072365', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1082009', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1082009', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082010', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1082010', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082011', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1082011', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082059', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1082059', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082060', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1082060', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082061', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1082061', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082065', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1082065', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082066', '4007004', '5');
INSERT INTO `makerrecipedata` VALUES ('1082066', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082067', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1082067', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082080', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1082080', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082081', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1082081', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082082', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1082082', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082083', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1082083', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082084', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1082084', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082085', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1082085', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082086', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082086', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082087', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1082087', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082088', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1082088', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082089', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1082089', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082090', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1082090', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082091', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1082091', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082092', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1082092', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082093', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082093', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082094', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1082094', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082095', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1082095', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082096', '4007001', '7');
INSERT INTO `makerrecipedata` VALUES ('1082096', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082097', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1082097', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082098', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1082098', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082099', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082099', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082100', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1082100', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082103', '4007000', '7');
INSERT INTO `makerrecipedata` VALUES ('1082103', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082104', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082104', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082105', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1082105', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082106', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082106', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082107', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1082107', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082108', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1082108', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082109', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1082109', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082110', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1082110', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082111', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082111', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082112', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082112', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082114', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1082114', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082115', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082115', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082116', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1082116', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082117', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082117', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082118', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082118', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082119', '4007005', '8');
INSERT INTO `makerrecipedata` VALUES ('1082119', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082120', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1082120', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082121', '4007003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082121', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082122', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1082122', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082123', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082123', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082125', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1082125', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082126', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1082126', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082127', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1082127', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082128', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1082128', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082129', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1082129', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082130', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1082130', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082131', '4007002', '9');
INSERT INTO `makerrecipedata` VALUES ('1082131', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082132', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1082132', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082133', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1082133', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082134', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1082134', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082135', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1082135', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082136', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1082136', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082137', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1082137', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082138', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1082138', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082139', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1082139', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082140', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1082140', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082141', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1082141', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082142', '4007003', '9');
INSERT INTO `makerrecipedata` VALUES ('1082142', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082143', '4007005', '9');
INSERT INTO `makerrecipedata` VALUES ('1082143', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082144', '4007007', '9');
INSERT INTO `makerrecipedata` VALUES ('1082144', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082151', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1082151', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082152', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1082152', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082153', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1082153', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082154', '4007005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082154', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082158', '4007006', '10');
INSERT INTO `makerrecipedata` VALUES ('1082158', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082159', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1082159', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082160', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1082160', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082163', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1082163', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1082163', '4007006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082163', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082164', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1082164', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1082164', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1082164', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082167', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1082167', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1082167', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1082167', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082168', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1082168', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1082168', '4007002', '11');
INSERT INTO `makerrecipedata` VALUES ('1082168', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082198', '4007000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082198', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1082201', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1082201', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1082204', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1082204', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1082207', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1082207', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1082210', '4007006', '9');
INSERT INTO `makerrecipedata` VALUES ('1082210', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1082213', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1082213', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1082216', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1082216', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1082216', '4007007', '11');
INSERT INTO `makerrecipedata` VALUES ('1082216', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1082234', '4007007', '12');
INSERT INTO `makerrecipedata` VALUES ('1082234', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1082234', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1082234', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1082235', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1082235', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1082235', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1082235', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1082236', '4007001', '12');
INSERT INTO `makerrecipedata` VALUES ('1082236', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1082236', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1082236', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1082237', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1082237', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1082237', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1082237', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1082238', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1082238', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1082238', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1082238', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1082239', '4007007', '12');
INSERT INTO `makerrecipedata` VALUES ('1082239', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1082239', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082239', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1082240', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1082240', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1082240', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082240', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1082241', '4007001', '12');
INSERT INTO `makerrecipedata` VALUES ('1082241', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1082241', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082241', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1082242', '4007005', '12');
INSERT INTO `makerrecipedata` VALUES ('1082242', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1082242', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082242', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1082243', '4007006', '12');
INSERT INTO `makerrecipedata` VALUES ('1082243', '4020009', '15');
INSERT INTO `makerrecipedata` VALUES ('1082243', '4260007', '8');
INSERT INTO `makerrecipedata` VALUES ('1082243', '4260008', '4');
INSERT INTO `makerrecipedata` VALUES ('1092004', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1092004', '4260000', '5');
INSERT INTO `makerrecipedata` VALUES ('1092009', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1092009', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1092010', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('1092010', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1092011', '4007004', '6');
INSERT INTO `makerrecipedata` VALUES ('1092011', '4260001', '6');
INSERT INTO `makerrecipedata` VALUES ('1092015', '4007001', '7');
INSERT INTO `makerrecipedata` VALUES ('1092015', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1092016', '4007001', '7');
INSERT INTO `makerrecipedata` VALUES ('1092016', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1092017', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1092017', '4260002', '7');
INSERT INTO `makerrecipedata` VALUES ('1092023', '4007001', '8');
INSERT INTO `makerrecipedata` VALUES ('1092023', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1092024', '4007001', '8');
INSERT INTO `makerrecipedata` VALUES ('1092024', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1092025', '4007004', '8');
INSERT INTO `makerrecipedata` VALUES ('1092025', '4260003', '8');
INSERT INTO `makerrecipedata` VALUES ('1092026', '4007000', '9');
INSERT INTO `makerrecipedata` VALUES ('1092026', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1092027', '4007001', '9');
INSERT INTO `makerrecipedata` VALUES ('1092027', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1092028', '4007004', '9');
INSERT INTO `makerrecipedata` VALUES ('1092028', '4260004', '9');
INSERT INTO `makerrecipedata` VALUES ('1092036', '4007003', '10');
INSERT INTO `makerrecipedata` VALUES ('1092036', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1092037', '4007005', '10');
INSERT INTO `makerrecipedata` VALUES ('1092037', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1092038', '4007002', '10');
INSERT INTO `makerrecipedata` VALUES ('1092038', '4260005', '10');
INSERT INTO `makerrecipedata` VALUES ('1092057', '4007004', '12');
INSERT INTO `makerrecipedata` VALUES ('1092057', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1092057', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1092057', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1092058', '4007002', '12');
INSERT INTO `makerrecipedata` VALUES ('1092058', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1092058', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1092058', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1092059', '4007000', '12');
INSERT INTO `makerrecipedata` VALUES ('1092059', '4021010', '1');
INSERT INTO `makerrecipedata` VALUES ('1092059', '4260007', '2');
INSERT INTO `makerrecipedata` VALUES ('1092059', '4260008', '10');
INSERT INTO `makerrecipedata` VALUES ('1092060', '4000244', '5');
INSERT INTO `makerrecipedata` VALUES ('1092060', '4000245', '5');
INSERT INTO `makerrecipedata` VALUES ('1092060', '4007001', '11');
INSERT INTO `makerrecipedata` VALUES ('1092060', '4260006', '11');
INSERT INTO `makerrecipedata` VALUES ('1302010', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1302010', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1302011', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1302011', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1302012', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1302012', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1302018', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1302018', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1302023', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1302023', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1302056', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1302056', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1302059', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1302059', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1302059', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1302059', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1302081', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1302081', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1302081', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1302081', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1302086', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1302086', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1302086', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1302086', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1312008', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1312008', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1312009', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1312009', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1312010', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1312010', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1312011', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1312011', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1312015', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1312015', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1312030', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1312030', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1312031', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1312031', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1312031', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1312031', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1312037', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1312037', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1312037', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1312037', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1312038', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1312038', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1312038', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1312038', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1322017', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1322017', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1322018', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1322018', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1322019', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1322019', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1322020', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1322020', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1322028', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1322028', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1322029', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1322029', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1322045', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1322045', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1322052', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1322052', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1322052', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1322052', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1322060', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1322060', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1322060', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1322060', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1322061', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1322061', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1322061', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1322061', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1332003', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1332003', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1332015', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1332015', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1332016', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1332016', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1332017', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1332017', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1332018', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1332018', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1332019', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1332019', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1332022', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1332022', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1332023', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1332023', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1332026', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1332026', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1332027', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1332027', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1332049', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1332049', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1332049', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1332049', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1332050', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1332050', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1332050', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1332050', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1332051', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1332051', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1332052', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1332052', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1332073', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1332073', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1332073', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1332073', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1332074', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1332074', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1332074', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1332074', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1332075', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1332075', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1332075', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1332075', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1332076', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1332076', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1332076', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1332076', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1372007', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1372007', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1372009', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1372009', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1372010', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1372010', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1372014', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1372014', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1372015', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1372015', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1372016', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1372016', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1372032', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1372032', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1372032', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1372032', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1372044', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1372044', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1372044', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1372044', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1372045', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1372045', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1372045', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1372045', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1382006', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1382006', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1382007', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1382007', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1382008', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1382008', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1382010', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1382010', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1382035', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1382035', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1382036', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1382036', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1382036', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1382036', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1382057', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1382057', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1382057', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1382057', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1382059', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1382059', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1382059', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1382059', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1402003', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1402003', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1402004', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1402004', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1402005', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1402005', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1402011', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1402011', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1402012', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1402012', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1402015', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1402015', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1402016', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1402016', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1402035', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1402035', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1402036', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1402036', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1402036', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1402036', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1402046', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1402046', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1402046', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1402046', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1402047', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1402047', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1402047', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1402047', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1412003', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1412003', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1412007', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1412007', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1412008', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1412008', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1412009', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1412009', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1412010', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1412010', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1412021', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1412021', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1412026', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1412026', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1412026', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1412026', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1412033', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1412033', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1412033', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1412033', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1412034', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1412034', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1412034', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1412034', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1422005', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1422005', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1422009', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1422009', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1422010', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1422010', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1422012', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1422012', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1422013', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1422013', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1422027', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1422027', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1422028', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1422028', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1422028', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1422028', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1422037', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1422037', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1422037', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1422037', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1422038', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1422038', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1422038', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1422038', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1432004', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1432004', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1432006', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1432006', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1432007', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1432007', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1432010', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1432010', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1432011', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1432011', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1432030', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1432030', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1432038', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1432038', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1432038', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1432038', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1432047', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1432047', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1432047', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1432047', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1432049', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1432049', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1432049', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1432049', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1442005', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1442005', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1442008', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1442008', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1442010', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1442010', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1442019', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1442019', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1442020', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1442020', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1442044', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1442044', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1442045', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1442045', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1442045', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1442045', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1442063', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1442063', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1442063', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1442063', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1442067', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1442067', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1442067', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1442067', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1452004', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1452004', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1452008', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1452008', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1452009', '4007006', '7');
INSERT INTO `makerrecipedata` VALUES ('1452009', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1452009', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1452010', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1452010', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1452010', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1452011', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1452011', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1452011', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1452012', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1452012', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1452012', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1452013', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1452013', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1452013', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1452014', '4007004', '8');
INSERT INTO `makerrecipedata` VALUES ('1452014', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1452014', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1452015', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1452015', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1452015', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1452017', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1452017', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1452019', '4007001', '10');
INSERT INTO `makerrecipedata` VALUES ('1452019', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1452019', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1452020', '4007004', '10');
INSERT INTO `makerrecipedata` VALUES ('1452020', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1452020', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1452021', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1452021', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1452021', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1452044', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1452044', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1452044', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1452044', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1452057', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1452057', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1452057', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1452057', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1452059', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1452059', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1452059', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1452059', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1462007', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1462007', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1462008', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1462008', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1462009', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1462009', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1462010', '4007002', '8');
INSERT INTO `makerrecipedata` VALUES ('1462010', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1462010', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1462011', '4007006', '8');
INSERT INTO `makerrecipedata` VALUES ('1462011', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1462011', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1462012', '4007004', '8');
INSERT INTO `makerrecipedata` VALUES ('1462012', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1462012', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1462013', '4007007', '8');
INSERT INTO `makerrecipedata` VALUES ('1462013', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1462013', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1462015', '4007001', '10');
INSERT INTO `makerrecipedata` VALUES ('1462015', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1462015', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1462016', '4007004', '10');
INSERT INTO `makerrecipedata` VALUES ('1462016', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1462016', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1462017', '4007007', '10');
INSERT INTO `makerrecipedata` VALUES ('1462017', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1462017', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1462018', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1462018', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1462039', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1462039', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1462039', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1462039', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1462050', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1462050', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1462050', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1462050', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1462051', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1462051', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1462051', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1462051', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1472018', '4007001', '5');
INSERT INTO `makerrecipedata` VALUES ('1472018', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1472018', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1472019', '4007006', '5');
INSERT INTO `makerrecipedata` VALUES ('1472019', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1472019', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1472020', '4007002', '5');
INSERT INTO `makerrecipedata` VALUES ('1472020', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1472020', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1472021', '4007007', '5');
INSERT INTO `makerrecipedata` VALUES ('1472021', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1472021', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1472022', '4007000', '6');
INSERT INTO `makerrecipedata` VALUES ('1472022', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1472022', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1472023', '4007006', '6');
INSERT INTO `makerrecipedata` VALUES ('1472023', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1472023', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1472024', '4007002', '6');
INSERT INTO `makerrecipedata` VALUES ('1472024', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1472024', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1472025', '4007007', '6');
INSERT INTO `makerrecipedata` VALUES ('1472025', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1472025', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1472026', '4007004', '7');
INSERT INTO `makerrecipedata` VALUES ('1472026', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1472026', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1472027', '4007003', '7');
INSERT INTO `makerrecipedata` VALUES ('1472027', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1472027', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1472028', '4007002', '7');
INSERT INTO `makerrecipedata` VALUES ('1472028', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1472028', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1472029', '4007007', '7');
INSERT INTO `makerrecipedata` VALUES ('1472029', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1472029', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1472031', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1472031', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1472033', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1472033', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1472051', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1472051', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1472051', '4007003', '11');
INSERT INTO `makerrecipedata` VALUES ('1472051', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1472051', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1472052', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1472052', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1472052', '4007005', '11');
INSERT INTO `makerrecipedata` VALUES ('1472052', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1472052', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1472053', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1472053', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1472068', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1472068', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1472068', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1472068', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1472071', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1472071', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1472071', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1472071', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1482007', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1482007', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1482008', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1482008', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1482009', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1482009', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1482010', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1482010', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1482011', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1482011', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1482012', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1482012', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1482013', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1482013', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1482013', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1482013', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1482023', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1482023', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1482023', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1482023', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1482024', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1482024', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1482024', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1482024', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('1492007', '4011000', '1');
INSERT INTO `makerrecipedata` VALUES ('1492007', '4260000', '20');
INSERT INTO `makerrecipedata` VALUES ('1492008', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('1492008', '4260001', '22');
INSERT INTO `makerrecipedata` VALUES ('1492009', '4011001', '3');
INSERT INTO `makerrecipedata` VALUES ('1492009', '4260002', '24');
INSERT INTO `makerrecipedata` VALUES ('1492010', '4011002', '3');
INSERT INTO `makerrecipedata` VALUES ('1492010', '4260003', '26');
INSERT INTO `makerrecipedata` VALUES ('1492011', '4011002', '4');
INSERT INTO `makerrecipedata` VALUES ('1492011', '4260004', '28');
INSERT INTO `makerrecipedata` VALUES ('1492012', '4011003', '4');
INSERT INTO `makerrecipedata` VALUES ('1492012', '4260005', '30');
INSERT INTO `makerrecipedata` VALUES ('1492013', '4000244', '20');
INSERT INTO `makerrecipedata` VALUES ('1492013', '4000245', '20');
INSERT INTO `makerrecipedata` VALUES ('1492013', '4011003', '5');
INSERT INTO `makerrecipedata` VALUES ('1492013', '4260006', '32');
INSERT INTO `makerrecipedata` VALUES ('1492023', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1492023', '4021010', '3');
INSERT INTO `makerrecipedata` VALUES ('1492023', '4260007', '14');
INSERT INTO `makerrecipedata` VALUES ('1492023', '4260008', '20');
INSERT INTO `makerrecipedata` VALUES ('1492025', '4011005', '5');
INSERT INTO `makerrecipedata` VALUES ('1492025', '4020009', '45');
INSERT INTO `makerrecipedata` VALUES ('1492025', '4260007', '20');
INSERT INTO `makerrecipedata` VALUES ('1492025', '4260008', '14');
INSERT INTO `makerrecipedata` VALUES ('2040727', '4000159', '50');
INSERT INTO `makerrecipedata` VALUES ('2040727', '4000299', '10');
INSERT INTO `makerrecipedata` VALUES ('2041058', '4000048', '100');
INSERT INTO `makerrecipedata` VALUES ('2041058', '4000299', '10');
INSERT INTO `makerrecipedata` VALUES ('4001174', '4000155', '10');
INSERT INTO `makerrecipedata` VALUES ('4001174', '4000277', '5');
INSERT INTO `makerrecipedata` VALUES ('4001174', '4000278', '5');
INSERT INTO `makerrecipedata` VALUES ('4001174', '4031966', '1');
INSERT INTO `makerrecipedata` VALUES ('4001175', '4000030', '3');
INSERT INTO `makerrecipedata` VALUES ('4001175', '4000048', '20');
INSERT INTO `makerrecipedata` VALUES ('4001175', '4031967', '1');
INSERT INTO `makerrecipedata` VALUES ('4001176', '4000360', '30');
INSERT INTO `makerrecipedata` VALUES ('4001176', '4003001', '20');
INSERT INTO `makerrecipedata` VALUES ('4001176', '4011001', '5');
INSERT INTO `makerrecipedata` VALUES ('4001176', '4031968', '1');
INSERT INTO `makerrecipedata` VALUES ('4001177', '4000052', '100');
INSERT INTO `makerrecipedata` VALUES ('4001177', '4007001', '10');
INSERT INTO `makerrecipedata` VALUES ('4001177', '4031969', '1');
INSERT INTO `makerrecipedata` VALUES ('4001178', '4000286', '25');
INSERT INTO `makerrecipedata` VALUES ('4001178', '4000295', '25');
INSERT INTO `makerrecipedata` VALUES ('4001178', '4007002', '1');
INSERT INTO `makerrecipedata` VALUES ('4001178', '4031970', '1');
INSERT INTO `makerrecipedata` VALUES ('4001179', '4000122', '7');
INSERT INTO `makerrecipedata` VALUES ('4001179', '4000364', '70');
INSERT INTO `makerrecipedata` VALUES ('4001179', '4003000', '7');
INSERT INTO `makerrecipedata` VALUES ('4001179', '4031971', '1');
INSERT INTO `makerrecipedata` VALUES ('4001180', '4000074', '10');
INSERT INTO `makerrecipedata` VALUES ('4001180', '4000229', '30');
INSERT INTO `makerrecipedata` VALUES ('4001180', '4007000', '1');
INSERT INTO `makerrecipedata` VALUES ('4001180', '4031972', '1');
INSERT INTO `makerrecipedata` VALUES ('4001181', '4000238', '30');
INSERT INTO `makerrecipedata` VALUES ('4001181', '4003005', '20');
INSERT INTO `makerrecipedata` VALUES ('4001181', '4007006', '1');
INSERT INTO `makerrecipedata` VALUES ('4001181', '4031973', '1');
INSERT INTO `makerrecipedata` VALUES ('4001182', '4000239', '12');
INSERT INTO `makerrecipedata` VALUES ('4001182', '4000240', '1');
INSERT INTO `makerrecipedata` VALUES ('4001182', '4003004', '36');
INSERT INTO `makerrecipedata` VALUES ('4001182', '4007001', '6');
INSERT INTO `makerrecipedata` VALUES ('4001182', '4031974', '1');
INSERT INTO `makerrecipedata` VALUES ('4001183', '4000232', '30');
INSERT INTO `makerrecipedata` VALUES ('4001183', '4000285', '30');
INSERT INTO `makerrecipedata` VALUES ('4001183', '4007001', '3');
INSERT INTO `makerrecipedata` VALUES ('4001183', '4031975', '1');
INSERT INTO `makerrecipedata` VALUES ('4001184', '4000182', '30');
INSERT INTO `makerrecipedata` VALUES ('4001184', '4003001', '10');
INSERT INTO `makerrecipedata` VALUES ('4001184', '4011001', '10');
INSERT INTO `makerrecipedata` VALUES ('4001184', '4031976', '1');
INSERT INTO `makerrecipedata` VALUES ('4001185', '4000081', '5');
INSERT INTO `makerrecipedata` VALUES ('4001185', '4000134', '30');
INSERT INTO `makerrecipedata` VALUES ('4001185', '4003005', '20');
INSERT INTO `makerrecipedata` VALUES ('4001185', '4031977', '1');
INSERT INTO `makerrecipedata` VALUES ('4001186', '4003005', '30');
INSERT INTO `makerrecipedata` VALUES ('4001186', '4005001', '1');
INSERT INTO `makerrecipedata` VALUES ('4001186', '4021007', '10');
INSERT INTO `makerrecipedata` VALUES ('4001186', '4021009', '1');
INSERT INTO `makerrecipedata` VALUES ('4001186', '4031978', '1');
INSERT INTO `makerrecipedata` VALUES ('4031980', '4011001', '2');
INSERT INTO `makerrecipedata` VALUES ('4031980', '4011006', '6');
INSERT INTO `makerrecipedata` VALUES ('4031980', '4011008', '1');
INSERT INTO `makerrecipedata` VALUES ('4031980', '4031979', '1');
INSERT INTO `makerrecipedata` VALUES ('4250000', '4021007', '1');
INSERT INTO `makerrecipedata` VALUES ('4250001', '4250000', '10');
INSERT INTO `makerrecipedata` VALUES ('4250002', '4250001', '10');
INSERT INTO `makerrecipedata` VALUES ('4250100', '4021005', '1');
INSERT INTO `makerrecipedata` VALUES ('4250101', '4250100', '10');
INSERT INTO `makerrecipedata` VALUES ('4250102', '4250101', '10');
INSERT INTO `makerrecipedata` VALUES ('4250200', '4021000', '1');
INSERT INTO `makerrecipedata` VALUES ('4250201', '4250200', '10');
INSERT INTO `makerrecipedata` VALUES ('4250202', '4250201', '10');
INSERT INTO `makerrecipedata` VALUES ('4250300', '4021004', '1');
INSERT INTO `makerrecipedata` VALUES ('4250301', '4250300', '10');
INSERT INTO `makerrecipedata` VALUES ('4250302', '4250301', '10');
INSERT INTO `makerrecipedata` VALUES ('4250400', '4021001', '1');
INSERT INTO `makerrecipedata` VALUES ('4250401', '4250400', '10');
INSERT INTO `makerrecipedata` VALUES ('4250402', '4250401', '10');
INSERT INTO `makerrecipedata` VALUES ('4250500', '4021002', '1');
INSERT INTO `makerrecipedata` VALUES ('4250501', '4250500', '10');
INSERT INTO `makerrecipedata` VALUES ('4250502', '4250501', '10');
INSERT INTO `makerrecipedata` VALUES ('4250600', '4021006', '1');
INSERT INTO `makerrecipedata` VALUES ('4250601', '4250600', '10');
INSERT INTO `makerrecipedata` VALUES ('4250602', '4250601', '10');
INSERT INTO `makerrecipedata` VALUES ('4250700', '4021003', '1');
INSERT INTO `makerrecipedata` VALUES ('4250701', '4250700', '10');
INSERT INTO `makerrecipedata` VALUES ('4250702', '4250701', '10');
INSERT INTO `makerrecipedata` VALUES ('4250800', '4005000', '1');
INSERT INTO `makerrecipedata` VALUES ('4250801', '4250800', '10');
INSERT INTO `makerrecipedata` VALUES ('4250802', '4250801', '10');
INSERT INTO `makerrecipedata` VALUES ('4250900', '4005001', '1');
INSERT INTO `makerrecipedata` VALUES ('4250901', '4250900', '10');
INSERT INTO `makerrecipedata` VALUES ('4250902', '4250901', '10');
INSERT INTO `makerrecipedata` VALUES ('4251000', '4005003', '1');
INSERT INTO `makerrecipedata` VALUES ('4251001', '4251000', '10');
INSERT INTO `makerrecipedata` VALUES ('4251002', '4251001', '10');
INSERT INTO `makerrecipedata` VALUES ('4251100', '4005002', '1');
INSERT INTO `makerrecipedata` VALUES ('4251101', '4251100', '10');
INSERT INTO `makerrecipedata` VALUES ('4251102', '4251101', '10');
INSERT INTO `makerrecipedata` VALUES ('4251300', '4021008', '1');
INSERT INTO `makerrecipedata` VALUES ('4251301', '4251300', '10');
INSERT INTO `makerrecipedata` VALUES ('4251302', '4251301', '10');
INSERT INTO `makerrecipedata` VALUES ('4251400', '4005004', '1');
INSERT INTO `makerrecipedata` VALUES ('4251401', '4251400', '10');
INSERT INTO `makerrecipedata` VALUES ('4251402', '4251401', '10');

-- ----------------------------
-- Table structure for `makerrewarddata`
-- ----------------------------
DROP TABLE IF EXISTS `makerrewarddata`;
CREATE TABLE `makerrewarddata` (
  `itemid` int(11) NOT NULL,
  `rewardid` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `prob` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`itemid`,`rewardid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of makerrewarddata
-- ----------------------------
INSERT INTO `makerrewarddata` VALUES ('4250000', '4250000', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250000', '4250001', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250000', '4250002', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250001', '4250000', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250001', '4250001', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250002', '4250001', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250002', '4250002', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250100', '4250100', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250100', '4250101', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250100', '4250102', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250101', '4250100', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250101', '4250101', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250102', '4250101', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250102', '4250102', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250200', '4250200', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250200', '4250201', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250200', '4250202', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250201', '4250200', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250201', '4250201', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250202', '4250201', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250202', '4250202', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250300', '4250300', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250300', '4250301', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250300', '4250302', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250301', '4250300', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250301', '4250301', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250302', '4250301', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250302', '4250302', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250400', '4250400', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250400', '4250401', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250400', '4250402', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250401', '4250400', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250401', '4250401', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250402', '4250401', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250402', '4250402', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250500', '4250500', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250500', '4250501', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250500', '4250502', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250501', '4250500', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250501', '4250501', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250502', '4250501', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250502', '4250502', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250600', '4250600', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250600', '4250601', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250600', '4250602', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250601', '4250600', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250601', '4250601', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250602', '4250601', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250602', '4250602', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250700', '4250700', '1', '14');
INSERT INTO `makerrewarddata` VALUES ('4250700', '4250701', '1', '5');
INSERT INTO `makerrewarddata` VALUES ('4250700', '4250702', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250701', '4250700', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250701', '4250701', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250702', '4250701', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250702', '4250702', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250800', '4250800', '1', '75');
INSERT INTO `makerrewarddata` VALUES ('4250800', '4250801', '1', '24');
INSERT INTO `makerrewarddata` VALUES ('4250800', '4250802', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250801', '4250800', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250801', '4250801', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250802', '4250801', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250802', '4250802', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250900', '4250900', '1', '75');
INSERT INTO `makerrewarddata` VALUES ('4250900', '4250901', '1', '24');
INSERT INTO `makerrewarddata` VALUES ('4250900', '4250902', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4250901', '4250900', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4250901', '4250901', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4250902', '4250901', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4250902', '4250902', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4251000', '4251000', '1', '75');
INSERT INTO `makerrewarddata` VALUES ('4251000', '4251001', '1', '24');
INSERT INTO `makerrewarddata` VALUES ('4251000', '4251002', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251001', '4251000', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4251001', '4251001', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4251002', '4251001', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4251002', '4251002', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4251100', '4251100', '1', '75');
INSERT INTO `makerrewarddata` VALUES ('4251100', '4251101', '1', '24');
INSERT INTO `makerrewarddata` VALUES ('4251100', '4251102', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251101', '4251100', '9', '2');
INSERT INTO `makerrewarddata` VALUES ('4251101', '4251101', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4251102', '4251101', '9', '7');
INSERT INTO `makerrewarddata` VALUES ('4251102', '4251102', '1', '3');
INSERT INTO `makerrewarddata` VALUES ('4251300', '4251300', '1', '27');
INSERT INTO `makerrewarddata` VALUES ('4251300', '4251301', '1', '12');
INSERT INTO `makerrewarddata` VALUES ('4251300', '4251302', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251301', '4251300', '9', '1');
INSERT INTO `makerrewarddata` VALUES ('4251301', '4251301', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251302', '4251301', '9', '4');
INSERT INTO `makerrewarddata` VALUES ('4251302', '4251302', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251400', '4251400', '1', '27');
INSERT INTO `makerrewarddata` VALUES ('4251400', '4251401', '1', '12');
INSERT INTO `makerrewarddata` VALUES ('4251400', '4251402', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251401', '4251400', '9', '1');
INSERT INTO `makerrewarddata` VALUES ('4251401', '4251401', '1', '1');
INSERT INTO `makerrewarddata` VALUES ('4251402', '4251401', '9', '4');
INSERT INTO `makerrewarddata` VALUES ('4251402', '4251402', '1', '1');

-- ----------------------------
-- Table structure for `marriages`
-- ----------------------------
DROP TABLE IF EXISTS `marriages`;
CREATE TABLE `marriages` (
  `marriageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `husbandid` int(10) unsigned NOT NULL DEFAULT '0',
  `wifeid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`marriageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marriages
-- ----------------------------

-- ----------------------------
-- Table structure for `medalmaps`
-- ----------------------------
DROP TABLE IF EXISTS `medalmaps`;
CREATE TABLE `medalmaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queststatusid` int(11) unsigned NOT NULL,
  `mapid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `queststatusid` (`queststatusid`),
  CONSTRAINT `medalmaps_ibfk_0` FOREIGN KEY (`queststatusid`) REFERENCES `queststatus` (`queststatusid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of medalmaps
-- ----------------------------

-- ----------------------------
-- Table structure for `monsterbook`
-- ----------------------------
DROP TABLE IF EXISTS `monsterbook`;
CREATE TABLE `monsterbook` (
  `charid` int(11) unsigned NOT NULL,
  `cardid` int(11) NOT NULL,
  `level` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of monsterbook
-- ----------------------------
INSERT INTO `monsterbook` VALUES ('11', '2388006', '2');
INSERT INTO `monsterbook` VALUES ('11', '2387002', '1');
INSERT INTO `monsterbook` VALUES ('11', '2380004', '1');

-- ----------------------------
-- Table structure for `monstercarddata`
-- ----------------------------
DROP TABLE IF EXISTS `monstercarddata`;
CREATE TABLE `monstercarddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardid` int(11) NOT NULL DEFAULT '0',
  `mobid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of monstercarddata
-- ----------------------------
INSERT INTO `monstercarddata` VALUES ('1', '2380000', '100100');
INSERT INTO `monstercarddata` VALUES ('2', '2380001', '100101');
INSERT INTO `monstercarddata` VALUES ('3', '2380003', '130100');
INSERT INTO `monstercarddata` VALUES ('4', '2380004', '130101');
INSERT INTO `monstercarddata` VALUES ('5', '2380005', '210100');
INSERT INTO `monstercarddata` VALUES ('6', '2380006', '1210100');
INSERT INTO `monstercarddata` VALUES ('7', '2380007', '1210102');
INSERT INTO `monstercarddata` VALUES ('8', '2380008', '1110101');
INSERT INTO `monstercarddata` VALUES ('9', '2380009', '1210101');
INSERT INTO `monstercarddata` VALUES ('10', '2380010', '1120100');
INSERT INTO `monstercarddata` VALUES ('11', '2380011', '1110100');
INSERT INTO `monstercarddata` VALUES ('12', '2380012', '1210103');
INSERT INTO `monstercarddata` VALUES ('13', '2381000', '1130100');
INSERT INTO `monstercarddata` VALUES ('14', '2381001', '1140100');
INSERT INTO `monstercarddata` VALUES ('15', '2381002', '2220100');
INSERT INTO `monstercarddata` VALUES ('16', '2381003', '2300100');
INSERT INTO `monstercarddata` VALUES ('17', '2381006', '2130103');
INSERT INTO `monstercarddata` VALUES ('18', '2381007', '2110200');
INSERT INTO `monstercarddata` VALUES ('19', '2381008', '2130100');
INSERT INTO `monstercarddata` VALUES ('20', '2381009', '2230108');
INSERT INTO `monstercarddata` VALUES ('21', '2381010', '2100102');
INSERT INTO `monstercarddata` VALUES ('22', '2381011', '2230103');
INSERT INTO `monstercarddata` VALUES ('23', '2381012', '5200000');
INSERT INTO `monstercarddata` VALUES ('24', '2381013', '2230105');
INSERT INTO `monstercarddata` VALUES ('25', '2381014', '2230110');
INSERT INTO `monstercarddata` VALUES ('26', '2381015', '2100105');
INSERT INTO `monstercarddata` VALUES ('27', '2381016', '2230101');
INSERT INTO `monstercarddata` VALUES ('28', '2381017', '2230107');
INSERT INTO `monstercarddata` VALUES ('29', '2381018', '2230111');
INSERT INTO `monstercarddata` VALUES ('30', '2381019', '2100106');
INSERT INTO `monstercarddata` VALUES ('31', '2381020', '2110300');
INSERT INTO `monstercarddata` VALUES ('32', '2381021', '2230106');
INSERT INTO `monstercarddata` VALUES ('33', '2381022', '2230102');
INSERT INTO `monstercarddata` VALUES ('34', '2381023', '2100103');
INSERT INTO `monstercarddata` VALUES ('35', '2381024', '2230100');
INSERT INTO `monstercarddata` VALUES ('36', '2381025', '2100107');
INSERT INTO `monstercarddata` VALUES ('37', '2381026', '2230109');
INSERT INTO `monstercarddata` VALUES ('38', '2381027', '2230104');
INSERT INTO `monstercarddata` VALUES ('39', '2381028', '2100104');
INSERT INTO `monstercarddata` VALUES ('40', '2381029', '2230200');
INSERT INTO `monstercarddata` VALUES ('41', '2381031', '2110301');
INSERT INTO `monstercarddata` VALUES ('42', '2381032', '3000000');
INSERT INTO `monstercarddata` VALUES ('43', '2381034', '3000005');
INSERT INTO `monstercarddata` VALUES ('44', '2381035', '3000006');
INSERT INTO `monstercarddata` VALUES ('45', '2381036', '3100102');
INSERT INTO `monstercarddata` VALUES ('46', '2381037', '5200001');
INSERT INTO `monstercarddata` VALUES ('47', '2381038', '5200002');
INSERT INTO `monstercarddata` VALUES ('48', '2382000', '3230307');
INSERT INTO `monstercarddata` VALUES ('49', '2382002', '3110100');
INSERT INTO `monstercarddata` VALUES ('50', '2382004', '3110101');
INSERT INTO `monstercarddata` VALUES ('51', '2382005', '3110102');
INSERT INTO `monstercarddata` VALUES ('52', '2382006', '5300000');
INSERT INTO `monstercarddata` VALUES ('53', '2382007', '3230104');
INSERT INTO `monstercarddata` VALUES ('54', '2382009', '3110300');
INSERT INTO `monstercarddata` VALUES ('55', '2382011', '3210200');
INSERT INTO `monstercarddata` VALUES ('56', '2382012', '3210201');
INSERT INTO `monstercarddata` VALUES ('57', '2382013', '3210202');
INSERT INTO `monstercarddata` VALUES ('58', '2382014', '5300001');
INSERT INTO `monstercarddata` VALUES ('59', '2382015', '3210204');
INSERT INTO `monstercarddata` VALUES ('60', '2382016', '3210205');
INSERT INTO `monstercarddata` VALUES ('61', '2382017', '3210207');
INSERT INTO `monstercarddata` VALUES ('62', '2382018', '3230100');
INSERT INTO `monstercarddata` VALUES ('63', '2382019', '3230101');
INSERT INTO `monstercarddata` VALUES ('64', '2382020', '3230200');
INSERT INTO `monstercarddata` VALUES ('65', '2382022', '3230302');
INSERT INTO `monstercarddata` VALUES ('66', '2382023', '5400000');
INSERT INTO `monstercarddata` VALUES ('67', '2382024', '3110302');
INSERT INTO `monstercarddata` VALUES ('68', '2382025', '3210203');
INSERT INTO `monstercarddata` VALUES ('69', '2382026', '3210206');
INSERT INTO `monstercarddata` VALUES ('70', '2382027', '3210450');
INSERT INTO `monstercarddata` VALUES ('71', '2382028', '3210208');
INSERT INTO `monstercarddata` VALUES ('72', '2382029', '3210800');
INSERT INTO `monstercarddata` VALUES ('73', '2382030', '3230102');
INSERT INTO `monstercarddata` VALUES ('74', '2382031', '3230303');
INSERT INTO `monstercarddata` VALUES ('75', '2382032', '3230306');
INSERT INTO `monstercarddata` VALUES ('76', '2382033', '3230103');
INSERT INTO `monstercarddata` VALUES ('77', '2382034', '3230304');
INSERT INTO `monstercarddata` VALUES ('78', '2382035', '3230405');
INSERT INTO `monstercarddata` VALUES ('79', '2382036', '3110303');
INSERT INTO `monstercarddata` VALUES ('80', '2382037', '3230308');
INSERT INTO `monstercarddata` VALUES ('81', '2382038', '3230305');
INSERT INTO `monstercarddata` VALUES ('82', '2382039', '4230100');
INSERT INTO `monstercarddata` VALUES ('83', '2382040', '4230101');
INSERT INTO `monstercarddata` VALUES ('84', '2382041', '4230113');
INSERT INTO `monstercarddata` VALUES ('85', '2382043', '4230200');
INSERT INTO `monstercarddata` VALUES ('86', '2382044', '4230201');
INSERT INTO `monstercarddata` VALUES ('87', '2382045', '4230500');
INSERT INTO `monstercarddata` VALUES ('88', '2382047', '4230107');
INSERT INTO `monstercarddata` VALUES ('89', '2382048', '4230111');
INSERT INTO `monstercarddata` VALUES ('90', '2382049', '4230114');
INSERT INTO `monstercarddata` VALUES ('91', '2382050', '4230119');
INSERT INTO `monstercarddata` VALUES ('92', '2382051', '4230501');
INSERT INTO `monstercarddata` VALUES ('93', '2382052', '4230105');
INSERT INTO `monstercarddata` VALUES ('94', '2382053', '4230103');
INSERT INTO `monstercarddata` VALUES ('95', '2382054', '4230109');
INSERT INTO `monstercarddata` VALUES ('96', '2382056', '4230124');
INSERT INTO `monstercarddata` VALUES ('97', '2382057', '4110300');
INSERT INTO `monstercarddata` VALUES ('98', '2382058', '4230108');
INSERT INTO `monstercarddata` VALUES ('99', '2382059', '4230123');
INSERT INTO `monstercarddata` VALUES ('100', '2382060', '4230502');
INSERT INTO `monstercarddata` VALUES ('101', '2382061', '4230120');
INSERT INTO `monstercarddata` VALUES ('102', '2382062', '4230112');
INSERT INTO `monstercarddata` VALUES ('103', '2382063', '4230125');
INSERT INTO `monstercarddata` VALUES ('104', '2382064', '4230106');
INSERT INTO `monstercarddata` VALUES ('105', '2382065', '4130100');
INSERT INTO `monstercarddata` VALUES ('106', '2382066', '4230110');
INSERT INTO `monstercarddata` VALUES ('107', '2382068', '4230300');
INSERT INTO `monstercarddata` VALUES ('108', '2382069', '4230400');
INSERT INTO `monstercarddata` VALUES ('109', '2382070', '4230503');
INSERT INTO `monstercarddata` VALUES ('110', '2382071', '4230504');
INSERT INTO `monstercarddata` VALUES ('111', '2382072', '4110301');
INSERT INTO `monstercarddata` VALUES ('112', '2382076', '4250000');
INSERT INTO `monstercarddata` VALUES ('113', '2383000', '4230121');
INSERT INTO `monstercarddata` VALUES ('114', '2383001', '4130101');
INSERT INTO `monstercarddata` VALUES ('115', '2383002', '4230115');
INSERT INTO `monstercarddata` VALUES ('116', '2383003', '4130102');
INSERT INTO `monstercarddata` VALUES ('117', '2383004', '4130103');
INSERT INTO `monstercarddata` VALUES ('118', '2383006', '4230505');
INSERT INTO `monstercarddata` VALUES ('119', '2383007', '9300255');
INSERT INTO `monstercarddata` VALUES ('120', '2383008', '4230102');
INSERT INTO `monstercarddata` VALUES ('121', '2383009', '4230104');
INSERT INTO `monstercarddata` VALUES ('122', '2383010', '4230506');
INSERT INTO `monstercarddata` VALUES ('123', '2383012', '5130100');
INSERT INTO `monstercarddata` VALUES ('124', '2383013', '5100000');
INSERT INTO `monstercarddata` VALUES ('125', '2383014', '5100003');
INSERT INTO `monstercarddata` VALUES ('126', '2383015', '5120503');
INSERT INTO `monstercarddata` VALUES ('127', '2383016', '9300144');
INSERT INTO `monstercarddata` VALUES ('128', '2383017', '5100002');
INSERT INTO `monstercarddata` VALUES ('129', '2383018', '5120504');
INSERT INTO `monstercarddata` VALUES ('130', '2383019', '5130103');
INSERT INTO `monstercarddata` VALUES ('131', '2383021', '5120001');
INSERT INTO `monstercarddata` VALUES ('132', '2383022', '5120002');
INSERT INTO `monstercarddata` VALUES ('133', '2383023', '5120003');
INSERT INTO `monstercarddata` VALUES ('134', '2383024', '5100005');
INSERT INTO `monstercarddata` VALUES ('135', '2383025', '5120501');
INSERT INTO `monstercarddata` VALUES ('136', '2383026', '5120100');
INSERT INTO `monstercarddata` VALUES ('137', '2383027', '5120502');
INSERT INTO `monstercarddata` VALUES ('138', '2383028', '9300149');
INSERT INTO `monstercarddata` VALUES ('139', '2383029', '5300100');
INSERT INTO `monstercarddata` VALUES ('140', '2383030', '5130101');
INSERT INTO `monstercarddata` VALUES ('141', '2383031', '5130104');
INSERT INTO `monstercarddata` VALUES ('142', '2383032', '5120506');
INSERT INTO `monstercarddata` VALUES ('143', '2383033', '5130105');
INSERT INTO `monstercarddata` VALUES ('144', '2383035', '5120500');
INSERT INTO `monstercarddata` VALUES ('145', '2383036', '5150001');
INSERT INTO `monstercarddata` VALUES ('146', '2383037', '5130107');
INSERT INTO `monstercarddata` VALUES ('147', '2383038', '5130108');
INSERT INTO `monstercarddata` VALUES ('148', '2383039', '5130102');
INSERT INTO `monstercarddata` VALUES ('149', '2383040', '5140000');
INSERT INTO `monstercarddata` VALUES ('150', '2383041', '5120505');
INSERT INTO `monstercarddata` VALUES ('151', '2383042', '5110302');
INSERT INTO `monstercarddata` VALUES ('152', '2383043', '5150000');
INSERT INTO `monstercarddata` VALUES ('153', '2383044', '6130100');
INSERT INTO `monstercarddata` VALUES ('154', '2383045', '6130103');
INSERT INTO `monstercarddata` VALUES ('155', '2383046', '6130201');
INSERT INTO `monstercarddata` VALUES ('156', '2383047', '6130203');
INSERT INTO `monstercarddata` VALUES ('157', '2383048', '5090000');
INSERT INTO `monstercarddata` VALUES ('158', '2383049', '5090001');
INSERT INTO `monstercarddata` VALUES ('159', '2383056', '4250001');
INSERT INTO `monstercarddata` VALUES ('160', '2383057', '5250000');
INSERT INTO `monstercarddata` VALUES ('161', '2383058', '5250002');
INSERT INTO `monstercarddata` VALUES ('162', '2383059', '5250001');
INSERT INTO `monstercarddata` VALUES ('163', '2384000', '6130200');
INSERT INTO `monstercarddata` VALUES ('164', '2384001', '9400201');
INSERT INTO `monstercarddata` VALUES ('165', '2384002', '6130207');
INSERT INTO `monstercarddata` VALUES ('166', '2384003', '6230602');
INSERT INTO `monstercarddata` VALUES ('167', '2384004', '6230400');
INSERT INTO `monstercarddata` VALUES ('168', '2384006', '6230600');
INSERT INTO `monstercarddata` VALUES ('169', '2384007', '6230200');
INSERT INTO `monstercarddata` VALUES ('170', '2384008', '6130204');
INSERT INTO `monstercarddata` VALUES ('171', '2384009', '6300000');
INSERT INTO `monstercarddata` VALUES ('172', '2384010', '6090000');
INSERT INTO `monstercarddata` VALUES ('173', '2384011', '6110300');
INSERT INTO `monstercarddata` VALUES ('174', '2384012', '6230300');
INSERT INTO `monstercarddata` VALUES ('175', '2384013', '6130209');
INSERT INTO `monstercarddata` VALUES ('176', '2384014', '6230500');
INSERT INTO `monstercarddata` VALUES ('177', '2384015', '6230601');
INSERT INTO `monstercarddata` VALUES ('178', '2384016', '6400000');
INSERT INTO `monstercarddata` VALUES ('179', '2384017', '6130208');
INSERT INTO `monstercarddata` VALUES ('180', '2384018', '9300146');
INSERT INTO `monstercarddata` VALUES ('181', '2384019', '8140200');
INSERT INTO `monstercarddata` VALUES ('182', '2384020', '7130100');
INSERT INTO `monstercarddata` VALUES ('183', '2384021', '7130400');
INSERT INTO `monstercarddata` VALUES ('184', '2384022', '7130401');
INSERT INTO `monstercarddata` VALUES ('185', '2384023', '7130402');
INSERT INTO `monstercarddata` VALUES ('186', '2384024', '7130500');
INSERT INTO `monstercarddata` VALUES ('187', '2384025', '7130104');
INSERT INTO `monstercarddata` VALUES ('188', '2384026', '7130001');
INSERT INTO `monstercarddata` VALUES ('189', '2384027', '7130002');
INSERT INTO `monstercarddata` VALUES ('190', '2384028', '7130600');
INSERT INTO `monstercarddata` VALUES ('191', '2384029', '7130103');
INSERT INTO `monstercarddata` VALUES ('192', '2384032', '6300100');
INSERT INTO `monstercarddata` VALUES ('193', '2384033', '7130501');
INSERT INTO `monstercarddata` VALUES ('194', '2384035', '7130200');
INSERT INTO `monstercarddata` VALUES ('195', '2384036', '7130101');
INSERT INTO `monstercarddata` VALUES ('196', '2384037', '6090001');
INSERT INTO `monstercarddata` VALUES ('197', '2384038', '7090000');
INSERT INTO `monstercarddata` VALUES ('198', '2384039', '6090003');
INSERT INTO `monstercarddata` VALUES ('199', '2384040', '6090004');
INSERT INTO `monstercarddata` VALUES ('200', '2385000', '8140300');
INSERT INTO `monstercarddata` VALUES ('201', '2385001', '7130003');
INSERT INTO `monstercarddata` VALUES ('202', '2385002', '7130601');
INSERT INTO `monstercarddata` VALUES ('203', '2385003', '6400100');
INSERT INTO `monstercarddata` VALUES ('204', '2385004', '7130102');
INSERT INTO `monstercarddata` VALUES ('205', '2385005', '7130004');
INSERT INTO `monstercarddata` VALUES ('206', '2385006', '8140000');
INSERT INTO `monstercarddata` VALUES ('207', '2385007', '8140001');
INSERT INTO `monstercarddata` VALUES ('208', '2385008', '8110300');
INSERT INTO `monstercarddata` VALUES ('209', '2385009', '8140100');
INSERT INTO `monstercarddata` VALUES ('210', '2385011', '8140002');
INSERT INTO `monstercarddata` VALUES ('211', '2385012', '7130010');
INSERT INTO `monstercarddata` VALUES ('212', '2385013', '7130020');
INSERT INTO `monstercarddata` VALUES ('213', '2385014', '8140110');
INSERT INTO `monstercarddata` VALUES ('214', '2385016', '8140101');
INSERT INTO `monstercarddata` VALUES ('215', '2385017', '8140102');
INSERT INTO `monstercarddata` VALUES ('216', '2385018', '8140103');
INSERT INTO `monstercarddata` VALUES ('217', '2385019', '8140111');
INSERT INTO `monstercarddata` VALUES ('218', '2385020', '7130300');
INSERT INTO `monstercarddata` VALUES ('219', '2385021', '8140500');
INSERT INTO `monstercarddata` VALUES ('220', '2385022', '8140700');
INSERT INTO `monstercarddata` VALUES ('221', '2385023', '8090000');
INSERT INTO `monstercarddata` VALUES ('222', '2385025', '8200000');
INSERT INTO `monstercarddata` VALUES ('223', '2386000', '8140600');
INSERT INTO `monstercarddata` VALUES ('224', '2386001', '8140701');
INSERT INTO `monstercarddata` VALUES ('225', '2386002', '9300324');
INSERT INTO `monstercarddata` VALUES ('226', '2386003', '8141300');
INSERT INTO `monstercarddata` VALUES ('227', '2386004', '8142000');
INSERT INTO `monstercarddata` VALUES ('228', '2386005', '8140702');
INSERT INTO `monstercarddata` VALUES ('229', '2386006', '8140703');
INSERT INTO `monstercarddata` VALUES ('230', '2386007', '8142100');
INSERT INTO `monstercarddata` VALUES ('231', '2386008', '8150300');
INSERT INTO `monstercarddata` VALUES ('232', '2386009', '9500136');
INSERT INTO `monstercarddata` VALUES ('233', '2386010', '9500137');
INSERT INTO `monstercarddata` VALUES ('234', '2386011', '8150200');
INSERT INTO `monstercarddata` VALUES ('235', '2386012', '8150100');
INSERT INTO `monstercarddata` VALUES ('236', '2386013', '8150301');
INSERT INTO `monstercarddata` VALUES ('237', '2386014', '8150101');
INSERT INTO `monstercarddata` VALUES ('238', '2386015', '8150302');
INSERT INTO `monstercarddata` VALUES ('239', '2386016', '8150201');
INSERT INTO `monstercarddata` VALUES ('240', '2386017', '8190000');
INSERT INTO `monstercarddata` VALUES ('241', '2386021', '8200001');
INSERT INTO `monstercarddata` VALUES ('242', '2386022', '8200002');
INSERT INTO `monstercarddata` VALUES ('243', '2386023', '8200003');
INSERT INTO `monstercarddata` VALUES ('244', '2386024', '8200004');
INSERT INTO `monstercarddata` VALUES ('245', '2387000', '8160000');
INSERT INTO `monstercarddata` VALUES ('246', '2387001', '8170000');
INSERT INTO `monstercarddata` VALUES ('247', '2387002', '8190003');
INSERT INTO `monstercarddata` VALUES ('248', '2387003', '8190004');
INSERT INTO `monstercarddata` VALUES ('249', '2387004', '8190002');
INSERT INTO `monstercarddata` VALUES ('250', '2387006', '8200005');
INSERT INTO `monstercarddata` VALUES ('251', '2387007', '8200006');
INSERT INTO `monstercarddata` VALUES ('252', '2387008', '8200007');
INSERT INTO `monstercarddata` VALUES ('253', '2387009', '8200008');
INSERT INTO `monstercarddata` VALUES ('254', '2387010', '8200009');
INSERT INTO `monstercarddata` VALUES ('255', '2387011', '8200010');
INSERT INTO `monstercarddata` VALUES ('256', '2387012', '8200011');
INSERT INTO `monstercarddata` VALUES ('257', '2387013', '8200012');
INSERT INTO `monstercarddata` VALUES ('258', '2388000', '9300184');
INSERT INTO `monstercarddata` VALUES ('259', '2388001', '9300003');
INSERT INTO `monstercarddata` VALUES ('260', '2388002', '5220002');
INSERT INTO `monstercarddata` VALUES ('261', '2388003', '5220000');
INSERT INTO `monstercarddata` VALUES ('262', '2388004', '9300012');
INSERT INTO `monstercarddata` VALUES ('263', '2388005', '5220003');
INSERT INTO `monstercarddata` VALUES ('264', '2388006', '6130101');
INSERT INTO `monstercarddata` VALUES ('265', '2388007', '6220000');
INSERT INTO `monstercarddata` VALUES ('266', '2388008', '6300005');
INSERT INTO `monstercarddata` VALUES ('267', '2388009', '7220001');
INSERT INTO `monstercarddata` VALUES ('268', '2388010', '7220000');
INSERT INTO `monstercarddata` VALUES ('269', '2388011', '9300119');
INSERT INTO `monstercarddata` VALUES ('270', '2388012', '9300039');
INSERT INTO `monstercarddata` VALUES ('271', '2388013', '7220002');
INSERT INTO `monstercarddata` VALUES ('272', '2388014', '9300139');
INSERT INTO `monstercarddata` VALUES ('273', '2388016', '8220001');
INSERT INTO `monstercarddata` VALUES ('274', '2388017', '8150000');
INSERT INTO `monstercarddata` VALUES ('275', '2388018', '8180000');
INSERT INTO `monstercarddata` VALUES ('276', '2388019', '8180001');
INSERT INTO `monstercarddata` VALUES ('277', '2388020', '8510000');
INSERT INTO `monstercarddata` VALUES ('278', '2388021', '9300028');
INSERT INTO `monstercarddata` VALUES ('279', '2388022', '8500002');
INSERT INTO `monstercarddata` VALUES ('280', '2388025', '3220000');
INSERT INTO `monstercarddata` VALUES ('281', '2388026', '8130100');
INSERT INTO `monstercarddata` VALUES ('282', '2388028', '9500317');
INSERT INTO `monstercarddata` VALUES ('283', '2388029', '3220001');
INSERT INTO `monstercarddata` VALUES ('284', '2388030', '4220000');
INSERT INTO `monstercarddata` VALUES ('285', '2388031', '6220001');
INSERT INTO `monstercarddata` VALUES ('286', '2388033', '8220003');
INSERT INTO `monstercarddata` VALUES ('287', '2388040', '8220004');
INSERT INTO `monstercarddata` VALUES ('288', '2388041', '8220005');
INSERT INTO `monstercarddata` VALUES ('289', '2388042', '8220006');
INSERT INTO `monstercarddata` VALUES ('290', '2388043', '8820000');
INSERT INTO `monstercarddata` VALUES ('291', '2380013', '9300274');
INSERT INTO `monstercarddata` VALUES ('292', '2388055', '8830000');
INSERT INTO `monstercarddata` VALUES ('293', '2380014', '1110130');
INSERT INTO `monstercarddata` VALUES ('294', '2380015', '100130');
INSERT INTO `monstercarddata` VALUES ('295', '2380016', '100131');
INSERT INTO `monstercarddata` VALUES ('296', '2380017', '100132');
INSERT INTO `monstercarddata` VALUES ('297', '2380018', '100133');
INSERT INTO `monstercarddata` VALUES ('298', '2380019', '100134');
INSERT INTO `monstercarddata` VALUES ('299', '2381083', '2230131');
INSERT INTO `monstercarddata` VALUES ('300', '2382093', '3300001');
INSERT INTO `monstercarddata` VALUES ('301', '2382094', '3300002');
INSERT INTO `monstercarddata` VALUES ('302', '2382095', '3300003');
INSERT INTO `monstercarddata` VALUES ('303', '2382096', '3300004');
INSERT INTO `monstercarddata` VALUES ('304', '2388052', '5220004');
INSERT INTO `monstercarddata` VALUES ('305', '2388053', '8220007');
INSERT INTO `monstercarddata` VALUES ('306', '2388054', '8220009');
INSERT INTO `monstercarddata` VALUES ('307', '2388068', '3300006');
INSERT INTO `monstercarddata` VALUES ('308', '2388069', '3300007');

-- ----------------------------
-- Table structure for `mts_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mts_cart`;
CREATE TABLE `mts_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mts_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `mts_items`
-- ----------------------------
DROP TABLE IF EXISTS `mts_items`;
CREATE TABLE `mts_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tab` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `seller` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `bid_incre` int(11) DEFAULT '0',
  `buy_now` int(11) DEFAULT '0',
  `position` int(11) DEFAULT '0',
  `upgradeslots` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `str` int(11) DEFAULT '0',
  `dex` int(11) DEFAULT '0',
  `int` int(11) DEFAULT '0',
  `luk` int(11) DEFAULT '0',
  `hp` int(11) DEFAULT '0',
  `mp` int(11) DEFAULT '0',
  `watk` int(11) DEFAULT '0',
  `matk` int(11) DEFAULT '0',
  `wdef` int(11) DEFAULT '0',
  `mdef` int(11) DEFAULT '0',
  `acc` int(11) DEFAULT '0',
  `avoid` int(11) DEFAULT '0',
  `hands` int(11) DEFAULT '0',
  `speed` int(11) DEFAULT '0',
  `jump` int(11) DEFAULT '0',
  `locked` int(11) DEFAULT '0',
  `isequip` int(1) DEFAULT '0',
  `owner` varchar(16) DEFAULT '',
  `sellername` varchar(16) NOT NULL,
  `sell_ends` varchar(16) NOT NULL,
  `transfer` int(2) DEFAULT '0',
  `vicious` int(2) unsigned NOT NULL DEFAULT '0',
  `flag` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mts_items
-- ----------------------------

-- ----------------------------
-- Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(13) NOT NULL DEFAULT '',
  `from` varchar(13) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `fame` int(11) NOT NULL DEFAULT '0',
  `deleted` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notes
-- ----------------------------

-- ----------------------------
-- Table structure for `nxcode`
-- ----------------------------
DROP TABLE IF EXISTS `nxcode`;
CREATE TABLE `nxcode` (
  `code` varchar(15) NOT NULL,
  `valid` int(11) NOT NULL DEFAULT '1',
  `user` varchar(13) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `item` int(11) NOT NULL DEFAULT '10000',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nxcode
-- ----------------------------

-- ----------------------------
-- Table structure for `pets`
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(13) DEFAULT NULL,
  `level` int(10) unsigned NOT NULL,
  `closeness` int(10) unsigned NOT NULL,
  `fullness` int(10) unsigned NOT NULL,
  `summoned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pets
-- ----------------------------

-- ----------------------------
-- Table structure for `playernpcs`
-- ----------------------------
DROP TABLE IF EXISTS `playernpcs`;
CREATE TABLE `playernpcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(13) NOT NULL,
  `hair` int(11) NOT NULL,
  `face` int(11) NOT NULL,
  `skin` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `cy` int(11) NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT '0',
  `dir` int(11) NOT NULL DEFAULT '0',
  `ScriptId` int(10) unsigned NOT NULL DEFAULT '0',
  `Foothold` int(11) NOT NULL DEFAULT '0',
  `rx0` int(11) NOT NULL DEFAULT '0',
  `rx1` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playernpcs
-- ----------------------------

-- ----------------------------
-- Table structure for `playernpcs_equip`
-- ----------------------------
DROP TABLE IF EXISTS `playernpcs_equip`;
CREATE TABLE `playernpcs_equip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NpcId` int(11) NOT NULL DEFAULT '0',
  `equipid` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `equippos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playernpcs_equip
-- ----------------------------

-- ----------------------------
-- Table structure for `questactions`
-- ----------------------------
DROP TABLE IF EXISTS `questactions`;
CREATE TABLE `questactions` (
  `questactionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`questactionid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questactions
-- ----------------------------

-- ----------------------------
-- Table structure for `questex`
-- ----------------------------
DROP TABLE IF EXISTS `questex`;
CREATE TABLE `questex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL,
  `questid` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questex_ibfk_1` (`characterid`),
  CONSTRAINT `questex_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questex
-- ----------------------------

-- ----------------------------
-- Table structure for `questprogress`
-- ----------------------------
DROP TABLE IF EXISTS `questprogress`;
CREATE TABLE `questprogress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queststatusid` int(10) unsigned NOT NULL DEFAULT '0',
  `progressid` int(11) NOT NULL DEFAULT '0',
  `progress` varchar(15) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `queststatusid` (`queststatusid`),
  CONSTRAINT `questprogress_ibfk_1` FOREIGN KEY (`queststatusid`) REFERENCES `queststatus` (`queststatusid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questprogress
-- ----------------------------

-- ----------------------------
-- Table structure for `questrequirements`
-- ----------------------------
DROP TABLE IF EXISTS `questrequirements`;
CREATE TABLE `questrequirements` (
  `questrequirementid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`questrequirementid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questrequirements
-- ----------------------------

-- ----------------------------
-- Table structure for `queststatus`
-- ----------------------------
DROP TABLE IF EXISTS `queststatus`;
CREATE TABLE `queststatus` (
  `queststatusid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL DEFAULT '0',
  `quest` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `forfeited` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queststatusid`),
  KEY `characterid` (`characterid`),
  CONSTRAINT `queststatus_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of queststatus
-- ----------------------------

-- ----------------------------
-- Table structure for `reactordrops`
-- ----------------------------
DROP TABLE IF EXISTS `reactordrops`;
CREATE TABLE `reactordrops` (
  `reactordropid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reactorid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `chance` int(11) NOT NULL,
  `questid` int(5) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`reactordropid`),
  KEY `reactorid` (`reactorid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 PACK_KEYS=1;

-- ----------------------------
-- Records of reactordrops
-- ----------------------------
insert  into `reactordrops`(`reactordropid`,`reactorid`,`itemid`,`chance`,`questid`) values (126,1022002,4001340,1,28167),(127,1202000,4001366,1,28194),(128,1202003,4001346,1,28225),(129,1202004,4001346,1,28225),(130,1032000,4032362,1,28252),(131,1032000,4032363,1,28252),(132,1202004,4032494,1,28255),(1,2001,4031161,1,1008),(2,2001,4031162,1,1008),(3,2001,2010009,2,-1),(4,2001,2010000,4,-1),(5,2001,2000000,4,-1),(6,2001,2000001,7,-1),(7,2001,2000002,10,-1),(8,2001,2000003,15,-1),(9,1012000,2000000,6,-1),(10,1012000,4000003,6,-1),(11,1012000,4031150,3,-1),(12,1072000,4031165,4,-1),(13,1102000,4000136,1,-1),(14,1102001,4000136,1,-1),(15,1102002,4000136,1,-1),(16,2002000,2000002,4,-1),(17,2002000,2000001,2,-1),(18,2002000,4031198,2,-1),(19,2112000,2000004,1,-1),(20,2112001,2020001,1,-1),(21,2112004,4001016,1,-1),(22,2112005,4001015,1,-1),(23,2112003,2000005,1,-1),(24,2112007,2022001,1,-1),(25,2112008,2000004,1,-1),(26,2112009,2020001,1,-1),(27,2112010,2000005,1,-1),(28,2112011,4001016,1,-1),(29,2112012,4001015,1,-1),(30,2112014,4001018,1,-1),(31,2112016,4001113,1,-1),(32,2112017,4001114,1,-1),(33,2202000,4031094,1,-1),(34,2212000,4031142,2,-1),(35,2212000,2000002,3,-1),(36,2212001,2000002,3,-1),(37,2212002,2000002,3,-1),(38,2212001,4031141,2,-1),(39,2212002,4031143,2,-1),(40,2212003,4031107,2,-1),(41,2212004,4031116,2,-1),(42,2212004,2000001,2,-1),(43,2212005,4031136,8,-1),(44,2222000,4031231,2,-1),(45,2222000,4031258,2,-1),(46,2222000,2000002,3,-1),(47,2302000,2000001,3,-1),(48,2302000,2022040,6,-1),(49,2302000,4031274,50,-1),(50,2302000,4031275,50,-1),(51,2302000,4031276,50,-1),(52,2302000,4031277,50,-1),(53,2302000,4031278,50,-1),(54,2302001,2000002,3,-1),(55,2302001,2022040,4,-1),(56,2302002,2000001,3,-1),(57,2302002,2022040,8,-1),(58,2302003,4161017,1,-1),(59,2302005,4031508,1,-1),(60,2502000,2022116,1,-1),(61,2052001,2022116,1,-1),(62,9202000,1032033,1,-1),(63,9202009,1032033,1,-1),(64,2202001,4031092,1,-1),(65,9202001,4001025,1,-1),(66,9202002,4001037,1,-1),(67,9202003,4001029,1,-1),(68,9202004,4001030,1,-1),(69,9202005,4001031,1,-1),(70,9202006,4001032,1,-1),(71,9202007,4001033,1,-1),(72,9202008,4001034,1,-1),(73,9202012,2020014,3,-1),(74,9202012,2020015,3,-1),(75,9202012,2001001,3,-1),(76,9202012,2000004,3,-1),(77,9202012,2000005,3,-1),(78,9202012,2000001,3,-1),(79,9202012,2000002,3,-1),(80,9202012,2000006,3,-1),(81,9202012,2001002,3,-1),(82,9202012,2040504,40,-1),(83,9202012,2040501,40,-1),(84,9202012,2040513,40,-1),(85,9202012,2040516,40,-1),(86,9202012,2041007,40,-1),(87,9202012,2041010,40,-1),(88,9202012,2041004,40,-1),(89,9202012,2041001,40,-1),(90,9202012,2041019,40,-1),(91,9202012,2041022,40,-1),(92,9202012,2041013,40,-1),(93,9202012,2041016,40,-1),(94,9202012,2040301,40,-1),(95,9202012,2040704,40,-1),(96,9202012,2040707,40,-1),(97,9202012,2040701,40,-1),(98,9202012,2040804,40,-1),(99,9202012,2040801,40,-1),(100,9202012,2040004,40,-1),(101,9202012,2040001,40,-1),(102,9202012,2290009,60,-1),(103,9202012,2290031,60,-1),(104,9202012,2290039,60,-1),(105,9202012,2290033,60,-1),(106,9202012,2290045,60,-1),(107,9202012,2290081,60,-1),(108,9202012,2290083,60,-1),(109,9202012,2290087,60,-1),(110,9202012,2290060,60,-1),(111,9202012,2290073,60,-1),(112,9202012,2100000,250,-1),(113,2612004,4031703,1,-1),(114,1302000,2010000,30,-1),(115,1302000,2010009,30,-1),(116,1302000,4032268,1,20013),(117,1302000,4032267,1,20013),(118,1052000,4031471,1,6153),(119,2112015,2280000,1,-1),(120,1022000,4031452,1,-1),(121,2202003,4001022,1,-1),(122,2201001,4001022,1,-1),(123,1402000,4032309,1,-1),(124,1402000,4032310,1,-1),(125,1022001,4032319,7,-1),(133,1052001,3010126,100,-1),(134,1052002,3010126,100,-1),(135,1052001,1072375,3,-1),(136,1052001,1072376,3,-1),(137,1052001,2049100,3,-1),(138,1052001,2049001,3,-1),(139,1052001,1382068,3,-1),(140,1052001,1402062,3,-1),(141,1052001,1442078,3,-1),(142,1052001,1452071,3,-1),(143,1052001,1472086,3,-1),(144,1052001,1492037,3,-1),(145,1052001,2040728,3,-1),(146,1052001,2040729,3,-1),(147,1052001,2040730,3,-1),(148,1052001,2040731,3,-1),(149,1052001,2040732,3,-1),(150,1052001,2040733,3,-1),(151,1052001,2040734,3,-1),(152,1052001,2040735,3,-1),(153,1052001,2040736,3,-1),(154,1052001,2040737,3,-1),(155,1052001,2040738,3,-1),(156,1052001,2040739,3,-1),(157,1052001,1302112,3,-1),(158,1052001,1302113,3,-1),(159,1052001,1312042,3,-1),(160,1052001,1312043,3,-1),(161,1052001,1322068,3,-1),(162,1052001,1322069,3,-1),(163,1052001,1332084,3,-1),(164,1052001,1332085,3,-1),(165,1052001,1332086,3,-1),(166,1052001,1332087,3,-1),(167,1052001,1342019,3,-1),(168,1052001,1342020,3,-1),(169,1052001,1372050,3,-1),(170,1052001,1372051,3,-1),(171,1052001,1382066,3,-1),(172,1052001,1382067,3,-1),(173,1052001,1402056,3,-1),(174,1052001,1402057,3,-1),(175,1052001,1402058,3,-1),(176,1052001,1402059,3,-1),(177,1052001,1412038,3,-1),(178,1052001,1412039,3,-1),(179,1052001,1422042,3,-1),(180,1052001,1422043,3,-1),(181,1052002,1072375,3,-1),(182,1052002,1072376,3,-1),(183,1052002,2040728,3,-1),(184,1052002,2040729,3,-1),(185,1052002,2040730,3,-1),(186,1052002,2040731,3,-1),(187,1052002,2040732,3,-1),(188,1052002,2040733,3,-1),(189,1052002,2040734,3,-1),(190,1052002,2040735,3,-1),(191,1052002,2040736,3,-1),(192,1052002,2040737,3,-1),(193,1052002,2040738,3,-1),(194,1052002,2040739,3,-1),(195,1052002,1302112,3,-1),(196,1052002,1302113,3,-1),(197,1052002,1312042,3,-1),(198,1052002,1312043,3,-1),(199,1052002,1322068,3,-1),(200,1052002,1322069,3,-1),(201,1052002,1332084,3,-1),(202,1052002,1332085,3,-1),(203,1052002,1332086,3,-1),(204,1052002,1332087,3,-1),(205,1052002,1342019,3,-1),(206,1052002,1342020,3,-1),(207,1052002,1372050,3,-1),(208,1052002,1372051,3,-1),(209,1052002,1382066,3,-1),(210,1052002,1382067,3,-1),(211,1052002,1402056,3,-1),(212,1052002,1402057,3,-1),(213,1052002,1402058,3,-1),(214,1052002,1402059,3,-1),(215,1052002,1412038,3,-1),(216,1052002,1412039,3,-1),(217,1052002,1422042,3,-1),(218,1052002,1422043,3,-1),(219,1002008,4032452,1,22502),(220,6102001,4001260,1,-1),(221,6102002,1472051,25,-1),(222,6102002,1442056,25,-1),(223,6102002,1072228,25,-1),(224,6102002,1322062,25,-1),(225,6102002,1092061,25,-1),(226,6102002,1452019,25,-1),(227,6102002,1492012,25,-1),(228,6102002,1092050,25,-1),(229,6102002,1402005,25,-1),(230,6102002,1052131,25,-1),(231,6102002,1462016,25,-1),(232,6102002,1332051,25,-1),(233,6102002,1102043,50,-1),(234,6102002,1102206,50,-1),(235,6102002,1102260,50,-1),(236,6102002,3010010,25,-1),(237,6102002,4032015,25,-1),(238,6102002,4032016,25,-1),(239,6102002,4032017,25,-1),(240,6102002,4161018,25,-1),(241,6102002,4161021,25,-1),(242,6102002,4001107,25,-1),(243,6102002,4161015,25,-1),(244,6102002,4161016,25,-1),(245,6102002,2022121,25,-1),(246,6102002,2044803,25,-1),(247,6102002,2044903,25,-1),(248,6102002,2290071,50,-1),(249,6102002,2290027,50,-1),(250,6102002,2290111,50,-1),(251,6102002,2290118,50,-1),(252,6102002,2290103,50,-1),(253,6102002,2290047,50,-1),(254,6102002,2290091,50,-1),(255,6102002,2290053,50,-1),(256,6102002,2290061,50,-1),(257,6102002,2290011,50,-1),(258,6102002,2290089,50,-1),(259,6102003,1472051,25,-1),(260,6102003,1442056,25,-1),(261,6102003,1072228,25,-1),(262,6102003,1322062,25,-1),(263,6102003,1092061,25,-1),(264,6102003,1452019,25,-1),(265,6102003,1492012,25,-1),(266,6102003,1092050,25,-1),(267,6102003,1402005,25,-1),(268,6102003,1052131,25,-1),(269,6102003,1462016,25,-1),(270,6102003,1332051,25,-1),(271,6102003,1102043,50,-1),(272,6102003,1102206,50,-1),(273,6102003,1102260,50,-1),(274,6102003,3010010,25,-1),(275,6102003,4032015,25,-1),(276,6102003,4032016,25,-1),(277,6102003,4032017,25,-1),(278,6102003,4161018,25,-1),(279,6102003,4161021,25,-1),(280,6102003,4001107,25,-1),(281,6102003,4161015,25,-1),(282,6102003,4161016,25,-1),(283,6102003,2022121,25,-1),(284,6102003,2044803,25,-1),(285,6102003,2044903,25,-1),(286,6102003,2290071,50,-1),(287,6102003,2290027,50,-1),(288,6102003,2290111,50,-1),(289,6102003,2290118,50,-1),(290,6102003,2290103,50,-1),(291,6102003,2290047,50,-1),(292,6102003,2290091,50,-1),(293,6102003,2290053,50,-1),(294,6102003,2290061,50,-1),(295,6102003,2290011,50,-1),(296,6102003,2290089,50,-1),(297,6102004,1472051,25,-1),(298,6102004,1442056,25,-1),(299,6102004,1072228,25,-1),(300,6102004,1322062,25,-1),(301,6102004,1092061,25,-1),(302,6102004,1452019,25,-1),(303,6102004,1492012,25,-1),(304,6102004,1092050,25,-1),(305,6102004,1402005,25,-1),(306,6102004,1052131,25,-1),(307,6102004,1462016,25,-1),(308,6102004,1332051,25,-1),(309,6102004,1102043,50,-1),(310,6102004,1102206,50,-1),(311,6102004,1102260,50,-1),(312,6102004,3010010,25,-1),(313,6102004,4032015,25,-1),(314,6102004,4032016,25,-1),(315,6102004,4032017,25,-1),(316,6102004,4161018,25,-1),(317,6102004,4161021,25,-1),(318,6102004,4001107,25,-1),(319,6102004,4161015,25,-1),(320,6102004,4161016,25,-1),(321,6102004,2022121,25,-1),(322,6102004,2044803,25,-1),(323,6102004,2044903,25,-1),(324,6102004,2290071,50,-1),(325,6102004,2290027,50,-1),(326,6102004,2290111,50,-1),(327,6102004,2290118,50,-1),(328,6102004,2290103,50,-1),(329,6102004,2290047,50,-1),(330,6102004,2290091,50,-1),(331,6102004,2290053,50,-1),(332,6102004,2290061,50,-1),(333,6102004,2290011,50,-1),(334,6102004,2290089,50,-1),(335,6102005,1472051,25,-1),(336,6102005,1442056,25,-1),(337,6102005,1072228,25,-1),(338,6102005,1322062,25,-1),(339,6102005,1092061,25,-1),(340,6102005,1452019,25,-1),(341,6102005,1492012,25,-1),(342,6102005,1092050,25,-1),(343,6102005,1402005,25,-1),(344,6102005,1052131,25,-1),(345,6102005,1462016,25,-1),(346,6102005,1332051,25,-1),(347,6102005,1102043,50,-1),(348,6102005,1102206,50,-1),(349,6102005,1102260,50,-1),(350,6102005,3010010,25,-1),(351,6102005,4032015,25,-1),(352,6102005,4032016,25,-1),(353,6102005,4032017,25,-1),(354,6102005,4161018,25,-1),(355,6102005,4161021,25,-1),(356,6102005,4001107,25,-1),(357,6102005,4161015,25,-1),(358,6102005,4161016,25,-1),(359,6102005,2022121,25,-1),(360,6102005,2044803,25,-1),(361,6102005,2044903,25,-1),(362,6102005,2290071,50,-1),(363,6102005,2290027,50,-1),(364,6102005,2290111,50,-1),(365,6102005,2290118,50,-1),(366,6102005,2290103,50,-1),(367,6102005,2290047,50,-1),(368,6102005,2290091,50,-1),(369,6102005,2290053,50,-1),(370,6102005,2290061,50,-1),(371,6102005,2290011,50,-1),(372,6102005,2290089,50,-1),(373,3002000,4001162,1,-1),(374,3002001,4001163,1,-1),(375,6702000,4031595,1,-1),(376,6702003,1032043,5,-1),(377,6702003,1032044,5,-1),(378,6702003,1032045,5,-1),(379,6702003,1102099,20,-1),(380,6702003,1102100,20,-1),(381,6702003,1102101,50,-1),(382,6702003,1102102,50,-1),(383,6702003,1102103,50,-1),(384,6702003,1102104,50,-1),(385,6702003,1102105,50,-1),(386,6702003,1102106,50,-1),(387,6702003,4021007,5,-1),(388,6702003,4021008,5,-1),(389,6702003,4020007,5,-1),(390,6702003,4020007,5,-1),(391,6702003,4011006,5,-1),(392,6702003,2040759,50,-1),(393,6702003,2041035,20,-1),(394,6702003,2041037,20,-1),(395,6702003,2041039,20,-1),(396,6702003,2041041,20,-1),(397,6702003,2000005,5,-1),(398,6702003,2022179,4,-1),(399,6702003,2022180,5,-1),(400,6702003,2022181,5,-1),(401,6702003,2022182,5,-1),(402,6702003,2000005,5,-1),(403,6702003,2020010,5,-1),(404,6702003,2020013,5,-1),(405,6702003,3010011,50,-1),(406,6702003,3012000,100,-1),(407,6702003,3012005,100,-1),(408,6702004,1032043,5,-1),(409,6702004,1032044,5,-1),(410,6702004,1032045,5,-1),(411,6702004,1102099,20,-1),(412,6702004,1102100,20,-1),(413,6702004,1102101,50,-1),(414,6702004,1102102,50,-1),(415,6702004,1102103,50,-1),(416,6702004,1102104,50,-1),(417,6702004,1102105,50,-1),(418,6702004,1102106,50,-1),(419,6702004,4021007,5,-1),(420,6702004,4021008,5,-1),(421,6702004,4020007,5,-1),(422,6702004,4020007,5,-1),(423,6702004,4011006,5,-1),(424,6702004,2040759,50,-1),(425,6702004,2041035,20,-1),(426,6702004,2041037,20,-1),(427,6702004,2041039,20,-1),(428,6702004,2041041,20,-1),(429,6702004,2000005,5,-1),(430,6702004,2022179,4,-1),(431,6702004,2022180,5,-1),(432,6702004,2022181,5,-1),(433,6702004,2022182,5,-1),(434,6702004,2000005,5,-1),(435,6702004,2020010,5,-1),(436,6702004,2020013,5,-1),(437,6702004,3010011,50,-1),(438,6702004,3012000,100,-1),(439,6702004,3012005,100,-1),(440,6702005,1032043,5,-1),(441,6702005,1032044,5,-1),(442,6702005,1032045,5,-1),(443,6702005,1102099,20,-1),(444,6702005,1102100,20,-1),(445,6702005,1102101,50,-1),(446,6702005,1102102,50,-1),(447,6702005,1102103,50,-1),(448,6702005,1102104,50,-1),(449,6702005,1102105,50,-1),(450,6702005,1102106,50,-1),(451,6702005,4021007,5,-1),(452,6702005,4021008,5,-1),(453,6702005,4020007,5,-1),(454,6702005,4020007,5,-1),(455,6702005,4011006,5,-1),(456,6702005,2040759,50,-1),(457,6702005,2041035,20,-1),(458,6702005,2041037,20,-1),(459,6702005,2041039,20,-1),(460,6702005,2041041,20,-1),(461,6702005,2000005,5,-1),(462,6702005,2022179,4,-1),(463,6702005,2022180,5,-1),(464,6702005,2022181,5,-1),(465,6702005,2022182,5,-1),(466,6702005,2000005,5,-1),(467,6702005,2020010,5,-1),(468,6702005,2020013,5,-1),(469,6702005,3010011,50,-1),(470,6702005,3012000,100,-1),(471,6702005,3012005,100,-1),(472,6702006,1032043,5,-1),(473,6702006,1032044,5,-1),(474,6702006,1032045,5,-1),(475,6702006,1102099,20,-1),(476,6702006,1102100,20,-1),(477,6702006,1102101,50,-1),(478,6702006,1102102,50,-1),(479,6702006,1102103,50,-1),(480,6702006,1102104,50,-1),(481,6702006,1102105,50,-1),(482,6702006,1102106,50,-1),(483,6702006,4021007,5,-1),(484,6702006,4021008,5,-1),(485,6702006,4020007,5,-1),(486,6702006,4020007,5,-1),(487,6702006,4011006,5,-1),(488,6702006,2040759,50,-1),(489,6702006,2041035,20,-1),(490,6702006,2041037,20,-1),(491,6702006,2041039,20,-1),(492,6702006,2041041,20,-1),(493,6702006,2000005,5,-1),(494,6702006,2022179,4,-1),(495,6702006,2022180,5,-1),(496,6702006,2022181,5,-1),(497,6702006,2022182,5,-1),(498,6702006,2000005,5,-1),(499,6702006,2020010,5,-1),(500,6702006,2020013,5,-1),(501,6702006,3010011,50,-1),(502,6702006,3012000,100,-1),(503,6702006,3012005,100,-1),(504,6702007,1032043,5,-1),(505,6702007,1032044,5,-1),(506,6702007,1032045,5,-1),(507,6702007,1102099,20,-1),(508,6702007,1102100,20,-1),(509,6702007,1102101,50,-1),(510,6702007,1102102,50,-1),(511,6702007,1102103,50,-1),(512,6702007,1102104,50,-1),(513,6702007,1102105,50,-1),(514,6702007,1102106,50,-1),(515,6702007,4021007,5,-1),(516,6702007,4021008,5,-1),(517,6702007,4020007,5,-1),(518,6702007,4020007,5,-1),(519,6702007,4011006,5,-1),(520,6702007,2040759,50,-1),(521,6702007,2041035,20,-1),(522,6702007,2041037,20,-1),(523,6702007,2041039,20,-1),(524,6702007,2041041,20,-1),(525,6702007,2000005,5,-1),(526,6702007,2022179,4,-1),(527,6702007,2022180,5,-1),(528,6702007,2022181,5,-1),(529,6702007,2022182,5,-1),(530,6702007,2000005,5,-1),(531,6702007,2020010,5,-1),(532,6702007,2020013,5,-1),(533,6702007,3010011,50,-1),(534,6702007,3012000,100,-1),(535,6702007,3012005,100,-1),(536,6702008,1032043,5,-1),(537,6702008,1032044,5,-1),(538,6702008,1032045,5,-1),(539,6702008,1102099,20,-1),(540,6702008,1102100,20,-1),(541,6702008,1102101,50,-1),(542,6702008,1102102,50,-1),(543,6702008,1102103,50,-1),(544,6702008,1102104,50,-1),(545,6702008,1102105,50,-1),(546,6702008,1102106,50,-1),(547,6702008,4021007,5,-1),(548,6702008,4021008,5,-1),(549,6702008,4020007,5,-1),(550,6702008,4020007,5,-1),(551,6702008,4011006,5,-1),(552,6702008,2040759,50,-1),(553,6702008,2041035,20,-1),(554,6702008,2041037,20,-1),(555,6702008,2041039,20,-1),(556,6702008,2041041,20,-1),(557,6702008,2000005,5,-1),(558,6702008,2022179,4,-1),(559,6702008,2022180,5,-1),(560,6702008,2022181,5,-1),(561,6702008,2022182,5,-1),(562,6702008,2000005,5,-1),(563,6702008,2020010,5,-1),(564,6702008,2020013,5,-1),(565,6702008,3010011,50,-1),(566,6702008,3012000,100,-1),(567,6702008,3012005,100,-1),(568,6702009,1032043,5,-1),(569,6702009,1032044,5,-1),(570,6702009,1032045,5,-1),(571,6702009,1102099,20,-1),(572,6702009,1102100,20,-1),(573,6702009,1102101,50,-1),(574,6702009,1102102,50,-1),(575,6702009,1102103,50,-1),(576,6702009,1102104,50,-1),(577,6702009,1102105,50,-1),(578,6702009,1102106,50,-1),(579,6702009,4021007,5,-1),(580,6702009,4021008,5,-1),(581,6702009,4020007,5,-1),(582,6702009,4020007,5,-1),(583,6702009,4011006,5,-1),(584,6702009,2040759,50,-1),(585,6702009,2041035,20,-1),(586,6702009,2041037,20,-1),(587,6702009,2041039,20,-1),(588,6702009,2041041,20,-1),(589,6702009,2000005,5,-1),(590,6702009,2022179,4,-1),(591,6702009,2022180,5,-1),(592,6702009,2022181,5,-1),(593,6702009,2022182,5,-1),(594,6702009,2000005,5,-1),(595,6702009,2020010,5,-1),(596,6702009,2020013,5,-1),(597,6702009,3010011,50,-1),(598,6702009,3012000,100,-1),(599,6702009,3012005,100,-1),(600,6702010,1032043,5,-1),(601,6702010,1032044,5,-1),(602,6702010,1032045,5,-1),(603,6702010,1102099,20,-1),(604,6702010,1102100,20,-1),(605,6702010,1102101,50,-1),(606,6702010,1102102,50,-1),(607,6702010,1102103,50,-1),(608,6702010,1102104,50,-1),(609,6702010,1102105,50,-1),(610,6702010,1102106,50,-1),(611,6702010,4021007,5,-1),(612,6702010,4021008,5,-1),(613,6702010,4020007,5,-1),(614,6702010,4020007,5,-1),(615,6702010,4011006,5,-1),(616,6702010,2040759,50,-1),(617,6702010,2041035,20,-1),(618,6702010,2041037,20,-1),(619,6702010,2041039,20,-1),(620,6702010,2041041,20,-1),(621,6702010,2000005,5,-1),(622,6702010,2022179,4,-1),(623,6702010,2022180,5,-1),(624,6702010,2022181,5,-1),(625,6702010,2022182,5,-1),(626,6702010,2000005,5,-1),(627,6702010,2020010,5,-1),(628,6702010,2020013,5,-1),(629,6702010,3010011,50,-1),(630,6702010,3012000,100,-1),(631,6702010,3012005,100,-1),(632,6702011,1032043,5,-1),(633,6702011,1032044,5,-1),(634,6702011,1032045,5,-1),(635,6702011,1102099,20,-1),(636,6702011,1102100,20,-1),(637,6702011,1102101,50,-1),(638,6702011,1102102,50,-1),(639,6702011,1102103,50,-1),(640,6702011,1102104,50,-1),(641,6702011,1102105,50,-1),(642,6702011,1102106,50,-1),(643,6702011,4021007,5,-1),(644,6702011,4021008,5,-1),(645,6702011,4020007,5,-1),(646,6702011,4020007,5,-1),(647,6702011,4011006,5,-1),(648,6702011,2040759,50,-1),(649,6702011,2041035,20,-1),(650,6702011,2041037,20,-1),(651,6702011,2041039,20,-1),(652,6702011,2041041,20,-1),(653,6702011,2000005,5,-1),(654,6702011,2022179,4,-1),(655,6702011,2022180,5,-1),(656,6702011,2022181,5,-1),(657,6702011,2022182,5,-1),(658,6702011,2000005,5,-1),(659,6702011,2020010,5,-1),(660,6702011,2020013,5,-1),(661,6702011,3010011,50,-1),(662,6702011,3012000,100,-1),(663,6702011,3012005,100,-1),(664,6702012,1032043,5,-1),(665,6702012,1032044,5,-1),(666,6702012,1032045,5,-1),(667,6702012,1102099,20,-1),(668,6702012,1102100,20,-1),(669,6702012,1102101,50,-1),(670,6702012,1102102,50,-1),(671,6702012,1102103,50,-1),(672,6702012,1102104,50,-1),(673,6702012,1102105,50,-1),(674,6702012,1102106,50,-1),(675,6702012,4021007,5,-1),(676,6702012,4021008,5,-1),(677,6702012,4020007,5,-1),(678,6702012,4020007,5,-1),(679,6702012,4011006,5,-1),(680,6702012,2040759,50,-1),(681,6702012,2041035,20,-1),(682,6702012,2041037,20,-1),(683,6702012,2041039,20,-1),(684,6702012,2041041,20,-1),(685,6702012,2000005,5,-1),(686,6702012,2022179,5,-1),(687,6702012,2022180,5,-1),(688,6702012,2022181,5,-1),(689,6702012,2022182,5,-1),(690,6702012,2000005,5,-1),(691,6702012,2020010,5,-1),(692,6702012,2020013,5,-1),(693,6702012,3010011,50,-1),(694,6702012,3012000,100,-1),(695,6702012,3012005,100,-1),(696,1032000,4001363,1,-1),(697,1032000,4001362,1,-1),(698,2512000,2022131,1,-1),(699,2512000,2022132,1,-1),(700,2612002,4001134,1,-1),(701,2612001,4001135,1,-1),(754,200002,4010001,1,-1),(753,200001,4020001,1,-1),(704,9102003,4001095,3,-1),(705,9102003,4001096,3,-1),(706,9102004,4001096,3,-1),(707,9102004,4001097,3,-1),(708,9102005,4001097,3,-1),(709,9102005,4001098,3,-1),(710,9102006,4001098,3,-1),(711,9102006,4001099,3,-1),(712,9102007,4001099,3,-1),(713,9102007,4001100,3,-1),(714,2002001,4001063,1,-1),(715,2002002,4001052,1,-1),(716,2002003,4001055,1,-1),(717,2002004,4001056,1,-1),(718,2002005,4001057,1,-1),(719,2002006,4001058,1,-1),(720,2002007,4001059,1,-1),(721,2002008,4001060,1,-1),(722,2002009,4001061,1,-1),(723,2002010,4001062,1,-1),(724,2002011,4001046,1,-1),(725,2002012,4001047,1,-1),(726,2002013,4001049,1,-1),(727,2002017,4001158,1,-1),(728,2002018,4001158,1,-1),(729,3102000,4000276,1,-1),(730,6102002,1382060,50,-1),(731,6102003,1382060,50,-1),(732,6102004,1382060,50,-1),(733,6102005,1382060,50,-1),(734,6102002,1442068,50,-1),(735,6102003,1442068,50,-1),(736,6102004,1442068,50,-1),(737,6102005,1442068,50,-1),(738,6102002,1452060,50,-1),(739,6102003,1452060,50,-1),(740,6102004,1452060,50,-1),(741,6102005,1452060,50,-1),(742,3102000,2022712,1,-1),(743,2502002,2022252,1,-1),(744,1202002,4031843,1,2169),(752,200001,4010005,1,-1),(751,200000,4020004,1,-1),(750,200000,4010004,1,-1),(749,9102002,4001453,1,-1),(755,200002,4020005,1,-1),(756,200003,4010000,1,-1),(757,200003,4010003,1,-1),(758,200004,4004002,1,-1),(759,200004,4010002,1,-1),(760,200004,4020003,1,-1),(761,200005,4010006,1,-1),(762,200005,4020006,1,-1),(763,200006,4020002,1,-1),(764,200006,4020007,1,-1),(765,200007,4004000,1,-1),(766,200007,4020000,1,-1),(767,200008,4004004,1,-1),(768,200008,4020008,1,-1),(769,200009,4004001,1,-1),(770,200009,4004003,1,-1),(771,200009,4010008,1,-1),(772,200010,4010008,1,-1),(773,200000,4010010,1,-1),(774,200001,4010010,1,-1),(775,200002,4010010,1,-1),(776,200003,4010010,1,-1),(777,200004,4010010,1,-1),(778,200005,4010010,1,-1),(779,200006,4010010,1,-1),(780,200007,4010010,1,-1),(781,200008,4010010,1,-1),(782,200009,4010010,1,-1),(783,200011,4010010,1,-1),(784,200011,4010010,1,-1),(785,200011,4010010,1,-1),(786,200011,4010010,1,-1),(787,200011,4010010,1,-1),(788,200011,4010010,1,-1),(789,200011,4010010,1,-1),(790,200011,4010010,1,-1),(791,200011,4010010,1,-1),(792,200011,4010010,1,-1),(793,100000,4022023,1,-1),(794,100001,4022023,1,-1),(795,100002,4022023,1,-1),(796,100003,4022023,1,-1),(797,100004,4022023,1,-1),(798,100005,4022023,1,-1),(799,100006,4022023,1,-1),(800,100007,4022023,1,-1),(801,100008,4022023,1,-1),(802,100009,4022023,1,-1),(803,100011,4022023,1,-1),(804,100011,4022023,1,-1),(805,100011,4022023,1,-1),(806,100011,4022023,1,-1),(807,100011,4022023,1,-1),(808,100011,4022023,1,-1),(809,100011,4022023,1,-1),(810,100011,4022023,1,-1),(811,100011,4022023,1,-1),(812,100011,4022023,1,-1),(813,100000,4022000,1,-1),(814,100000,4022001,1,-1),(815,100001,4022002,1,-1),(816,100001,4022003,1,-1),(817,100002,4022004,1,-1),(818,100002,4022005,1,-1),(819,100003,4022006,1,-1),(820,100003,4022007,1,-1),(821,100004,4022008,1,-1),(822,100004,4022009,1,-1),(823,100005,4022010,1,-1),(824,100005,4022011,1,-1),(825,100006,4022012,1,-1),(826,100006,4022013,1,-1),(827,100007,4022014,1,-1),(828,100007,4022015,1,-1),(829,100008,4022016,1,-1),(830,100008,4022017,1,-1),(831,100009,4022018,1,-1),(832,100009,4022019,1,-1),(833,100009,4022020,1,-1),(834,100009,4022021,1,-1),(835,100010,4022022,1,-1),(836,1002009,4031161,1,1008),(837,1002009,4031162,1,1008),(838,1209001,4032980,1,2565),(839,1052001,1532022,3,-1),(840,1052001,1532023,3,-1);

-- ----------------------------
-- Table structure for `reports`
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reporttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reporterid` int(11) NOT NULL,
  `victimid` int(11) NOT NULL,
  `reason` tinyint(4) NOT NULL,
  `chatlog` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reports
-- ----------------------------

-- ----------------------------
-- Table structure for `responses`
-- ----------------------------
DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses` (
  `chat` text,
  `response` text,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of responses
-- ----------------------------

-- ----------------------------
-- Table structure for `rings`
-- ----------------------------
DROP TABLE IF EXISTS `rings`;
CREATE TABLE `rings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerRingId` int(11) NOT NULL DEFAULT '0',
  `partnerChrId` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `partnername` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rings
-- ----------------------------

-- ----------------------------
-- Table structure for `savedlocations`
-- ----------------------------
DROP TABLE IF EXISTS `savedlocations`;
CREATE TABLE `savedlocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL,
  `locationtype` enum('FREE_MARKET','WORLDTOUR','FLORINA','INTRO','MIRROR','EVENT') NOT NULL,
  `map` int(11) NOT NULL,
  `portal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `savedlocations_ibfk_1` (`characterid`),
  CONSTRAINT `savedlocations_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of savedlocations
-- ----------------------------

-- ----------------------------
-- Table structure for `shopitems`
-- ----------------------------
DROP TABLE IF EXISTS `shopitems`;
CREATE TABLE `shopitems` (
  `shopitemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(10) unsigned NOT NULL,
  `itemid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pitch` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL COMMENT 'sort is an arbitrary field designed to give leeway when modifying shops. The lowest number is 104 and it increments by 4 for each item to allow decent space for swapping/inserting/removing items.',
  PRIMARY KEY (`shopitemid`)
) ENGINE=MyISAM AUTO_INCREMENT=20021 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shopitems
-- ----------------------------
INSERT INTO `shopitems` VALUES ('1', '11000', '1332005', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2', '11000', '1322005', '50', '0', '108');
INSERT INTO `shopitems` VALUES ('3', '11000', '1312004', '50', '0', '112');
INSERT INTO `shopitems` VALUES ('4', '11000', '1302000', '50', '0', '116');
INSERT INTO `shopitems` VALUES ('5', '11100', '2010002', '50', '0', '104');
INSERT INTO `shopitems` VALUES ('6', '11100', '2010000', '30', '0', '108');
INSERT INTO `shopitems` VALUES ('7', '11100', '2000002', '320', '0', '112');
INSERT INTO `shopitems` VALUES ('8', '11100', '2000001', '160', '0', '116');
INSERT INTO `shopitems` VALUES ('9', '11100', '2000000', '50', '0', '120');
INSERT INTO `shopitems` VALUES ('10', '21000', '1072005', '50', '0', '104');
INSERT INTO `shopitems` VALUES ('11', '21000', '1072001', '50', '0', '108');
INSERT INTO `shopitems` VALUES ('12', '21000', '1061008', '50', '0', '112');
INSERT INTO `shopitems` VALUES ('13', '21000', '1061002', '50', '0', '116');
INSERT INTO `shopitems` VALUES ('14', '21000', '1060006', '50', '0', '120');
INSERT INTO `shopitems` VALUES ('15', '21000', '1060002', '50', '0', '124');
INSERT INTO `shopitems` VALUES ('16', '21000', '1041011', '50', '0', '128');
INSERT INTO `shopitems` VALUES ('17', '21000', '1041010', '50', '0', '132');
INSERT INTO `shopitems` VALUES ('18', '21000', '1041006', '50', '0', '136');
INSERT INTO `shopitems` VALUES ('19', '21000', '1041002', '50', '0', '140');
INSERT INTO `shopitems` VALUES ('20', '21000', '1040010', '50', '0', '144');
INSERT INTO `shopitems` VALUES ('21', '21000', '1040006', '50', '0', '148');
INSERT INTO `shopitems` VALUES ('22', '21000', '1040002', '50', '0', '152');
INSERT INTO `shopitems` VALUES ('23', '1001000', '1332007', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('24', '1001000', '1312000', '3000', '0', '108');
INSERT INTO `shopitems` VALUES ('25', '1001000', '1302007', '3000', '0', '112');
INSERT INTO `shopitems` VALUES ('26', '1001000', '1322005', '50', '0', '116');
INSERT INTO `shopitems` VALUES ('27', '1001000', '1312004', '50', '0', '120');
INSERT INTO `shopitems` VALUES ('28', '1001000', '1302000', '50', '0', '124');
INSERT INTO `shopitems` VALUES ('29', '1001001', '3010001', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('30', '1001001', '1092003', '2000', '0', '108');
INSERT INTO `shopitems` VALUES ('31', '1001001', '1072063', '10000', '0', '112');
INSERT INTO `shopitems` VALUES ('32', '1001001', '1072062', '10000', '0', '116');
INSERT INTO `shopitems` VALUES ('33', '1001001', '1072017', '10000', '0', '120');
INSERT INTO `shopitems` VALUES ('34', '1001001', '1072049', '5000', '0', '124');
INSERT INTO `shopitems` VALUES ('35', '1001001', '1072048', '5000', '0', '128');
INSERT INTO `shopitems` VALUES ('36', '1001001', '1072008', '5000', '0', '132');
INSERT INTO `shopitems` VALUES ('37', '1001001', '1072005', '50', '0', '136');
INSERT INTO `shopitems` VALUES ('38', '1001001', '1072038', '50', '0', '140');
INSERT INTO `shopitems` VALUES ('39', '1001001', '1072037', '50', '0', '144');
INSERT INTO `shopitems` VALUES ('40', '1001001', '1072001', '50', '0', '148');
INSERT INTO `shopitems` VALUES ('41', '1001001', '1062001', '4800', '0', '152');
INSERT INTO `shopitems` VALUES ('42', '1001001', '1062000', '4800', '0', '156');
INSERT INTO `shopitems` VALUES ('43', '1001001', '1060004', '2800', '0', '160');
INSERT INTO `shopitems` VALUES ('44', '1001001', '1060007', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('45', '1001001', '1041012', '3000', '0', '168');
INSERT INTO `shopitems` VALUES ('46', '1001001', '1041004', '3000', '0', '172');
INSERT INTO `shopitems` VALUES ('47', '1001001', '1040014', '3000', '0', '176');
INSERT INTO `shopitems` VALUES ('48', '1001001', '1040013', '3000', '0', '180');
INSERT INTO `shopitems` VALUES ('49', '1001001', '1002001', '3000', '0', '184');
INSERT INTO `shopitems` VALUES ('50', '1001001', '1002019', '2000', '0', '188');
INSERT INTO `shopitems` VALUES ('51', '1001001', '1002134', '800', '0', '192');
INSERT INTO `shopitems` VALUES ('52', '1001001', '1002133', '800', '0', '196');
INSERT INTO `shopitems` VALUES ('53', '1001001', '1002132', '800', '0', '200');
INSERT INTO `shopitems` VALUES ('54', '1001001', '1002069', '450', '0', '204');
INSERT INTO `shopitems` VALUES ('55', '1001001', '1002068', '450', '0', '208');
INSERT INTO `shopitems` VALUES ('56', '1001001', '1002067', '450', '0', '212');
INSERT INTO `shopitems` VALUES ('57', '1001001', '1002066', '450', '0', '216');
INSERT INTO `shopitems` VALUES ('58', '1001001', '1002014', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('59', '1001001', '1002008', '500', '0', '224');
INSERT INTO `shopitems` VALUES ('60', '1001100', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('61', '1001100', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('62', '1001100', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('63', '1001100', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('64', '1001100', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('65', '1001100', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('66', '1001100', '2030001', '500', '0', '128');
INSERT INTO `shopitems` VALUES ('67', '1001100', '2030000', '400', '0', '132');
INSERT INTO `shopitems` VALUES ('68', '1001100', '2020028', '3000', '0', '136');
INSERT INTO `shopitems` VALUES ('69', '1001100', '2010004', '310', '0', '140');
INSERT INTO `shopitems` VALUES ('70', '1001100', '2010003', '100', '0', '144');
INSERT INTO `shopitems` VALUES ('71', '1001100', '2010001', '106', '0', '148');
INSERT INTO `shopitems` VALUES ('72', '1001100', '2010002', '50', '0', '152');
INSERT INTO `shopitems` VALUES ('73', '1001100', '2010000', '30', '0', '156');
INSERT INTO `shopitems` VALUES ('74', '1001100', '2002005', '500', '0', '160');
INSERT INTO `shopitems` VALUES ('75', '1001100', '2002004', '500', '0', '164');
INSERT INTO `shopitems` VALUES ('76', '1001100', '2002002', '500', '0', '168');
INSERT INTO `shopitems` VALUES ('77', '1001100', '2002001', '400', '0', '172');
INSERT INTO `shopitems` VALUES ('78', '1001100', '2002000', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('79', '1001100', '2000006', '620', '0', '180');
INSERT INTO `shopitems` VALUES ('80', '1001100', '2000003', '200', '0', '184');
INSERT INTO `shopitems` VALUES ('81', '1001100', '2000002', '320', '0', '188');
INSERT INTO `shopitems` VALUES ('82', '1001100', '2000001', '160', '0', '192');
INSERT INTO `shopitems` VALUES ('83', '1001100', '2000000', '50', '0', '196');
INSERT INTO `shopitems` VALUES ('84', '1011000', '1442004', '24000', '0', '104');
INSERT INTO `shopitems` VALUES ('85', '1011000', '1422004', '20000', '0', '108');
INSERT INTO `shopitems` VALUES ('86', '1011000', '1322008', '12000', '0', '112');
INSERT INTO `shopitems` VALUES ('87', '1011000', '1322007', '6000', '0', '116');
INSERT INTO `shopitems` VALUES ('88', '1011000', '1302007', '3000', '0', '120');
INSERT INTO `shopitems` VALUES ('89', '1011000', '1462000', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('90', '1011000', '1462003', '12000', '0', '128');
INSERT INTO `shopitems` VALUES ('91', '1011000', '1462002', '8000', '0', '132');
INSERT INTO `shopitems` VALUES ('92', '1011000', '1462001', '4000', '0', '136');
INSERT INTO `shopitems` VALUES ('93', '1011000', '1452000', '20000', '0', '140');
INSERT INTO `shopitems` VALUES ('94', '1011000', '1452001', '10000', '0', '144');
INSERT INTO `shopitems` VALUES ('95', '1011000', '1452003', '6000', '0', '148');
INSERT INTO `shopitems` VALUES ('96', '1011000', '1452002', '3000', '0', '152');
INSERT INTO `shopitems` VALUES ('97', '1011001', '1072064', '30000', '0', '104');
INSERT INTO `shopitems` VALUES ('98', '1011001', '1072018', '30000', '0', '108');
INSERT INTO `shopitems` VALUES ('99', '1011001', '1072056', '15000', '0', '112');
INSERT INTO `shopitems` VALUES ('100', '1011001', '1072055', '15000', '0', '116');
INSERT INTO `shopitems` VALUES ('101', '1011001', '1072054', '15000', '0', '120');
INSERT INTO `shopitems` VALUES ('102', '1011001', '1072012', '15000', '0', '124');
INSERT INTO `shopitems` VALUES ('103', '1011001', '1072068', '9000', '0', '128');
INSERT INTO `shopitems` VALUES ('104', '1011001', '1072067', '9000', '0', '132');
INSERT INTO `shopitems` VALUES ('105', '1011001', '1072026', '9000', '0', '136');
INSERT INTO `shopitems` VALUES ('106', '1011001', '1072025', '9000', '0', '140');
INSERT INTO `shopitems` VALUES ('107', '1011001', '1072061', '4500', '0', '144');
INSERT INTO `shopitems` VALUES ('108', '1011001', '1072060', '4500', '0', '148');
INSERT INTO `shopitems` VALUES ('109', '1011001', '1072016', '4500', '0', '152');
INSERT INTO `shopitems` VALUES ('110', '1011001', '1072059', '1800', '0', '156');
INSERT INTO `shopitems` VALUES ('111', '1011001', '1072015', '1800', '0', '160');
INSERT INTO `shopitems` VALUES ('112', '1011001', '1062006', '13000', '0', '164');
INSERT INTO `shopitems` VALUES ('113', '1011001', '1062002', '9000', '0', '168');
INSERT INTO `shopitems` VALUES ('114', '1011001', '1062004', '3000', '0', '172');
INSERT INTO `shopitems` VALUES ('115', '1011001', '1061052', '44000', '0', '176');
INSERT INTO `shopitems` VALUES ('116', '1011001', '1061051', '44000', '0', '180');
INSERT INTO `shopitems` VALUES ('117', '1011001', '1061050', '44000', '0', '184');
INSERT INTO `shopitems` VALUES ('118', '1011001', '1061026', '9000', '0', '188');
INSERT INTO `shopitems` VALUES ('119', '1011001', '1061025', '9000', '0', '192');
INSERT INTO `shopitems` VALUES ('120', '1011001', '1061024', '9000', '0', '196');
INSERT INTO `shopitems` VALUES ('121', '1011001', '1061059', '5000', '0', '200');
INSERT INTO `shopitems` VALUES ('122', '1011001', '1061058', '5000', '0', '204');
INSERT INTO `shopitems` VALUES ('123', '1011001', '1061006', '5000', '0', '208');
INSERT INTO `shopitems` VALUES ('124', '1011001', '1061057', '3000', '0', '212');
INSERT INTO `shopitems` VALUES ('125', '1011001', '1061009', '3000', '0', '216');
INSERT INTO `shopitems` VALUES ('126', '1011001', '1060059', '44000', '0', '220');
INSERT INTO `shopitems` VALUES ('127', '1011001', '1060058', '44000', '0', '224');
INSERT INTO `shopitems` VALUES ('128', '1011001', '1060057', '44000', '0', '228');
INSERT INTO `shopitems` VALUES ('129', '1011001', '1060056', '44000', '0', '232');
INSERT INTO `shopitems` VALUES ('130', '1011001', '1060005', '14000', '0', '236');
INSERT INTO `shopitems` VALUES ('131', '1011001', '1041056', '50000', '0', '240');
INSERT INTO `shopitems` VALUES ('132', '1011001', '1041055', '50000', '0', '244');
INSERT INTO `shopitems` VALUES ('133', '1011001', '1041054', '50000', '0', '248');
INSERT INTO `shopitems` VALUES ('134', '1011001', '1041035', '15000', '0', '252');
INSERT INTO `shopitems` VALUES ('135', '1011001', '1041034', '15000', '0', '256');
INSERT INTO `shopitems` VALUES ('136', '1011001', '1041033', '15000', '0', '260');
INSERT INTO `shopitems` VALUES ('137', '1011001', '1041032', '15000', '0', '264');
INSERT INTO `shopitems` VALUES ('138', '1011001', '1041028', '9000', '0', '268');
INSERT INTO `shopitems` VALUES ('139', '1011001', '1041027', '9000', '0', '272');
INSERT INTO `shopitems` VALUES ('140', '1011001', '1041013', '9000', '0', '276');
INSERT INTO `shopitems` VALUES ('141', '1011001', '1041063', '5500', '0', '280');
INSERT INTO `shopitems` VALUES ('142', '1011001', '1041062', '5500', '0', '284');
INSERT INTO `shopitems` VALUES ('143', '1011001', '1041008', '5500', '0', '288');
INSERT INTO `shopitems` VALUES ('144', '1011001', '1041061', '3200', '0', '292');
INSERT INTO `shopitems` VALUES ('145', '1011001', '1041007', '3200', '0', '296');
INSERT INTO `shopitems` VALUES ('146', '1011001', '1040070', '50000', '0', '300');
INSERT INTO `shopitems` VALUES ('147', '1011001', '1040069', '50000', '0', '304');
INSERT INTO `shopitems` VALUES ('148', '1011001', '1040068', '50000', '0', '308');
INSERT INTO `shopitems` VALUES ('149', '1011001', '1040067', '50000', '0', '312');
INSERT INTO `shopitems` VALUES ('150', '1011001', '1040025', '15000', '0', '316');
INSERT INTO `shopitems` VALUES ('151', '1011001', '1040024', '15000', '0', '320');
INSERT INTO `shopitems` VALUES ('152', '1011001', '1040023', '15000', '0', '324');
INSERT INTO `shopitems` VALUES ('153', '1011001', '1040022', '15000', '0', '328');
INSERT INTO `shopitems` VALUES ('154', '1011001', '1040003', '9000', '0', '332');
INSERT INTO `shopitems` VALUES ('155', '1011001', '1040011', '5500', '0', '336');
INSERT INTO `shopitems` VALUES ('156', '1011001', '1040007', '5500', '0', '340');
INSERT INTO `shopitems` VALUES ('157', '1011001', '1040071', '3200', '0', '344');
INSERT INTO `shopitems` VALUES ('158', '1011001', '1040008', '3200', '0', '348');
INSERT INTO `shopitems` VALUES ('159', '1011001', '1032003', '7000', '0', '352');
INSERT INTO `shopitems` VALUES ('160', '1011001', '1032001', '7000', '0', '356');
INSERT INTO `shopitems` VALUES ('161', '1011001', '1002165', '30000', '0', '360');
INSERT INTO `shopitems` VALUES ('162', '1011001', '1002164', '30000', '0', '364');
INSERT INTO `shopitems` VALUES ('163', '1011001', '1002163', '30000', '0', '368');
INSERT INTO `shopitems` VALUES ('164', '1011001', '1002162', '30000', '0', '372');
INSERT INTO `shopitems` VALUES ('165', '1011001', '1002161', '30000', '0', '376');
INSERT INTO `shopitems` VALUES ('166', '1011001', '1002160', '20000', '0', '380');
INSERT INTO `shopitems` VALUES ('167', '1011001', '1002159', '20000', '0', '384');
INSERT INTO `shopitems` VALUES ('168', '1011001', '1002158', '20000', '0', '388');
INSERT INTO `shopitems` VALUES ('169', '1011001', '1002157', '20000', '0', '392');
INSERT INTO `shopitems` VALUES ('170', '1011001', '1002156', '20000', '0', '396');
INSERT INTO `shopitems` VALUES ('171', '1011001', '1002057', '800', '0', '400');
INSERT INTO `shopitems` VALUES ('172', '1011001', '1002010', '800', '0', '404');
INSERT INTO `shopitems` VALUES ('173', '1011001', '1002121', '12000', '0', '408');
INSERT INTO `shopitems` VALUES ('174', '1011001', '1002120', '12000', '0', '412');
INSERT INTO `shopitems` VALUES ('175', '1011001', '1002119', '12000', '0', '416');
INSERT INTO `shopitems` VALUES ('176', '1011001', '1002118', '12000', '0', '420');
INSERT INTO `shopitems` VALUES ('177', '1011001', '1002117', '12000', '0', '424');
INSERT INTO `shopitems` VALUES ('178', '1011001', '1002116', '4000', '0', '428');
INSERT INTO `shopitems` VALUES ('179', '1011001', '1002115', '4000', '0', '432');
INSERT INTO `shopitems` VALUES ('180', '1011001', '1002114', '4000', '0', '436');
INSERT INTO `shopitems` VALUES ('181', '1011001', '1002113', '4000', '0', '440');
INSERT INTO `shopitems` VALUES ('182', '1011001', '1002112', '4000', '0', '444');
INSERT INTO `shopitems` VALUES ('183', '1011001', '1002063', '3000', '0', '448');
INSERT INTO `shopitems` VALUES ('184', '1011001', '1002062', '3000', '0', '452');
INSERT INTO `shopitems` VALUES ('185', '1011001', '1002061', '3000', '0', '456');
INSERT INTO `shopitems` VALUES ('186', '1011001', '1002060', '3000', '0', '460');
INSERT INTO `shopitems` VALUES ('187', '1011001', '1002012', '3000', '0', '464');
INSERT INTO `shopitems` VALUES ('188', '1011001', '1002033', '3000', '0', '468');
INSERT INTO `shopitems` VALUES ('189', '1011001', '1002008', '500', '0', '472');
INSERT INTO `shopitems` VALUES ('190', '1011100', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('191', '1011100', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('192', '1011100', '2050002', '300', '0', '112');
INSERT INTO `shopitems` VALUES ('193', '1011100', '2050001', '200', '0', '116');
INSERT INTO `shopitems` VALUES ('194', '1011100', '2050000', '200', '0', '120');
INSERT INTO `shopitems` VALUES ('195', '1011100', '2061000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('196', '1011100', '2060000', '1400', '0', '128');
INSERT INTO `shopitems` VALUES ('197', '1011100', '2061000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('198', '1011100', '2060000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('199', '1011100', '2030004', '500', '0', '140');
INSERT INTO `shopitems` VALUES ('200', '1011100', '2030000', '400', '0', '144');
INSERT INTO `shopitems` VALUES ('201', '1011100', '2020028', '3000', '0', '148');
INSERT INTO `shopitems` VALUES ('202', '1011100', '2010004', '310', '0', '152');
INSERT INTO `shopitems` VALUES ('203', '1011100', '2010003', '100', '0', '156');
INSERT INTO `shopitems` VALUES ('204', '1011100', '2010001', '106', '0', '160');
INSERT INTO `shopitems` VALUES ('205', '1011100', '2010002', '50', '0', '164');
INSERT INTO `shopitems` VALUES ('206', '1011100', '2010000', '30', '0', '168');
INSERT INTO `shopitems` VALUES ('207', '1011100', '2002005', '500', '0', '172');
INSERT INTO `shopitems` VALUES ('208', '1011100', '2002004', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('209', '1011100', '2002002', '500', '0', '180');
INSERT INTO `shopitems` VALUES ('210', '1011100', '2002001', '400', '0', '184');
INSERT INTO `shopitems` VALUES ('211', '1011100', '2002000', '500', '0', '188');
INSERT INTO `shopitems` VALUES ('212', '1011100', '2000006', '620', '0', '192');
INSERT INTO `shopitems` VALUES ('213', '1011100', '2000003', '200', '0', '196');
INSERT INTO `shopitems` VALUES ('214', '1011100', '2000002', '320', '0', '200');
INSERT INTO `shopitems` VALUES ('215', '1011100', '2000001', '160', '0', '204');
INSERT INTO `shopitems` VALUES ('216', '1011100', '2000000', '50', '0', '208');
INSERT INTO `shopitems` VALUES ('217', '1012004', '4160019', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('218', '1012004', '4160039', '1000', '0', '108');
INSERT INTO `shopitems` VALUES ('219', '1012004', '4160037', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('220', '1012004', '4031993', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('221', '1012004', '4160036', '1000', '0', '120');
INSERT INTO `shopitems` VALUES ('222', '1012004', '4160035', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('223', '1012004', '4160034', '1000', '0', '128');
INSERT INTO `shopitems` VALUES ('224', '1012004', '4160032', '1000', '0', '132');
INSERT INTO `shopitems` VALUES ('225', '1012004', '4160024', '1000', '0', '136');
INSERT INTO `shopitems` VALUES ('226', '1012004', '4160023', '1000', '0', '140');
INSERT INTO `shopitems` VALUES ('227', '1012004', '4160022', '1000', '0', '144');
INSERT INTO `shopitems` VALUES ('228', '1012004', '4160015', '1000', '0', '148');
INSERT INTO `shopitems` VALUES ('229', '1012004', '4160012', '1000', '0', '152');
INSERT INTO `shopitems` VALUES ('230', '1012004', '4160013', '1000', '0', '156');
INSERT INTO `shopitems` VALUES ('231', '1012004', '4160017', '1000', '0', '160');
INSERT INTO `shopitems` VALUES ('232', '1012004', '4160014', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('233', '1012004', '4160020', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('234', '1012004', '4160010', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('235', '1012004', '4160009', '1000', '0', '176');
INSERT INTO `shopitems` VALUES ('236', '1012004', '4160008', '1000', '0', '180');
INSERT INTO `shopitems` VALUES ('237', '1012004', '4160007', '1000', '0', '184');
INSERT INTO `shopitems` VALUES ('238', '1012004', '4160006', '1000', '0', '188');
INSERT INTO `shopitems` VALUES ('239', '1012004', '4160005', '1000', '0', '192');
INSERT INTO `shopitems` VALUES ('240', '1012004', '4160004', '1000', '0', '196');
INSERT INTO `shopitems` VALUES ('241', '1012004', '4160003', '1000', '0', '200');
INSERT INTO `shopitems` VALUES ('242', '1012004', '4160002', '1000', '0', '204');
INSERT INTO `shopitems` VALUES ('243', '1012004', '4160001', '1000', '0', '208');
INSERT INTO `shopitems` VALUES ('244', '1012004', '4160000', '1000', '0', '212');
INSERT INTO `shopitems` VALUES ('245', '1012004', '4160026', '1000', '0', '216');
INSERT INTO `shopitems` VALUES ('246', '1012004', '2260000', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('247', '1012004', '2120000', '30', '0', '224');
INSERT INTO `shopitems` VALUES ('248', '1021000', '1442004', '24000', '0', '104');
INSERT INTO `shopitems` VALUES ('249', '1021000', '1442007', '12000', '0', '108');
INSERT INTO `shopitems` VALUES ('250', '1021000', '1442006', '8000', '0', '112');
INSERT INTO `shopitems` VALUES ('251', '1021000', '1442000', '3000', '0', '116');
INSERT INTO `shopitems` VALUES ('252', '1021000', '1432001', '7000', '0', '120');
INSERT INTO `shopitems` VALUES ('253', '1021000', '1432000', '3000', '0', '124');
INSERT INTO `shopitems` VALUES ('254', '1021000', '1422004', '20000', '0', '128');
INSERT INTO `shopitems` VALUES ('255', '1021000', '1422006', '10000', '0', '132');
INSERT INTO `shopitems` VALUES ('256', '1021000', '1422003', '10000', '0', '136');
INSERT INTO `shopitems` VALUES ('257', '1021000', '1422002', '6000', '0', '140');
INSERT INTO `shopitems` VALUES ('258', '1021000', '1422000', '3000', '0', '144');
INSERT INTO `shopitems` VALUES ('259', '1021000', '1412006', '45000', '0', '148');
INSERT INTO `shopitems` VALUES ('260', '1021000', '1412000', '22000', '0', '152');
INSERT INTO `shopitems` VALUES ('261', '1021000', '1412002', '10000', '0', '156');
INSERT INTO `shopitems` VALUES ('262', '1021000', '1412001', '3000', '0', '160');
INSERT INTO `shopitems` VALUES ('263', '1021000', '1402008', '22000', '0', '164');
INSERT INTO `shopitems` VALUES ('264', '1021000', '1402000', '12000', '0', '168');
INSERT INTO `shopitems` VALUES ('265', '1021000', '1402001', '3000', '0', '172');
INSERT INTO `shopitems` VALUES ('266', '1021000', '1322014', '40000', '0', '176');
INSERT INTO `shopitems` VALUES ('267', '1021000', '1322004', '22000', '0', '180');
INSERT INTO `shopitems` VALUES ('268', '1021000', '1322002', '10000', '0', '184');
INSERT INTO `shopitems` VALUES ('269', '1021000', '1322000', '6000', '0', '188');
INSERT INTO `shopitems` VALUES ('270', '1021000', '1312005', '40000', '0', '192');
INSERT INTO `shopitems` VALUES ('271', '1021000', '1312003', '20000', '0', '196');
INSERT INTO `shopitems` VALUES ('272', '1021000', '1312001', '6000', '0', '200');
INSERT INTO `shopitems` VALUES ('273', '1021000', '1332010', '22000', '0', '204');
INSERT INTO `shopitems` VALUES ('274', '1021000', '1332008', '10000', '0', '208');
INSERT INTO `shopitems` VALUES ('275', '1021000', '1332006', '7000', '0', '212');
INSERT INTO `shopitems` VALUES ('276', '1021000', '1302008', '40000', '0', '216');
INSERT INTO `shopitems` VALUES ('277', '1021000', '1302003', '20000', '0', '220');
INSERT INTO `shopitems` VALUES ('278', '1021000', '1302006', '10000', '0', '224');
INSERT INTO `shopitems` VALUES ('279', '1021000', '1302002', '10000', '0', '228');
INSERT INTO `shopitems` VALUES ('280', '1021000', '1302005', '6000', '0', '232');
INSERT INTO `shopitems` VALUES ('281', '1021000', '1302007', '3000', '0', '236');
INSERT INTO `shopitems` VALUES ('282', '1021001', '1092000', '6000', '0', '104');
INSERT INTO `shopitems` VALUES ('283', '1021001', '1092005', '4000', '0', '108');
INSERT INTO `shopitems` VALUES ('284', '1021001', '1072011', '15000', '0', '112');
INSERT INTO `shopitems` VALUES ('285', '1021001', '1072047', '10000', '0', '116');
INSERT INTO `shopitems` VALUES ('286', '1021001', '1072046', '10000', '0', '120');
INSERT INTO `shopitems` VALUES ('287', '1021001', '1072007', '10000', '0', '124');
INSERT INTO `shopitems` VALUES ('288', '1021001', '1072050', '5000', '0', '128');
INSERT INTO `shopitems` VALUES ('289', '1021001', '1072009', '5000', '0', '132');
INSERT INTO `shopitems` VALUES ('290', '1021001', '1061020', '14000', '0', '136');
INSERT INTO `shopitems` VALUES ('291', '1021001', '1061019', '14000', '0', '140');
INSERT INTO `shopitems` VALUES ('292', '1021001', '1061015', '14000', '0', '144');
INSERT INTO `shopitems` VALUES ('293', '1021001', '1061018', '9000', '0', '148');
INSERT INTO `shopitems` VALUES ('294', '1021001', '1061017', '9000', '0', '152');
INSERT INTO `shopitems` VALUES ('295', '1021001', '1061016', '9000', '0', '156');
INSERT INTO `shopitems` VALUES ('296', '1021001', '1061023', '3000', '0', '160');
INSERT INTO `shopitems` VALUES ('297', '1021001', '1061014', '3000', '0', '164');
INSERT INTO `shopitems` VALUES ('298', '1021001', '1060019', '38000', '0', '168');
INSERT INTO `shopitems` VALUES ('299', '1021001', '1060018', '38000', '0', '172');
INSERT INTO `shopitems` VALUES ('300', '1021001', '1060017', '38000', '0', '176');
INSERT INTO `shopitems` VALUES ('301', '1021001', '1060016', '38000', '0', '180');
INSERT INTO `shopitems` VALUES ('302', '1021001', '1060060', '14000', '0', '184');
INSERT INTO `shopitems` VALUES ('303', '1021001', '1060030', '14000', '0', '188');
INSERT INTO `shopitems` VALUES ('304', '1021001', '1060011', '14000', '0', '192');
INSERT INTO `shopitems` VALUES ('305', '1021001', '1060029', '9000', '0', '196');
INSERT INTO `shopitems` VALUES ('306', '1021001', '1060010', '9000', '0', '200');
INSERT INTO `shopitems` VALUES ('307', '1021001', '1060027', '5000', '0', '204');
INSERT INTO `shopitems` VALUES ('308', '1021001', '1060009', '5000', '0', '208');
INSERT INTO `shopitems` VALUES ('309', '1021001', '1060028', '3000', '0', '212');
INSERT INTO `shopitems` VALUES ('310', '1021001', '1060008', '3000', '0', '216');
INSERT INTO `shopitems` VALUES ('311', '1021001', '1051013', '60000', '0', '220');
INSERT INTO `shopitems` VALUES ('312', '1021001', '1051012', '60000', '0', '224');
INSERT INTO `shopitems` VALUES ('313', '1021001', '1051011', '60000', '0', '228');
INSERT INTO `shopitems` VALUES ('314', '1021001', '1051010', '60000', '0', '232');
INSERT INTO `shopitems` VALUES ('315', '1021001', '1051000', '8000', '0', '236');
INSERT INTO `shopitems` VALUES ('316', '1021001', '1050011', '70000', '0', '240');
INSERT INTO `shopitems` VALUES ('317', '1021001', '1050007', '15000', '0', '244');
INSERT INTO `shopitems` VALUES ('318', '1021001', '1050006', '15000', '0', '248');
INSERT INTO `shopitems` VALUES ('319', '1021001', '1050005', '15000', '0', '252');
INSERT INTO `shopitems` VALUES ('320', '1021001', '1041024', '16000', '0', '256');
INSERT INTO `shopitems` VALUES ('321', '1021001', '1041023', '16000', '0', '260');
INSERT INTO `shopitems` VALUES ('322', '1021001', '1041022', '16000', '0', '264');
INSERT INTO `shopitems` VALUES ('323', '1021001', '1041021', '9000', '0', '268');
INSERT INTO `shopitems` VALUES ('324', '1021001', '1041020', '9000', '0', '272');
INSERT INTO `shopitems` VALUES ('325', '1021001', '1041019', '9000', '0', '276');
INSERT INTO `shopitems` VALUES ('326', '1021001', '1041064', '3200', '0', '280');
INSERT INTO `shopitems` VALUES ('327', '1021001', '1041014', '3200', '0', '284');
INSERT INTO `shopitems` VALUES ('328', '1021001', '1040026', '40000', '0', '288');
INSERT INTO `shopitems` VALUES ('329', '1021001', '1040021', '40000', '0', '292');
INSERT INTO `shopitems` VALUES ('330', '1021001', '1040041', '16000', '0', '296');
INSERT INTO `shopitems` VALUES ('331', '1021001', '1040016', '16000', '0', '300');
INSERT INTO `shopitems` VALUES ('332', '1021001', '1040040', '16000', '0', '304');
INSERT INTO `shopitems` VALUES ('333', '1021001', '1040039', '9000', '0', '308');
INSERT INTO `shopitems` VALUES ('334', '1021001', '1040012', '9000', '0', '312');
INSERT INTO `shopitems` VALUES ('335', '1021001', '1040037', '5500', '0', '316');
INSERT INTO `shopitems` VALUES ('336', '1021001', '1040009', '5500', '0', '320');
INSERT INTO `shopitems` VALUES ('337', '1021001', '1040038', '3200', '0', '324');
INSERT INTO `shopitems` VALUES ('338', '1021001', '1040015', '3200', '0', '328');
INSERT INTO `shopitems` VALUES ('339', '1021001', '1002005', '19000', '0', '332');
INSERT INTO `shopitems` VALUES ('340', '1021001', '1002027', '11500', '0', '336');
INSERT INTO `shopitems` VALUES ('341', '1021001', '1002059', '8500', '0', '340');
INSERT INTO `shopitems` VALUES ('342', '1021001', '1002055', '8700', '0', '344');
INSERT INTO `shopitems` VALUES ('343', '1021001', '1002051', '3500', '0', '348');
INSERT INTO `shopitems` VALUES ('344', '1021001', '1002039', '2700', '0', '352');
INSERT INTO `shopitems` VALUES ('345', '1021001', '1002043', '2400', '0', '356');
INSERT INTO `shopitems` VALUES ('346', '1021100', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('347', '1021100', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('348', '1021100', '2050002', '300', '0', '112');
INSERT INTO `shopitems` VALUES ('349', '1021100', '2050001', '200', '0', '116');
INSERT INTO `shopitems` VALUES ('350', '1021100', '2050000', '200', '0', '120');
INSERT INTO `shopitems` VALUES ('351', '1021100', '2061000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('352', '1021100', '2060000', '1400', '0', '128');
INSERT INTO `shopitems` VALUES ('353', '1021100', '2061000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('354', '1021100', '2060000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('355', '1021100', '2030003', '500', '0', '140');
INSERT INTO `shopitems` VALUES ('356', '1021100', '2030000', '400', '0', '144');
INSERT INTO `shopitems` VALUES ('357', '1021100', '2010004', '310', '0', '148');
INSERT INTO `shopitems` VALUES ('358', '1021100', '2010003', '100', '0', '152');
INSERT INTO `shopitems` VALUES ('359', '1021100', '2010001', '106', '0', '156');
INSERT INTO `shopitems` VALUES ('360', '1021100', '2010002', '50', '0', '160');
INSERT INTO `shopitems` VALUES ('361', '1021100', '2010000', '30', '0', '164');
INSERT INTO `shopitems` VALUES ('362', '1021100', '2002005', '500', '0', '168');
INSERT INTO `shopitems` VALUES ('363', '1021100', '2002004', '500', '0', '172');
INSERT INTO `shopitems` VALUES ('364', '1021100', '2002002', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('365', '1021100', '2002001', '400', '0', '180');
INSERT INTO `shopitems` VALUES ('366', '1021100', '2002000', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('367', '1021100', '2000006', '620', '0', '188');
INSERT INTO `shopitems` VALUES ('368', '1021100', '2000003', '200', '0', '192');
INSERT INTO `shopitems` VALUES ('369', '1021100', '2000002', '320', '0', '196');
INSERT INTO `shopitems` VALUES ('370', '1021100', '2000001', '160', '0', '200');
INSERT INTO `shopitems` VALUES ('371', '1021100', '2000000', '50', '0', '204');
INSERT INTO `shopitems` VALUES ('372', '1031000', '1322002', '10000', '0', '104');
INSERT INTO `shopitems` VALUES ('373', '1031000', '1382002', '20000', '0', '108');
INSERT INTO `shopitems` VALUES ('374', '1031000', '1382004', '10000', '0', '112');
INSERT INTO `shopitems` VALUES ('375', '1031000', '1382005', '6000', '0', '116');
INSERT INTO `shopitems` VALUES ('376', '1031000', '1382003', '6000', '0', '120');
INSERT INTO `shopitems` VALUES ('377', '1031000', '1382000', '3000', '0', '124');
INSERT INTO `shopitems` VALUES ('378', '1031000', '1372003', '38000', '0', '128');
INSERT INTO `shopitems` VALUES ('379', '1031000', '1372004', '18000', '0', '132');
INSERT INTO `shopitems` VALUES ('380', '1031000', '1372002', '9000', '0', '136');
INSERT INTO `shopitems` VALUES ('381', '1031000', '1372006', '5000', '0', '140');
INSERT INTO `shopitems` VALUES ('382', '1031000', '1372005', '2000', '0', '144');
INSERT INTO `shopitems` VALUES ('383', '1031001', '1072024', '4000', '0', '104');
INSERT INTO `shopitems` VALUES ('384', '1031001', '1072023', '4000', '0', '108');
INSERT INTO `shopitems` VALUES ('385', '1031001', '1072045', '1500', '0', '112');
INSERT INTO `shopitems` VALUES ('386', '1031001', '1072044', '1500', '0', '116');
INSERT INTO `shopitems` VALUES ('387', '1031001', '1072006', '1500', '0', '120');
INSERT INTO `shopitems` VALUES ('388', '1031001', '1061036', '40000', '0', '124');
INSERT INTO `shopitems` VALUES ('389', '1031001', '1061035', '40000', '0', '128');
INSERT INTO `shopitems` VALUES ('390', '1031001', '1061034', '40000', '0', '132');
INSERT INTO `shopitems` VALUES ('391', '1031001', '1061028', '8000', '0', '136');
INSERT INTO `shopitems` VALUES ('392', '1031001', '1061027', '8000', '0', '140');
INSERT INTO `shopitems` VALUES ('393', '1031001', '1061022', '4000', '0', '144');
INSERT INTO `shopitems` VALUES ('394', '1031001', '1061021', '4000', '0', '148');
INSERT INTO `shopitems` VALUES ('395', '1031001', '1061013', '4000', '0', '152');
INSERT INTO `shopitems` VALUES ('396', '1031001', '1061012', '4000', '0', '156');
INSERT INTO `shopitems` VALUES ('397', '1031001', '1061011', '2000', '0', '160');
INSERT INTO `shopitems` VALUES ('398', '1031001', '1061010', '2000', '0', '164');
INSERT INTO `shopitems` VALUES ('399', '1031001', '1060015', '8000', '0', '168');
INSERT INTO `shopitems` VALUES ('400', '1031001', '1060014', '8000', '0', '172');
INSERT INTO `shopitems` VALUES ('401', '1031001', '1060013', '2000', '0', '176');
INSERT INTO `shopitems` VALUES ('402', '1031001', '1060012', '2000', '0', '180');
INSERT INTO `shopitems` VALUES ('403', '1031001', '1051003', '16000', '0', '184');
INSERT INTO `shopitems` VALUES ('404', '1031001', '1051005', '16000', '0', '188');
INSERT INTO `shopitems` VALUES ('405', '1031001', '1051004', '16000', '0', '192');
INSERT INTO `shopitems` VALUES ('406', '1031001', '1050028', '40000', '0', '196');
INSERT INTO `shopitems` VALUES ('407', '1031001', '1050027', '40000', '0', '200');
INSERT INTO `shopitems` VALUES ('408', '1031001', '1050026', '40000', '0', '204');
INSERT INTO `shopitems` VALUES ('409', '1031001', '1050003', '40000', '0', '208');
INSERT INTO `shopitems` VALUES ('410', '1031001', '1050025', '16000', '0', '212');
INSERT INTO `shopitems` VALUES ('411', '1031001', '1050024', '16000', '0', '216');
INSERT INTO `shopitems` VALUES ('412', '1031001', '1050023', '16000', '0', '220');
INSERT INTO `shopitems` VALUES ('413', '1031001', '1050001', '16000', '0', '224');
INSERT INTO `shopitems` VALUES ('414', '1031001', '1050010', '7000', '0', '228');
INSERT INTO `shopitems` VALUES ('415', '1031001', '1050009', '7000', '0', '232');
INSERT INTO `shopitems` VALUES ('416', '1031001', '1050008', '7000', '0', '236');
INSERT INTO `shopitems` VALUES ('417', '1031001', '1041043', '42000', '0', '240');
INSERT INTO `shopitems` VALUES ('418', '1031001', '1041042', '42000', '0', '244');
INSERT INTO `shopitems` VALUES ('419', '1031001', '1041041', '42000', '0', '248');
INSERT INTO `shopitems` VALUES ('420', '1031001', '1041031', '8500', '0', '252');
INSERT INTO `shopitems` VALUES ('421', '1031001', '1041030', '8500', '0', '256');
INSERT INTO `shopitems` VALUES ('422', '1031001', '1041029', '8500', '0', '260');
INSERT INTO `shopitems` VALUES ('423', '1031001', '1041026', '4000', '0', '264');
INSERT INTO `shopitems` VALUES ('424', '1031001', '1041025', '4000', '0', '268');
INSERT INTO `shopitems` VALUES ('425', '1031001', '1041018', '4000', '0', '272');
INSERT INTO `shopitems` VALUES ('426', '1031001', '1041017', '4000', '0', '276');
INSERT INTO `shopitems` VALUES ('427', '1031001', '1041016', '2000', '0', '280');
INSERT INTO `shopitems` VALUES ('428', '1031001', '1041015', '2000', '0', '284');
INSERT INTO `shopitems` VALUES ('429', '1031001', '1040020', '8500', '0', '288');
INSERT INTO `shopitems` VALUES ('430', '1031001', '1040019', '8500', '0', '292');
INSERT INTO `shopitems` VALUES ('431', '1031001', '1040018', '8500', '0', '296');
INSERT INTO `shopitems` VALUES ('432', '1031001', '1040017', '2000', '0', '300');
INSERT INTO `shopitems` VALUES ('433', '1031001', '1040004', '2000', '0', '304');
INSERT INTO `shopitems` VALUES ('434', '1031001', '1002016', '8000', '0', '308');
INSERT INTO `shopitems` VALUES ('435', '1031001', '1002106', '3800', '0', '312');
INSERT INTO `shopitems` VALUES ('436', '1031001', '1002105', '3800', '0', '316');
INSERT INTO `shopitems` VALUES ('437', '1031001', '1002104', '3800', '0', '320');
INSERT INTO `shopitems` VALUES ('438', '1031001', '1002103', '3800', '0', '324');
INSERT INTO `shopitems` VALUES ('439', '1031001', '1002102', '3800', '0', '328');
INSERT INTO `shopitems` VALUES ('440', '1031001', '1002017', '1200', '0', '332');
INSERT INTO `shopitems` VALUES ('441', '1031100', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('442', '1031100', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('443', '1031100', '2050003', '500', '0', '112');
INSERT INTO `shopitems` VALUES ('444', '1031100', '2050002', '300', '0', '116');
INSERT INTO `shopitems` VALUES ('445', '1031100', '2050001', '200', '0', '120');
INSERT INTO `shopitems` VALUES ('446', '1031100', '2050000', '200', '0', '124');
INSERT INTO `shopitems` VALUES ('447', '1031100', '2061000', '1400', '0', '128');
INSERT INTO `shopitems` VALUES ('448', '1031100', '2060000', '1400', '0', '132');
INSERT INTO `shopitems` VALUES ('449', '1031100', '2061000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('450', '1031100', '2060000', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('451', '1031100', '2030002', '500', '0', '144');
INSERT INTO `shopitems` VALUES ('452', '1031100', '2030000', '400', '0', '148');
INSERT INTO `shopitems` VALUES ('453', '1031100', '2010004', '305', '0', '152');
INSERT INTO `shopitems` VALUES ('454', '1031100', '2010003', '97', '0', '156');
INSERT INTO `shopitems` VALUES ('455', '1031100', '2010001', '106', '0', '160');
INSERT INTO `shopitems` VALUES ('456', '1031100', '2010002', '50', '0', '164');
INSERT INTO `shopitems` VALUES ('457', '1031100', '2010000', '30', '0', '168');
INSERT INTO `shopitems` VALUES ('458', '1031100', '2002005', '500', '0', '172');
INSERT INTO `shopitems` VALUES ('459', '1031100', '2002004', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('460', '1031100', '2002002', '500', '0', '180');
INSERT INTO `shopitems` VALUES ('461', '1031100', '2002001', '400', '0', '184');
INSERT INTO `shopitems` VALUES ('462', '1031100', '2002000', '500', '0', '188');
INSERT INTO `shopitems` VALUES ('463', '1031100', '2000006', '604', '0', '192');
INSERT INTO `shopitems` VALUES ('464', '1031100', '2000003', '192', '0', '196');
INSERT INTO `shopitems` VALUES ('465', '1031100', '2000002', '320', '0', '200');
INSERT INTO `shopitems` VALUES ('466', '1031100', '2000001', '160', '0', '204');
INSERT INTO `shopitems` VALUES ('467', '1031100', '2000000', '50', '0', '208');
INSERT INTO `shopitems` VALUES ('468', '1032103', '2044900', '70000', '0', '104');
INSERT INTO `shopitems` VALUES ('469', '1032103', '2044800', '70000', '0', '108');
INSERT INTO `shopitems` VALUES ('470', '1032103', '2043800', '70000', '0', '112');
INSERT INTO `shopitems` VALUES ('471', '1032103', '2043700', '70000', '0', '116');
INSERT INTO `shopitems` VALUES ('472', '1032103', '2044600', '70000', '0', '120');
INSERT INTO `shopitems` VALUES ('473', '1032103', '2044500', '70000', '0', '124');
INSERT INTO `shopitems` VALUES ('474', '1032103', '2040300', '35000', '0', '128');
INSERT INTO `shopitems` VALUES ('475', '1032103', '2040700', '35000', '0', '132');
INSERT INTO `shopitems` VALUES ('476', '1032103', '2040600', '35000', '0', '136');
INSERT INTO `shopitems` VALUES ('477', '1032103', '2040400', '35000', '0', '140');
INSERT INTO `shopitems` VALUES ('478', '1032103', '2040000', '35000', '0', '144');
INSERT INTO `shopitems` VALUES ('479', '1051000', '1472000', '3000', '0', '104');
INSERT INTO `shopitems` VALUES ('480', '1051000', '1442000', '3000', '0', '108');
INSERT INTO `shopitems` VALUES ('481', '1051000', '1432001', '7000', '0', '112');
INSERT INTO `shopitems` VALUES ('482', '1051000', '1432000', '3000', '0', '116');
INSERT INTO `shopitems` VALUES ('483', '1051000', '1422000', '3000', '0', '120');
INSERT INTO `shopitems` VALUES ('484', '1051000', '1412001', '3000', '0', '124');
INSERT INTO `shopitems` VALUES ('485', '1051000', '1402001', '3000', '0', '128');
INSERT INTO `shopitems` VALUES ('486', '1051000', '1322009', '20000', '0', '132');
INSERT INTO `shopitems` VALUES ('487', '1051000', '1332009', '42000', '0', '136');
INSERT INTO `shopitems` VALUES ('488', '1051000', '1332012', '40000', '0', '140');
INSERT INTO `shopitems` VALUES ('489', '1051000', '1332004', '38000', '0', '144');
INSERT INTO `shopitems` VALUES ('490', '1051000', '1332010', '22000', '0', '148');
INSERT INTO `shopitems` VALUES ('491', '1051000', '1332013', '15000', '0', '152');
INSERT INTO `shopitems` VALUES ('492', '1051000', '1332008', '10000', '0', '156');
INSERT INTO `shopitems` VALUES ('493', '1051000', '1332002', '8000', '0', '160');
INSERT INTO `shopitems` VALUES ('494', '1051000', '1332006', '7000', '0', '164');
INSERT INTO `shopitems` VALUES ('495', '1051000', '1332000', '4000', '0', '168');
INSERT INTO `shopitems` VALUES ('496', '1051000', '1302007', '3000', '0', '172');
INSERT INTO `shopitems` VALUES ('497', '1051001', '1072066', '9000', '0', '104');
INSERT INTO `shopitems` VALUES ('498', '1051001', '1072065', '9000', '0', '108');
INSERT INTO `shopitems` VALUES ('499', '1051001', '1072022', '9000', '0', '112');
INSERT INTO `shopitems` VALUES ('500', '1051001', '1072031', '4500', '0', '116');
INSERT INTO `shopitems` VALUES ('501', '1051001', '1072030', '4500', '0', '120');
INSERT INTO `shopitems` VALUES ('502', '1051001', '1072029', '4500', '0', '124');
INSERT INTO `shopitems` VALUES ('503', '1051001', '1072028', '4500', '0', '128');
INSERT INTO `shopitems` VALUES ('504', '1051001', '1072043', '2000', '0', '132');
INSERT INTO `shopitems` VALUES ('505', '1051001', '1072042', '2000', '0', '136');
INSERT INTO `shopitems` VALUES ('506', '1051001', '1072004', '2000', '0', '140');
INSERT INTO `shopitems` VALUES ('507', '1051001', '1072071', '1800', '0', '144');
INSERT INTO `shopitems` VALUES ('508', '1051001', '1072070', '1800', '0', '148');
INSERT INTO `shopitems` VALUES ('509', '1051001', '1061046', '40000', '0', '152');
INSERT INTO `shopitems` VALUES ('510', '1051001', '1061045', '40000', '0', '156');
INSERT INTO `shopitems` VALUES ('511', '1051001', '1061044', '40000', '0', '160');
INSERT INTO `shopitems` VALUES ('512', '1051001', '1061043', '40000', '0', '164');
INSERT INTO `shopitems` VALUES ('513', '1051001', '1061056', '18000', '0', '168');
INSERT INTO `shopitems` VALUES ('514', '1051001', '1061055', '18000', '0', '172');
INSERT INTO `shopitems` VALUES ('515', '1051001', '1061054', '18000', '0', '176');
INSERT INTO `shopitems` VALUES ('516', '1051001', '1061053', '18000', '0', '180');
INSERT INTO `shopitems` VALUES ('517', '1051001', '1061042', '12000', '0', '184');
INSERT INTO `shopitems` VALUES ('518', '1051001', '1061041', '12000', '0', '188');
INSERT INTO `shopitems` VALUES ('519', '1051001', '1061040', '12000', '0', '192');
INSERT INTO `shopitems` VALUES ('520', '1051001', '1061033', '8000', '0', '196');
INSERT INTO `shopitems` VALUES ('521', '1051001', '1061032', '8000', '0', '200');
INSERT INTO `shopitems` VALUES ('522', '1051001', '1061003', '8000', '0', '204');
INSERT INTO `shopitems` VALUES ('523', '1051001', '1061038', '4800', '0', '208');
INSERT INTO `shopitems` VALUES ('524', '1051001', '1061037', '4800', '0', '212');
INSERT INTO `shopitems` VALUES ('525', '1051001', '1061031', '2800', '0', '216');
INSERT INTO `shopitems` VALUES ('526', '1051001', '1061030', '2800', '0', '220');
INSERT INTO `shopitems` VALUES ('527', '1051001', '1061029', '2800', '0', '224');
INSERT INTO `shopitems` VALUES ('528', '1051001', '1060046', '40000', '0', '228');
INSERT INTO `shopitems` VALUES ('529', '1051001', '1060045', '40000', '0', '232');
INSERT INTO `shopitems` VALUES ('530', '1051001', '1060044', '40000', '0', '236');
INSERT INTO `shopitems` VALUES ('531', '1051001', '1060043', '40000', '0', '240');
INSERT INTO `shopitems` VALUES ('532', '1051001', '1060039', '19000', '0', '244');
INSERT INTO `shopitems` VALUES ('533', '1051001', '1060038', '19000', '0', '248');
INSERT INTO `shopitems` VALUES ('534', '1051001', '1060037', '19000', '0', '252');
INSERT INTO `shopitems` VALUES ('535', '1051001', '1060033', '8000', '0', '256');
INSERT INTO `shopitems` VALUES ('536', '1051001', '1060032', '8000', '0', '260');
INSERT INTO `shopitems` VALUES ('537', '1051001', '1060031', '8000', '0', '264');
INSERT INTO `shopitems` VALUES ('538', '1051001', '1060025', '4800', '0', '268');
INSERT INTO `shopitems` VALUES ('539', '1051001', '1060024', '4800', '0', '272');
INSERT INTO `shopitems` VALUES ('540', '1051001', '1060023', '2800', '0', '276');
INSERT INTO `shopitems` VALUES ('541', '1051001', '1060022', '2800', '0', '280');
INSERT INTO `shopitems` VALUES ('542', '1051001', '1060021', '2800', '0', '284');
INSERT INTO `shopitems` VALUES ('543', '1051001', '1041050', '45000', '0', '288');
INSERT INTO `shopitems` VALUES ('544', '1051001', '1041049', '45000', '0', '292');
INSERT INTO `shopitems` VALUES ('545', '1051001', '1041048', '45000', '0', '296');
INSERT INTO `shopitems` VALUES ('546', '1051001', '1041047', '45000', '0', '300');
INSERT INTO `shopitems` VALUES ('547', '1051001', '1041060', '18000', '0', '304');
INSERT INTO `shopitems` VALUES ('548', '1051001', '1041059', '18000', '0', '308');
INSERT INTO `shopitems` VALUES ('549', '1051001', '1041058', '18000', '0', '312');
INSERT INTO `shopitems` VALUES ('550', '1051001', '1041057', '18000', '0', '316');
INSERT INTO `shopitems` VALUES ('551', '1051001', '1041040', '9000', '0', '320');
INSERT INTO `shopitems` VALUES ('552', '1051001', '1041039', '9000', '0', '324');
INSERT INTO `shopitems` VALUES ('553', '1051001', '1041003', '9000', '0', '328');
INSERT INTO `shopitems` VALUES ('554', '1051001', '1041045', '5000', '0', '332');
INSERT INTO `shopitems` VALUES ('555', '1051001', '1041044', '5000', '0', '336');
INSERT INTO `shopitems` VALUES ('556', '1051001', '1041038', '3000', '0', '340');
INSERT INTO `shopitems` VALUES ('557', '1051001', '1041037', '3000', '0', '344');
INSERT INTO `shopitems` VALUES ('558', '1051001', '1041036', '3000', '0', '348');
INSERT INTO `shopitems` VALUES ('559', '1051001', '1040060', '45000', '0', '352');
INSERT INTO `shopitems` VALUES ('560', '1051001', '1040059', '45000', '0', '356');
INSERT INTO `shopitems` VALUES ('561', '1051001', '1040058', '45000', '0', '360');
INSERT INTO `shopitems` VALUES ('562', '1051001', '1040057', '45000', '0', '364');
INSERT INTO `shopitems` VALUES ('563', '1051001', '1040050', '16000', '0', '368');
INSERT INTO `shopitems` VALUES ('564', '1051001', '1040049', '16000', '0', '372');
INSERT INTO `shopitems` VALUES ('565', '1051001', '1040048', '16000', '0', '376');
INSERT INTO `shopitems` VALUES ('566', '1051001', '1040044', '9000', '0', '380');
INSERT INTO `shopitems` VALUES ('567', '1051001', '1040043', '9000', '0', '384');
INSERT INTO `shopitems` VALUES ('568', '1051001', '1040042', '9000', '0', '388');
INSERT INTO `shopitems` VALUES ('569', '1051001', '1040035', '5000', '0', '392');
INSERT INTO `shopitems` VALUES ('570', '1051001', '1040034', '5000', '0', '396');
INSERT INTO `shopitems` VALUES ('571', '1051001', '1040033', '3000', '0', '400');
INSERT INTO `shopitems` VALUES ('572', '1051001', '1040032', '3000', '0', '404');
INSERT INTO `shopitems` VALUES ('573', '1051001', '1040031', '3000', '0', '408');
INSERT INTO `shopitems` VALUES ('574', '1051001', '1002175', '30000', '0', '412');
INSERT INTO `shopitems` VALUES ('575', '1051001', '1002174', '30000', '0', '416');
INSERT INTO `shopitems` VALUES ('576', '1051001', '1002173', '30000', '0', '420');
INSERT INTO `shopitems` VALUES ('577', '1051001', '1002172', '30000', '0', '424');
INSERT INTO `shopitems` VALUES ('578', '1051001', '1002171', '30000', '0', '428');
INSERT INTO `shopitems` VALUES ('579', '1051001', '1002150', '20000', '0', '432');
INSERT INTO `shopitems` VALUES ('580', '1051001', '1002149', '20000', '0', '436');
INSERT INTO `shopitems` VALUES ('581', '1051001', '1002148', '20000', '0', '440');
INSERT INTO `shopitems` VALUES ('582', '1051001', '1002147', '20000', '0', '444');
INSERT INTO `shopitems` VALUES ('583', '1051001', '1002146', '20000', '0', '448');
INSERT INTO `shopitems` VALUES ('584', '1051001', '1002097', '7400', '0', '452');
INSERT INTO `shopitems` VALUES ('585', '1051001', '1002096', '7400', '0', '456');
INSERT INTO `shopitems` VALUES ('586', '1051001', '1002020', '7400', '0', '460');
INSERT INTO `shopitems` VALUES ('587', '1051001', '1002131', '12000', '0', '464');
INSERT INTO `shopitems` VALUES ('588', '1051001', '1002130', '12000', '0', '468');
INSERT INTO `shopitems` VALUES ('589', '1051001', '1002129', '12000', '0', '472');
INSERT INTO `shopitems` VALUES ('590', '1051001', '1002128', '12000', '0', '476');
INSERT INTO `shopitems` VALUES ('591', '1051001', '1002127', '12000', '0', '480');
INSERT INTO `shopitems` VALUES ('592', '1051001', '1002111', '4000', '0', '484');
INSERT INTO `shopitems` VALUES ('593', '1051001', '1002110', '4000', '0', '488');
INSERT INTO `shopitems` VALUES ('594', '1051001', '1002109', '4000', '0', '492');
INSERT INTO `shopitems` VALUES ('595', '1051001', '1002108', '4000', '0', '496');
INSERT INTO `shopitems` VALUES ('596', '1051001', '1002107', '4000', '0', '500');
INSERT INTO `shopitems` VALUES ('597', '1051001', '1002001', '3000', '0', '504');
INSERT INTO `shopitems` VALUES ('598', '1051001', '1002126', '900', '0', '508');
INSERT INTO `shopitems` VALUES ('599', '1051001', '1002125', '900', '0', '512');
INSERT INTO `shopitems` VALUES ('600', '1051001', '1002124', '900', '0', '516');
INSERT INTO `shopitems` VALUES ('601', '1051001', '1002123', '900', '0', '520');
INSERT INTO `shopitems` VALUES ('602', '1051001', '1002122', '900', '0', '524');
INSERT INTO `shopitems` VALUES ('603', '1051002', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('604', '1051002', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('605', '1051002', '2050002', '300', '0', '112');
INSERT INTO `shopitems` VALUES ('606', '1051002', '2050001', '200', '0', '116');
INSERT INTO `shopitems` VALUES ('607', '1051002', '2050000', '200', '0', '120');
INSERT INTO `shopitems` VALUES ('608', '1051002', '2061000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('609', '1051002', '2060000', '1400', '0', '128');
INSERT INTO `shopitems` VALUES ('610', '1051002', '2061000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('611', '1051002', '2060000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('612', '1051002', '2030005', '500', '0', '140');
INSERT INTO `shopitems` VALUES ('613', '1051002', '2030000', '400', '0', '144');
INSERT INTO `shopitems` VALUES ('614', '1051002', '2010004', '310', '0', '148');
INSERT INTO `shopitems` VALUES ('615', '1051002', '2010003', '100', '0', '152');
INSERT INTO `shopitems` VALUES ('616', '1051002', '2010001', '106', '0', '156');
INSERT INTO `shopitems` VALUES ('617', '1051002', '2010002', '50', '0', '160');
INSERT INTO `shopitems` VALUES ('618', '1051002', '2010000', '30', '0', '164');
INSERT INTO `shopitems` VALUES ('619', '1051002', '2002005', '500', '0', '168');
INSERT INTO `shopitems` VALUES ('620', '1051002', '2002004', '500', '0', '172');
INSERT INTO `shopitems` VALUES ('621', '1051002', '2002002', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('622', '1051002', '2002001', '400', '0', '180');
INSERT INTO `shopitems` VALUES ('623', '1051002', '2002000', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('624', '1051002', '2000006', '620', '0', '188');
INSERT INTO `shopitems` VALUES ('625', '1051002', '2000003', '200', '0', '192');
INSERT INTO `shopitems` VALUES ('626', '1051002', '2000002', '320', '0', '196');
INSERT INTO `shopitems` VALUES ('627', '1051002', '2000001', '160', '0', '200');
INSERT INTO `shopitems` VALUES ('628', '1051002', '2000000', '50', '0', '204');
INSERT INTO `shopitems` VALUES ('629', '1052104', '2044700', '70000', '0', '104');
INSERT INTO `shopitems` VALUES ('630', '1052104', '2043300', '70000', '0', '108');
INSERT INTO `shopitems` VALUES ('631', '1052104', '2044400', '70000', '0', '112');
INSERT INTO `shopitems` VALUES ('632', '1052104', '2044300', '70000', '0', '116');
INSERT INTO `shopitems` VALUES ('633', '1052104', '2044200', '70000', '0', '120');
INSERT INTO `shopitems` VALUES ('634', '1052104', '2044100', '70000', '0', '124');
INSERT INTO `shopitems` VALUES ('635', '1052104', '2044000', '70000', '0', '128');
INSERT INTO `shopitems` VALUES ('636', '1052104', '2043200', '70000', '0', '132');
INSERT INTO `shopitems` VALUES ('637', '1052104', '2043100', '70000', '0', '136');
INSERT INTO `shopitems` VALUES ('638', '1052104', '2043000', '70000', '0', '140');
INSERT INTO `shopitems` VALUES ('639', '1052104', '2040703', '35000', '0', '144');
INSERT INTO `shopitems` VALUES ('640', '1052104', '2040700', '35000', '0', '148');
INSERT INTO `shopitems` VALUES ('641', '1052104', '2040600', '35000', '0', '152');
INSERT INTO `shopitems` VALUES ('642', '1052104', '2040500', '35000', '0', '156');
INSERT INTO `shopitems` VALUES ('643', '1052104', '2040003', '35000', '0', '160');
INSERT INTO `shopitems` VALUES ('644', '1052104', '2040000', '35000', '0', '164');
INSERT INTO `shopitems` VALUES ('645', '1061001', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('646', '1061001', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('647', '1061001', '2061000', '2800', '0', '112');
INSERT INTO `shopitems` VALUES ('648', '1061001', '2060000', '2800', '0', '116');
INSERT INTO `shopitems` VALUES ('649', '1061001', '2061000', '2', '0', '120');
INSERT INTO `shopitems` VALUES ('650', '1061001', '2060000', '2', '0', '124');
INSERT INTO `shopitems` VALUES ('651', '1061001', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('652', '1061001', '2020002', '320', '0', '132');
INSERT INTO `shopitems` VALUES ('653', '1061001', '2022000', '1650', '0', '136');
INSERT INTO `shopitems` VALUES ('654', '1061001', '2020000', '420', '0', '140');
INSERT INTO `shopitems` VALUES ('655', '1061001', '2022003', '1100', '0', '144');
INSERT INTO `shopitems` VALUES ('656', '1061001', '2020006', '530', '0', '148');
INSERT INTO `shopitems` VALUES ('657', '1061001', '2020004', '450', '0', '152');
INSERT INTO `shopitems` VALUES ('658', '1061001', '2020003', '450', '0', '156');
INSERT INTO `shopitems` VALUES ('659', '1061001', '2020005', '320', '0', '160');
INSERT INTO `shopitems` VALUES ('660', '1061001', '2020001', '220', '0', '164');
INSERT INTO `shopitems` VALUES ('661', '1061002', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('662', '1061002', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('663', '1061002', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('664', '1061002', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('665', '1061002', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('666', '1061002', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('667', '1061002', '2030006', '600', '0', '128');
INSERT INTO `shopitems` VALUES ('668', '1061002', '2030000', '400', '0', '132');
INSERT INTO `shopitems` VALUES ('669', '1061002', '2022003', '1100', '0', '136');
INSERT INTO `shopitems` VALUES ('670', '1061002', '2022000', '1650', '0', '140');
INSERT INTO `shopitems` VALUES ('671', '1061002', '2010004', '310', '0', '144');
INSERT INTO `shopitems` VALUES ('672', '1061002', '2010003', '100', '0', '148');
INSERT INTO `shopitems` VALUES ('673', '1061002', '2010001', '106', '0', '152');
INSERT INTO `shopitems` VALUES ('674', '1061002', '2010002', '50', '0', '156');
INSERT INTO `shopitems` VALUES ('675', '1061002', '2010000', '30', '0', '160');
INSERT INTO `shopitems` VALUES ('676', '1061002', '2000006', '620', '0', '164');
INSERT INTO `shopitems` VALUES ('677', '1061002', '2000003', '200', '0', '168');
INSERT INTO `shopitems` VALUES ('678', '1061002', '2000002', '320', '0', '172');
INSERT INTO `shopitems` VALUES ('679', '1061002', '2000001', '160', '0', '176');
INSERT INTO `shopitems` VALUES ('680', '1061002', '2000000', '50', '0', '180');
INSERT INTO `shopitems` VALUES ('681', '1081000', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('682', '1081000', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('683', '1081000', '2001002', '4000', '0', '112');
INSERT INTO `shopitems` VALUES ('684', '1081000', '2001001', '2300', '0', '116');
INSERT INTO `shopitems` VALUES ('685', '1081000', '2001000', '3200', '0', '120');
INSERT INTO `shopitems` VALUES ('686', '1081000', '2020002', '320', '0', '124');
INSERT INTO `shopitems` VALUES ('687', '1081000', '2022000', '1650', '0', '128');
INSERT INTO `shopitems` VALUES ('688', '1081000', '2020000', '420', '0', '132');
INSERT INTO `shopitems` VALUES ('689', '1081000', '2022003', '1100', '0', '136');
INSERT INTO `shopitems` VALUES ('690', '1081000', '2020006', '530', '0', '140');
INSERT INTO `shopitems` VALUES ('691', '1081000', '2020004', '450', '0', '144');
INSERT INTO `shopitems` VALUES ('692', '1081000', '2020003', '450', '0', '148');
INSERT INTO `shopitems` VALUES ('693', '1081000', '2020005', '320', '0', '152');
INSERT INTO `shopitems` VALUES ('694', '1081000', '2020001', '220', '0', '156');
INSERT INTO `shopitems` VALUES ('695', '1081000', '2010004', '310', '0', '160');
INSERT INTO `shopitems` VALUES ('696', '1081000', '2010003', '100', '0', '164');
INSERT INTO `shopitems` VALUES ('697', '1081000', '2010001', '106', '0', '168');
INSERT INTO `shopitems` VALUES ('698', '1081000', '2010002', '50', '0', '172');
INSERT INTO `shopitems` VALUES ('699', '1081000', '2010000', '30', '0', '176');
INSERT INTO `shopitems` VALUES ('700', '1081000', '2000003', '200', '0', '180');
INSERT INTO `shopitems` VALUES ('701', '1081000', '2000002', '320', '0', '184');
INSERT INTO `shopitems` VALUES ('702', '1081000', '2000001', '160', '0', '188');
INSERT INTO `shopitems` VALUES ('703', '1081000', '2000000', '50', '0', '192');
INSERT INTO `shopitems` VALUES ('704', '1091000', '1322007', '6000', '0', '104');
INSERT INTO `shopitems` VALUES ('705', '1091000', '1302007', '3000', '0', '108');
INSERT INTO `shopitems` VALUES ('706', '1091000', '1442004', '24000', '0', '112');
INSERT INTO `shopitems` VALUES ('707', '1091000', '1482004', '52000', '0', '116');
INSERT INTO `shopitems` VALUES ('708', '1091000', '1482003', '20000', '0', '120');
INSERT INTO `shopitems` VALUES ('709', '1091000', '1482002', '10000', '0', '124');
INSERT INTO `shopitems` VALUES ('710', '1091000', '1482001', '6000', '0', '128');
INSERT INTO `shopitems` VALUES ('711', '1091000', '1482000', '3000', '0', '132');
INSERT INTO `shopitems` VALUES ('712', '1091000', '1492004', '50000', '0', '136');
INSERT INTO `shopitems` VALUES ('713', '1091000', '1492003', '22000', '0', '140');
INSERT INTO `shopitems` VALUES ('714', '1091000', '1492002', '10000', '0', '144');
INSERT INTO `shopitems` VALUES ('715', '1091000', '1492001', '6000', '0', '148');
INSERT INTO `shopitems` VALUES ('716', '1091000', '1492000', '3000', '0', '152');
INSERT INTO `shopitems` VALUES ('717', '1091001', '1072288', '8000', '0', '104');
INSERT INTO `shopitems` VALUES ('718', '1091001', '1072285', '5000', '0', '108');
INSERT INTO `shopitems` VALUES ('719', '1091001', '1052107', '60000', '0', '112');
INSERT INTO `shopitems` VALUES ('720', '1091001', '1052104', '30000', '0', '116');
INSERT INTO `shopitems` VALUES ('721', '1091001', '1052101', '16000', '0', '120');
INSERT INTO `shopitems` VALUES ('722', '1091001', '1052098', '8000', '0', '124');
INSERT INTO `shopitems` VALUES ('723', '1091001', '1052095', '4000', '0', '128');
INSERT INTO `shopitems` VALUES ('724', '1091001', '1002619', '20000', '0', '132');
INSERT INTO `shopitems` VALUES ('725', '1091001', '1002616', '12000', '0', '136');
INSERT INTO `shopitems` VALUES ('726', '1091001', '1002613', '4000', '0', '140');
INSERT INTO `shopitems` VALUES ('727', '1091001', '1002610', '900', '0', '144');
INSERT INTO `shopitems` VALUES ('728', '1091002', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('729', '1091002', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('730', '1091002', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('731', '1091002', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('732', '1091002', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('733', '1091002', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('734', '1091002', '2030019', '500', '0', '128');
INSERT INTO `shopitems` VALUES ('735', '1091002', '2030000', '400', '0', '132');
INSERT INTO `shopitems` VALUES ('736', '1091002', '2020028', '3000', '0', '136');
INSERT INTO `shopitems` VALUES ('737', '1091002', '2010004', '310', '0', '140');
INSERT INTO `shopitems` VALUES ('738', '1091002', '2010003', '100', '0', '144');
INSERT INTO `shopitems` VALUES ('739', '1091002', '2010001', '106', '0', '148');
INSERT INTO `shopitems` VALUES ('740', '1091002', '2010002', '50', '0', '152');
INSERT INTO `shopitems` VALUES ('741', '1091002', '2010000', '30', '0', '156');
INSERT INTO `shopitems` VALUES ('742', '1091002', '2002005', '500', '0', '160');
INSERT INTO `shopitems` VALUES ('743', '1091002', '2002004', '500', '0', '164');
INSERT INTO `shopitems` VALUES ('744', '1091002', '2002002', '500', '0', '168');
INSERT INTO `shopitems` VALUES ('745', '1091002', '2002001', '400', '0', '172');
INSERT INTO `shopitems` VALUES ('746', '1091002', '2002000', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('747', '1091002', '2000006', '620', '0', '180');
INSERT INTO `shopitems` VALUES ('748', '1091002', '2000003', '200', '0', '184');
INSERT INTO `shopitems` VALUES ('749', '1091002', '2000002', '320', '0', '188');
INSERT INTO `shopitems` VALUES ('750', '1091002', '2000001', '160', '0', '192');
INSERT INTO `shopitems` VALUES ('751', '1091002', '2000000', '50', '0', '196');
INSERT INTO `shopitems` VALUES ('752', '1093000', '2022258', '105', '0', '104');
INSERT INTO `shopitems` VALUES ('753', '1100001', '1072005', '50', '0', '104');
INSERT INTO `shopitems` VALUES ('754', '1100001', '1072001', '50', '0', '108');
INSERT INTO `shopitems` VALUES ('755', '1100001', '1061008', '50', '0', '112');
INSERT INTO `shopitems` VALUES ('756', '1100001', '1061002', '50', '0', '116');
INSERT INTO `shopitems` VALUES ('757', '1100001', '1060006', '50', '0', '120');
INSERT INTO `shopitems` VALUES ('758', '1100001', '1060002', '50', '0', '124');
INSERT INTO `shopitems` VALUES ('759', '1100001', '1041011', '50', '0', '128');
INSERT INTO `shopitems` VALUES ('760', '1100001', '1041010', '50', '0', '132');
INSERT INTO `shopitems` VALUES ('761', '1100001', '1041006', '50', '0', '136');
INSERT INTO `shopitems` VALUES ('762', '1100001', '1041002', '50', '0', '140');
INSERT INTO `shopitems` VALUES ('763', '1100001', '1040010', '50', '0', '144');
INSERT INTO `shopitems` VALUES ('764', '1100001', '1040006', '50', '0', '148');
INSERT INTO `shopitems` VALUES ('765', '1100001', '1040002', '50', '0', '152');
INSERT INTO `shopitems` VALUES ('766', '1100001', '1332005', '500', '0', '156');
INSERT INTO `shopitems` VALUES ('767', '1100001', '1322005', '50', '0', '160');
INSERT INTO `shopitems` VALUES ('768', '1100001', '1312004', '50', '0', '164');
INSERT INTO `shopitems` VALUES ('769', '1100001', '1302000', '50', '0', '168');
INSERT INTO `shopitems` VALUES ('770', '1100002', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('771', '1100002', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('772', '1100002', '2050002', '300', '0', '112');
INSERT INTO `shopitems` VALUES ('773', '1100002', '2050001', '200', '0', '116');
INSERT INTO `shopitems` VALUES ('774', '1100002', '2050000', '200', '0', '120');
INSERT INTO `shopitems` VALUES ('775', '1100002', '2061000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('776', '1100002', '2060000', '1400', '0', '128');
INSERT INTO `shopitems` VALUES ('777', '1100002', '2061000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('778', '1100002', '2060000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('779', '1100002', '2030000', '400', '0', '140');
INSERT INTO `shopitems` VALUES ('780', '1100002', '2120008', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('781', '1100002', '2010004', '310', '0', '148');
INSERT INTO `shopitems` VALUES ('782', '1100002', '2010003', '100', '0', '152');
INSERT INTO `shopitems` VALUES ('783', '1100002', '2010001', '106', '0', '156');
INSERT INTO `shopitems` VALUES ('784', '1100002', '2010002', '50', '0', '160');
INSERT INTO `shopitems` VALUES ('785', '1100002', '2010000', '30', '0', '164');
INSERT INTO `shopitems` VALUES ('786', '1100002', '2002005', '500', '0', '168');
INSERT INTO `shopitems` VALUES ('787', '1100002', '2002004', '500', '0', '172');
INSERT INTO `shopitems` VALUES ('788', '1100002', '2002002', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('789', '1100002', '2002001', '400', '0', '180');
INSERT INTO `shopitems` VALUES ('790', '1100002', '2002000', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('791', '1100002', '2000006', '620', '0', '188');
INSERT INTO `shopitems` VALUES ('792', '1100002', '2000003', '200', '0', '192');
INSERT INTO `shopitems` VALUES ('793', '1100002', '2000002', '320', '0', '196');
INSERT INTO `shopitems` VALUES ('794', '1100002', '2000001', '160', '0', '200');
INSERT INTO `shopitems` VALUES ('795', '1100002', '2000000', '50', '0', '204');
INSERT INTO `shopitems` VALUES ('796', '2010004', '4160019', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('797', '2010004', '4160039', '1000', '0', '108');
INSERT INTO `shopitems` VALUES ('798', '2010004', '4160037', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('799', '2010004', '4031993', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('800', '2010004', '4160036', '1000', '0', '120');
INSERT INTO `shopitems` VALUES ('801', '2010004', '4160035', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('802', '2010004', '4160034', '1000', '0', '128');
INSERT INTO `shopitems` VALUES ('803', '2010004', '4160032', '1000', '0', '132');
INSERT INTO `shopitems` VALUES ('804', '2010004', '4160024', '1000', '0', '136');
INSERT INTO `shopitems` VALUES ('805', '2010004', '4160023', '1000', '0', '140');
INSERT INTO `shopitems` VALUES ('806', '2010004', '4160022', '1000', '0', '144');
INSERT INTO `shopitems` VALUES ('807', '2010004', '4160015', '1000', '0', '148');
INSERT INTO `shopitems` VALUES ('808', '2010004', '4160012', '1000', '0', '152');
INSERT INTO `shopitems` VALUES ('809', '2010004', '4160013', '1000', '0', '156');
INSERT INTO `shopitems` VALUES ('810', '2010004', '4160017', '1000', '0', '160');
INSERT INTO `shopitems` VALUES ('811', '2010004', '4160014', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('812', '2010004', '4160020', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('813', '2010004', '4160010', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('814', '2010004', '4160009', '1000', '0', '176');
INSERT INTO `shopitems` VALUES ('815', '2010004', '4160008', '1000', '0', '180');
INSERT INTO `shopitems` VALUES ('816', '2010004', '4160007', '1000', '0', '184');
INSERT INTO `shopitems` VALUES ('817', '2010004', '4160006', '1000', '0', '188');
INSERT INTO `shopitems` VALUES ('818', '2010004', '4160005', '1000', '0', '192');
INSERT INTO `shopitems` VALUES ('819', '2010004', '4160004', '1000', '0', '196');
INSERT INTO `shopitems` VALUES ('820', '2010004', '4160003', '1000', '0', '200');
INSERT INTO `shopitems` VALUES ('821', '2010004', '4160002', '1000', '0', '204');
INSERT INTO `shopitems` VALUES ('822', '2010004', '4160001', '1000', '0', '208');
INSERT INTO `shopitems` VALUES ('823', '2010004', '4160000', '1000', '0', '212');
INSERT INTO `shopitems` VALUES ('824', '2010004', '4160026', '1000', '0', '216');
INSERT INTO `shopitems` VALUES ('825', '2010004', '2260000', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('826', '2010004', '2120000', '30', '0', '224');
INSERT INTO `shopitems` VALUES ('827', '2012003', '1492004', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('828', '2012003', '1482004', '75000', '0', '108');
INSERT INTO `shopitems` VALUES ('829', '2012003', '1472001', '20000', '0', '112');
INSERT INTO `shopitems` VALUES ('830', '2012003', '1462000', '30000', '0', '116');
INSERT INTO `shopitems` VALUES ('831', '2012003', '1452005', '150000', '0', '120');
INSERT INTO `shopitems` VALUES ('832', '2012003', '1442001', '60000', '0', '124');
INSERT INTO `shopitems` VALUES ('833', '2012003', '1432002', '60000', '0', '128');
INSERT INTO `shopitems` VALUES ('834', '2012003', '1422001', '45000', '0', '132');
INSERT INTO `shopitems` VALUES ('835', '2012003', '1412006', '45000', '0', '136');
INSERT INTO `shopitems` VALUES ('836', '2012003', '1402002', '150000', '0', '140');
INSERT INTO `shopitems` VALUES ('837', '2012003', '1382002', '20000', '0', '144');
INSERT INTO `shopitems` VALUES ('838', '2012003', '1372003', '38000', '0', '148');
INSERT INTO `shopitems` VALUES ('839', '2012003', '1332012', '40000', '0', '152');
INSERT INTO `shopitems` VALUES ('840', '2012003', '1332009', '42000', '0', '156');
INSERT INTO `shopitems` VALUES ('841', '2012003', '1322014', '40000', '0', '160');
INSERT INTO `shopitems` VALUES ('842', '2012003', '1312005', '40000', '0', '164');
INSERT INTO `shopitems` VALUES ('843', '2012003', '1302008', '40000', '0', '168');
INSERT INTO `shopitems` VALUES ('844', '2012004', '1052107', '90000', '0', '104');
INSERT INTO `shopitems` VALUES ('845', '2012004', '1002622', '40000', '0', '108');
INSERT INTO `shopitems` VALUES ('846', '2012004', '1061046', '40000', '0', '112');
INSERT INTO `shopitems` VALUES ('847', '2012004', '1061045', '40000', '0', '116');
INSERT INTO `shopitems` VALUES ('848', '2012004', '1061044', '40000', '0', '120');
INSERT INTO `shopitems` VALUES ('849', '2012004', '1061043', '40000', '0', '124');
INSERT INTO `shopitems` VALUES ('850', '2012004', '1060046', '40000', '0', '128');
INSERT INTO `shopitems` VALUES ('851', '2012004', '1060045', '40000', '0', '132');
INSERT INTO `shopitems` VALUES ('852', '2012004', '1060044', '40000', '0', '136');
INSERT INTO `shopitems` VALUES ('853', '2012004', '1060043', '40000', '0', '140');
INSERT INTO `shopitems` VALUES ('854', '2012004', '1041050', '45000', '0', '144');
INSERT INTO `shopitems` VALUES ('855', '2012004', '1041049', '45000', '0', '148');
INSERT INTO `shopitems` VALUES ('856', '2012004', '1041048', '45000', '0', '152');
INSERT INTO `shopitems` VALUES ('857', '2012004', '1041047', '45000', '0', '156');
INSERT INTO `shopitems` VALUES ('858', '2012004', '1040060', '45000', '0', '160');
INSERT INTO `shopitems` VALUES ('859', '2012004', '1040059', '45000', '0', '164');
INSERT INTO `shopitems` VALUES ('860', '2012004', '1040058', '45000', '0', '168');
INSERT INTO `shopitems` VALUES ('861', '2012004', '1040057', '45000', '0', '172');
INSERT INTO `shopitems` VALUES ('862', '2012004', '1002175', '30000', '0', '176');
INSERT INTO `shopitems` VALUES ('863', '2012004', '1002174', '30000', '0', '180');
INSERT INTO `shopitems` VALUES ('864', '2012004', '1002173', '30000', '0', '184');
INSERT INTO `shopitems` VALUES ('865', '2012004', '1002172', '30000', '0', '188');
INSERT INTO `shopitems` VALUES ('866', '2012004', '1002171', '30000', '0', '192');
INSERT INTO `shopitems` VALUES ('867', '2012004', '1061051', '44000', '0', '196');
INSERT INTO `shopitems` VALUES ('868', '2012004', '1061050', '44000', '0', '200');
INSERT INTO `shopitems` VALUES ('869', '2012004', '1061052', '44000', '0', '204');
INSERT INTO `shopitems` VALUES ('870', '2012004', '1060057', '44000', '0', '208');
INSERT INTO `shopitems` VALUES ('871', '2012004', '1060056', '44000', '0', '212');
INSERT INTO `shopitems` VALUES ('872', '2012004', '1060058', '44000', '0', '216');
INSERT INTO `shopitems` VALUES ('873', '2012004', '1060059', '44000', '0', '220');
INSERT INTO `shopitems` VALUES ('874', '2012004', '1041055', '50000', '0', '224');
INSERT INTO `shopitems` VALUES ('875', '2012004', '1041054', '50000', '0', '228');
INSERT INTO `shopitems` VALUES ('876', '2012004', '1041056', '50000', '0', '232');
INSERT INTO `shopitems` VALUES ('877', '2012004', '1040068', '50000', '0', '236');
INSERT INTO `shopitems` VALUES ('878', '2012004', '1040067', '50000', '0', '240');
INSERT INTO `shopitems` VALUES ('879', '2012004', '1040070', '50000', '0', '244');
INSERT INTO `shopitems` VALUES ('880', '2012004', '1040069', '50000', '0', '248');
INSERT INTO `shopitems` VALUES ('881', '2012004', '1002165', '30000', '0', '252');
INSERT INTO `shopitems` VALUES ('882', '2012004', '1002164', '30000', '0', '256');
INSERT INTO `shopitems` VALUES ('883', '2012004', '1002163', '30000', '0', '260');
INSERT INTO `shopitems` VALUES ('884', '2012004', '1002162', '30000', '0', '264');
INSERT INTO `shopitems` VALUES ('885', '2012004', '1002161', '30000', '0', '268');
INSERT INTO `shopitems` VALUES ('886', '2012004', '1061036', '40000', '0', '272');
INSERT INTO `shopitems` VALUES ('887', '2012004', '1061035', '40000', '0', '276');
INSERT INTO `shopitems` VALUES ('888', '2012004', '1061034', '40000', '0', '280');
INSERT INTO `shopitems` VALUES ('889', '2012004', '1050028', '40000', '0', '284');
INSERT INTO `shopitems` VALUES ('890', '2012004', '1050027', '40000', '0', '288');
INSERT INTO `shopitems` VALUES ('891', '2012004', '1050026', '40000', '0', '292');
INSERT INTO `shopitems` VALUES ('892', '2012004', '1050003', '40000', '0', '296');
INSERT INTO `shopitems` VALUES ('893', '2012004', '1041043', '42000', '0', '300');
INSERT INTO `shopitems` VALUES ('894', '2012004', '1041042', '42000', '0', '304');
INSERT INTO `shopitems` VALUES ('895', '2012004', '1041041', '42000', '0', '308');
INSERT INTO `shopitems` VALUES ('896', '2012004', '1002064', '40000', '0', '312');
INSERT INTO `shopitems` VALUES ('897', '2012004', '1092006', '60000', '0', '316');
INSERT INTO `shopitems` VALUES ('898', '2012004', '1060019', '38000', '0', '320');
INSERT INTO `shopitems` VALUES ('899', '2012004', '1060018', '38000', '0', '324');
INSERT INTO `shopitems` VALUES ('900', '2012004', '1060017', '38000', '0', '328');
INSERT INTO `shopitems` VALUES ('901', '2012004', '1060016', '38000', '0', '332');
INSERT INTO `shopitems` VALUES ('902', '2012004', '1051013', '60000', '0', '336');
INSERT INTO `shopitems` VALUES ('903', '2012004', '1051012', '60000', '0', '340');
INSERT INTO `shopitems` VALUES ('904', '2012004', '1051011', '60000', '0', '344');
INSERT INTO `shopitems` VALUES ('905', '2012004', '1051010', '60000', '0', '348');
INSERT INTO `shopitems` VALUES ('906', '2012004', '1040026', '40000', '0', '352');
INSERT INTO `shopitems` VALUES ('907', '2012004', '1040021', '40000', '0', '356');
INSERT INTO `shopitems` VALUES ('908', '2012004', '1002023', '120000', '0', '360');
INSERT INTO `shopitems` VALUES ('909', '2012005', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('910', '2012005', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('911', '2012005', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('912', '2012005', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('913', '2012005', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('914', '2012005', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('915', '2012005', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('916', '2012005', '2050003', '500', '0', '132');
INSERT INTO `shopitems` VALUES ('917', '2012005', '2050002', '300', '0', '136');
INSERT INTO `shopitems` VALUES ('918', '2012005', '2050001', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('919', '2012005', '2050000', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('920', '2012005', '2020028', '3000', '0', '148');
INSERT INTO `shopitems` VALUES ('921', '2012005', '2010004', '310', '0', '152');
INSERT INTO `shopitems` VALUES ('922', '2012005', '2010003', '100', '0', '156');
INSERT INTO `shopitems` VALUES ('923', '2012005', '2010001', '106', '0', '160');
INSERT INTO `shopitems` VALUES ('924', '2012005', '2010002', '50', '0', '164');
INSERT INTO `shopitems` VALUES ('925', '2012005', '2010000', '30', '0', '168');
INSERT INTO `shopitems` VALUES ('926', '2012005', '2001002', '4000', '0', '172');
INSERT INTO `shopitems` VALUES ('927', '2012005', '2001001', '2300', '0', '176');
INSERT INTO `shopitems` VALUES ('928', '2012005', '2001000', '3200', '0', '180');
INSERT INTO `shopitems` VALUES ('929', '2012005', '2022000', '1650', '0', '184');
INSERT INTO `shopitems` VALUES ('930', '2012005', '2022003', '1100', '0', '188');
INSERT INTO `shopitems` VALUES ('931', '2012005', '2002005', '500', '0', '192');
INSERT INTO `shopitems` VALUES ('932', '2012005', '2002004', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('933', '2012005', '2002002', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('934', '2012005', '2002001', '400', '0', '204');
INSERT INTO `shopitems` VALUES ('935', '2012005', '2002000', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('936', '2012005', '2000006', '620', '0', '212');
INSERT INTO `shopitems` VALUES ('937', '2012005', '2000003', '200', '0', '216');
INSERT INTO `shopitems` VALUES ('938', '2012005', '2000002', '320', '0', '220');
INSERT INTO `shopitems` VALUES ('939', '2012005', '2000001', '160', '0', '224');
INSERT INTO `shopitems` VALUES ('940', '2012005', '2000000', '50', '0', '228');
INSERT INTO `shopitems` VALUES ('941', '2020001', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('942', '2020001', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('943', '2020001', '1482006', '150000', '0', '112');
INSERT INTO `shopitems` VALUES ('944', '2020001', '1482005', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('945', '2020001', '1472007', '60000', '0', '120');
INSERT INTO `shopitems` VALUES ('946', '2020001', '1472004', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('947', '2020001', '1462005', '250000', '0', '128');
INSERT INTO `shopitems` VALUES ('948', '2020001', '1462004', '200000', '0', '132');
INSERT INTO `shopitems` VALUES ('949', '2020001', '1452007', '375000', '0', '136');
INSERT INTO `shopitems` VALUES ('950', '2020001', '1452006', '250000', '0', '140');
INSERT INTO `shopitems` VALUES ('951', '2020001', '1442009', '300000', '0', '144');
INSERT INTO `shopitems` VALUES ('952', '2020001', '1442003', '175000', '0', '148');
INSERT INTO `shopitems` VALUES ('953', '2020001', '1432005', '225000', '0', '152');
INSERT INTO `shopitems` VALUES ('954', '2020001', '1432003', '175000', '0', '156');
INSERT INTO `shopitems` VALUES ('955', '2020001', '1422007', '250000', '0', '160');
INSERT INTO `shopitems` VALUES ('956', '2020001', '1422008', '200000', '0', '164');
INSERT INTO `shopitems` VALUES ('957', '2020001', '1412005', '250000', '0', '168');
INSERT INTO `shopitems` VALUES ('958', '2020001', '1412004', '200000', '0', '172');
INSERT INTO `shopitems` VALUES ('959', '2020001', '1402007', '450000', '0', '176');
INSERT INTO `shopitems` VALUES ('960', '2020001', '1402006', '350000', '0', '180');
INSERT INTO `shopitems` VALUES ('961', '2020001', '1372000', '400000', '0', '184');
INSERT INTO `shopitems` VALUES ('962', '2020001', '1372001', '175000', '0', '188');
INSERT INTO `shopitems` VALUES ('963', '2020001', '1332011', '425000', '0', '192');
INSERT INTO `shopitems` VALUES ('964', '2020001', '1332014', '375000', '0', '196');
INSERT INTO `shopitems` VALUES ('965', '2020001', '1332001', '200000', '0', '200');
INSERT INTO `shopitems` VALUES ('966', '2020001', '1322016', '175000', '0', '204');
INSERT INTO `shopitems` VALUES ('967', '2020001', '1322015', '100000', '0', '208');
INSERT INTO `shopitems` VALUES ('968', '2020001', '1312007', '175000', '0', '212');
INSERT INTO `shopitems` VALUES ('969', '2020001', '1312006', '100000', '0', '216');
INSERT INTO `shopitems` VALUES ('970', '2020001', '1302009', '225000', '0', '220');
INSERT INTO `shopitems` VALUES ('971', '2020001', '1302004', '100000', '0', '224');
INSERT INTO `shopitems` VALUES ('972', '2022000', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('973', '2022000', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('974', '2022000', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('975', '2022000', '1061069', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('976', '2022000', '1061070', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('977', '2022000', '1060072', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('978', '2022000', '1060071', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('979', '2022000', '1060052', '108000', '0', '132');
INSERT INTO `shopitems` VALUES ('980', '2022000', '1060050', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('981', '2022000', '1060051', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('982', '2022000', '1051009', '111000', '0', '144');
INSERT INTO `shopitems` VALUES ('983', '2022000', '1051008', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('984', '2022000', '1051007', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('985', '2022000', '1041074', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('986', '2022000', '1041075', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('987', '2022000', '1040083', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('988', '2022000', '1040082', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('989', '2022000', '1040061', '114000', '0', '172');
INSERT INTO `shopitems` VALUES ('990', '2022000', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('991', '2022000', '1040063', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('992', '2022000', '1002180', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('993', '2022000', '1002179', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('994', '2022000', '1002178', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('995', '2022000', '1002177', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('996', '2022000', '1002176', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('997', '2022000', '1061080', '160000', '0', '204');
INSERT INTO `shopitems` VALUES ('998', '2022000', '1061081', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('999', '2022000', '1061062', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('1000', '2022000', '1061060', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('1001', '2022000', '1061064', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('1002', '2022000', '1061061', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('1003', '2022000', '1060069', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('1004', '2022000', '1060070', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('1005', '2022000', '1060063', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('1006', '2022000', '1060061', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('1007', '2022000', '1060065', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('1008', '2022000', '1060062', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('1009', '2022000', '1041081', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('1010', '2022000', '1041082', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('1011', '2022000', '1041067', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('1012', '2022000', '1041065', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('1013', '2022000', '1041069', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('1014', '2022000', '1041066', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('1015', '2022000', '1040079', '180000', '0', '276');
INSERT INTO `shopitems` VALUES ('1016', '2022000', '1040081', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('1017', '2022000', '1040076', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('1018', '2022000', '1040074', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('1019', '2022000', '1040073', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('1020', '2022000', '1040072', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('1021', '2022000', '1002137', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('1022', '2022000', '1002135', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('1023', '2022000', '1002139', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('1024', '2022000', '1002138', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('1025', '2022000', '1061047', '120000', '0', '316');
INSERT INTO `shopitems` VALUES ('1026', '2022000', '1061048', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('1027', '2022000', '1051027', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('1028', '2022000', '1051024', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('1029', '2022000', '1051025', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('1030', '2022000', '1051023', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('1031', '2022000', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('1032', '2022000', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('1033', '2022000', '1050038', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('1034', '2022000', '1050035', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('1035', '2022000', '1050002', '300000', '0', '356');
INSERT INTO `shopitems` VALUES ('1036', '2022000', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('1037', '2022000', '1041051', '120000', '0', '364');
INSERT INTO `shopitems` VALUES ('1038', '2022000', '1041052', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('1039', '2022000', '1002144', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('1040', '2022000', '1002143', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('1041', '2022000', '1002142', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('1042', '2022000', '1002141', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('1043', '2022000', '1092002', '200000', '0', '388');
INSERT INTO `shopitems` VALUES ('1044', '2022000', '1092001', '100000', '0', '392');
INSERT INTO `shopitems` VALUES ('1045', '2022000', '1061084', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('1046', '2022000', '1061083', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('1047', '2022000', '1060074', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('1048', '2022000', '1060075', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('1049', '2022000', '1051014', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('1050', '2022000', '1051001', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('1051', '2022000', '1050021', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('1052', '2022000', '1050000', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('1053', '2022000', '1041085', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('1054', '2022000', '1041084', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('1055', '2022000', '1040085', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('1056', '2022000', '1040000', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('1057', '2022000', '1002004', '160000', '0', '444');
INSERT INTO `shopitems` VALUES ('1058', '2022000', '1072338', '29000', '0', '448');
INSERT INTO `shopitems` VALUES ('1059', '2022000', '1072171', '29000', '0', '452');
INSERT INTO `shopitems` VALUES ('1060', '2022000', '1072170', '29000', '0', '456');
INSERT INTO `shopitems` VALUES ('1061', '2022000', '1072169', '28000', '0', '460');
INSERT INTO `shopitems` VALUES ('1062', '2022000', '1072168', '30000', '0', '464');
INSERT INTO `shopitems` VALUES ('1063', '2022001', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1064', '2022001', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1065', '2022001', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('1066', '2022001', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('1067', '2022001', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('1068', '2022001', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('1069', '2022001', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('1070', '2022001', '2050002', '300', '0', '132');
INSERT INTO `shopitems` VALUES ('1071', '2022001', '2050001', '200', '0', '136');
INSERT INTO `shopitems` VALUES ('1072', '2022001', '2050000', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('1073', '2022001', '2020015', '10200', '0', '144');
INSERT INTO `shopitems` VALUES ('1074', '2022001', '2020014', '8100', '0', '148');
INSERT INTO `shopitems` VALUES ('1075', '2022001', '2020013', '5600', '0', '152');
INSERT INTO `shopitems` VALUES ('1076', '2022001', '2020012', '4500', '0', '156');
INSERT INTO `shopitems` VALUES ('1077', '2022001', '2001002', '4000', '0', '160');
INSERT INTO `shopitems` VALUES ('1078', '2022001', '2001001', '2300', '0', '164');
INSERT INTO `shopitems` VALUES ('1079', '2022001', '2001000', '3200', '0', '168');
INSERT INTO `shopitems` VALUES ('1080', '2022001', '2022000', '1650', '0', '172');
INSERT INTO `shopitems` VALUES ('1081', '2022001', '2022003', '1100', '0', '176');
INSERT INTO `shopitems` VALUES ('1082', '2022001', '2010004', '310', '0', '180');
INSERT INTO `shopitems` VALUES ('1083', '2022001', '2010003', '100', '0', '184');
INSERT INTO `shopitems` VALUES ('1084', '2022001', '2010001', '106', '0', '188');
INSERT INTO `shopitems` VALUES ('1085', '2022001', '2010002', '50', '0', '192');
INSERT INTO `shopitems` VALUES ('1086', '2022001', '2010000', '30', '0', '196');
INSERT INTO `shopitems` VALUES ('1087', '2022001', '2002005', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('1088', '2022001', '2002004', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('1089', '2022001', '2002002', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('1090', '2022001', '2002001', '400', '0', '212');
INSERT INTO `shopitems` VALUES ('1091', '2022001', '2002000', '500', '0', '216');
INSERT INTO `shopitems` VALUES ('1092', '2022001', '2000006', '620', '0', '220');
INSERT INTO `shopitems` VALUES ('1093', '2022001', '2000003', '200', '0', '224');
INSERT INTO `shopitems` VALUES ('1094', '2022001', '2000002', '320', '0', '228');
INSERT INTO `shopitems` VALUES ('1095', '2022001', '2000001', '160', '0', '232');
INSERT INTO `shopitems` VALUES ('1096', '2022001', '2000000', '50', '0', '236');
INSERT INTO `shopitems` VALUES ('1097', '2022001', '2022186', '2400', '0', '240');
INSERT INTO `shopitems` VALUES ('1098', '2022001', '2022001', '400', '0', '244');
INSERT INTO `shopitems` VALUES ('1099', '2022002', '2044900', '70000', '0', '104');
INSERT INTO `shopitems` VALUES ('1100', '2022002', '2044800', '70000', '0', '108');
INSERT INTO `shopitems` VALUES ('1101', '2022002', '2044700', '70000', '0', '112');
INSERT INTO `shopitems` VALUES ('1102', '2022002', '2044600', '70000', '0', '116');
INSERT INTO `shopitems` VALUES ('1103', '2022002', '2044500', '70000', '0', '120');
INSERT INTO `shopitems` VALUES ('1104', '2022002', '2044400', '70000', '0', '124');
INSERT INTO `shopitems` VALUES ('1105', '2022002', '2044300', '70000', '0', '128');
INSERT INTO `shopitems` VALUES ('1106', '2022002', '2044200', '70000', '0', '132');
INSERT INTO `shopitems` VALUES ('1107', '2022002', '2044100', '70000', '0', '136');
INSERT INTO `shopitems` VALUES ('1108', '2022002', '2044000', '70000', '0', '140');
INSERT INTO `shopitems` VALUES ('1109', '2022002', '2043800', '70000', '0', '144');
INSERT INTO `shopitems` VALUES ('1110', '2022002', '2043700', '70000', '0', '148');
INSERT INTO `shopitems` VALUES ('1111', '2022002', '2043300', '70000', '0', '152');
INSERT INTO `shopitems` VALUES ('1112', '2022002', '2043200', '70000', '0', '156');
INSERT INTO `shopitems` VALUES ('1113', '2022002', '2043100', '70000', '0', '160');
INSERT INTO `shopitems` VALUES ('1114', '2022002', '2043000', '70000', '0', '164');
INSERT INTO `shopitems` VALUES ('1115', '2022002', '2041003', '35000', '0', '168');
INSERT INTO `shopitems` VALUES ('1116', '2022002', '2041000', '35000', '0', '172');
INSERT INTO `shopitems` VALUES ('1117', '2022002', '2040900', '35000', '0', '176');
INSERT INTO `shopitems` VALUES ('1118', '2022002', '2040800', '35000', '0', '180');
INSERT INTO `shopitems` VALUES ('1119', '2022002', '2040700', '35000', '0', '184');
INSERT INTO `shopitems` VALUES ('1120', '2022002', '2040600', '35000', '0', '188');
INSERT INTO `shopitems` VALUES ('1121', '2022002', '2040503', '35000', '0', '192');
INSERT INTO `shopitems` VALUES ('1122', '2022002', '2040400', '35000', '0', '196');
INSERT INTO `shopitems` VALUES ('1123', '2022002', '2040300', '35000', '0', '200');
INSERT INTO `shopitems` VALUES ('1124', '2022002', '2040003', '35000', '0', '204');
INSERT INTO `shopitems` VALUES ('1125', '2030009', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1126', '2030009', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1127', '2030009', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('1128', '2030009', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('1129', '2030009', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('1130', '2030009', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('1131', '2030009', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('1132', '2030009', '2020015', '10608', '0', '132');
INSERT INTO `shopitems` VALUES ('1133', '2030009', '2020014', '8424', '0', '136');
INSERT INTO `shopitems` VALUES ('1134', '2030009', '2020013', '5824', '0', '140');
INSERT INTO `shopitems` VALUES ('1135', '2030009', '2020012', '4680', '0', '144');
INSERT INTO `shopitems` VALUES ('1136', '2030009', '2022000', '1716', '0', '148');
INSERT INTO `shopitems` VALUES ('1137', '2030009', '2022003', '1144', '0', '152');
INSERT INTO `shopitems` VALUES ('1138', '2030009', '2020006', '551', '0', '156');
INSERT INTO `shopitems` VALUES ('1139', '2030009', '2020004', '468', '0', '160');
INSERT INTO `shopitems` VALUES ('1140', '2030009', '2020003', '468', '0', '164');
INSERT INTO `shopitems` VALUES ('1141', '2030009', '2020001', '228', '0', '168');
INSERT INTO `shopitems` VALUES ('1142', '2030009', '2010004', '322', '0', '172');
INSERT INTO `shopitems` VALUES ('1143', '2030009', '2020005', '332', '0', '176');
INSERT INTO `shopitems` VALUES ('1144', '2030009', '2001002', '4160', '0', '180');
INSERT INTO `shopitems` VALUES ('1145', '2030009', '2001001', '2392', '0', '184');
INSERT INTO `shopitems` VALUES ('1146', '2030009', '2001000', '3328', '0', '188');
INSERT INTO `shopitems` VALUES ('1147', '2030009', '2002005', '520', '0', '192');
INSERT INTO `shopitems` VALUES ('1148', '2030009', '2002004', '520', '0', '196');
INSERT INTO `shopitems` VALUES ('1149', '2030009', '2002002', '520', '0', '200');
INSERT INTO `shopitems` VALUES ('1150', '2030009', '2002001', '416', '0', '204');
INSERT INTO `shopitems` VALUES ('1151', '2030009', '2002000', '520', '0', '208');
INSERT INTO `shopitems` VALUES ('1152', '2030009', '2000006', '644', '0', '212');
INSERT INTO `shopitems` VALUES ('1153', '2030009', '2000003', '208', '0', '216');
INSERT INTO `shopitems` VALUES ('1154', '2030009', '2000002', '332', '0', '220');
INSERT INTO `shopitems` VALUES ('1155', '2030009', '2000001', '166', '0', '224');
INSERT INTO `shopitems` VALUES ('1156', '2040049', '2061001', '10', '0', '104');
INSERT INTO `shopitems` VALUES ('1157', '2040049', '2060001', '10', '0', '108');
INSERT INTO `shopitems` VALUES ('1158', '2040049', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('1159', '2040049', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('1160', '2040049', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('1161', '2040049', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('1162', '2040049', '2120000', '25', '0', '128');
INSERT INTO `shopitems` VALUES ('1163', '2040049', '2020015', '10608', '0', '132');
INSERT INTO `shopitems` VALUES ('1164', '2040049', '2020014', '8424', '0', '136');
INSERT INTO `shopitems` VALUES ('1165', '2040049', '2020013', '5824', '0', '140');
INSERT INTO `shopitems` VALUES ('1166', '2040049', '2020012', '4680', '0', '144');
INSERT INTO `shopitems` VALUES ('1167', '2040049', '2022000', '1716', '0', '148');
INSERT INTO `shopitems` VALUES ('1168', '2040049', '2022003', '1144', '0', '152');
INSERT INTO `shopitems` VALUES ('1169', '2040049', '2020006', '503', '0', '156');
INSERT INTO `shopitems` VALUES ('1170', '2040049', '2020005', '304', '0', '160');
INSERT INTO `shopitems` VALUES ('1171', '2040049', '2020004', '427', '0', '164');
INSERT INTO `shopitems` VALUES ('1172', '2040049', '2020003', '427', '0', '168');
INSERT INTO `shopitems` VALUES ('1173', '2040049', '2020002', '304', '0', '172');
INSERT INTO `shopitems` VALUES ('1174', '2040049', '2020001', '209', '0', '176');
INSERT INTO `shopitems` VALUES ('1175', '2040049', '2010002', '47', '0', '180');
INSERT INTO `shopitems` VALUES ('1176', '2040049', '2010001', '106', '0', '184');
INSERT INTO `shopitems` VALUES ('1177', '2040049', '2002010', '475', '0', '188');
INSERT INTO `shopitems` VALUES ('1178', '2040049', '2002009', '570', '0', '192');
INSERT INTO `shopitems` VALUES ('1179', '2040049', '2002008', '570', '0', '196');
INSERT INTO `shopitems` VALUES ('1180', '2040049', '2002007', '570', '0', '200');
INSERT INTO `shopitems` VALUES ('1181', '2040049', '2002006', '570', '0', '204');
INSERT INTO `shopitems` VALUES ('1182', '2040049', '2001002', '3800', '0', '208');
INSERT INTO `shopitems` VALUES ('1183', '2040049', '2001001', '2185', '0', '212');
INSERT INTO `shopitems` VALUES ('1184', '2040049', '2000006', '589', '0', '216');
INSERT INTO `shopitems` VALUES ('1185', '2040049', '2000011', '620', '0', '220');
INSERT INTO `shopitems` VALUES ('1186', '2040049', '2000003', '190', '0', '224');
INSERT INTO `shopitems` VALUES ('1187', '2040049', '2000010', '200', '0', '228');
INSERT INTO `shopitems` VALUES ('1188', '2040049', '2000002', '304', '0', '232');
INSERT INTO `shopitems` VALUES ('1189', '2040049', '2000009', '320', '0', '236');
INSERT INTO `shopitems` VALUES ('1190', '2040049', '2000001', '152', '0', '240');
INSERT INTO `shopitems` VALUES ('1191', '2040049', '2000008', '160', '0', '244');
INSERT INTO `shopitems` VALUES ('1192', '2040049', '2000000', '47', '0', '248');
INSERT INTO `shopitems` VALUES ('1193', '2040049', '2000007', '50', '0', '252');
INSERT INTO `shopitems` VALUES ('1194', '2040051', '2030000', '400', '0', '104');
INSERT INTO `shopitems` VALUES ('1195', '2040051', '2061001', '10', '0', '108');
INSERT INTO `shopitems` VALUES ('1196', '2040051', '2060001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1197', '2040051', '2061000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('1198', '2040051', '2060000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1199', '2040051', '2061000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('1200', '2040051', '2060000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1201', '2040051', '2050003', '500', '0', '132');
INSERT INTO `shopitems` VALUES ('1202', '2040051', '2050002', '300', '0', '136');
INSERT INTO `shopitems` VALUES ('1203', '2040051', '2050001', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('1204', '2040051', '2050000', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('1205', '2040051', '2000006', '620', '0', '148');
INSERT INTO `shopitems` VALUES ('1206', '2040051', '2000011', '620', '0', '152');
INSERT INTO `shopitems` VALUES ('1207', '2040051', '2000003', '200', '0', '156');
INSERT INTO `shopitems` VALUES ('1208', '2040051', '2000010', '200', '0', '160');
INSERT INTO `shopitems` VALUES ('1209', '2040051', '2000002', '320', '0', '164');
INSERT INTO `shopitems` VALUES ('1210', '2040051', '2000009', '320', '0', '168');
INSERT INTO `shopitems` VALUES ('1211', '2040051', '2000001', '160', '0', '172');
INSERT INTO `shopitems` VALUES ('1212', '2040051', '2000008', '160', '0', '176');
INSERT INTO `shopitems` VALUES ('1213', '2040051', '2000000', '50', '0', '180');
INSERT INTO `shopitems` VALUES ('1214', '2040051', '2000007', '50', '0', '184');
INSERT INTO `shopitems` VALUES ('1215', '2040051', '2020015', '10200', '0', '188');
INSERT INTO `shopitems` VALUES ('1216', '2040051', '2020014', '8100', '0', '192');
INSERT INTO `shopitems` VALUES ('1217', '2040051', '2020013', '5824', '0', '196');
INSERT INTO `shopitems` VALUES ('1218', '2040051', '2020012', '4680', '0', '200');
INSERT INTO `shopitems` VALUES ('1219', '2040051', '2001002', '4000', '0', '204');
INSERT INTO `shopitems` VALUES ('1220', '2040051', '2001001', '2300', '0', '208');
INSERT INTO `shopitems` VALUES ('1221', '2040051', '2022000', '1650', '0', '212');
INSERT INTO `shopitems` VALUES ('1222', '2040051', '2022003', '1100', '0', '216');
INSERT INTO `shopitems` VALUES ('1223', '2040051', '2002009', '600', '0', '220');
INSERT INTO `shopitems` VALUES ('1224', '2040051', '2002008', '600', '0', '224');
INSERT INTO `shopitems` VALUES ('1225', '2040051', '2002007', '600', '0', '228');
INSERT INTO `shopitems` VALUES ('1226', '2040051', '2002006', '600', '0', '232');
INSERT INTO `shopitems` VALUES ('1227', '2040051', '2002010', '500', '0', '236');
INSERT INTO `shopitems` VALUES ('1228', '2041002', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('1229', '2041002', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('1230', '2041002', '1492004', '75000', '0', '112');
INSERT INTO `shopitems` VALUES ('1231', '2041002', '1482006', '150000', '0', '116');
INSERT INTO `shopitems` VALUES ('1232', '2041002', '1482005', '100000', '0', '120');
INSERT INTO `shopitems` VALUES ('1233', '2041002', '1482004', '75000', '0', '124');
INSERT INTO `shopitems` VALUES ('1234', '2041002', '1472007', '60000', '0', '128');
INSERT INTO `shopitems` VALUES ('1235', '2041002', '1472004', '30000', '0', '132');
INSERT INTO `shopitems` VALUES ('1236', '2041002', '1472001', '20000', '0', '136');
INSERT INTO `shopitems` VALUES ('1237', '2041002', '1462005', '250000', '0', '140');
INSERT INTO `shopitems` VALUES ('1238', '2041002', '1462004', '200000', '0', '144');
INSERT INTO `shopitems` VALUES ('1239', '2041002', '1462000', '30000', '0', '148');
INSERT INTO `shopitems` VALUES ('1240', '2041002', '1452007', '375000', '0', '152');
INSERT INTO `shopitems` VALUES ('1241', '2041002', '1452006', '250000', '0', '156');
INSERT INTO `shopitems` VALUES ('1242', '2041002', '1452005', '150000', '0', '160');
INSERT INTO `shopitems` VALUES ('1243', '2041002', '1442009', '300000', '0', '164');
INSERT INTO `shopitems` VALUES ('1244', '2041002', '1442003', '175000', '0', '168');
INSERT INTO `shopitems` VALUES ('1245', '2041002', '1442001', '60000', '0', '172');
INSERT INTO `shopitems` VALUES ('1246', '2041002', '1432005', '225000', '0', '176');
INSERT INTO `shopitems` VALUES ('1247', '2041002', '1432003', '175000', '0', '180');
INSERT INTO `shopitems` VALUES ('1248', '2041002', '1432002', '60000', '0', '184');
INSERT INTO `shopitems` VALUES ('1249', '2041002', '1422007', '250000', '0', '188');
INSERT INTO `shopitems` VALUES ('1250', '2041002', '1422008', '200000', '0', '192');
INSERT INTO `shopitems` VALUES ('1251', '2041002', '1422001', '45000', '0', '196');
INSERT INTO `shopitems` VALUES ('1252', '2041002', '1412005', '250000', '0', '200');
INSERT INTO `shopitems` VALUES ('1253', '2041002', '1412004', '200000', '0', '204');
INSERT INTO `shopitems` VALUES ('1254', '2041002', '1412006', '45000', '0', '208');
INSERT INTO `shopitems` VALUES ('1255', '2041002', '1402007', '450000', '0', '212');
INSERT INTO `shopitems` VALUES ('1256', '2041002', '1402006', '350000', '0', '216');
INSERT INTO `shopitems` VALUES ('1257', '2041002', '1402002', '150000', '0', '220');
INSERT INTO `shopitems` VALUES ('1258', '2041002', '1382002', '20000', '0', '224');
INSERT INTO `shopitems` VALUES ('1259', '2041002', '1372000', '400000', '0', '228');
INSERT INTO `shopitems` VALUES ('1260', '2041002', '1372001', '175000', '0', '232');
INSERT INTO `shopitems` VALUES ('1261', '2041002', '1372003', '38000', '0', '236');
INSERT INTO `shopitems` VALUES ('1262', '2041002', '1332011', '425000', '0', '240');
INSERT INTO `shopitems` VALUES ('1263', '2041002', '1332014', '375000', '0', '244');
INSERT INTO `shopitems` VALUES ('1264', '2041002', '1332001', '200000', '0', '248');
INSERT INTO `shopitems` VALUES ('1265', '2041002', '1332012', '40000', '0', '252');
INSERT INTO `shopitems` VALUES ('1266', '2041002', '1332009', '42000', '0', '256');
INSERT INTO `shopitems` VALUES ('1267', '2041002', '1322016', '175000', '0', '260');
INSERT INTO `shopitems` VALUES ('1268', '2041002', '1322015', '100000', '0', '264');
INSERT INTO `shopitems` VALUES ('1269', '2041002', '1322014', '40000', '0', '268');
INSERT INTO `shopitems` VALUES ('1270', '2041002', '1312007', '175000', '0', '272');
INSERT INTO `shopitems` VALUES ('1271', '2041002', '1312006', '100000', '0', '276');
INSERT INTO `shopitems` VALUES ('1272', '2041002', '1312005', '40000', '0', '280');
INSERT INTO `shopitems` VALUES ('1273', '2041002', '1302009', '225000', '0', '284');
INSERT INTO `shopitems` VALUES ('1274', '2041002', '1302004', '100000', '0', '288');
INSERT INTO `shopitems` VALUES ('1275', '2041002', '1302008', '40000', '0', '292');
INSERT INTO `shopitems` VALUES ('1276', '2041003', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('1277', '2041003', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('1278', '2041003', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('1279', '2041003', '1061069', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('1280', '2041003', '1061070', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('1281', '2041003', '1060072', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('1282', '2041003', '1060071', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('1283', '2041003', '1060052', '108000', '0', '132');
INSERT INTO `shopitems` VALUES ('1284', '2041003', '1060050', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('1285', '2041003', '1060051', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('1286', '2041003', '1051009', '111000', '0', '144');
INSERT INTO `shopitems` VALUES ('1287', '2041003', '1051008', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('1288', '2041003', '1051007', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('1289', '2041003', '1041074', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('1290', '2041003', '1041075', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('1291', '2041003', '1040083', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('1292', '2041003', '1040082', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('1293', '2041003', '1040061', '114000', '0', '172');
INSERT INTO `shopitems` VALUES ('1294', '2041003', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('1295', '2041003', '1040063', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('1296', '2041003', '1002180', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('1297', '2041003', '1002179', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('1298', '2041003', '1002178', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('1299', '2041003', '1002177', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('1300', '2041003', '1002176', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('1301', '2041003', '1061080', '160000', '0', '204');
INSERT INTO `shopitems` VALUES ('1302', '2041003', '1061081', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('1303', '2041003', '1061062', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('1304', '2041003', '1061060', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('1305', '2041003', '1061064', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('1306', '2041003', '1061061', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('1307', '2041003', '1060069', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('1308', '2041003', '1060070', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('1309', '2041003', '1060063', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('1310', '2041003', '1060061', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('1311', '2041003', '1060065', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('1312', '2041003', '1060062', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('1313', '2041003', '1041081', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('1314', '2041003', '1041082', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('1315', '2041003', '1041067', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('1316', '2041003', '1041065', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('1317', '2041003', '1041069', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('1318', '2041003', '1041066', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('1319', '2041003', '1040079', '180000', '0', '276');
INSERT INTO `shopitems` VALUES ('1320', '2041003', '1040081', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('1321', '2041003', '1040076', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('1322', '2041003', '1040074', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('1323', '2041003', '1040073', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('1324', '2041003', '1040072', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('1325', '2041003', '1002137', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('1326', '2041003', '1002135', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('1327', '2041003', '1002139', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('1328', '2041003', '1002138', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('1329', '2041003', '1061047', '120000', '0', '316');
INSERT INTO `shopitems` VALUES ('1330', '2041003', '1061048', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('1331', '2041003', '1051027', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('1332', '2041003', '1051024', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('1333', '2041003', '1051025', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('1334', '2041003', '1051023', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('1335', '2041003', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('1336', '2041003', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('1337', '2041003', '1050038', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('1338', '2041003', '1050035', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('1339', '2041003', '1050002', '300000', '0', '356');
INSERT INTO `shopitems` VALUES ('1340', '2041003', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('1341', '2041003', '1041051', '120000', '0', '364');
INSERT INTO `shopitems` VALUES ('1342', '2041003', '1041052', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('1343', '2041003', '1002144', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('1344', '2041003', '1002143', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('1345', '2041003', '1002142', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('1346', '2041003', '1002141', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('1347', '2041003', '1092002', '200000', '0', '388');
INSERT INTO `shopitems` VALUES ('1348', '2041003', '1092001', '100000', '0', '392');
INSERT INTO `shopitems` VALUES ('1349', '2041003', '1061084', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('1350', '2041003', '1061083', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('1351', '2041003', '1060074', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('1352', '2041003', '1060075', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('1353', '2041003', '1051014', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('1354', '2041003', '1051001', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('1355', '2041003', '1050021', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('1356', '2041003', '1050000', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('1357', '2041003', '1041085', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('1358', '2041003', '1041084', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('1359', '2041003', '1040085', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('1360', '2041003', '1040000', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('1361', '2041003', '1002004', '160000', '0', '444');
INSERT INTO `shopitems` VALUES ('1362', '2041006', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1363', '2041006', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1364', '2041006', '2061001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1365', '2041006', '2060001', '10', '0', '116');
INSERT INTO `shopitems` VALUES ('1366', '2041006', '2061000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1367', '2041006', '2060000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('1368', '2041006', '2061000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1369', '2041006', '2060000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('1370', '2041006', '2030000', '400', '0', '136');
INSERT INTO `shopitems` VALUES ('1371', '2041006', '2020028', '2850', '0', '140');
INSERT INTO `shopitems` VALUES ('1372', '2041006', '2020006', '503', '0', '144');
INSERT INTO `shopitems` VALUES ('1373', '2041006', '2020005', '304', '0', '148');
INSERT INTO `shopitems` VALUES ('1374', '2041006', '2020004', '427', '0', '152');
INSERT INTO `shopitems` VALUES ('1375', '2041006', '2020003', '427', '0', '156');
INSERT INTO `shopitems` VALUES ('1376', '2041006', '2020002', '304', '0', '160');
INSERT INTO `shopitems` VALUES ('1377', '2041006', '2020001', '209', '0', '164');
INSERT INTO `shopitems` VALUES ('1378', '2041006', '2010002', '47', '0', '168');
INSERT INTO `shopitems` VALUES ('1379', '2041006', '2010001', '106', '0', '172');
INSERT INTO `shopitems` VALUES ('1380', '2041006', '2002010', '500', '0', '176');
INSERT INTO `shopitems` VALUES ('1381', '2041006', '2002009', '500', '0', '180');
INSERT INTO `shopitems` VALUES ('1382', '2041006', '2002008', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('1383', '2041006', '2002007', '500', '0', '188');
INSERT INTO `shopitems` VALUES ('1384', '2041006', '2002006', '500', '0', '192');
INSERT INTO `shopitems` VALUES ('1385', '2041006', '2001002', '3800', '0', '196');
INSERT INTO `shopitems` VALUES ('1386', '2041006', '2001001', '2185', '0', '200');
INSERT INTO `shopitems` VALUES ('1387', '2041006', '2000006', '589', '0', '204');
INSERT INTO `shopitems` VALUES ('1388', '2041006', '2000011', '620', '0', '208');
INSERT INTO `shopitems` VALUES ('1389', '2041006', '2000003', '190', '0', '212');
INSERT INTO `shopitems` VALUES ('1390', '2041006', '2000010', '200', '0', '216');
INSERT INTO `shopitems` VALUES ('1391', '2041006', '2000002', '304', '0', '220');
INSERT INTO `shopitems` VALUES ('1392', '2041006', '2000009', '320', '0', '224');
INSERT INTO `shopitems` VALUES ('1393', '2041006', '2000001', '152', '0', '228');
INSERT INTO `shopitems` VALUES ('1394', '2041006', '2000008', '160', '0', '232');
INSERT INTO `shopitems` VALUES ('1395', '2041006', '2000000', '47', '0', '236');
INSERT INTO `shopitems` VALUES ('1396', '2041006', '2000007', '50', '0', '240');
INSERT INTO `shopitems` VALUES ('1397', '2041014', '4160019', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('1398', '2041014', '4160039', '1000', '0', '108');
INSERT INTO `shopitems` VALUES ('1399', '2041014', '4160037', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('1400', '2041014', '4031993', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('1401', '2041014', '4160036', '1000', '0', '120');
INSERT INTO `shopitems` VALUES ('1402', '2041014', '4160035', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('1403', '2041014', '4160034', '1000', '0', '128');
INSERT INTO `shopitems` VALUES ('1404', '2041014', '4160032', '1000', '0', '132');
INSERT INTO `shopitems` VALUES ('1405', '2041014', '4160024', '1000', '0', '136');
INSERT INTO `shopitems` VALUES ('1406', '2041014', '4160023', '1000', '0', '140');
INSERT INTO `shopitems` VALUES ('1407', '2041014', '4160022', '1000', '0', '144');
INSERT INTO `shopitems` VALUES ('1408', '2041014', '4160015', '1000', '0', '148');
INSERT INTO `shopitems` VALUES ('1409', '2041014', '4160012', '1000', '0', '152');
INSERT INTO `shopitems` VALUES ('1410', '2041014', '4160013', '1000', '0', '156');
INSERT INTO `shopitems` VALUES ('1411', '2041014', '4160017', '1000', '0', '160');
INSERT INTO `shopitems` VALUES ('1412', '2041014', '4160014', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('1413', '2041014', '4160020', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('1414', '2041014', '4160010', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('1415', '2041014', '4160009', '1000', '0', '176');
INSERT INTO `shopitems` VALUES ('1416', '2041014', '4160008', '1000', '0', '180');
INSERT INTO `shopitems` VALUES ('1417', '2041014', '4160007', '1000', '0', '184');
INSERT INTO `shopitems` VALUES ('1418', '2041014', '4160006', '1000', '0', '188');
INSERT INTO `shopitems` VALUES ('1419', '2041014', '4160005', '1000', '0', '192');
INSERT INTO `shopitems` VALUES ('1420', '2041014', '4160004', '1000', '0', '196');
INSERT INTO `shopitems` VALUES ('1421', '2041014', '4160003', '1000', '0', '200');
INSERT INTO `shopitems` VALUES ('1422', '2041014', '4160002', '1000', '0', '204');
INSERT INTO `shopitems` VALUES ('1423', '2041014', '4160001', '1000', '0', '208');
INSERT INTO `shopitems` VALUES ('1424', '2041014', '4160000', '1000', '0', '212');
INSERT INTO `shopitems` VALUES ('1425', '2041014', '4160026', '1000', '0', '216');
INSERT INTO `shopitems` VALUES ('1426', '2041014', '2260000', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('1427', '2041014', '2120000', '30', '0', '224');
INSERT INTO `shopitems` VALUES ('1428', '2041016', '4031348', '10000000', '0', '104');
INSERT INTO `shopitems` VALUES ('1429', '2041016', '2044900', '69000', '0', '108');
INSERT INTO `shopitems` VALUES ('1430', '2041016', '2044800', '69000', '0', '112');
INSERT INTO `shopitems` VALUES ('1431', '2041016', '2044700', '69000', '0', '116');
INSERT INTO `shopitems` VALUES ('1432', '2041016', '2044600', '69000', '0', '120');
INSERT INTO `shopitems` VALUES ('1433', '2041016', '2044500', '69000', '0', '124');
INSERT INTO `shopitems` VALUES ('1434', '2041016', '2043800', '69000', '0', '128');
INSERT INTO `shopitems` VALUES ('1435', '2041016', '2043700', '69000', '0', '132');
INSERT INTO `shopitems` VALUES ('1436', '2041016', '2044400', '69000', '0', '136');
INSERT INTO `shopitems` VALUES ('1437', '2041016', '2044300', '69000', '0', '140');
INSERT INTO `shopitems` VALUES ('1438', '2041016', '2044200', '69000', '0', '144');
INSERT INTO `shopitems` VALUES ('1439', '2041016', '2044100', '69000', '0', '148');
INSERT INTO `shopitems` VALUES ('1440', '2041016', '2044000', '69000', '0', '152');
INSERT INTO `shopitems` VALUES ('1441', '2041016', '2043300', '69000', '0', '156');
INSERT INTO `shopitems` VALUES ('1442', '2041016', '2043200', '69000', '0', '160');
INSERT INTO `shopitems` VALUES ('1443', '2041016', '2043100', '69000', '0', '164');
INSERT INTO `shopitems` VALUES ('1444', '2041016', '2043000', '69000', '0', '168');
INSERT INTO `shopitems` VALUES ('1445', '2041016', '2041003', '34000', '0', '172');
INSERT INTO `shopitems` VALUES ('1446', '2041016', '2041000', '34000', '0', '176');
INSERT INTO `shopitems` VALUES ('1447', '2041016', '2040900', '34000', '0', '180');
INSERT INTO `shopitems` VALUES ('1448', '2041016', '2040800', '34000', '0', '184');
INSERT INTO `shopitems` VALUES ('1449', '2041016', '2040706', '34000', '0', '188');
INSERT INTO `shopitems` VALUES ('1450', '2041016', '2040703', '34000', '0', '192');
INSERT INTO `shopitems` VALUES ('1451', '2041016', '2040700', '34000', '0', '196');
INSERT INTO `shopitems` VALUES ('1452', '2041016', '2040600', '34000', '0', '200');
INSERT INTO `shopitems` VALUES ('1453', '2041016', '2040503', '34000', '0', '204');
INSERT INTO `shopitems` VALUES ('1454', '2041016', '2040400', '34000', '0', '208');
INSERT INTO `shopitems` VALUES ('1455', '2041016', '2040000', '34000', '0', '212');
INSERT INTO `shopitems` VALUES ('1456', '2041016', '2040300', '34000', '0', '216');
INSERT INTO `shopitems` VALUES ('1457', '2050000', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('1458', '2050000', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('1459', '2050000', '1482006', '150000', '0', '112');
INSERT INTO `shopitems` VALUES ('1460', '2050000', '1482005', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('1461', '2050000', '1472007', '60000', '0', '120');
INSERT INTO `shopitems` VALUES ('1462', '2050000', '1472004', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('1463', '2050000', '1462005', '250000', '0', '128');
INSERT INTO `shopitems` VALUES ('1464', '2050000', '1462004', '200000', '0', '132');
INSERT INTO `shopitems` VALUES ('1465', '2050000', '1452007', '375000', '0', '136');
INSERT INTO `shopitems` VALUES ('1466', '2050000', '1452006', '250000', '0', '140');
INSERT INTO `shopitems` VALUES ('1467', '2050000', '1442009', '300000', '0', '144');
INSERT INTO `shopitems` VALUES ('1468', '2050000', '1442003', '175000', '0', '148');
INSERT INTO `shopitems` VALUES ('1469', '2050000', '1432005', '225000', '0', '152');
INSERT INTO `shopitems` VALUES ('1470', '2050000', '1432003', '175000', '0', '156');
INSERT INTO `shopitems` VALUES ('1471', '2050000', '1422007', '250000', '0', '160');
INSERT INTO `shopitems` VALUES ('1472', '2050000', '1422008', '200000', '0', '164');
INSERT INTO `shopitems` VALUES ('1473', '2050000', '1412005', '250000', '0', '168');
INSERT INTO `shopitems` VALUES ('1474', '2050000', '1412004', '200000', '0', '172');
INSERT INTO `shopitems` VALUES ('1475', '2050000', '1402007', '450000', '0', '176');
INSERT INTO `shopitems` VALUES ('1476', '2050000', '1402006', '350000', '0', '180');
INSERT INTO `shopitems` VALUES ('1477', '2050000', '1372000', '400000', '0', '184');
INSERT INTO `shopitems` VALUES ('1478', '2050000', '1372001', '175000', '0', '188');
INSERT INTO `shopitems` VALUES ('1479', '2050000', '1332011', '425000', '0', '192');
INSERT INTO `shopitems` VALUES ('1480', '2050000', '1332014', '375000', '0', '196');
INSERT INTO `shopitems` VALUES ('1481', '2050000', '1332001', '200000', '0', '200');
INSERT INTO `shopitems` VALUES ('1482', '2050000', '1322016', '175000', '0', '204');
INSERT INTO `shopitems` VALUES ('1483', '2050000', '1322015', '100000', '0', '208');
INSERT INTO `shopitems` VALUES ('1484', '2050000', '1312007', '175000', '0', '212');
INSERT INTO `shopitems` VALUES ('1485', '2050000', '1312006', '100000', '0', '216');
INSERT INTO `shopitems` VALUES ('1486', '2050000', '1302009', '225000', '0', '220');
INSERT INTO `shopitems` VALUES ('1487', '2050000', '1302004', '100000', '0', '224');
INSERT INTO `shopitems` VALUES ('1488', '2050003', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('1489', '2050003', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('1490', '2050003', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('1491', '2050003', '1061069', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('1492', '2050003', '1061070', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('1493', '2050003', '1060072', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('1494', '2050003', '1060071', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('1495', '2050003', '1060052', '108000', '0', '132');
INSERT INTO `shopitems` VALUES ('1496', '2050003', '1060050', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('1497', '2050003', '1060051', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('1498', '2050003', '1051009', '111000', '0', '144');
INSERT INTO `shopitems` VALUES ('1499', '2050003', '1051008', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('1500', '2050003', '1051007', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('1501', '2050003', '1041074', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('1502', '2050003', '1041075', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('1503', '2050003', '1040083', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('1504', '2050003', '1040082', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('1505', '2050003', '1040061', '114000', '0', '172');
INSERT INTO `shopitems` VALUES ('1506', '2050003', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('1507', '2050003', '1040063', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('1508', '2050003', '1002180', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('1509', '2050003', '1002179', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('1510', '2050003', '1002178', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('1511', '2050003', '1002177', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('1512', '2050003', '1002176', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('1513', '2050003', '1061080', '160000', '0', '204');
INSERT INTO `shopitems` VALUES ('1514', '2050003', '1061081', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('1515', '2050003', '1061062', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('1516', '2050003', '1061060', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('1517', '2050003', '1061064', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('1518', '2050003', '1061061', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('1519', '2050003', '1060069', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('1520', '2050003', '1060070', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('1521', '2050003', '1060063', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('1522', '2050003', '1060061', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('1523', '2050003', '1060065', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('1524', '2050003', '1060062', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('1525', '2050003', '1041081', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('1526', '2050003', '1041082', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('1527', '2050003', '1041067', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('1528', '2050003', '1041065', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('1529', '2050003', '1041069', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('1530', '2050003', '1041066', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('1531', '2050003', '1040079', '180000', '0', '276');
INSERT INTO `shopitems` VALUES ('1532', '2050003', '1040081', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('1533', '2050003', '1040076', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('1534', '2050003', '1040074', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('1535', '2050003', '1040073', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('1536', '2050003', '1040072', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('1537', '2050003', '1002137', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('1538', '2050003', '1002135', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('1539', '2050003', '1002139', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('1540', '2050003', '1002138', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('1541', '2050003', '1061047', '120000', '0', '316');
INSERT INTO `shopitems` VALUES ('1542', '2050003', '1061048', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('1543', '2050003', '1051027', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('1544', '2050003', '1051024', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('1545', '2050003', '1051025', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('1546', '2050003', '1051023', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('1547', '2050003', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('1548', '2050003', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('1549', '2050003', '1050038', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('1550', '2050003', '1050035', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('1551', '2050003', '1050002', '300000', '0', '356');
INSERT INTO `shopitems` VALUES ('1552', '2050003', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('1553', '2050003', '1041051', '120000', '0', '364');
INSERT INTO `shopitems` VALUES ('1554', '2050003', '1041052', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('1555', '2050003', '1002144', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('1556', '2050003', '1002143', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('1557', '2050003', '1002142', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('1558', '2050003', '1002141', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('1559', '2050003', '1092002', '200000', '0', '388');
INSERT INTO `shopitems` VALUES ('1560', '2050003', '1092001', '100000', '0', '392');
INSERT INTO `shopitems` VALUES ('1561', '2050003', '1061084', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('1562', '2050003', '1061083', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('1563', '2050003', '1060074', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('1564', '2050003', '1060075', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('1565', '2050003', '1051014', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('1566', '2050003', '1051001', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('1567', '2050003', '1050021', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('1568', '2050003', '1050000', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('1569', '2050003', '1041085', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('1570', '2050003', '1041084', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('1571', '2050003', '1040085', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('1572', '2050003', '1040000', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('1573', '2050003', '1002004', '160000', '0', '444');
INSERT INTO `shopitems` VALUES ('1574', '2051000', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1575', '2051000', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1576', '2051000', '2061001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1577', '2051000', '2060001', '10', '0', '116');
INSERT INTO `shopitems` VALUES ('1578', '2051000', '2061000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1579', '2051000', '2060000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('1580', '2051000', '2061000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1581', '2051000', '2060000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('1582', '2051000', '2030000', '400', '0', '136');
INSERT INTO `shopitems` VALUES ('1583', '2051000', '2022000', '1567', '0', '140');
INSERT INTO `shopitems` VALUES ('1584', '2051000', '2022003', '1045', '0', '144');
INSERT INTO `shopitems` VALUES ('1585', '2051000', '2020015', '9690', '0', '148');
INSERT INTO `shopitems` VALUES ('1586', '2051000', '2020014', '7695', '0', '152');
INSERT INTO `shopitems` VALUES ('1587', '2051000', '2020013', '5600', '0', '156');
INSERT INTO `shopitems` VALUES ('1588', '2051000', '2020012', '4680', '0', '160');
INSERT INTO `shopitems` VALUES ('1589', '2051000', '2010004', '294', '0', '164');
INSERT INTO `shopitems` VALUES ('1590', '2051000', '2010003', '95', '0', '168');
INSERT INTO `shopitems` VALUES ('1591', '2051000', '2010002', '47', '0', '172');
INSERT INTO `shopitems` VALUES ('1592', '2051000', '2010001', '106', '0', '176');
INSERT INTO `shopitems` VALUES ('1593', '2051000', '2010000', '28', '0', '180');
INSERT INTO `shopitems` VALUES ('1594', '2051000', '2001002', '3800', '0', '184');
INSERT INTO `shopitems` VALUES ('1595', '2051000', '2001001', '2185', '0', '188');
INSERT INTO `shopitems` VALUES ('1596', '2051000', '2001000', '3040', '0', '192');
INSERT INTO `shopitems` VALUES ('1597', '2051000', '2002011', '1200', '0', '196');
INSERT INTO `shopitems` VALUES ('1598', '2051000', '2002005', '475', '0', '200');
INSERT INTO `shopitems` VALUES ('1599', '2051000', '2002004', '475', '0', '204');
INSERT INTO `shopitems` VALUES ('1600', '2051000', '2002002', '475', '0', '208');
INSERT INTO `shopitems` VALUES ('1601', '2051000', '2002001', '380', '0', '212');
INSERT INTO `shopitems` VALUES ('1602', '2051000', '2002000', '475', '0', '216');
INSERT INTO `shopitems` VALUES ('1603', '2051000', '2000006', '589', '0', '220');
INSERT INTO `shopitems` VALUES ('1604', '2051000', '2000003', '190', '0', '224');
INSERT INTO `shopitems` VALUES ('1605', '2051000', '2000002', '304', '0', '228');
INSERT INTO `shopitems` VALUES ('1606', '2051000', '2000001', '152', '0', '232');
INSERT INTO `shopitems` VALUES ('1607', '2051000', '2000000', '47', '0', '236');
INSERT INTO `shopitems` VALUES ('1608', '2060003', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('1609', '2060003', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('1610', '2060003', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('1611', '2060003', '1052107', '90000', '0', '116');
INSERT INTO `shopitems` VALUES ('1612', '2060003', '1002622', '40000', '0', '120');
INSERT INTO `shopitems` VALUES ('1613', '2060003', '1061070', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('1614', '2060003', '1061069', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('1615', '2060003', '1041075', '180000', '0', '132');
INSERT INTO `shopitems` VALUES ('1616', '2060003', '1041074', '180000', '0', '136');
INSERT INTO `shopitems` VALUES ('1617', '2060003', '1060072', '160000', '0', '140');
INSERT INTO `shopitems` VALUES ('1618', '2060003', '1060071', '160000', '0', '144');
INSERT INTO `shopitems` VALUES ('1619', '2060003', '1040083', '180000', '0', '148');
INSERT INTO `shopitems` VALUES ('1620', '2060003', '1040082', '180000', '0', '152');
INSERT INTO `shopitems` VALUES ('1621', '2060003', '1051009', '111000', '0', '156');
INSERT INTO `shopitems` VALUES ('1622', '2060003', '1051008', '111000', '0', '160');
INSERT INTO `shopitems` VALUES ('1623', '2060003', '1051007', '111000', '0', '164');
INSERT INTO `shopitems` VALUES ('1624', '2060003', '1060051', '108000', '0', '168');
INSERT INTO `shopitems` VALUES ('1625', '2060003', '1060050', '108000', '0', '172');
INSERT INTO `shopitems` VALUES ('1626', '2060003', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('1627', '2060003', '1040061', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('1628', '2060003', '1060045', '40000', '0', '184');
INSERT INTO `shopitems` VALUES ('1629', '2060003', '1060043', '40000', '0', '188');
INSERT INTO `shopitems` VALUES ('1630', '2060003', '1040059', '45000', '0', '192');
INSERT INTO `shopitems` VALUES ('1631', '2060003', '1040057', '45000', '0', '196');
INSERT INTO `shopitems` VALUES ('1632', '2060003', '1061046', '40000', '0', '200');
INSERT INTO `shopitems` VALUES ('1633', '2060003', '1061045', '40000', '0', '204');
INSERT INTO `shopitems` VALUES ('1634', '2060003', '1061043', '40000', '0', '208');
INSERT INTO `shopitems` VALUES ('1635', '2060003', '1041050', '45000', '0', '212');
INSERT INTO `shopitems` VALUES ('1636', '2060003', '1041049', '45000', '0', '216');
INSERT INTO `shopitems` VALUES ('1637', '2060003', '1041047', '45000', '0', '220');
INSERT INTO `shopitems` VALUES ('1638', '2060003', '1061081', '160000', '0', '224');
INSERT INTO `shopitems` VALUES ('1639', '2060003', '1061080', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('1640', '2060003', '1041082', '180000', '0', '232');
INSERT INTO `shopitems` VALUES ('1641', '2060003', '1041081', '180000', '0', '236');
INSERT INTO `shopitems` VALUES ('1642', '2060003', '1060070', '160000', '0', '240');
INSERT INTO `shopitems` VALUES ('1643', '2060003', '1060069', '160000', '0', '244');
INSERT INTO `shopitems` VALUES ('1644', '2060003', '1040081', '180000', '0', '248');
INSERT INTO `shopitems` VALUES ('1645', '2060003', '1040079', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('1646', '2060003', '1060063', '108000', '0', '256');
INSERT INTO `shopitems` VALUES ('1647', '2060003', '1060062', '108000', '0', '260');
INSERT INTO `shopitems` VALUES ('1648', '2060003', '1060061', '108000', '0', '264');
INSERT INTO `shopitems` VALUES ('1649', '2060003', '1040074', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('1650', '2060003', '1040073', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('1651', '2060003', '1040072', '114000', '0', '276');
INSERT INTO `shopitems` VALUES ('1652', '2060003', '1061062', '108000', '0', '280');
INSERT INTO `shopitems` VALUES ('1653', '2060003', '1061061', '108000', '0', '284');
INSERT INTO `shopitems` VALUES ('1654', '2060003', '1061060', '108000', '0', '288');
INSERT INTO `shopitems` VALUES ('1655', '2060003', '1041067', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('1656', '2060003', '1041066', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('1657', '2060003', '1041065', '114000', '0', '300');
INSERT INTO `shopitems` VALUES ('1658', '2060003', '1060058', '44000', '0', '304');
INSERT INTO `shopitems` VALUES ('1659', '2060003', '1060056', '44000', '0', '308');
INSERT INTO `shopitems` VALUES ('1660', '2060003', '1040069', '50000', '0', '312');
INSERT INTO `shopitems` VALUES ('1661', '2060003', '1040067', '50000', '0', '316');
INSERT INTO `shopitems` VALUES ('1662', '2060003', '1061052', '44000', '0', '320');
INSERT INTO `shopitems` VALUES ('1663', '2060003', '1061050', '44000', '0', '324');
INSERT INTO `shopitems` VALUES ('1664', '2060003', '1041056', '50000', '0', '328');
INSERT INTO `shopitems` VALUES ('1665', '2060003', '1041054', '50000', '0', '332');
INSERT INTO `shopitems` VALUES ('1666', '2060003', '1050038', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('1667', '2060003', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('1668', '2060003', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('1669', '2060003', '1051025', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('1670', '2060003', '1051024', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('1671', '2060003', '1051023', '450000', '0', '356');
INSERT INTO `shopitems` VALUES ('1672', '2060003', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('1673', '2060003', '1050030', '300000', '0', '364');
INSERT INTO `shopitems` VALUES ('1674', '2060003', '1050002', '300000', '0', '368');
INSERT INTO `shopitems` VALUES ('1675', '2060003', '1061048', '120000', '0', '372');
INSERT INTO `shopitems` VALUES ('1676', '2060003', '1061047', '120000', '0', '376');
INSERT INTO `shopitems` VALUES ('1677', '2060003', '1041052', '120000', '0', '380');
INSERT INTO `shopitems` VALUES ('1678', '2060003', '1041051', '120000', '0', '384');
INSERT INTO `shopitems` VALUES ('1679', '2060003', '1050028', '40000', '0', '388');
INSERT INTO `shopitems` VALUES ('1680', '2060003', '1050026', '40000', '0', '392');
INSERT INTO `shopitems` VALUES ('1681', '2060003', '1050003', '40000', '0', '396');
INSERT INTO `shopitems` VALUES ('1682', '2060003', '1061036', '40000', '0', '400');
INSERT INTO `shopitems` VALUES ('1683', '2060003', '1061035', '40000', '0', '404');
INSERT INTO `shopitems` VALUES ('1684', '2060003', '1061034', '40000', '0', '408');
INSERT INTO `shopitems` VALUES ('1685', '2060003', '1041043', '42000', '0', '412');
INSERT INTO `shopitems` VALUES ('1686', '2060003', '1041042', '42000', '0', '416');
INSERT INTO `shopitems` VALUES ('1687', '2060003', '1041041', '42000', '0', '420');
INSERT INTO `shopitems` VALUES ('1688', '2060003', '1061084', '180000', '0', '424');
INSERT INTO `shopitems` VALUES ('1689', '2060003', '1061083', '180000', '0', '428');
INSERT INTO `shopitems` VALUES ('1690', '2060003', '1060075', '180000', '0', '432');
INSERT INTO `shopitems` VALUES ('1691', '2060003', '1060074', '180000', '0', '436');
INSERT INTO `shopitems` VALUES ('1692', '2060003', '1041085', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('1693', '2060003', '1041084', '200000', '0', '444');
INSERT INTO `shopitems` VALUES ('1694', '2060003', '1040086', '200000', '0', '448');
INSERT INTO `shopitems` VALUES ('1695', '2060003', '1040085', '200000', '0', '452');
INSERT INTO `shopitems` VALUES ('1696', '2060003', '1051015', '112500', '0', '456');
INSERT INTO `shopitems` VALUES ('1697', '2060003', '1051014', '112500', '0', '460');
INSERT INTO `shopitems` VALUES ('1698', '2060003', '1051001', '112500', '0', '464');
INSERT INTO `shopitems` VALUES ('1699', '2060003', '1050021', '112500', '0', '468');
INSERT INTO `shopitems` VALUES ('1700', '2060003', '1050000', '112500', '0', '472');
INSERT INTO `shopitems` VALUES ('1701', '2060003', '1060017', '38000', '0', '476');
INSERT INTO `shopitems` VALUES ('1702', '2060003', '1060016', '38000', '0', '480');
INSERT INTO `shopitems` VALUES ('1703', '2060003', '1040026', '40000', '0', '484');
INSERT INTO `shopitems` VALUES ('1704', '2060003', '1040021', '40000', '0', '488');
INSERT INTO `shopitems` VALUES ('1705', '2060003', '1050011', '70000', '0', '492');
INSERT INTO `shopitems` VALUES ('1706', '2060003', '1051013', '60000', '0', '496');
INSERT INTO `shopitems` VALUES ('1707', '2060003', '1051012', '60000', '0', '500');
INSERT INTO `shopitems` VALUES ('1708', '2060003', '1051011', '60000', '0', '504');
INSERT INTO `shopitems` VALUES ('1709', '2060003', '1002177', '100000', '0', '508');
INSERT INTO `shopitems` VALUES ('1710', '2060003', '1002172', '60000', '0', '512');
INSERT INTO `shopitems` VALUES ('1711', '2060003', '1002138', '100000', '0', '516');
INSERT INTO `shopitems` VALUES ('1712', '2060003', '1002162', '60000', '0', '520');
INSERT INTO `shopitems` VALUES ('1713', '2060003', '1002142', '96000', '0', '524');
INSERT INTO `shopitems` VALUES ('1714', '2060003', '1002034', '60000', '0', '528');
INSERT INTO `shopitems` VALUES ('1715', '2060003', '1002048', '160000', '0', '532');
INSERT INTO `shopitems` VALUES ('1716', '2060003', '1002023', '120000', '0', '536');
INSERT INTO `shopitems` VALUES ('1717', '2060004', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1718', '2060004', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1719', '2060004', '2061001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1720', '2060004', '2060001', '10', '0', '116');
INSERT INTO `shopitems` VALUES ('1721', '2060004', '2061000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1722', '2060004', '2060000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('1723', '2060004', '2061000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1724', '2060004', '2060000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('1725', '2060004', '2030000', '400', '0', '136');
INSERT INTO `shopitems` VALUES ('1726', '2060004', '2022000', '1650', '0', '140');
INSERT INTO `shopitems` VALUES ('1727', '2060004', '2022003', '1100', '0', '144');
INSERT INTO `shopitems` VALUES ('1728', '2060004', '2020015', '10200', '0', '148');
INSERT INTO `shopitems` VALUES ('1729', '2060004', '2020014', '8100', '0', '152');
INSERT INTO `shopitems` VALUES ('1730', '2060004', '2020013', '5600', '0', '156');
INSERT INTO `shopitems` VALUES ('1731', '2060004', '2020012', '4500', '0', '160');
INSERT INTO `shopitems` VALUES ('1732', '2060004', '2010004', '310', '0', '164');
INSERT INTO `shopitems` VALUES ('1733', '2060004', '2010003', '100', '0', '168');
INSERT INTO `shopitems` VALUES ('1734', '2060004', '2010001', '106', '0', '172');
INSERT INTO `shopitems` VALUES ('1735', '2060004', '2010002', '50', '0', '176');
INSERT INTO `shopitems` VALUES ('1736', '2060004', '2010000', '30', '0', '180');
INSERT INTO `shopitems` VALUES ('1737', '2060004', '2001002', '4000', '0', '184');
INSERT INTO `shopitems` VALUES ('1738', '2060004', '2001001', '2300', '0', '188');
INSERT INTO `shopitems` VALUES ('1739', '2060004', '2001000', '3200', '0', '192');
INSERT INTO `shopitems` VALUES ('1740', '2060004', '2022041', '1600', '0', '196');
INSERT INTO `shopitems` VALUES ('1741', '2060004', '2022040', '300', '0', '200');
INSERT INTO `shopitems` VALUES ('1742', '2060004', '2002005', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('1743', '2060004', '2002004', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('1744', '2060004', '2002002', '500', '0', '212');
INSERT INTO `shopitems` VALUES ('1745', '2060004', '2002001', '400', '0', '216');
INSERT INTO `shopitems` VALUES ('1746', '2060004', '2002000', '500', '0', '220');
INSERT INTO `shopitems` VALUES ('1747', '2060004', '2000006', '620', '0', '224');
INSERT INTO `shopitems` VALUES ('1748', '2060004', '2000003', '200', '0', '228');
INSERT INTO `shopitems` VALUES ('1749', '2060004', '2000002', '320', '0', '232');
INSERT INTO `shopitems` VALUES ('1750', '2060004', '2000001', '160', '0', '236');
INSERT INTO `shopitems` VALUES ('1751', '2060004', '2000000', '50', '0', '240');
INSERT INTO `shopitems` VALUES ('1752', '2060007', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('1753', '2060007', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('1754', '2060007', '1492004', '75000', '0', '112');
INSERT INTO `shopitems` VALUES ('1755', '2060007', '1482006', '150000', '0', '116');
INSERT INTO `shopitems` VALUES ('1756', '2060007', '1482005', '100000', '0', '120');
INSERT INTO `shopitems` VALUES ('1757', '2060007', '1482004', '75000', '0', '124');
INSERT INTO `shopitems` VALUES ('1758', '2060007', '1472007', '60000', '0', '128');
INSERT INTO `shopitems` VALUES ('1759', '2060007', '1462005', '250000', '0', '132');
INSERT INTO `shopitems` VALUES ('1760', '2060007', '1462004', '200000', '0', '136');
INSERT INTO `shopitems` VALUES ('1761', '2060007', '1462000', '30000', '0', '140');
INSERT INTO `shopitems` VALUES ('1762', '2060007', '1462003', '12000', '0', '144');
INSERT INTO `shopitems` VALUES ('1763', '2060007', '1452007', '375000', '0', '148');
INSERT INTO `shopitems` VALUES ('1764', '2060007', '1452006', '250000', '0', '152');
INSERT INTO `shopitems` VALUES ('1765', '2060007', '1452005', '150000', '0', '156');
INSERT INTO `shopitems` VALUES ('1766', '2060007', '1452000', '20000', '0', '160');
INSERT INTO `shopitems` VALUES ('1767', '2060007', '1442009', '300000', '0', '164');
INSERT INTO `shopitems` VALUES ('1768', '2060007', '1442003', '175000', '0', '168');
INSERT INTO `shopitems` VALUES ('1769', '2060007', '1442001', '60000', '0', '172');
INSERT INTO `shopitems` VALUES ('1770', '2060007', '1442004', '24000', '0', '176');
INSERT INTO `shopitems` VALUES ('1771', '2060007', '1432005', '225000', '0', '180');
INSERT INTO `shopitems` VALUES ('1772', '2060007', '1432003', '175000', '0', '184');
INSERT INTO `shopitems` VALUES ('1773', '2060007', '1432002', '60000', '0', '188');
INSERT INTO `shopitems` VALUES ('1774', '2060007', '1422007', '250000', '0', '192');
INSERT INTO `shopitems` VALUES ('1775', '2060007', '1422008', '200000', '0', '196');
INSERT INTO `shopitems` VALUES ('1776', '2060007', '1422001', '45000', '0', '200');
INSERT INTO `shopitems` VALUES ('1777', '2060007', '1422004', '20000', '0', '204');
INSERT INTO `shopitems` VALUES ('1778', '2060007', '1412005', '250000', '0', '208');
INSERT INTO `shopitems` VALUES ('1779', '2060007', '1412006', '45000', '0', '212');
INSERT INTO `shopitems` VALUES ('1780', '2060007', '1412004', '200000', '0', '216');
INSERT INTO `shopitems` VALUES ('1781', '2060007', '1412000', '22000', '0', '220');
INSERT INTO `shopitems` VALUES ('1782', '2060007', '1402007', '450000', '0', '224');
INSERT INTO `shopitems` VALUES ('1783', '2060007', '1402006', '350000', '0', '228');
INSERT INTO `shopitems` VALUES ('1784', '2060007', '1402002', '150000', '0', '232');
INSERT INTO `shopitems` VALUES ('1785', '2060007', '1402008', '22000', '0', '236');
INSERT INTO `shopitems` VALUES ('1786', '2060007', '1372000', '400000', '0', '240');
INSERT INTO `shopitems` VALUES ('1787', '2060007', '1372001', '175000', '0', '244');
INSERT INTO `shopitems` VALUES ('1788', '2060007', '1372003', '38000', '0', '248');
INSERT INTO `shopitems` VALUES ('1789', '2060007', '1382002', '20000', '0', '252');
INSERT INTO `shopitems` VALUES ('1790', '2060007', '1372004', '18000', '0', '256');
INSERT INTO `shopitems` VALUES ('1791', '2060007', '1332011', '425000', '0', '260');
INSERT INTO `shopitems` VALUES ('1792', '2060007', '1332014', '375000', '0', '264');
INSERT INTO `shopitems` VALUES ('1793', '2060007', '1332012', '40000', '0', '268');
INSERT INTO `shopitems` VALUES ('1794', '2060007', '1332004', '38000', '0', '272');
INSERT INTO `shopitems` VALUES ('1795', '2060007', '1322016', '175000', '0', '276');
INSERT INTO `shopitems` VALUES ('1796', '2060007', '1322015', '100000', '0', '280');
INSERT INTO `shopitems` VALUES ('1797', '2060007', '1322014', '40000', '0', '284');
INSERT INTO `shopitems` VALUES ('1798', '2060007', '1322004', '22000', '0', '288');
INSERT INTO `shopitems` VALUES ('1799', '2060007', '1312007', '175000', '0', '292');
INSERT INTO `shopitems` VALUES ('1800', '2060007', '1312006', '100000', '0', '296');
INSERT INTO `shopitems` VALUES ('1801', '2060007', '1312005', '40000', '0', '300');
INSERT INTO `shopitems` VALUES ('1802', '2060007', '1312003', '20000', '0', '304');
INSERT INTO `shopitems` VALUES ('1803', '2060007', '1302009', '225000', '0', '308');
INSERT INTO `shopitems` VALUES ('1804', '2060007', '1302004', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('1805', '2060007', '1302008', '40000', '0', '316');
INSERT INTO `shopitems` VALUES ('1806', '2060007', '1302003', '20000', '0', '320');
INSERT INTO `shopitems` VALUES ('1807', '2070001', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1808', '2070001', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1809', '2070001', '2061001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1810', '2070001', '2060001', '10', '0', '116');
INSERT INTO `shopitems` VALUES ('1811', '2070001', '2061000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1812', '2070001', '2060000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('1813', '2070001', '2061000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1814', '2070001', '2060000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('1815', '2070001', '2030000', '400', '0', '136');
INSERT INTO `shopitems` VALUES ('1816', '2070001', '2022000', '1650', '0', '140');
INSERT INTO `shopitems` VALUES ('1817', '2070001', '2022003', '1100', '0', '144');
INSERT INTO `shopitems` VALUES ('1818', '2070001', '2020015', '10200', '0', '148');
INSERT INTO `shopitems` VALUES ('1819', '2070001', '2020014', '8100', '0', '152');
INSERT INTO `shopitems` VALUES ('1820', '2070001', '2020013', '5600', '0', '156');
INSERT INTO `shopitems` VALUES ('1821', '2070001', '2020012', '4500', '0', '160');
INSERT INTO `shopitems` VALUES ('1822', '2070001', '2010004', '310', '0', '164');
INSERT INTO `shopitems` VALUES ('1823', '2070001', '2010003', '100', '0', '168');
INSERT INTO `shopitems` VALUES ('1824', '2070001', '2010001', '106', '0', '172');
INSERT INTO `shopitems` VALUES ('1825', '2070001', '2010002', '50', '0', '176');
INSERT INTO `shopitems` VALUES ('1826', '2070001', '2010000', '30', '0', '180');
INSERT INTO `shopitems` VALUES ('1827', '2070001', '2001002', '4000', '0', '184');
INSERT INTO `shopitems` VALUES ('1828', '2070001', '2001001', '2300', '0', '188');
INSERT INTO `shopitems` VALUES ('1829', '2070001', '2001000', '3200', '0', '192');
INSERT INTO `shopitems` VALUES ('1830', '2070001', '2002005', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('1831', '2070001', '2002004', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('1832', '2070001', '2002002', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('1833', '2070001', '2002001', '400', '0', '208');
INSERT INTO `shopitems` VALUES ('1834', '2070001', '2002000', '500', '0', '212');
INSERT INTO `shopitems` VALUES ('1835', '2070001', '2000006', '620', '0', '216');
INSERT INTO `shopitems` VALUES ('1836', '2070001', '2000003', '200', '0', '220');
INSERT INTO `shopitems` VALUES ('1837', '2070001', '2000002', '320', '0', '224');
INSERT INTO `shopitems` VALUES ('1838', '2070001', '2000001', '160', '0', '228');
INSERT INTO `shopitems` VALUES ('1839', '2070001', '2000000', '50', '0', '232');
INSERT INTO `shopitems` VALUES ('1840', '2070002', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('1841', '2070002', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('1842', '2070002', '1482006', '150000', '0', '112');
INSERT INTO `shopitems` VALUES ('1843', '2070002', '1482005', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('1844', '2070002', '1472007', '60000', '0', '120');
INSERT INTO `shopitems` VALUES ('1845', '2070002', '1472004', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('1846', '2070002', '1462005', '250000', '0', '128');
INSERT INTO `shopitems` VALUES ('1847', '2070002', '1462004', '200000', '0', '132');
INSERT INTO `shopitems` VALUES ('1848', '2070002', '1452007', '375000', '0', '136');
INSERT INTO `shopitems` VALUES ('1849', '2070002', '1452006', '250000', '0', '140');
INSERT INTO `shopitems` VALUES ('1850', '2070002', '1442009', '300000', '0', '144');
INSERT INTO `shopitems` VALUES ('1851', '2070002', '1442003', '175000', '0', '148');
INSERT INTO `shopitems` VALUES ('1852', '2070002', '1432005', '225000', '0', '152');
INSERT INTO `shopitems` VALUES ('1853', '2070002', '1432003', '175000', '0', '156');
INSERT INTO `shopitems` VALUES ('1854', '2070002', '1422007', '250000', '0', '160');
INSERT INTO `shopitems` VALUES ('1855', '2070002', '1422008', '200000', '0', '164');
INSERT INTO `shopitems` VALUES ('1856', '2070002', '1412005', '250000', '0', '168');
INSERT INTO `shopitems` VALUES ('1857', '2070002', '1412004', '200000', '0', '172');
INSERT INTO `shopitems` VALUES ('1858', '2070002', '1402007', '450000', '0', '176');
INSERT INTO `shopitems` VALUES ('1859', '2070002', '1402006', '350000', '0', '180');
INSERT INTO `shopitems` VALUES ('1860', '2070002', '1372000', '400000', '0', '184');
INSERT INTO `shopitems` VALUES ('1861', '2070002', '1372001', '175000', '0', '188');
INSERT INTO `shopitems` VALUES ('1862', '2070002', '1332011', '425000', '0', '192');
INSERT INTO `shopitems` VALUES ('1863', '2070002', '1332014', '375000', '0', '196');
INSERT INTO `shopitems` VALUES ('1864', '2070002', '1332001', '200000', '0', '200');
INSERT INTO `shopitems` VALUES ('1865', '2070002', '1322016', '175000', '0', '204');
INSERT INTO `shopitems` VALUES ('1866', '2070002', '1322015', '100000', '0', '208');
INSERT INTO `shopitems` VALUES ('1867', '2070002', '1312007', '175000', '0', '212');
INSERT INTO `shopitems` VALUES ('1868', '2070002', '1312006', '100000', '0', '216');
INSERT INTO `shopitems` VALUES ('1869', '2070002', '1302009', '225000', '0', '220');
INSERT INTO `shopitems` VALUES ('1870', '2070002', '1302004', '100000', '0', '224');
INSERT INTO `shopitems` VALUES ('1871', '2070003', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('1872', '2070003', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('1873', '2070003', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('1874', '2070003', '1052107', '90000', '0', '116');
INSERT INTO `shopitems` VALUES ('1875', '2070003', '1061069', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('1876', '2070003', '1061070', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('1877', '2070003', '1060072', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('1878', '2070003', '1060071', '160000', '0', '132');
INSERT INTO `shopitems` VALUES ('1879', '2070003', '1060052', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('1880', '2070003', '1060050', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('1881', '2070003', '1060051', '108000', '0', '144');
INSERT INTO `shopitems` VALUES ('1882', '2070003', '1051009', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('1883', '2070003', '1051008', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('1884', '2070003', '1051007', '111000', '0', '156');
INSERT INTO `shopitems` VALUES ('1885', '2070003', '1041074', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('1886', '2070003', '1041075', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('1887', '2070003', '1040083', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('1888', '2070003', '1040082', '180000', '0', '172');
INSERT INTO `shopitems` VALUES ('1889', '2070003', '1040061', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('1890', '2070003', '1040062', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('1891', '2070003', '1040063', '114000', '0', '184');
INSERT INTO `shopitems` VALUES ('1892', '2070003', '1002180', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('1893', '2070003', '1002179', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('1894', '2070003', '1002178', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('1895', '2070003', '1002177', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('1896', '2070003', '1002176', '100000', '0', '204');
INSERT INTO `shopitems` VALUES ('1897', '2070003', '1061080', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('1898', '2070003', '1061081', '160000', '0', '212');
INSERT INTO `shopitems` VALUES ('1899', '2070003', '1061062', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('1900', '2070003', '1061060', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('1901', '2070003', '1061064', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('1902', '2070003', '1061061', '108000', '0', '228');
INSERT INTO `shopitems` VALUES ('1903', '2070003', '1060069', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('1904', '2070003', '1060070', '160000', '0', '236');
INSERT INTO `shopitems` VALUES ('1905', '2070003', '1060063', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('1906', '2070003', '1060061', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('1907', '2070003', '1060065', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('1908', '2070003', '1060062', '108000', '0', '252');
INSERT INTO `shopitems` VALUES ('1909', '2070003', '1041081', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('1910', '2070003', '1041082', '180000', '0', '260');
INSERT INTO `shopitems` VALUES ('1911', '2070003', '1041067', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('1912', '2070003', '1041065', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('1913', '2070003', '1041069', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('1914', '2070003', '1041066', '114000', '0', '276');
INSERT INTO `shopitems` VALUES ('1915', '2070003', '1040079', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('1916', '2070003', '1040081', '180000', '0', '284');
INSERT INTO `shopitems` VALUES ('1917', '2070003', '1040076', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('1918', '2070003', '1040074', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('1919', '2070003', '1040073', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('1920', '2070003', '1040072', '114000', '0', '300');
INSERT INTO `shopitems` VALUES ('1921', '2070003', '1002137', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('1922', '2070003', '1002135', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('1923', '2070003', '1002139', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('1924', '2070003', '1002138', '100000', '0', '316');
INSERT INTO `shopitems` VALUES ('1925', '2070003', '1061047', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('1926', '2070003', '1061048', '120000', '0', '324');
INSERT INTO `shopitems` VALUES ('1927', '2070003', '1051027', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('1928', '2070003', '1051024', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('1929', '2070003', '1051025', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('1930', '2070003', '1051023', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('1931', '2070003', '1050037', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('1932', '2070003', '1050036', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('1933', '2070003', '1050038', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('1934', '2070003', '1050035', '450000', '0', '356');
INSERT INTO `shopitems` VALUES ('1935', '2070003', '1050002', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('1936', '2070003', '1050031', '300000', '0', '364');
INSERT INTO `shopitems` VALUES ('1937', '2070003', '1041051', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('1938', '2070003', '1041052', '120000', '0', '372');
INSERT INTO `shopitems` VALUES ('1939', '2070003', '1002144', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('1940', '2070003', '1002143', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('1941', '2070003', '1002142', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('1942', '2070003', '1002141', '96000', '0', '388');
INSERT INTO `shopitems` VALUES ('1943', '2070003', '1092002', '200000', '0', '392');
INSERT INTO `shopitems` VALUES ('1944', '2070003', '1092001', '100000', '0', '396');
INSERT INTO `shopitems` VALUES ('1945', '2070003', '1061084', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('1946', '2070003', '1061083', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('1947', '2070003', '1060074', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('1948', '2070003', '1060075', '180000', '0', '412');
INSERT INTO `shopitems` VALUES ('1949', '2070003', '1051014', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('1950', '2070003', '1051001', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('1951', '2070003', '1050021', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('1952', '2070003', '1050000', '112500', '0', '428');
INSERT INTO `shopitems` VALUES ('1953', '2070003', '1041085', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('1954', '2070003', '1041084', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('1955', '2070003', '1040085', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('1956', '2070003', '1040000', '200000', '0', '444');
INSERT INTO `shopitems` VALUES ('1957', '2070003', '1002004', '160000', '0', '448');
INSERT INTO `shopitems` VALUES ('1958', '2080001', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('1959', '2080001', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('1960', '2080001', '2061001', '10', '0', '112');
INSERT INTO `shopitems` VALUES ('1961', '2080001', '2060001', '10', '0', '116');
INSERT INTO `shopitems` VALUES ('1962', '2080001', '2061000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('1963', '2080001', '2060000', '1400', '0', '124');
INSERT INTO `shopitems` VALUES ('1964', '2080001', '2061000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('1965', '2080001', '2060000', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('1966', '2080001', '2030000', '400', '0', '136');
INSERT INTO `shopitems` VALUES ('1967', '2080001', '2020015', '10200', '0', '140');
INSERT INTO `shopitems` VALUES ('1968', '2080001', '2020014', '8100', '0', '144');
INSERT INTO `shopitems` VALUES ('1969', '2080001', '2020013', '5600', '0', '148');
INSERT INTO `shopitems` VALUES ('1970', '2080001', '2020012', '4500', '0', '152');
INSERT INTO `shopitems` VALUES ('1971', '2080001', '2010004', '310', '0', '156');
INSERT INTO `shopitems` VALUES ('1972', '2080001', '2010003', '100', '0', '160');
INSERT INTO `shopitems` VALUES ('1973', '2080001', '2010001', '106', '0', '164');
INSERT INTO `shopitems` VALUES ('1974', '2080001', '2010002', '50', '0', '168');
INSERT INTO `shopitems` VALUES ('1975', '2080001', '2010000', '30', '0', '172');
INSERT INTO `shopitems` VALUES ('1976', '2080001', '2001002', '4000', '0', '176');
INSERT INTO `shopitems` VALUES ('1977', '2080001', '2001001', '2300', '0', '180');
INSERT INTO `shopitems` VALUES ('1978', '2080001', '2001000', '3200', '0', '184');
INSERT INTO `shopitems` VALUES ('1979', '2080001', '2022089', '3400', '0', '188');
INSERT INTO `shopitems` VALUES ('1980', '2080001', '2002005', '500', '0', '192');
INSERT INTO `shopitems` VALUES ('1981', '2080001', '2002004', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('1982', '2080001', '2002002', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('1983', '2080001', '2002001', '400', '0', '204');
INSERT INTO `shopitems` VALUES ('1984', '2080001', '2002000', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('1985', '2080001', '2000006', '620', '0', '212');
INSERT INTO `shopitems` VALUES ('1986', '2080001', '2000003', '200', '0', '216');
INSERT INTO `shopitems` VALUES ('1987', '2080001', '2000002', '320', '0', '220');
INSERT INTO `shopitems` VALUES ('1988', '2080001', '2000001', '160', '0', '224');
INSERT INTO `shopitems` VALUES ('1989', '2080001', '2000000', '50', '0', '228');
INSERT INTO `shopitems` VALUES ('1990', '2080002', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('1991', '2080002', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('1992', '2080002', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('1993', '2080002', '1061069', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('1994', '2080002', '1061070', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('1995', '2080002', '1060072', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('1996', '2080002', '1060071', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('1997', '2080002', '1060052', '108000', '0', '132');
INSERT INTO `shopitems` VALUES ('1998', '2080002', '1060050', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('1999', '2080002', '1060051', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('2000', '2080002', '1051009', '111000', '0', '144');
INSERT INTO `shopitems` VALUES ('2001', '2080002', '1051008', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('2002', '2080002', '1051007', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('2003', '2080002', '1041074', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('2004', '2080002', '1041075', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('2005', '2080002', '1040083', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('2006', '2080002', '1040082', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('2007', '2080002', '1040061', '114000', '0', '172');
INSERT INTO `shopitems` VALUES ('2008', '2080002', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('2009', '2080002', '1040063', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('2010', '2080002', '1002180', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('2011', '2080002', '1002179', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('2012', '2080002', '1002178', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('2013', '2080002', '1002177', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('2014', '2080002', '1002176', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('2015', '2080002', '1061080', '160000', '0', '204');
INSERT INTO `shopitems` VALUES ('2016', '2080002', '1061081', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('2017', '2080002', '1061062', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('2018', '2080002', '1061060', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('2019', '2080002', '1061064', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('2020', '2080002', '1061061', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('2021', '2080002', '1060069', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('2022', '2080002', '1060070', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('2023', '2080002', '1060063', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('2024', '2080002', '1060061', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('2025', '2080002', '1060065', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('2026', '2080002', '1060062', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('2027', '2080002', '1041081', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('2028', '2080002', '1041082', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('2029', '2080002', '1041067', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('2030', '2080002', '1041065', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('2031', '2080002', '1041069', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('2032', '2080002', '1041066', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('2033', '2080002', '1040079', '180000', '0', '276');
INSERT INTO `shopitems` VALUES ('2034', '2080002', '1040081', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('2035', '2080002', '1040076', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('2036', '2080002', '1040074', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('2037', '2080002', '1040073', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('2038', '2080002', '1040072', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('2039', '2080002', '1002137', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('2040', '2080002', '1002135', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('2041', '2080002', '1002139', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('2042', '2080002', '1002138', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('2043', '2080002', '1061047', '120000', '0', '316');
INSERT INTO `shopitems` VALUES ('2044', '2080002', '1061048', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('2045', '2080002', '1051027', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('2046', '2080002', '1051024', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('2047', '2080002', '1051025', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('2048', '2080002', '1051023', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('2049', '2080002', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('2050', '2080002', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('2051', '2080002', '1050038', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('2052', '2080002', '1050035', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('2053', '2080002', '1050002', '300000', '0', '356');
INSERT INTO `shopitems` VALUES ('2054', '2080002', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('2055', '2080002', '1041051', '120000', '0', '364');
INSERT INTO `shopitems` VALUES ('2056', '2080002', '1041052', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('2057', '2080002', '1002144', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('2058', '2080002', '1002143', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('2059', '2080002', '1002142', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('2060', '2080002', '1002141', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('2061', '2080002', '1092002', '200000', '0', '388');
INSERT INTO `shopitems` VALUES ('2062', '2080002', '1092001', '100000', '0', '392');
INSERT INTO `shopitems` VALUES ('2063', '2080002', '1061084', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('2064', '2080002', '1061083', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('2065', '2080002', '1060074', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('2066', '2080002', '1060075', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('2067', '2080002', '1051014', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('2068', '2080002', '1051001', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('2069', '2080002', '1050021', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('2070', '2080002', '1050000', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('2071', '2080002', '1041085', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('2072', '2080002', '1041084', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('2073', '2080002', '1040085', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('2074', '2080002', '1040000', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('2075', '2080002', '1002004', '160000', '0', '444');
INSERT INTO `shopitems` VALUES ('2076', '2080003', '2044900', '70000', '0', '104');
INSERT INTO `shopitems` VALUES ('2077', '2080003', '2044800', '70000', '0', '108');
INSERT INTO `shopitems` VALUES ('2078', '2080003', '2044700', '70000', '0', '112');
INSERT INTO `shopitems` VALUES ('2079', '2080003', '2044600', '70000', '0', '116');
INSERT INTO `shopitems` VALUES ('2080', '2080003', '2044500', '70000', '0', '120');
INSERT INTO `shopitems` VALUES ('2081', '2080003', '2044400', '70000', '0', '124');
INSERT INTO `shopitems` VALUES ('2082', '2080003', '2044300', '70000', '0', '128');
INSERT INTO `shopitems` VALUES ('2083', '2080003', '2044200', '70000', '0', '132');
INSERT INTO `shopitems` VALUES ('2084', '2080003', '2044100', '70000', '0', '136');
INSERT INTO `shopitems` VALUES ('2085', '2080003', '2044000', '70000', '0', '140');
INSERT INTO `shopitems` VALUES ('2086', '2080003', '2043800', '70000', '0', '144');
INSERT INTO `shopitems` VALUES ('2087', '2080003', '2043700', '70000', '0', '148');
INSERT INTO `shopitems` VALUES ('2088', '2080003', '2043300', '70000', '0', '152');
INSERT INTO `shopitems` VALUES ('2089', '2080003', '2043200', '70000', '0', '156');
INSERT INTO `shopitems` VALUES ('2090', '2080003', '2043100', '70000', '0', '160');
INSERT INTO `shopitems` VALUES ('2091', '2080003', '2043000', '70000', '0', '164');
INSERT INTO `shopitems` VALUES ('2092', '2080003', '2040706', '35000', '0', '168');
INSERT INTO `shopitems` VALUES ('2093', '2080003', '2040703', '35000', '0', '172');
INSERT INTO `shopitems` VALUES ('2094', '2080003', '2041003', '35000', '0', '176');
INSERT INTO `shopitems` VALUES ('2095', '2080003', '2041000', '35000', '0', '180');
INSERT INTO `shopitems` VALUES ('2096', '2080003', '2040900', '35000', '0', '184');
INSERT INTO `shopitems` VALUES ('2097', '2080003', '2040600', '35000', '0', '188');
INSERT INTO `shopitems` VALUES ('2098', '2080003', '2040400', '35000', '0', '192');
INSERT INTO `shopitems` VALUES ('2099', '2080003', '2040300', '35000', '0', '196');
INSERT INTO `shopitems` VALUES ('2100', '2080003', '2040000', '35000', '0', '200');
INSERT INTO `shopitems` VALUES ('2101', '2080004', '4160019', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('2102', '2080004', '4160039', '1000', '0', '108');
INSERT INTO `shopitems` VALUES ('2103', '2080004', '4160037', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('2104', '2080004', '4031993', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('2105', '2080004', '4160036', '1000', '0', '120');
INSERT INTO `shopitems` VALUES ('2106', '2080004', '4160035', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('2107', '2080004', '4160034', '1000', '0', '128');
INSERT INTO `shopitems` VALUES ('2108', '2080004', '4160032', '1000', '0', '132');
INSERT INTO `shopitems` VALUES ('2109', '2080004', '4160024', '1000', '0', '136');
INSERT INTO `shopitems` VALUES ('2110', '2080004', '4160023', '1000', '0', '140');
INSERT INTO `shopitems` VALUES ('2111', '2080004', '4160022', '1000', '0', '144');
INSERT INTO `shopitems` VALUES ('2112', '2080004', '4160015', '1000', '0', '148');
INSERT INTO `shopitems` VALUES ('2113', '2080004', '4160012', '1000', '0', '152');
INSERT INTO `shopitems` VALUES ('2114', '2080004', '4160013', '1000', '0', '156');
INSERT INTO `shopitems` VALUES ('2115', '2080004', '4160017', '1000', '0', '160');
INSERT INTO `shopitems` VALUES ('2116', '2080004', '4160014', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('2117', '2080004', '4160020', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('2118', '2080004', '4160010', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('2119', '2080004', '4160009', '1000', '0', '176');
INSERT INTO `shopitems` VALUES ('2120', '2080004', '4160008', '1000', '0', '180');
INSERT INTO `shopitems` VALUES ('2121', '2080004', '4160007', '1000', '0', '184');
INSERT INTO `shopitems` VALUES ('2122', '2080004', '4160006', '1000', '0', '188');
INSERT INTO `shopitems` VALUES ('2123', '2080004', '4160005', '1000', '0', '192');
INSERT INTO `shopitems` VALUES ('2124', '2080004', '4160004', '1000', '0', '196');
INSERT INTO `shopitems` VALUES ('2125', '2080004', '4160003', '1000', '0', '200');
INSERT INTO `shopitems` VALUES ('2126', '2080004', '4160002', '1000', '0', '204');
INSERT INTO `shopitems` VALUES ('2127', '2080004', '4160001', '1000', '0', '208');
INSERT INTO `shopitems` VALUES ('2128', '2080004', '4160000', '1000', '0', '212');
INSERT INTO `shopitems` VALUES ('2129', '2080004', '4160026', '1000', '0', '216');
INSERT INTO `shopitems` VALUES ('2130', '2080004', '2260000', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('2131', '2080004', '2120000', '30', '0', '224');
INSERT INTO `shopitems` VALUES ('2132', '2090001', '1492006', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('2133', '2090001', '1492005', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('2134', '2090001', '1482006', '150000', '0', '112');
INSERT INTO `shopitems` VALUES ('2135', '2090001', '1482005', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('2136', '2090001', '1472007', '60000', '0', '120');
INSERT INTO `shopitems` VALUES ('2137', '2090001', '1472004', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('2138', '2090001', '1472001', '20000', '0', '128');
INSERT INTO `shopitems` VALUES ('2139', '2090001', '1462005', '250000', '0', '132');
INSERT INTO `shopitems` VALUES ('2140', '2090001', '1462004', '200000', '0', '136');
INSERT INTO `shopitems` VALUES ('2141', '2090001', '1462000', '30000', '0', '140');
INSERT INTO `shopitems` VALUES ('2142', '2090001', '1452007', '375000', '0', '144');
INSERT INTO `shopitems` VALUES ('2143', '2090001', '1452006', '250000', '0', '148');
INSERT INTO `shopitems` VALUES ('2144', '2090001', '1452005', '150000', '0', '152');
INSERT INTO `shopitems` VALUES ('2145', '2090001', '1442009', '300000', '0', '156');
INSERT INTO `shopitems` VALUES ('2146', '2090001', '1442003', '175000', '0', '160');
INSERT INTO `shopitems` VALUES ('2147', '2090001', '1442001', '60000', '0', '164');
INSERT INTO `shopitems` VALUES ('2148', '2090001', '1432005', '225000', '0', '168');
INSERT INTO `shopitems` VALUES ('2149', '2090001', '1432003', '175000', '0', '172');
INSERT INTO `shopitems` VALUES ('2150', '2090001', '1432002', '60000', '0', '176');
INSERT INTO `shopitems` VALUES ('2151', '2090001', '1422007', '250000', '0', '180');
INSERT INTO `shopitems` VALUES ('2152', '2090001', '1422008', '200000', '0', '184');
INSERT INTO `shopitems` VALUES ('2153', '2090001', '1422001', '45000', '0', '188');
INSERT INTO `shopitems` VALUES ('2154', '2090001', '1412005', '250000', '0', '192');
INSERT INTO `shopitems` VALUES ('2155', '2090001', '1412004', '200000', '0', '196');
INSERT INTO `shopitems` VALUES ('2156', '2090001', '1412006', '45000', '0', '200');
INSERT INTO `shopitems` VALUES ('2157', '2090001', '1402007', '450000', '0', '204');
INSERT INTO `shopitems` VALUES ('2158', '2090001', '1402006', '350000', '0', '208');
INSERT INTO `shopitems` VALUES ('2159', '2090001', '1402002', '150000', '0', '212');
INSERT INTO `shopitems` VALUES ('2160', '2090001', '1382002', '20000', '0', '216');
INSERT INTO `shopitems` VALUES ('2161', '2090001', '1372000', '400000', '0', '220');
INSERT INTO `shopitems` VALUES ('2162', '2090001', '1372001', '175000', '0', '224');
INSERT INTO `shopitems` VALUES ('2163', '2090001', '1372003', '38000', '0', '228');
INSERT INTO `shopitems` VALUES ('2164', '2090001', '1332011', '425000', '0', '232');
INSERT INTO `shopitems` VALUES ('2165', '2090001', '1332014', '375000', '0', '236');
INSERT INTO `shopitems` VALUES ('2166', '2090001', '1332001', '200000', '0', '240');
INSERT INTO `shopitems` VALUES ('2167', '2090001', '1332012', '40000', '0', '244');
INSERT INTO `shopitems` VALUES ('2168', '2090001', '1332009', '42000', '0', '248');
INSERT INTO `shopitems` VALUES ('2169', '2090001', '1322016', '175000', '0', '252');
INSERT INTO `shopitems` VALUES ('2170', '2090001', '1322015', '100000', '0', '256');
INSERT INTO `shopitems` VALUES ('2171', '2090001', '1322014', '40000', '0', '260');
INSERT INTO `shopitems` VALUES ('2172', '2090001', '1312007', '175000', '0', '264');
INSERT INTO `shopitems` VALUES ('2173', '2090001', '1312006', '100000', '0', '268');
INSERT INTO `shopitems` VALUES ('2174', '2090001', '1312005', '40000', '0', '272');
INSERT INTO `shopitems` VALUES ('2175', '2090001', '1302009', '225000', '0', '276');
INSERT INTO `shopitems` VALUES ('2176', '2090001', '1302004', '100000', '0', '280');
INSERT INTO `shopitems` VALUES ('2177', '2090001', '1302008', '40000', '0', '284');
INSERT INTO `shopitems` VALUES ('2178', '2090002', '1002625', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('2179', '2090002', '1052113', '120000', '0', '108');
INSERT INTO `shopitems` VALUES ('2180', '2090002', '1052110', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('2181', '2090002', '1061069', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('2182', '2090002', '1061070', '160000', '0', '120');
INSERT INTO `shopitems` VALUES ('2183', '2090002', '1060072', '160000', '0', '124');
INSERT INTO `shopitems` VALUES ('2184', '2090002', '1060071', '160000', '0', '128');
INSERT INTO `shopitems` VALUES ('2185', '2090002', '1060052', '108000', '0', '132');
INSERT INTO `shopitems` VALUES ('2186', '2090002', '1060050', '108000', '0', '136');
INSERT INTO `shopitems` VALUES ('2187', '2090002', '1060051', '108000', '0', '140');
INSERT INTO `shopitems` VALUES ('2188', '2090002', '1051009', '111000', '0', '144');
INSERT INTO `shopitems` VALUES ('2189', '2090002', '1051008', '111000', '0', '148');
INSERT INTO `shopitems` VALUES ('2190', '2090002', '1051007', '111000', '0', '152');
INSERT INTO `shopitems` VALUES ('2191', '2090002', '1041074', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('2192', '2090002', '1041075', '180000', '0', '160');
INSERT INTO `shopitems` VALUES ('2193', '2090002', '1040083', '180000', '0', '164');
INSERT INTO `shopitems` VALUES ('2194', '2090002', '1040082', '180000', '0', '168');
INSERT INTO `shopitems` VALUES ('2195', '2090002', '1040061', '114000', '0', '172');
INSERT INTO `shopitems` VALUES ('2196', '2090002', '1040062', '114000', '0', '176');
INSERT INTO `shopitems` VALUES ('2197', '2090002', '1040063', '114000', '0', '180');
INSERT INTO `shopitems` VALUES ('2198', '2090002', '1002180', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('2199', '2090002', '1002179', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('2200', '2090002', '1002178', '100000', '0', '192');
INSERT INTO `shopitems` VALUES ('2201', '2090002', '1002177', '100000', '0', '196');
INSERT INTO `shopitems` VALUES ('2202', '2090002', '1002176', '100000', '0', '200');
INSERT INTO `shopitems` VALUES ('2203', '2090002', '1061080', '160000', '0', '204');
INSERT INTO `shopitems` VALUES ('2204', '2090002', '1061081', '160000', '0', '208');
INSERT INTO `shopitems` VALUES ('2205', '2090002', '1061062', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('2206', '2090002', '1061060', '108000', '0', '216');
INSERT INTO `shopitems` VALUES ('2207', '2090002', '1061064', '108000', '0', '220');
INSERT INTO `shopitems` VALUES ('2208', '2090002', '1061061', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('2209', '2090002', '1060069', '160000', '0', '228');
INSERT INTO `shopitems` VALUES ('2210', '2090002', '1060070', '160000', '0', '232');
INSERT INTO `shopitems` VALUES ('2211', '2090002', '1060063', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('2212', '2090002', '1060061', '108000', '0', '240');
INSERT INTO `shopitems` VALUES ('2213', '2090002', '1060065', '108000', '0', '244');
INSERT INTO `shopitems` VALUES ('2214', '2090002', '1060062', '108000', '0', '248');
INSERT INTO `shopitems` VALUES ('2215', '2090002', '1041081', '180000', '0', '252');
INSERT INTO `shopitems` VALUES ('2216', '2090002', '1041082', '180000', '0', '256');
INSERT INTO `shopitems` VALUES ('2217', '2090002', '1041067', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('2218', '2090002', '1041065', '114000', '0', '264');
INSERT INTO `shopitems` VALUES ('2219', '2090002', '1041069', '114000', '0', '268');
INSERT INTO `shopitems` VALUES ('2220', '2090002', '1041066', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('2221', '2090002', '1040079', '180000', '0', '276');
INSERT INTO `shopitems` VALUES ('2222', '2090002', '1040081', '180000', '0', '280');
INSERT INTO `shopitems` VALUES ('2223', '2090002', '1040076', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('2224', '2090002', '1040074', '114000', '0', '288');
INSERT INTO `shopitems` VALUES ('2225', '2090002', '1040073', '114000', '0', '292');
INSERT INTO `shopitems` VALUES ('2226', '2090002', '1040072', '114000', '0', '296');
INSERT INTO `shopitems` VALUES ('2227', '2090002', '1002137', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('2228', '2090002', '1002135', '100000', '0', '304');
INSERT INTO `shopitems` VALUES ('2229', '2090002', '1002139', '100000', '0', '308');
INSERT INTO `shopitems` VALUES ('2230', '2090002', '1002138', '100000', '0', '312');
INSERT INTO `shopitems` VALUES ('2231', '2090002', '1061047', '120000', '0', '316');
INSERT INTO `shopitems` VALUES ('2232', '2090002', '1061048', '120000', '0', '320');
INSERT INTO `shopitems` VALUES ('2233', '2090002', '1051027', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('2234', '2090002', '1051024', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('2235', '2090002', '1051025', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('2236', '2090002', '1051023', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('2237', '2090002', '1050037', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('2238', '2090002', '1050036', '450000', '0', '344');
INSERT INTO `shopitems` VALUES ('2239', '2090002', '1050038', '450000', '0', '348');
INSERT INTO `shopitems` VALUES ('2240', '2090002', '1050035', '450000', '0', '352');
INSERT INTO `shopitems` VALUES ('2241', '2090002', '1050002', '300000', '0', '356');
INSERT INTO `shopitems` VALUES ('2242', '2090002', '1050031', '300000', '0', '360');
INSERT INTO `shopitems` VALUES ('2243', '2090002', '1041051', '120000', '0', '364');
INSERT INTO `shopitems` VALUES ('2244', '2090002', '1041052', '120000', '0', '368');
INSERT INTO `shopitems` VALUES ('2245', '2090002', '1002144', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('2246', '2090002', '1002143', '96000', '0', '376');
INSERT INTO `shopitems` VALUES ('2247', '2090002', '1002142', '96000', '0', '380');
INSERT INTO `shopitems` VALUES ('2248', '2090002', '1002141', '96000', '0', '384');
INSERT INTO `shopitems` VALUES ('2249', '2090002', '1092002', '200000', '0', '388');
INSERT INTO `shopitems` VALUES ('2250', '2090002', '1092001', '100000', '0', '392');
INSERT INTO `shopitems` VALUES ('2251', '2090002', '1061084', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('2252', '2090002', '1061083', '180000', '0', '400');
INSERT INTO `shopitems` VALUES ('2253', '2090002', '1060074', '180000', '0', '404');
INSERT INTO `shopitems` VALUES ('2254', '2090002', '1060075', '180000', '0', '408');
INSERT INTO `shopitems` VALUES ('2255', '2090002', '1051014', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('2256', '2090002', '1051001', '112500', '0', '416');
INSERT INTO `shopitems` VALUES ('2257', '2090002', '1050021', '112500', '0', '420');
INSERT INTO `shopitems` VALUES ('2258', '2090002', '1050000', '112500', '0', '424');
INSERT INTO `shopitems` VALUES ('2259', '2090002', '1041085', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('2260', '2090002', '1041084', '200000', '0', '432');
INSERT INTO `shopitems` VALUES ('2261', '2090002', '1040085', '200000', '0', '436');
INSERT INTO `shopitems` VALUES ('2262', '2090002', '1040000', '200000', '0', '440');
INSERT INTO `shopitems` VALUES ('2263', '2090002', '1002004', '160000', '0', '444');
INSERT INTO `shopitems` VALUES ('2264', '2090003', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('2265', '2090003', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2266', '2090003', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('2267', '2090003', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('2268', '2090003', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('2269', '2090003', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2270', '2090003', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('2271', '2090003', '2050002', '300', '0', '132');
INSERT INTO `shopitems` VALUES ('2272', '2090003', '2050001', '200', '0', '136');
INSERT INTO `shopitems` VALUES ('2273', '2090003', '2050000', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('2274', '2090003', '2020015', '10200', '0', '144');
INSERT INTO `shopitems` VALUES ('2275', '2090003', '2020014', '8100', '0', '148');
INSERT INTO `shopitems` VALUES ('2276', '2090003', '2020013', '5600', '0', '152');
INSERT INTO `shopitems` VALUES ('2277', '2090003', '2020012', '4500', '0', '156');
INSERT INTO `shopitems` VALUES ('2278', '2090003', '2001002', '4000', '0', '160');
INSERT INTO `shopitems` VALUES ('2279', '2090003', '2001001', '2300', '0', '164');
INSERT INTO `shopitems` VALUES ('2280', '2090003', '2001000', '3200', '0', '168');
INSERT INTO `shopitems` VALUES ('2281', '2090003', '2022000', '1650', '0', '172');
INSERT INTO `shopitems` VALUES ('2282', '2090003', '2022003', '1100', '0', '176');
INSERT INTO `shopitems` VALUES ('2283', '2090003', '2010004', '310', '0', '180');
INSERT INTO `shopitems` VALUES ('2284', '2090003', '2010003', '100', '0', '184');
INSERT INTO `shopitems` VALUES ('2285', '2090003', '2010001', '106', '0', '188');
INSERT INTO `shopitems` VALUES ('2286', '2090003', '2010002', '50', '0', '192');
INSERT INTO `shopitems` VALUES ('2287', '2090003', '2010000', '30', '0', '196');
INSERT INTO `shopitems` VALUES ('2288', '2090003', '2002005', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2289', '2090003', '2002004', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('2290', '2090003', '2002002', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('2291', '2090003', '2002001', '400', '0', '212');
INSERT INTO `shopitems` VALUES ('2292', '2090003', '2002000', '500', '0', '216');
INSERT INTO `shopitems` VALUES ('2293', '2090003', '2000006', '620', '0', '220');
INSERT INTO `shopitems` VALUES ('2294', '2090003', '2000003', '200', '0', '224');
INSERT INTO `shopitems` VALUES ('2295', '2090003', '2000002', '320', '0', '228');
INSERT INTO `shopitems` VALUES ('2296', '2090003', '2000001', '160', '0', '232');
INSERT INTO `shopitems` VALUES ('2297', '2090003', '2000000', '50', '0', '236');
INSERT INTO `shopitems` VALUES ('2298', '2090006', '4160019', '1000', '0', '104');
INSERT INTO `shopitems` VALUES ('2299', '2090006', '4160039', '1000', '0', '108');
INSERT INTO `shopitems` VALUES ('2300', '2090006', '4160037', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('2301', '2090006', '4031993', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('2302', '2090006', '4160036', '1000', '0', '120');
INSERT INTO `shopitems` VALUES ('2303', '2090006', '4160035', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('2304', '2090006', '4160034', '1000', '0', '128');
INSERT INTO `shopitems` VALUES ('2305', '2090006', '4160032', '1000', '0', '132');
INSERT INTO `shopitems` VALUES ('2306', '2090006', '4160024', '1000', '0', '136');
INSERT INTO `shopitems` VALUES ('2307', '2090006', '4160023', '1000', '0', '140');
INSERT INTO `shopitems` VALUES ('2308', '2090006', '4160022', '1000', '0', '144');
INSERT INTO `shopitems` VALUES ('2309', '2090006', '4160015', '1000', '0', '148');
INSERT INTO `shopitems` VALUES ('2310', '2090006', '4160012', '1000', '0', '152');
INSERT INTO `shopitems` VALUES ('2311', '2090006', '4160013', '1000', '0', '156');
INSERT INTO `shopitems` VALUES ('2312', '2090006', '4160017', '1000', '0', '160');
INSERT INTO `shopitems` VALUES ('2313', '2090006', '4160014', '1000', '0', '164');
INSERT INTO `shopitems` VALUES ('2314', '2090006', '4160020', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('2315', '2090006', '4160010', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('2316', '2090006', '4160009', '1000', '0', '176');
INSERT INTO `shopitems` VALUES ('2317', '2090006', '4160008', '1000', '0', '180');
INSERT INTO `shopitems` VALUES ('2318', '2090006', '4160007', '1000', '0', '184');
INSERT INTO `shopitems` VALUES ('2319', '2090006', '4160006', '1000', '0', '188');
INSERT INTO `shopitems` VALUES ('2320', '2090006', '4160005', '1000', '0', '192');
INSERT INTO `shopitems` VALUES ('2321', '2090006', '4160004', '1000', '0', '196');
INSERT INTO `shopitems` VALUES ('2322', '2090006', '4160003', '1000', '0', '200');
INSERT INTO `shopitems` VALUES ('2323', '2090006', '4160002', '1000', '0', '204');
INSERT INTO `shopitems` VALUES ('2324', '2090006', '4160001', '1000', '0', '208');
INSERT INTO `shopitems` VALUES ('2325', '2090006', '4160000', '1000', '0', '212');
INSERT INTO `shopitems` VALUES ('2326', '2090006', '4160026', '1000', '0', '216');
INSERT INTO `shopitems` VALUES ('2327', '2090006', '2260000', '1000', '0', '220');
INSERT INTO `shopitems` VALUES ('2328', '2090006', '2120000', '30', '0', '224');
INSERT INTO `shopitems` VALUES ('2329', '2093000', '1492004', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('2330', '2093000', '1482004', '75000', '0', '108');
INSERT INTO `shopitems` VALUES ('2331', '2093000', '1472001', '20000', '0', '112');
INSERT INTO `shopitems` VALUES ('2332', '2093000', '1462000', '30000', '0', '116');
INSERT INTO `shopitems` VALUES ('2333', '2093000', '1452005', '150000', '0', '120');
INSERT INTO `shopitems` VALUES ('2334', '2093000', '1442001', '60000', '0', '124');
INSERT INTO `shopitems` VALUES ('2335', '2093000', '1432002', '60000', '0', '128');
INSERT INTO `shopitems` VALUES ('2336', '2093000', '1422001', '45000', '0', '132');
INSERT INTO `shopitems` VALUES ('2337', '2093000', '1412006', '45000', '0', '136');
INSERT INTO `shopitems` VALUES ('2338', '2093000', '1402002', '150000', '0', '140');
INSERT INTO `shopitems` VALUES ('2339', '2093000', '1382002', '20000', '0', '144');
INSERT INTO `shopitems` VALUES ('2340', '2093000', '1372003', '38000', '0', '148');
INSERT INTO `shopitems` VALUES ('2341', '2093000', '1332012', '40000', '0', '152');
INSERT INTO `shopitems` VALUES ('2342', '2093000', '1332009', '42000', '0', '156');
INSERT INTO `shopitems` VALUES ('2343', '2093000', '1322014', '40000', '0', '160');
INSERT INTO `shopitems` VALUES ('2344', '2093000', '1312005', '40000', '0', '164');
INSERT INTO `shopitems` VALUES ('2345', '2093000', '1302008', '40000', '0', '168');
INSERT INTO `shopitems` VALUES ('2346', '2093001', '1052107', '90000', '0', '104');
INSERT INTO `shopitems` VALUES ('2347', '2093001', '1002622', '40000', '0', '108');
INSERT INTO `shopitems` VALUES ('2348', '2093001', '1061046', '40000', '0', '112');
INSERT INTO `shopitems` VALUES ('2349', '2093001', '1061045', '40000', '0', '116');
INSERT INTO `shopitems` VALUES ('2350', '2093001', '1061044', '40000', '0', '120');
INSERT INTO `shopitems` VALUES ('2351', '2093001', '1061043', '40000', '0', '124');
INSERT INTO `shopitems` VALUES ('2352', '2093001', '1060046', '40000', '0', '128');
INSERT INTO `shopitems` VALUES ('2353', '2093001', '1060045', '40000', '0', '132');
INSERT INTO `shopitems` VALUES ('2354', '2093001', '1060044', '40000', '0', '136');
INSERT INTO `shopitems` VALUES ('2355', '2093001', '1060043', '40000', '0', '140');
INSERT INTO `shopitems` VALUES ('2356', '2093001', '1041050', '45000', '0', '144');
INSERT INTO `shopitems` VALUES ('2357', '2093001', '1041049', '45000', '0', '148');
INSERT INTO `shopitems` VALUES ('2358', '2093001', '1041048', '45000', '0', '152');
INSERT INTO `shopitems` VALUES ('2359', '2093001', '1041047', '45000', '0', '156');
INSERT INTO `shopitems` VALUES ('2360', '2093001', '1040060', '45000', '0', '160');
INSERT INTO `shopitems` VALUES ('2361', '2093001', '1040059', '45000', '0', '164');
INSERT INTO `shopitems` VALUES ('2362', '2093001', '1040058', '45000', '0', '168');
INSERT INTO `shopitems` VALUES ('2363', '2093001', '1040057', '45000', '0', '172');
INSERT INTO `shopitems` VALUES ('2364', '2093001', '1002175', '30000', '0', '176');
INSERT INTO `shopitems` VALUES ('2365', '2093001', '1002174', '30000', '0', '180');
INSERT INTO `shopitems` VALUES ('2366', '2093001', '1002173', '30000', '0', '184');
INSERT INTO `shopitems` VALUES ('2367', '2093001', '1002172', '30000', '0', '188');
INSERT INTO `shopitems` VALUES ('2368', '2093001', '1002171', '30000', '0', '192');
INSERT INTO `shopitems` VALUES ('2369', '2093001', '1061051', '44000', '0', '196');
INSERT INTO `shopitems` VALUES ('2370', '2093001', '1061050', '44000', '0', '200');
INSERT INTO `shopitems` VALUES ('2371', '2093001', '1061052', '44000', '0', '204');
INSERT INTO `shopitems` VALUES ('2372', '2093001', '1060057', '44000', '0', '208');
INSERT INTO `shopitems` VALUES ('2373', '2093001', '1060056', '44000', '0', '212');
INSERT INTO `shopitems` VALUES ('2374', '2093001', '1060058', '44000', '0', '216');
INSERT INTO `shopitems` VALUES ('2375', '2093001', '1060059', '44000', '0', '220');
INSERT INTO `shopitems` VALUES ('2376', '2093001', '1041055', '50000', '0', '224');
INSERT INTO `shopitems` VALUES ('2377', '2093001', '1041054', '50000', '0', '228');
INSERT INTO `shopitems` VALUES ('2378', '2093001', '1041056', '50000', '0', '232');
INSERT INTO `shopitems` VALUES ('2379', '2093001', '1040068', '50000', '0', '236');
INSERT INTO `shopitems` VALUES ('2380', '2093001', '1040067', '50000', '0', '240');
INSERT INTO `shopitems` VALUES ('2381', '2093001', '1040070', '50000', '0', '244');
INSERT INTO `shopitems` VALUES ('2382', '2093001', '1040069', '50000', '0', '248');
INSERT INTO `shopitems` VALUES ('2383', '2093001', '1002165', '30000', '0', '252');
INSERT INTO `shopitems` VALUES ('2384', '2093001', '1002164', '30000', '0', '256');
INSERT INTO `shopitems` VALUES ('2385', '2093001', '1002163', '30000', '0', '260');
INSERT INTO `shopitems` VALUES ('2386', '2093001', '1002162', '30000', '0', '264');
INSERT INTO `shopitems` VALUES ('2387', '2093001', '1002161', '30000', '0', '268');
INSERT INTO `shopitems` VALUES ('2388', '2093001', '1061036', '40000', '0', '272');
INSERT INTO `shopitems` VALUES ('2389', '2093001', '1061035', '40000', '0', '276');
INSERT INTO `shopitems` VALUES ('2390', '2093001', '1061034', '40000', '0', '280');
INSERT INTO `shopitems` VALUES ('2391', '2093001', '1050028', '40000', '0', '284');
INSERT INTO `shopitems` VALUES ('2392', '2093001', '1050027', '40000', '0', '288');
INSERT INTO `shopitems` VALUES ('2393', '2093001', '1050026', '40000', '0', '292');
INSERT INTO `shopitems` VALUES ('2394', '2093001', '1050003', '40000', '0', '296');
INSERT INTO `shopitems` VALUES ('2395', '2093001', '1041043', '42000', '0', '300');
INSERT INTO `shopitems` VALUES ('2396', '2093001', '1041042', '42000', '0', '304');
INSERT INTO `shopitems` VALUES ('2397', '2093001', '1041041', '42000', '0', '308');
INSERT INTO `shopitems` VALUES ('2398', '2093001', '1002064', '40000', '0', '312');
INSERT INTO `shopitems` VALUES ('2399', '2093001', '1092006', '60000', '0', '316');
INSERT INTO `shopitems` VALUES ('2400', '2093001', '1060019', '38000', '0', '320');
INSERT INTO `shopitems` VALUES ('2401', '2093001', '1060018', '38000', '0', '324');
INSERT INTO `shopitems` VALUES ('2402', '2093001', '1060017', '38000', '0', '328');
INSERT INTO `shopitems` VALUES ('2403', '2093001', '1060016', '38000', '0', '332');
INSERT INTO `shopitems` VALUES ('2404', '2093001', '1051013', '60000', '0', '336');
INSERT INTO `shopitems` VALUES ('2405', '2093001', '1051012', '60000', '0', '340');
INSERT INTO `shopitems` VALUES ('2406', '2093001', '1051011', '60000', '0', '344');
INSERT INTO `shopitems` VALUES ('2407', '2093001', '1051010', '60000', '0', '348');
INSERT INTO `shopitems` VALUES ('2408', '2093001', '1040026', '40000', '0', '352');
INSERT INTO `shopitems` VALUES ('2409', '2093001', '1040021', '40000', '0', '356');
INSERT INTO `shopitems` VALUES ('2410', '2093001', '1002023', '120000', '0', '360');
INSERT INTO `shopitems` VALUES ('2411', '2093002', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('2412', '2093002', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2413', '2093002', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('2414', '2093002', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('2415', '2093002', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('2416', '2093002', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2417', '2093002', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('2418', '2093002', '2050003', '500', '0', '132');
INSERT INTO `shopitems` VALUES ('2419', '2093002', '2050002', '300', '0', '136');
INSERT INTO `shopitems` VALUES ('2420', '2093002', '2050001', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('2421', '2093002', '2050000', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('2422', '2093002', '2020028', '3000', '0', '148');
INSERT INTO `shopitems` VALUES ('2423', '2093002', '2010004', '310', '0', '152');
INSERT INTO `shopitems` VALUES ('2424', '2093002', '2010003', '100', '0', '156');
INSERT INTO `shopitems` VALUES ('2425', '2093002', '2010001', '106', '0', '160');
INSERT INTO `shopitems` VALUES ('2426', '2093002', '2010002', '50', '0', '164');
INSERT INTO `shopitems` VALUES ('2427', '2093002', '2010000', '30', '0', '168');
INSERT INTO `shopitems` VALUES ('2428', '2093002', '2001002', '4000', '0', '172');
INSERT INTO `shopitems` VALUES ('2429', '2093002', '2001001', '2300', '0', '176');
INSERT INTO `shopitems` VALUES ('2430', '2093002', '2001000', '3200', '0', '180');
INSERT INTO `shopitems` VALUES ('2431', '2093002', '2022000', '1650', '0', '184');
INSERT INTO `shopitems` VALUES ('2432', '2093002', '2022003', '1100', '0', '188');
INSERT INTO `shopitems` VALUES ('2433', '2093002', '2002005', '500', '0', '192');
INSERT INTO `shopitems` VALUES ('2434', '2093002', '2002004', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('2435', '2093002', '2002002', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2436', '2093002', '2002001', '400', '0', '204');
INSERT INTO `shopitems` VALUES ('2437', '2093002', '2002000', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('2438', '2093002', '2000006', '620', '0', '212');
INSERT INTO `shopitems` VALUES ('2439', '2093002', '2000003', '200', '0', '216');
INSERT INTO `shopitems` VALUES ('2440', '2093002', '2000002', '320', '0', '220');
INSERT INTO `shopitems` VALUES ('2441', '2093002', '2000001', '160', '0', '224');
INSERT INTO `shopitems` VALUES ('2442', '2093002', '2000000', '50', '0', '228');
INSERT INTO `shopitems` VALUES ('2443', '2100002', '1492004', '75000', '0', '104');
INSERT INTO `shopitems` VALUES ('2444', '2100002', '1482004', '75000', '0', '108');
INSERT INTO `shopitems` VALUES ('2445', '2100002', '1472001', '20000', '0', '112');
INSERT INTO `shopitems` VALUES ('2446', '2100002', '1462000', '30000', '0', '116');
INSERT INTO `shopitems` VALUES ('2447', '2100002', '1452005', '150000', '0', '120');
INSERT INTO `shopitems` VALUES ('2448', '2100002', '1442001', '60000', '0', '124');
INSERT INTO `shopitems` VALUES ('2449', '2100002', '1432002', '60000', '0', '128');
INSERT INTO `shopitems` VALUES ('2450', '2100002', '1422001', '45000', '0', '132');
INSERT INTO `shopitems` VALUES ('2451', '2100002', '1412006', '45000', '0', '136');
INSERT INTO `shopitems` VALUES ('2452', '2100002', '1402002', '150000', '0', '140');
INSERT INTO `shopitems` VALUES ('2453', '2100002', '1382002', '20000', '0', '144');
INSERT INTO `shopitems` VALUES ('2454', '2100002', '1372003', '38000', '0', '148');
INSERT INTO `shopitems` VALUES ('2455', '2100002', '1332012', '40000', '0', '152');
INSERT INTO `shopitems` VALUES ('2456', '2100002', '1332009', '42000', '0', '156');
INSERT INTO `shopitems` VALUES ('2457', '2100002', '1322014', '40000', '0', '160');
INSERT INTO `shopitems` VALUES ('2458', '2100002', '1312005', '40000', '0', '164');
INSERT INTO `shopitems` VALUES ('2459', '2100002', '1302008', '40000', '0', '168');
INSERT INTO `shopitems` VALUES ('2460', '2100003', '1052107', '90000', '0', '104');
INSERT INTO `shopitems` VALUES ('2461', '2100003', '1002622', '40000', '0', '108');
INSERT INTO `shopitems` VALUES ('2462', '2100003', '1061046', '40000', '0', '112');
INSERT INTO `shopitems` VALUES ('2463', '2100003', '1061045', '40000', '0', '116');
INSERT INTO `shopitems` VALUES ('2464', '2100003', '1061044', '40000', '0', '120');
INSERT INTO `shopitems` VALUES ('2465', '2100003', '1061043', '40000', '0', '124');
INSERT INTO `shopitems` VALUES ('2466', '2100003', '1060046', '40000', '0', '128');
INSERT INTO `shopitems` VALUES ('2467', '2100003', '1060045', '40000', '0', '132');
INSERT INTO `shopitems` VALUES ('2468', '2100003', '1060044', '40000', '0', '136');
INSERT INTO `shopitems` VALUES ('2469', '2100003', '1060043', '40000', '0', '140');
INSERT INTO `shopitems` VALUES ('2470', '2100003', '1041050', '45000', '0', '144');
INSERT INTO `shopitems` VALUES ('2471', '2100003', '1041049', '45000', '0', '148');
INSERT INTO `shopitems` VALUES ('2472', '2100003', '1041048', '45000', '0', '152');
INSERT INTO `shopitems` VALUES ('2473', '2100003', '1041047', '45000', '0', '156');
INSERT INTO `shopitems` VALUES ('2474', '2100003', '1040060', '45000', '0', '160');
INSERT INTO `shopitems` VALUES ('2475', '2100003', '1040059', '45000', '0', '164');
INSERT INTO `shopitems` VALUES ('2476', '2100003', '1040058', '45000', '0', '168');
INSERT INTO `shopitems` VALUES ('2477', '2100003', '1040057', '45000', '0', '172');
INSERT INTO `shopitems` VALUES ('2478', '2100003', '1002175', '30000', '0', '176');
INSERT INTO `shopitems` VALUES ('2479', '2100003', '1002174', '30000', '0', '180');
INSERT INTO `shopitems` VALUES ('2480', '2100003', '1002173', '30000', '0', '184');
INSERT INTO `shopitems` VALUES ('2481', '2100003', '1002172', '30000', '0', '188');
INSERT INTO `shopitems` VALUES ('2482', '2100003', '1002171', '30000', '0', '192');
INSERT INTO `shopitems` VALUES ('2483', '2100003', '1061051', '44000', '0', '196');
INSERT INTO `shopitems` VALUES ('2484', '2100003', '1061050', '44000', '0', '200');
INSERT INTO `shopitems` VALUES ('2485', '2100003', '1061052', '44000', '0', '204');
INSERT INTO `shopitems` VALUES ('2486', '2100003', '1060057', '44000', '0', '208');
INSERT INTO `shopitems` VALUES ('2487', '2100003', '1060056', '44000', '0', '212');
INSERT INTO `shopitems` VALUES ('2488', '2100003', '1060058', '44000', '0', '216');
INSERT INTO `shopitems` VALUES ('2489', '2100003', '1060059', '44000', '0', '220');
INSERT INTO `shopitems` VALUES ('2490', '2100003', '1041055', '50000', '0', '224');
INSERT INTO `shopitems` VALUES ('2491', '2100003', '1041054', '50000', '0', '228');
INSERT INTO `shopitems` VALUES ('2492', '2100003', '1041056', '50000', '0', '232');
INSERT INTO `shopitems` VALUES ('2493', '2100003', '1040068', '50000', '0', '236');
INSERT INTO `shopitems` VALUES ('2494', '2100003', '1040067', '50000', '0', '240');
INSERT INTO `shopitems` VALUES ('2495', '2100003', '1040070', '50000', '0', '244');
INSERT INTO `shopitems` VALUES ('2496', '2100003', '1040069', '50000', '0', '248');
INSERT INTO `shopitems` VALUES ('2497', '2100003', '1002165', '30000', '0', '252');
INSERT INTO `shopitems` VALUES ('2498', '2100003', '1002164', '30000', '0', '256');
INSERT INTO `shopitems` VALUES ('2499', '2100003', '1002163', '30000', '0', '260');
INSERT INTO `shopitems` VALUES ('2500', '2100003', '1002162', '30000', '0', '264');
INSERT INTO `shopitems` VALUES ('2501', '2100003', '1002161', '30000', '0', '268');
INSERT INTO `shopitems` VALUES ('2502', '2100003', '1061036', '40000', '0', '272');
INSERT INTO `shopitems` VALUES ('2503', '2100003', '1061035', '40000', '0', '276');
INSERT INTO `shopitems` VALUES ('2504', '2100003', '1061034', '40000', '0', '280');
INSERT INTO `shopitems` VALUES ('2505', '2100003', '1050028', '40000', '0', '284');
INSERT INTO `shopitems` VALUES ('2506', '2100003', '1050027', '40000', '0', '288');
INSERT INTO `shopitems` VALUES ('2507', '2100003', '1050026', '40000', '0', '292');
INSERT INTO `shopitems` VALUES ('2508', '2100003', '1050003', '40000', '0', '296');
INSERT INTO `shopitems` VALUES ('2509', '2100003', '1041043', '42000', '0', '300');
INSERT INTO `shopitems` VALUES ('2510', '2100003', '1041042', '42000', '0', '304');
INSERT INTO `shopitems` VALUES ('2511', '2100003', '1041041', '42000', '0', '308');
INSERT INTO `shopitems` VALUES ('2512', '2100003', '1002064', '40000', '0', '312');
INSERT INTO `shopitems` VALUES ('2513', '2100003', '1092006', '60000', '0', '316');
INSERT INTO `shopitems` VALUES ('2514', '2100003', '1060019', '38000', '0', '320');
INSERT INTO `shopitems` VALUES ('2515', '2100003', '1060018', '38000', '0', '324');
INSERT INTO `shopitems` VALUES ('2516', '2100003', '1060017', '38000', '0', '328');
INSERT INTO `shopitems` VALUES ('2517', '2100003', '1060016', '38000', '0', '332');
INSERT INTO `shopitems` VALUES ('2518', '2100003', '1051013', '60000', '0', '336');
INSERT INTO `shopitems` VALUES ('2519', '2100003', '1051012', '60000', '0', '340');
INSERT INTO `shopitems` VALUES ('2520', '2100003', '1051011', '60000', '0', '344');
INSERT INTO `shopitems` VALUES ('2521', '2100003', '1051010', '60000', '0', '348');
INSERT INTO `shopitems` VALUES ('2522', '2100003', '1040026', '40000', '0', '352');
INSERT INTO `shopitems` VALUES ('2523', '2100003', '1040021', '40000', '0', '356');
INSERT INTO `shopitems` VALUES ('2524', '2100003', '1002023', '120000', '0', '360');
INSERT INTO `shopitems` VALUES ('2525', '2100003', '1002004', '160000', '0', '364');
INSERT INTO `shopitems` VALUES ('2526', '2100004', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('2527', '2100004', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2528', '2100004', '2120000', '30', '0', '112');
INSERT INTO `shopitems` VALUES ('2529', '2100004', '2061000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('2530', '2100004', '2060000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('2531', '2100004', '2061000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2532', '2100004', '2060000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('2533', '2100004', '2030000', '400', '0', '132');
INSERT INTO `shopitems` VALUES ('2534', '2100004', '2050003', '500', '0', '136');
INSERT INTO `shopitems` VALUES ('2535', '2100004', '2050002', '300', '0', '140');
INSERT INTO `shopitems` VALUES ('2536', '2100004', '2050001', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('2537', '2100004', '2050000', '200', '0', '148');
INSERT INTO `shopitems` VALUES ('2538', '2100004', '2020028', '3000', '0', '152');
INSERT INTO `shopitems` VALUES ('2539', '2100004', '2010004', '310', '0', '156');
INSERT INTO `shopitems` VALUES ('2540', '2100004', '2010003', '100', '0', '160');
INSERT INTO `shopitems` VALUES ('2541', '2100004', '2010001', '106', '0', '164');
INSERT INTO `shopitems` VALUES ('2542', '2100004', '2010002', '50', '0', '168');
INSERT INTO `shopitems` VALUES ('2543', '2100004', '2010000', '30', '0', '172');
INSERT INTO `shopitems` VALUES ('2544', '2100004', '2001002', '4000', '0', '176');
INSERT INTO `shopitems` VALUES ('2545', '2100004', '2001001', '2300', '0', '180');
INSERT INTO `shopitems` VALUES ('2546', '2100004', '2001000', '3200', '0', '184');
INSERT INTO `shopitems` VALUES ('2547', '2100004', '2022000', '1650', '0', '188');
INSERT INTO `shopitems` VALUES ('2548', '2100004', '2022003', '1100', '0', '192');
INSERT INTO `shopitems` VALUES ('2549', '2100004', '2002005', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('2550', '2100004', '2002004', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2551', '2100004', '2002002', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('2552', '2100004', '2002001', '400', '0', '208');
INSERT INTO `shopitems` VALUES ('2553', '2100004', '2002000', '500', '0', '212');
INSERT INTO `shopitems` VALUES ('2554', '2100004', '2000006', '620', '0', '216');
INSERT INTO `shopitems` VALUES ('2555', '2100004', '2000003', '200', '0', '220');
INSERT INTO `shopitems` VALUES ('2556', '2100004', '2000002', '320', '0', '224');
INSERT INTO `shopitems` VALUES ('2557', '2100004', '2000001', '160', '0', '228');
INSERT INTO `shopitems` VALUES ('2558', '2100004', '2000000', '50', '0', '232');
INSERT INTO `shopitems` VALUES ('2559', '2110001', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('2560', '2110001', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2561', '2110001', '2120000', '30', '0', '112');
INSERT INTO `shopitems` VALUES ('2562', '2110001', '2061000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('2563', '2110001', '2060000', '1400', '0', '120');
INSERT INTO `shopitems` VALUES ('2564', '2110001', '2061000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2565', '2110001', '2060000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('2566', '2110001', '2030000', '400', '0', '132');
INSERT INTO `shopitems` VALUES ('2567', '2110001', '2050003', '500', '0', '136');
INSERT INTO `shopitems` VALUES ('2568', '2110001', '2050002', '300', '0', '140');
INSERT INTO `shopitems` VALUES ('2569', '2110001', '2050001', '200', '0', '144');
INSERT INTO `shopitems` VALUES ('2570', '2110001', '2050000', '200', '0', '148');
INSERT INTO `shopitems` VALUES ('2571', '2110001', '2020028', '3000', '0', '152');
INSERT INTO `shopitems` VALUES ('2572', '2110001', '2010004', '310', '0', '156');
INSERT INTO `shopitems` VALUES ('2573', '2110001', '2010003', '100', '0', '160');
INSERT INTO `shopitems` VALUES ('2574', '2110001', '2010001', '106', '0', '164');
INSERT INTO `shopitems` VALUES ('2575', '2110001', '2010002', '50', '0', '168');
INSERT INTO `shopitems` VALUES ('2576', '2110001', '2010000', '30', '0', '172');
INSERT INTO `shopitems` VALUES ('2577', '2110001', '2001002', '4000', '0', '176');
INSERT INTO `shopitems` VALUES ('2578', '2110001', '2001001', '2300', '0', '180');
INSERT INTO `shopitems` VALUES ('2579', '2110001', '2001000', '3200', '0', '184');
INSERT INTO `shopitems` VALUES ('2580', '2110001', '2022000', '1650', '0', '188');
INSERT INTO `shopitems` VALUES ('2581', '2110001', '2022003', '1100', '0', '192');
INSERT INTO `shopitems` VALUES ('2582', '2110001', '2002005', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('2583', '2110001', '2002004', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2584', '2110001', '2002002', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('2585', '2110001', '2002001', '400', '0', '208');
INSERT INTO `shopitems` VALUES ('2586', '2110001', '2002000', '500', '0', '212');
INSERT INTO `shopitems` VALUES ('2587', '2110001', '2000006', '620', '0', '216');
INSERT INTO `shopitems` VALUES ('2588', '2110001', '2000003', '200', '0', '220');
INSERT INTO `shopitems` VALUES ('2589', '2110001', '2000002', '320', '0', '224');
INSERT INTO `shopitems` VALUES ('2590', '2110001', '2000001', '160', '0', '228');
INSERT INTO `shopitems` VALUES ('2591', '2110001', '2000000', '50', '0', '232');
INSERT INTO `shopitems` VALUES ('2592', '2130000', '2330000', '600', '0', '104');
INSERT INTO `shopitems` VALUES ('2593', '2130000', '2070000', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2594', '2130000', '2061000', '1400', '0', '112');
INSERT INTO `shopitems` VALUES ('2595', '2130000', '2060000', '1400', '0', '116');
INSERT INTO `shopitems` VALUES ('2596', '2130000', '2061000', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('2597', '2130000', '2060000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2598', '2130000', '2030000', '400', '0', '128');
INSERT INTO `shopitems` VALUES ('2599', '2130000', '2050002', '300', '0', '132');
INSERT INTO `shopitems` VALUES ('2600', '2130000', '2050001', '200', '0', '136');
INSERT INTO `shopitems` VALUES ('2601', '2130000', '2050000', '200', '0', '140');
INSERT INTO `shopitems` VALUES ('2602', '2130000', '2020015', '10200', '0', '144');
INSERT INTO `shopitems` VALUES ('2603', '2130000', '2020014', '8100', '0', '148');
INSERT INTO `shopitems` VALUES ('2604', '2130000', '2020013', '5600', '0', '152');
INSERT INTO `shopitems` VALUES ('2605', '2130000', '2020012', '4500', '0', '156');
INSERT INTO `shopitems` VALUES ('2606', '2130000', '2001002', '4000', '0', '160');
INSERT INTO `shopitems` VALUES ('2607', '2130000', '2001001', '2300', '0', '164');
INSERT INTO `shopitems` VALUES ('2608', '2130000', '2001000', '3200', '0', '168');
INSERT INTO `shopitems` VALUES ('2609', '2130000', '2022000', '1650', '0', '172');
INSERT INTO `shopitems` VALUES ('2610', '2130000', '2022003', '1100', '0', '176');
INSERT INTO `shopitems` VALUES ('2611', '2130000', '2010004', '310', '0', '180');
INSERT INTO `shopitems` VALUES ('2612', '2130000', '2010003', '100', '0', '184');
INSERT INTO `shopitems` VALUES ('2613', '2130000', '2010001', '106', '0', '188');
INSERT INTO `shopitems` VALUES ('2614', '2130000', '2010002', '50', '0', '192');
INSERT INTO `shopitems` VALUES ('2615', '2130000', '2010000', '30', '0', '196');
INSERT INTO `shopitems` VALUES ('2616', '2130000', '2002005', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2617', '2130000', '2002004', '500', '0', '204');
INSERT INTO `shopitems` VALUES ('2618', '2130000', '2002002', '500', '0', '208');
INSERT INTO `shopitems` VALUES ('2619', '2130000', '2002001', '400', '0', '212');
INSERT INTO `shopitems` VALUES ('2620', '2130000', '2002000', '500', '0', '216');
INSERT INTO `shopitems` VALUES ('2621', '2130000', '2000006', '620', '0', '220');
INSERT INTO `shopitems` VALUES ('2622', '2130000', '2000003', '200', '0', '224');
INSERT INTO `shopitems` VALUES ('2623', '2130000', '2000002', '320', '0', '228');
INSERT INTO `shopitems` VALUES ('2624', '2130000', '2000001', '160', '0', '232');
INSERT INTO `shopitems` VALUES ('2625', '2130000', '2000000', '50', '0', '236');
INSERT INTO `shopitems` VALUES ('2626', '9110003', '2022022', '1300', '0', '104');
INSERT INTO `shopitems` VALUES ('2627', '9110003', '2022021', '550', '0', '108');
INSERT INTO `shopitems` VALUES ('2628', '9110004', '2022023', '1350', '0', '104');
INSERT INTO `shopitems` VALUES ('2629', '9110004', '2022014', '650', '0', '108');
INSERT INTO `shopitems` VALUES ('2630', '9110005', '2022025', '4200', '0', '104');
INSERT INTO `shopitems` VALUES ('2631', '9110005', '2022024', '2000', '0', '108');
INSERT INTO `shopitems` VALUES ('2632', '9110006', '2022027', '3800', '0', '104');
INSERT INTO `shopitems` VALUES ('2633', '9110006', '2022026', '1800', '0', '108');
INSERT INTO `shopitems` VALUES ('2634', '9110007', '2022020', '550', '0', '104');
INSERT INTO `shopitems` VALUES ('2635', '9110007', '2022019', '850', '0', '108');
INSERT INTO `shopitems` VALUES ('2636', '9110007', '2022018', '1600', '0', '112');
INSERT INTO `shopitems` VALUES ('2637', '9110007', '2022017', '1100', '0', '116');
INSERT INTO `shopitems` VALUES ('2638', '9120000', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2639', '9120000', '1472008', '250000', '0', '108');
INSERT INTO `shopitems` VALUES ('2640', '9120000', '1312013', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('2641', '9120000', '1322012', '15000', '0', '116');
INSERT INTO `shopitems` VALUES ('2642', '9120000', '1402009', '30000', '0', '120');
INSERT INTO `shopitems` VALUES ('2643', '9120000', '1432008', '150000', '0', '124');
INSERT INTO `shopitems` VALUES ('2644', '9120000', '1402010', '150000', '0', '128');
INSERT INTO `shopitems` VALUES ('2645', '9120000', '1462006', '500000', '0', '132');
INSERT INTO `shopitems` VALUES ('2646', '9120000', '1302021', '1250000', '0', '136');
INSERT INTO `shopitems` VALUES ('2647', '9120000', '1302022', '80000', '0', '140');
INSERT INTO `shopitems` VALUES ('2648', '9120000', '1332024', '2000000', '0', '144');
INSERT INTO `shopitems` VALUES ('2649', '9120000', '1382011', '2000000', '0', '148');
INSERT INTO `shopitems` VALUES ('2650', '9120002', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2651', '9120002', '2020014', '8100', '0', '108');
INSERT INTO `shopitems` VALUES ('2652', '9120002', '2022002', '1000', '0', '112');
INSERT INTO `shopitems` VALUES ('2653', '9120002', '2001002', '4000', '0', '116');
INSERT INTO `shopitems` VALUES ('2654', '9120002', '2000006', '620', '0', '120');
INSERT INTO `shopitems` VALUES ('2655', '9120002', '2000003', '200', '0', '124');
INSERT INTO `shopitems` VALUES ('2656', '9120002', '2020012', '4500', '0', '128');
INSERT INTO `shopitems` VALUES ('2657', '9120002', '2001001', '2300', '0', '132');
INSERT INTO `shopitems` VALUES ('2658', '9120002', '2000002', '320', '0', '136');
INSERT INTO `shopitems` VALUES ('2659', '9120002', '2000001', '160', '0', '140');
INSERT INTO `shopitems` VALUES ('2660', '9120002', '2060003', '40', '0', '144');
INSERT INTO `shopitems` VALUES ('2661', '9120004', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2662', '9120004', '2030010', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2663', '9120004', '2030009', '500', '0', '112');
INSERT INTO `shopitems` VALUES ('2664', '9120004', '2030008', '400', '0', '116');
INSERT INTO `shopitems` VALUES ('2665', '9120004', '1050100', '30000', '0', '120');
INSERT INTO `shopitems` VALUES ('2666', '9120019', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2667', '9120019', '2030010', '500', '0', '108');
INSERT INTO `shopitems` VALUES ('2668', '9120019', '2030009', '500', '0', '112');
INSERT INTO `shopitems` VALUES ('2669', '9120019', '2030008', '400', '0', '116');
INSERT INTO `shopitems` VALUES ('2670', '9120019', '1051098', '30000', '0', '120');
INSERT INTO `shopitems` VALUES ('2671', '9201020', '1051153', '100000', '0', '104');
INSERT INTO `shopitems` VALUES ('2672', '9201020', '1051152', '100000', '0', '108');
INSERT INTO `shopitems` VALUES ('2673', '9201020', '1051151', '100000', '0', '112');
INSERT INTO `shopitems` VALUES ('2674', '9201020', '1051150', '100000', '0', '116');
INSERT INTO `shopitems` VALUES ('2675', '9201020', '1050134', '100000', '0', '120');
INSERT INTO `shopitems` VALUES ('2676', '9201020', '1050133', '100000', '0', '124');
INSERT INTO `shopitems` VALUES ('2677', '9201020', '1050132', '100000', '0', '128');
INSERT INTO `shopitems` VALUES ('2678', '9201020', '1050131', '100000', '0', '132');
INSERT INTO `shopitems` VALUES ('2679', '9201058', '1061046', '42500', '0', '104');
INSERT INTO `shopitems` VALUES ('2680', '9201058', '1061045', '42500', '0', '108');
INSERT INTO `shopitems` VALUES ('2681', '9201058', '1061044', '42500', '0', '112');
INSERT INTO `shopitems` VALUES ('2682', '9201058', '1061043', '42500', '0', '116');
INSERT INTO `shopitems` VALUES ('2683', '9201058', '1060046', '42500', '0', '120');
INSERT INTO `shopitems` VALUES ('2684', '9201058', '1060045', '42500', '0', '124');
INSERT INTO `shopitems` VALUES ('2685', '9201058', '1060044', '42500', '0', '128');
INSERT INTO `shopitems` VALUES ('2686', '9201058', '1060043', '42500', '0', '132');
INSERT INTO `shopitems` VALUES ('2687', '9201058', '1041050', '47500', '0', '136');
INSERT INTO `shopitems` VALUES ('2688', '9201058', '1041049', '47500', '0', '140');
INSERT INTO `shopitems` VALUES ('2689', '9201058', '1041048', '47500', '0', '144');
INSERT INTO `shopitems` VALUES ('2690', '9201058', '1041047', '47500', '0', '148');
INSERT INTO `shopitems` VALUES ('2691', '9201058', '1040060', '47500', '0', '152');
INSERT INTO `shopitems` VALUES ('2692', '9201058', '1040059', '47500', '0', '156');
INSERT INTO `shopitems` VALUES ('2693', '9201058', '1040058', '47500', '0', '160');
INSERT INTO `shopitems` VALUES ('2694', '9201058', '1040057', '47500', '0', '164');
INSERT INTO `shopitems` VALUES ('2695', '9201058', '1002175', '32500', '0', '168');
INSERT INTO `shopitems` VALUES ('2696', '9201058', '1002174', '32500', '0', '172');
INSERT INTO `shopitems` VALUES ('2697', '9201058', '1002173', '32500', '0', '176');
INSERT INTO `shopitems` VALUES ('2698', '9201058', '1002172', '32500', '0', '180');
INSERT INTO `shopitems` VALUES ('2699', '9201058', '1002171', '32500', '0', '184');
INSERT INTO `shopitems` VALUES ('2700', '9201058', '1061051', '46500', '0', '188');
INSERT INTO `shopitems` VALUES ('2701', '9201058', '1061050', '46500', '0', '192');
INSERT INTO `shopitems` VALUES ('2702', '9201058', '1061052', '46500', '0', '196');
INSERT INTO `shopitems` VALUES ('2703', '9201058', '1060057', '46500', '0', '200');
INSERT INTO `shopitems` VALUES ('2704', '9201058', '1060056', '46500', '0', '204');
INSERT INTO `shopitems` VALUES ('2705', '9201058', '1060058', '46500', '0', '208');
INSERT INTO `shopitems` VALUES ('2706', '9201058', '1060059', '46500', '0', '212');
INSERT INTO `shopitems` VALUES ('2707', '9201058', '1041055', '52500', '0', '216');
INSERT INTO `shopitems` VALUES ('2708', '9201058', '1041054', '52500', '0', '220');
INSERT INTO `shopitems` VALUES ('2709', '9201058', '1041056', '52500', '0', '224');
INSERT INTO `shopitems` VALUES ('2710', '9201058', '1040068', '52500', '0', '228');
INSERT INTO `shopitems` VALUES ('2711', '9201058', '1040067', '52500', '0', '232');
INSERT INTO `shopitems` VALUES ('2712', '9201058', '1040070', '52500', '0', '236');
INSERT INTO `shopitems` VALUES ('2713', '9201058', '1040069', '52500', '0', '240');
INSERT INTO `shopitems` VALUES ('2714', '9201058', '1002165', '32500', '0', '244');
INSERT INTO `shopitems` VALUES ('2715', '9201058', '1002164', '32500', '0', '248');
INSERT INTO `shopitems` VALUES ('2716', '9201058', '1002163', '32500', '0', '252');
INSERT INTO `shopitems` VALUES ('2717', '9201058', '1002162', '32500', '0', '256');
INSERT INTO `shopitems` VALUES ('2718', '9201058', '1002161', '32500', '0', '260');
INSERT INTO `shopitems` VALUES ('2719', '9201058', '1061036', '42500', '0', '264');
INSERT INTO `shopitems` VALUES ('2720', '9201058', '1061035', '42500', '0', '268');
INSERT INTO `shopitems` VALUES ('2721', '9201058', '1061034', '42500', '0', '272');
INSERT INTO `shopitems` VALUES ('2722', '9201058', '1050028', '42500', '0', '276');
INSERT INTO `shopitems` VALUES ('2723', '9201058', '1050027', '42500', '0', '280');
INSERT INTO `shopitems` VALUES ('2724', '9201058', '1050026', '42500', '0', '284');
INSERT INTO `shopitems` VALUES ('2725', '9201058', '1050003', '42500', '0', '288');
INSERT INTO `shopitems` VALUES ('2726', '9201058', '1041043', '44500', '0', '292');
INSERT INTO `shopitems` VALUES ('2727', '9201058', '1041042', '44500', '0', '296');
INSERT INTO `shopitems` VALUES ('2728', '9201058', '1041041', '44500', '0', '300');
INSERT INTO `shopitems` VALUES ('2729', '9201058', '1002064', '42500', '0', '304');
INSERT INTO `shopitems` VALUES ('2730', '9201058', '1092006', '62500', '0', '308');
INSERT INTO `shopitems` VALUES ('2731', '9201058', '1060019', '40500', '0', '312');
INSERT INTO `shopitems` VALUES ('2732', '9201058', '1060018', '40500', '0', '316');
INSERT INTO `shopitems` VALUES ('2733', '9201058', '1060017', '40500', '0', '320');
INSERT INTO `shopitems` VALUES ('2734', '9201058', '1060016', '40500', '0', '324');
INSERT INTO `shopitems` VALUES ('2735', '9201058', '1051013', '62500', '0', '328');
INSERT INTO `shopitems` VALUES ('2736', '9201058', '1051012', '62500', '0', '332');
INSERT INTO `shopitems` VALUES ('2737', '9201058', '1051011', '62500', '0', '336');
INSERT INTO `shopitems` VALUES ('2738', '9201058', '1051010', '62500', '0', '340');
INSERT INTO `shopitems` VALUES ('2739', '9201058', '1040026', '42500', '0', '344');
INSERT INTO `shopitems` VALUES ('2740', '9201058', '1040021', '42500', '0', '348');
INSERT INTO `shopitems` VALUES ('2741', '9201058', '1002023', '122500', '0', '352');
INSERT INTO `shopitems` VALUES ('2742', '9201059', '1472001', '22500', '0', '104');
INSERT INTO `shopitems` VALUES ('2743', '9201059', '1462000', '32500', '0', '108');
INSERT INTO `shopitems` VALUES ('2744', '9201059', '1452005', '152500', '0', '112');
INSERT INTO `shopitems` VALUES ('2745', '9201059', '1442001', '62500', '0', '116');
INSERT INTO `shopitems` VALUES ('2746', '9201059', '1432002', '62500', '0', '120');
INSERT INTO `shopitems` VALUES ('2747', '9201059', '1422001', '47500', '0', '124');
INSERT INTO `shopitems` VALUES ('2748', '9201059', '1412006', '47500', '0', '128');
INSERT INTO `shopitems` VALUES ('2749', '9201059', '1402002', '152500', '0', '132');
INSERT INTO `shopitems` VALUES ('2750', '9201059', '1382002', '22500', '0', '136');
INSERT INTO `shopitems` VALUES ('2751', '9201059', '1372003', '40500', '0', '140');
INSERT INTO `shopitems` VALUES ('2752', '9201059', '1332012', '42500', '0', '144');
INSERT INTO `shopitems` VALUES ('2753', '9201059', '1332009', '44500', '0', '148');
INSERT INTO `shopitems` VALUES ('2754', '9201059', '1322014', '42500', '0', '152');
INSERT INTO `shopitems` VALUES ('2755', '9201059', '1312005', '42500', '0', '156');
INSERT INTO `shopitems` VALUES ('2756', '9201059', '1302068', '352500', '0', '160');
INSERT INTO `shopitems` VALUES ('2757', '9201059', '1302008', '42500', '0', '164');
INSERT INTO `shopitems` VALUES ('2758', '9201060', '2010003', '100', '0', '104');
INSERT INTO `shopitems` VALUES ('2759', '9201060', '2061000', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('2760', '9201060', '2060000', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('2761', '9201060', '2030000', '400', '0', '116');
INSERT INTO `shopitems` VALUES ('2762', '9201060', '2022195', '15000', '0', '120');
INSERT INTO `shopitems` VALUES ('2763', '9201060', '2020015', '10200', '0', '124');
INSERT INTO `shopitems` VALUES ('2764', '9201060', '2020014', '8100', '0', '128');
INSERT INTO `shopitems` VALUES ('2765', '9201060', '2020013', '5600', '0', '132');
INSERT INTO `shopitems` VALUES ('2766', '9201060', '2020012', '4500', '0', '136');
INSERT INTO `shopitems` VALUES ('2767', '9201060', '2022190', '3000', '0', '140');
INSERT INTO `shopitems` VALUES ('2768', '9201060', '2001002', '4000', '0', '144');
INSERT INTO `shopitems` VALUES ('2769', '9201060', '2001001', '2300', '0', '148');
INSERT INTO `shopitems` VALUES ('2770', '9201060', '2001000', '3200', '0', '152');
INSERT INTO `shopitems` VALUES ('2771', '9201060', '2022000', '1650', '0', '156');
INSERT INTO `shopitems` VALUES ('2772', '9201060', '2022003', '1100', '0', '160');
INSERT INTO `shopitems` VALUES ('2773', '9201060', '2022192', '600', '0', '164');
INSERT INTO `shopitems` VALUES ('2774', '9201060', '2022191', '1000', '0', '168');
INSERT INTO `shopitems` VALUES ('2775', '9201060', '2022189', '1000', '0', '172');
INSERT INTO `shopitems` VALUES ('2776', '9201060', '2010004', '310', '0', '176');
INSERT INTO `shopitems` VALUES ('2777', '9201060', '2010001', '106', '0', '180');
INSERT INTO `shopitems` VALUES ('2778', '9201060', '2010002', '50', '0', '184');
INSERT INTO `shopitems` VALUES ('2779', '9201060', '2010000', '30', '0', '188');
INSERT INTO `shopitems` VALUES ('2780', '9201060', '2002025', '1500', '0', '192');
INSERT INTO `shopitems` VALUES ('2781', '9201060', '2002024', '1500', '0', '196');
INSERT INTO `shopitems` VALUES ('2782', '9201060', '2002023', '3800', '0', '200');
INSERT INTO `shopitems` VALUES ('2783', '9201060', '2002022', '2100', '0', '204');
INSERT INTO `shopitems` VALUES ('2784', '9201060', '2002021', '2800', '0', '208');
INSERT INTO `shopitems` VALUES ('2785', '9201060', '2002020', '2800', '0', '212');
INSERT INTO `shopitems` VALUES ('2786', '9201060', '2002019', '5000', '0', '216');
INSERT INTO `shopitems` VALUES ('2787', '9201060', '2002018', '5000', '0', '220');
INSERT INTO `shopitems` VALUES ('2788', '9201060', '2002017', '5000', '0', '224');
INSERT INTO `shopitems` VALUES ('2789', '9201060', '2002016', '5000', '0', '228');
INSERT INTO `shopitems` VALUES ('2790', '9201060', '2000006', '620', '0', '232');
INSERT INTO `shopitems` VALUES ('2791', '9201060', '2000003', '200', '0', '236');
INSERT INTO `shopitems` VALUES ('2792', '9201060', '2000002', '320', '0', '240');
INSERT INTO `shopitems` VALUES ('2793', '9201060', '2000001', '160', '0', '244');
INSERT INTO `shopitems` VALUES ('2794', '9201060', '2000000', '50', '0', '248');
INSERT INTO `shopitems` VALUES ('2795', '9270019', '1472007', '60000', '0', '104');
INSERT INTO `shopitems` VALUES ('2796', '9270019', '1472004', '30000', '0', '108');
INSERT INTO `shopitems` VALUES ('2797', '9270019', '1472001', '20000', '0', '112');
INSERT INTO `shopitems` VALUES ('2798', '9270019', '1462005', '250000', '0', '116');
INSERT INTO `shopitems` VALUES ('2799', '9270019', '1462004', '200000', '0', '120');
INSERT INTO `shopitems` VALUES ('2800', '9270019', '1462000', '30000', '0', '124');
INSERT INTO `shopitems` VALUES ('2801', '9270019', '1452007', '375000', '0', '128');
INSERT INTO `shopitems` VALUES ('2802', '9270019', '1452006', '250000', '0', '132');
INSERT INTO `shopitems` VALUES ('2803', '9270019', '1452005', '150000', '0', '136');
INSERT INTO `shopitems` VALUES ('2804', '9270019', '1442009', '300000', '0', '140');
INSERT INTO `shopitems` VALUES ('2805', '9270019', '1442003', '175000', '0', '144');
INSERT INTO `shopitems` VALUES ('2806', '9270019', '1442001', '60000', '0', '148');
INSERT INTO `shopitems` VALUES ('2807', '9270019', '1432005', '225000', '0', '152');
INSERT INTO `shopitems` VALUES ('2808', '9270019', '1432003', '175000', '0', '156');
INSERT INTO `shopitems` VALUES ('2809', '9270019', '1432002', '60000', '0', '160');
INSERT INTO `shopitems` VALUES ('2810', '9270019', '1422007', '250000', '0', '164');
INSERT INTO `shopitems` VALUES ('2811', '9270019', '1422008', '200000', '0', '168');
INSERT INTO `shopitems` VALUES ('2812', '9270019', '1422001', '45000', '0', '172');
INSERT INTO `shopitems` VALUES ('2813', '9270019', '1412005', '250000', '0', '176');
INSERT INTO `shopitems` VALUES ('2814', '9270019', '1412004', '200000', '0', '180');
INSERT INTO `shopitems` VALUES ('2815', '9270019', '1412006', '45000', '0', '184');
INSERT INTO `shopitems` VALUES ('2816', '9270019', '1402007', '450000', '0', '188');
INSERT INTO `shopitems` VALUES ('2817', '9270019', '1402006', '350000', '0', '192');
INSERT INTO `shopitems` VALUES ('2818', '9270019', '1402002', '150000', '0', '196');
INSERT INTO `shopitems` VALUES ('2819', '9270019', '1382002', '20000', '0', '200');
INSERT INTO `shopitems` VALUES ('2820', '9270019', '1372000', '400000', '0', '204');
INSERT INTO `shopitems` VALUES ('2821', '9270019', '1372001', '175000', '0', '208');
INSERT INTO `shopitems` VALUES ('2822', '9270019', '1372003', '38000', '0', '212');
INSERT INTO `shopitems` VALUES ('2823', '9270019', '1332011', '425000', '0', '216');
INSERT INTO `shopitems` VALUES ('2824', '9270019', '1332014', '375000', '0', '220');
INSERT INTO `shopitems` VALUES ('2825', '9270019', '1332001', '200000', '0', '224');
INSERT INTO `shopitems` VALUES ('2826', '9270019', '1332012', '40000', '0', '228');
INSERT INTO `shopitems` VALUES ('2827', '9270019', '1332009', '42000', '0', '232');
INSERT INTO `shopitems` VALUES ('2828', '9270019', '1322016', '175000', '0', '236');
INSERT INTO `shopitems` VALUES ('2829', '9270019', '1322015', '100000', '0', '240');
INSERT INTO `shopitems` VALUES ('2830', '9270019', '1322014', '40000', '0', '244');
INSERT INTO `shopitems` VALUES ('2831', '9270019', '1312007', '175000', '0', '248');
INSERT INTO `shopitems` VALUES ('2832', '9270019', '1312006', '100000', '0', '252');
INSERT INTO `shopitems` VALUES ('2833', '9270019', '1312005', '40000', '0', '256');
INSERT INTO `shopitems` VALUES ('2834', '9270019', '1302009', '225000', '0', '260');
INSERT INTO `shopitems` VALUES ('2835', '9270019', '1302004', '100000', '0', '264');
INSERT INTO `shopitems` VALUES ('2836', '9270019', '1302008', '40000', '0', '268');
INSERT INTO `shopitems` VALUES ('2837', '9270020', '1061069', '160000', '0', '104');
INSERT INTO `shopitems` VALUES ('2838', '9270020', '1061070', '160000', '0', '108');
INSERT INTO `shopitems` VALUES ('2839', '9270020', '1060072', '160000', '0', '112');
INSERT INTO `shopitems` VALUES ('2840', '9270020', '1060071', '160000', '0', '116');
INSERT INTO `shopitems` VALUES ('2841', '9270020', '1060052', '108000', '0', '120');
INSERT INTO `shopitems` VALUES ('2842', '9270020', '1060050', '108000', '0', '124');
INSERT INTO `shopitems` VALUES ('2843', '9270020', '1060051', '108000', '0', '128');
INSERT INTO `shopitems` VALUES ('2844', '9270020', '1051009', '111000', '0', '132');
INSERT INTO `shopitems` VALUES ('2845', '9270020', '1051008', '111000', '0', '136');
INSERT INTO `shopitems` VALUES ('2846', '9270020', '1051007', '111000', '0', '140');
INSERT INTO `shopitems` VALUES ('2847', '9270020', '1041074', '180000', '0', '144');
INSERT INTO `shopitems` VALUES ('2848', '9270020', '1041075', '180000', '0', '148');
INSERT INTO `shopitems` VALUES ('2849', '9270020', '1040083', '180000', '0', '152');
INSERT INTO `shopitems` VALUES ('2850', '9270020', '1040082', '180000', '0', '156');
INSERT INTO `shopitems` VALUES ('2851', '9270020', '1040061', '114000', '0', '160');
INSERT INTO `shopitems` VALUES ('2852', '9270020', '1040062', '114000', '0', '164');
INSERT INTO `shopitems` VALUES ('2853', '9270020', '1040063', '114000', '0', '168');
INSERT INTO `shopitems` VALUES ('2854', '9270020', '1002180', '100000', '0', '172');
INSERT INTO `shopitems` VALUES ('2855', '9270020', '1002179', '100000', '0', '176');
INSERT INTO `shopitems` VALUES ('2856', '9270020', '1002178', '100000', '0', '180');
INSERT INTO `shopitems` VALUES ('2857', '9270020', '1002177', '100000', '0', '184');
INSERT INTO `shopitems` VALUES ('2858', '9270020', '1002176', '100000', '0', '188');
INSERT INTO `shopitems` VALUES ('2859', '9270020', '1061080', '160000', '0', '192');
INSERT INTO `shopitems` VALUES ('2860', '9270020', '1061081', '160000', '0', '196');
INSERT INTO `shopitems` VALUES ('2861', '9270020', '1061062', '108000', '0', '200');
INSERT INTO `shopitems` VALUES ('2862', '9270020', '1061060', '108000', '0', '204');
INSERT INTO `shopitems` VALUES ('2863', '9270020', '1061064', '108000', '0', '208');
INSERT INTO `shopitems` VALUES ('2864', '9270020', '1061061', '108000', '0', '212');
INSERT INTO `shopitems` VALUES ('2865', '9270020', '1060069', '160000', '0', '216');
INSERT INTO `shopitems` VALUES ('2866', '9270020', '1060070', '160000', '0', '220');
INSERT INTO `shopitems` VALUES ('2867', '9270020', '1060063', '108000', '0', '224');
INSERT INTO `shopitems` VALUES ('2868', '9270020', '1060061', '108000', '0', '228');
INSERT INTO `shopitems` VALUES ('2869', '9270020', '1060065', '108000', '0', '232');
INSERT INTO `shopitems` VALUES ('2870', '9270020', '1060062', '108000', '0', '236');
INSERT INTO `shopitems` VALUES ('2871', '9270020', '1041081', '180000', '0', '240');
INSERT INTO `shopitems` VALUES ('2872', '9270020', '1041082', '180000', '0', '244');
INSERT INTO `shopitems` VALUES ('2873', '9270020', '1041067', '114000', '0', '248');
INSERT INTO `shopitems` VALUES ('2874', '9270020', '1041065', '114000', '0', '252');
INSERT INTO `shopitems` VALUES ('2875', '9270020', '1041069', '114000', '0', '256');
INSERT INTO `shopitems` VALUES ('2876', '9270020', '1041066', '114000', '0', '260');
INSERT INTO `shopitems` VALUES ('2877', '9270020', '1040079', '180000', '0', '264');
INSERT INTO `shopitems` VALUES ('2878', '9270020', '1040081', '180000', '0', '268');
INSERT INTO `shopitems` VALUES ('2879', '9270020', '1040076', '114000', '0', '272');
INSERT INTO `shopitems` VALUES ('2880', '9270020', '1040074', '114000', '0', '276');
INSERT INTO `shopitems` VALUES ('2881', '9270020', '1040073', '114000', '0', '280');
INSERT INTO `shopitems` VALUES ('2882', '9270020', '1040072', '114000', '0', '284');
INSERT INTO `shopitems` VALUES ('2883', '9270020', '1002137', '100000', '0', '288');
INSERT INTO `shopitems` VALUES ('2884', '9270020', '1002135', '100000', '0', '292');
INSERT INTO `shopitems` VALUES ('2885', '9270020', '1002139', '100000', '0', '296');
INSERT INTO `shopitems` VALUES ('2886', '9270020', '1002138', '100000', '0', '300');
INSERT INTO `shopitems` VALUES ('2887', '9270020', '1061047', '120000', '0', '304');
INSERT INTO `shopitems` VALUES ('2888', '9270020', '1061048', '120000', '0', '308');
INSERT INTO `shopitems` VALUES ('2889', '9270020', '1051027', '450000', '0', '312');
INSERT INTO `shopitems` VALUES ('2890', '9270020', '1051024', '450000', '0', '316');
INSERT INTO `shopitems` VALUES ('2891', '9270020', '1051025', '450000', '0', '320');
INSERT INTO `shopitems` VALUES ('2892', '9270020', '1051023', '450000', '0', '324');
INSERT INTO `shopitems` VALUES ('2893', '9270020', '1050037', '450000', '0', '328');
INSERT INTO `shopitems` VALUES ('2894', '9270020', '1050036', '450000', '0', '332');
INSERT INTO `shopitems` VALUES ('2895', '9270020', '1050038', '450000', '0', '336');
INSERT INTO `shopitems` VALUES ('2896', '9270020', '1050035', '450000', '0', '340');
INSERT INTO `shopitems` VALUES ('2897', '9270020', '1050002', '300000', '0', '344');
INSERT INTO `shopitems` VALUES ('2898', '9270020', '1050031', '300000', '0', '348');
INSERT INTO `shopitems` VALUES ('2899', '9270020', '1041051', '120000', '0', '352');
INSERT INTO `shopitems` VALUES ('2900', '9270020', '1041052', '120000', '0', '356');
INSERT INTO `shopitems` VALUES ('2901', '9270020', '1002144', '96000', '0', '360');
INSERT INTO `shopitems` VALUES ('2902', '9270020', '1002143', '96000', '0', '364');
INSERT INTO `shopitems` VALUES ('2903', '9270020', '1002142', '96000', '0', '368');
INSERT INTO `shopitems` VALUES ('2904', '9270020', '1002141', '96000', '0', '372');
INSERT INTO `shopitems` VALUES ('2905', '9270020', '1092002', '200000', '0', '376');
INSERT INTO `shopitems` VALUES ('2906', '9270020', '1092001', '100000', '0', '380');
INSERT INTO `shopitems` VALUES ('2907', '9270020', '1061084', '180000', '0', '384');
INSERT INTO `shopitems` VALUES ('2908', '9270020', '1061083', '180000', '0', '388');
INSERT INTO `shopitems` VALUES ('2909', '9270020', '1060074', '180000', '0', '392');
INSERT INTO `shopitems` VALUES ('2910', '9270020', '1060075', '180000', '0', '396');
INSERT INTO `shopitems` VALUES ('2911', '9270020', '1051014', '112500', '0', '400');
INSERT INTO `shopitems` VALUES ('2912', '9270020', '1051001', '112500', '0', '404');
INSERT INTO `shopitems` VALUES ('2913', '9270020', '1050021', '112500', '0', '408');
INSERT INTO `shopitems` VALUES ('2914', '9270020', '1050000', '112500', '0', '412');
INSERT INTO `shopitems` VALUES ('2915', '9270020', '1041085', '200000', '0', '416');
INSERT INTO `shopitems` VALUES ('2916', '9270020', '1041084', '200000', '0', '420');
INSERT INTO `shopitems` VALUES ('2917', '9270020', '1040085', '200000', '0', '424');
INSERT INTO `shopitems` VALUES ('2918', '9270020', '1040000', '200000', '0', '428');
INSERT INTO `shopitems` VALUES ('2919', '9270020', '1002004', '160000', '0', '432');
INSERT INTO `shopitems` VALUES ('2920', '9270021', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2921', '9270021', '2022015', '12000', '0', '108');
INSERT INTO `shopitems` VALUES ('2922', '9270021', '2061000', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('2923', '9270021', '2060000', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('2924', '9270021', '2030000', '400', '0', '120');
INSERT INTO `shopitems` VALUES ('2925', '9270021', '2050003', '500', '0', '124');
INSERT INTO `shopitems` VALUES ('2926', '9270021', '2050002', '300', '0', '128');
INSERT INTO `shopitems` VALUES ('2927', '9270021', '2050001', '200', '0', '132');
INSERT INTO `shopitems` VALUES ('2928', '9270021', '2050000', '200', '0', '136');
INSERT INTO `shopitems` VALUES ('2929', '9270021', '2020028', '3000', '0', '140');
INSERT INTO `shopitems` VALUES ('2930', '9270021', '2010004', '310', '0', '144');
INSERT INTO `shopitems` VALUES ('2931', '9270021', '2010003', '100', '0', '148');
INSERT INTO `shopitems` VALUES ('2932', '9270021', '2010001', '106', '0', '152');
INSERT INTO `shopitems` VALUES ('2933', '9270021', '2010002', '50', '0', '156');
INSERT INTO `shopitems` VALUES ('2934', '9270021', '2010000', '30', '0', '160');
INSERT INTO `shopitems` VALUES ('2935', '9270021', '2001002', '4000', '0', '164');
INSERT INTO `shopitems` VALUES ('2936', '9270021', '2001001', '2300', '0', '168');
INSERT INTO `shopitems` VALUES ('2937', '9270021', '2001000', '3200', '0', '172');
INSERT INTO `shopitems` VALUES ('2938', '9270021', '2022000', '1650', '0', '176');
INSERT INTO `shopitems` VALUES ('2939', '9270021', '2022003', '1100', '0', '180');
INSERT INTO `shopitems` VALUES ('2940', '9270021', '2002005', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('2941', '9270021', '2002004', '500', '0', '188');
INSERT INTO `shopitems` VALUES ('2942', '9270021', '2002002', '500', '0', '192');
INSERT INTO `shopitems` VALUES ('2943', '9270021', '2002001', '400', '0', '196');
INSERT INTO `shopitems` VALUES ('2944', '9270021', '2002000', '500', '0', '200');
INSERT INTO `shopitems` VALUES ('2945', '9270021', '2000006', '620', '0', '204');
INSERT INTO `shopitems` VALUES ('2946', '9270021', '2000003', '200', '0', '208');
INSERT INTO `shopitems` VALUES ('2947', '9270021', '2000002', '320', '0', '212');
INSERT INTO `shopitems` VALUES ('2948', '9270021', '2000001', '160', '0', '216');
INSERT INTO `shopitems` VALUES ('2949', '9270021', '2000000', '50', '0', '220');
INSERT INTO `shopitems` VALUES ('2950', '9270022', '2070000', '500', '0', '104');
INSERT INTO `shopitems` VALUES ('2951', '9270022', '2061000', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('2952', '9270022', '2060000', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('2953', '9270022', '2030000', '400', '0', '116');
INSERT INTO `shopitems` VALUES ('2954', '9270022', '2050003', '500', '0', '120');
INSERT INTO `shopitems` VALUES ('2955', '9270022', '2050002', '300', '0', '124');
INSERT INTO `shopitems` VALUES ('2956', '9270022', '2050001', '200', '0', '128');
INSERT INTO `shopitems` VALUES ('2957', '9270022', '2050000', '200', '0', '132');
INSERT INTO `shopitems` VALUES ('2958', '9270022', '2020028', '3000', '0', '136');
INSERT INTO `shopitems` VALUES ('2959', '9270022', '2010004', '310', '0', '140');
INSERT INTO `shopitems` VALUES ('2960', '9270022', '2010003', '100', '0', '144');
INSERT INTO `shopitems` VALUES ('2961', '9270022', '2010001', '106', '0', '148');
INSERT INTO `shopitems` VALUES ('2962', '9270022', '2010002', '50', '0', '152');
INSERT INTO `shopitems` VALUES ('2963', '9270022', '2010000', '30', '0', '156');
INSERT INTO `shopitems` VALUES ('2964', '9270022', '2001002', '4000', '0', '160');
INSERT INTO `shopitems` VALUES ('2965', '9270022', '2001001', '2300', '0', '164');
INSERT INTO `shopitems` VALUES ('2966', '9270022', '2001000', '3200', '0', '168');
INSERT INTO `shopitems` VALUES ('2967', '9270022', '2022000', '1650', '0', '172');
INSERT INTO `shopitems` VALUES ('2968', '9270022', '2022003', '1100', '0', '176');
INSERT INTO `shopitems` VALUES ('2969', '9270022', '2002005', '500', '0', '180');
INSERT INTO `shopitems` VALUES ('2970', '9270022', '2002004', '500', '0', '184');
INSERT INTO `shopitems` VALUES ('2971', '9270022', '2002002', '500', '0', '188');
INSERT INTO `shopitems` VALUES ('2972', '9270022', '2002001', '400', '0', '192');
INSERT INTO `shopitems` VALUES ('2973', '9270022', '2002000', '500', '0', '196');
INSERT INTO `shopitems` VALUES ('2974', '9270022', '2000006', '620', '0', '200');
INSERT INTO `shopitems` VALUES ('2975', '9270022', '2000003', '200', '0', '204');
INSERT INTO `shopitems` VALUES ('2976', '9270022', '2000002', '320', '0', '208');
INSERT INTO `shopitems` VALUES ('2977', '9270022', '2000001', '160', '0', '212');
INSERT INTO `shopitems` VALUES ('2978', '9270022', '2000000', '50', '0', '216');
INSERT INTO `shopitems` VALUES ('2979', '9270027', '2022215', '6800', '0', '104');
INSERT INTO `shopitems` VALUES ('2980', '9270027', '2022214', '3200', '0', '108');
INSERT INTO `shopitems` VALUES ('2981', '9270027', '2022211', '6400', '0', '112');
INSERT INTO `shopitems` VALUES ('2982', '9270027', '2022210', '3200', '0', '116');
INSERT INTO `shopitems` VALUES ('2983', '9270027', '2022209', '1600', '0', '120');
INSERT INTO `shopitems` VALUES ('2984', '9270027', '2022208', '1000', '0', '124');
INSERT INTO `shopitems` VALUES ('2985', '9270027', '2022207', '2600', '0', '128');
INSERT INTO `shopitems` VALUES ('2986', '9270027', '2022206', '2200', '0', '132');
INSERT INTO `shopitems` VALUES ('2987', '9270027', '2022205', '1800', '0', '136');
INSERT INTO `shopitems` VALUES ('2988', '9270027', '2022204', '1200', '0', '140');
INSERT INTO `shopitems` VALUES ('2989', '9270027', '2022203', '800', '0', '144');
INSERT INTO `shopitems` VALUES ('2990', '9999992', '1812006', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('2991', '9999992', '1832000', '1', '0', '114');
INSERT INTO `shopitems` VALUES ('2992', '9999992', '1812005', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('2993', '9999992', '1822000', '1', '0', '118');
INSERT INTO `shopitems` VALUES ('2994', '9999992', '1812004', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('2995', '9999992', '1812003', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('2996', '9999992', '1812002', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('2997', '9999992', '1812001', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('2998', '9999992', '1812000', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('2999', '9999992', '1802100', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3000', '9999992', '1802055', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3001', '9999992', '1802053', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3002', '9999992', '1802052', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3003', '9999992', '1802051', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3004', '9999992', '1802050', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3005', '9999992', '1802049', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3006', '9999992', '1802048', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3007', '9999992', '1802047', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3008', '9999992', '1802045', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3009', '9999992', '1802044', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3010', '9999992', '1802042', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3011', '9999992', '1802038', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3012', '9999992', '1802037', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3013', '9999992', '1802036', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3014', '9999992', '1802035', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3015', '9999992', '1802034', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3016', '9999992', '1802033', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3017', '9999992', '1802032', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3018', '9999992', '1802031', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3019', '9999992', '1802030', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3020', '9999992', '1802029', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3021', '9999992', '1802028', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3022', '9999992', '1802027', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3023', '9999992', '1802026', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3024', '9999992', '1802025', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3025', '9999992', '1802024', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3026', '9999992', '1802023', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3027', '9999992', '1802022', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3028', '9999992', '1802021', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3029', '9999992', '1802020', '1', '0', '260');
INSERT INTO `shopitems` VALUES ('3030', '9999992', '1802019', '1', '0', '264');
INSERT INTO `shopitems` VALUES ('3031', '9999992', '1802018', '1', '0', '268');
INSERT INTO `shopitems` VALUES ('3032', '9999992', '1802017', '1', '0', '272');
INSERT INTO `shopitems` VALUES ('3033', '9999992', '1802016', '1', '0', '276');
INSERT INTO `shopitems` VALUES ('3034', '9999992', '1802015', '1', '0', '280');
INSERT INTO `shopitems` VALUES ('3035', '9999992', '1802014', '1', '0', '284');
INSERT INTO `shopitems` VALUES ('3036', '9999992', '1802013', '1', '0', '288');
INSERT INTO `shopitems` VALUES ('3037', '9999992', '1802012', '1', '0', '292');
INSERT INTO `shopitems` VALUES ('3038', '9999992', '1802011', '1', '0', '296');
INSERT INTO `shopitems` VALUES ('3039', '9999992', '1802010', '1', '0', '300');
INSERT INTO `shopitems` VALUES ('3040', '9999992', '1802009', '1', '0', '304');
INSERT INTO `shopitems` VALUES ('3041', '9999992', '1802008', '1', '0', '308');
INSERT INTO `shopitems` VALUES ('3042', '9999992', '1802007', '1', '0', '312');
INSERT INTO `shopitems` VALUES ('3043', '9999992', '1802006', '1', '0', '316');
INSERT INTO `shopitems` VALUES ('3044', '9999992', '1802005', '1', '0', '320');
INSERT INTO `shopitems` VALUES ('3045', '9999992', '1802004', '1', '0', '324');
INSERT INTO `shopitems` VALUES ('3046', '9999992', '1802003', '1', '0', '328');
INSERT INTO `shopitems` VALUES ('3047', '9999992', '1802002', '1', '0', '332');
INSERT INTO `shopitems` VALUES ('3048', '9999992', '1802001', '1', '0', '336');
INSERT INTO `shopitems` VALUES ('3049', '9999992', '1802000', '1', '0', '340');
INSERT INTO `shopitems` VALUES ('3050', '9999992', '5000045', '1', '0', '344');
INSERT INTO `shopitems` VALUES ('3051', '9999992', '5000044', '1', '0', '348');
INSERT INTO `shopitems` VALUES ('3052', '9999992', '5000041', '1', '0', '352');
INSERT INTO `shopitems` VALUES ('3053', '9999992', '5000039', '1', '0', '356');
INSERT INTO `shopitems` VALUES ('3054', '9999992', '5000037', '1', '0', '360');
INSERT INTO `shopitems` VALUES ('3055', '9999992', '5000036', '1', '0', '364');
INSERT INTO `shopitems` VALUES ('3056', '9999992', '5000034', '1', '0', '368');
INSERT INTO `shopitems` VALUES ('3057', '9999992', '5000025', '1', '0', '372');
INSERT INTO `shopitems` VALUES ('3058', '9999992', '5000024', '1', '0', '376');
INSERT INTO `shopitems` VALUES ('3059', '9999992', '5000023', '1', '0', '380');
INSERT INTO `shopitems` VALUES ('3060', '9999992', '5000022', '1', '0', '384');
INSERT INTO `shopitems` VALUES ('3061', '9999992', '5000020', '1', '0', '388');
INSERT INTO `shopitems` VALUES ('3062', '9999992', '5000017', '1', '0', '392');
INSERT INTO `shopitems` VALUES ('3063', '9999992', '5000015', '1', '0', '396');
INSERT INTO `shopitems` VALUES ('3064', '9999992', '5000014', '1', '0', '400');
INSERT INTO `shopitems` VALUES ('3065', '9999992', '5000013', '1', '0', '404');
INSERT INTO `shopitems` VALUES ('3066', '9999992', '5000012', '1', '0', '408');
INSERT INTO `shopitems` VALUES ('3067', '9999992', '5000011', '1', '0', '412');
INSERT INTO `shopitems` VALUES ('3068', '9999992', '5000010', '1', '0', '416');
INSERT INTO `shopitems` VALUES ('3069', '9999992', '5000009', '1', '0', '420');
INSERT INTO `shopitems` VALUES ('3070', '9999992', '5000008', '1', '0', '424');
INSERT INTO `shopitems` VALUES ('3071', '9999992', '5000007', '1', '0', '428');
INSERT INTO `shopitems` VALUES ('3072', '9999992', '5000006', '1', '0', '432');
INSERT INTO `shopitems` VALUES ('3073', '9999992', '5000005', '1', '0', '436');
INSERT INTO `shopitems` VALUES ('3074', '9999992', '5000004', '1', '0', '440');
INSERT INTO `shopitems` VALUES ('3075', '9999992', '5000003', '1', '0', '444');
INSERT INTO `shopitems` VALUES ('3076', '9999992', '5000002', '1', '0', '448');
INSERT INTO `shopitems` VALUES ('3077', '9999992', '5000001', '1', '0', '452');
INSERT INTO `shopitems` VALUES ('3078', '9999992', '5000000', '1', '0', '456');
INSERT INTO `shopitems` VALUES ('3079', '9999993', '5077000', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3080', '9999993', '5076000', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3081', '9999993', '5075000', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3082', '9999993', '5075001', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3083', '9999993', '5075002', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3084', '9999993', '5072000', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3085', '9999993', '5390000', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3086', '9999993', '5390001', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3087', '9999993', '5390002', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3088', '9999993', '5071000', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3089', '9999994', '3010041', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3090', '9999994', '3010040', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3091', '9999994', '3010028', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3092', '9999994', '3010026', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3093', '9999994', '3010025', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3094', '9999994', '3010024', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3095', '9999994', '3010023', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3096', '9999994', '3010022', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3097', '9999994', '3010019', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3098', '9999994', '3010018', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3099', '9999994', '3010017', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3100', '9999994', '3010016', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3101', '9999994', '3010015', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3102', '9999994', '3010014', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3103', '9999994', '3010013', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3104', '9999994', '3010012', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3105', '9999994', '3010011', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3106', '9999994', '3010010', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3107', '9999994', '3010009', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3108', '9999994', '3010008', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3109', '9999994', '3010007', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3110', '9999994', '3010006', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3111', '9999994', '3010005', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3112', '9999994', '3010004', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3113', '9999994', '3010003', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3114', '9999994', '3010002', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3115', '9999994', '3010001', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3116', '9999994', '3010000', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3117', '9999995', '1112230', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3118', '9999995', '1112229', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3119', '9999995', '1112228', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3120', '9999995', '1112227', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3121', '9999995', '1112226', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3122', '9999995', '1112225', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3123', '9999995', '1112224', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3124', '9999995', '1112223', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3125', '9999995', '1112222', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3126', '9999995', '1112221', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3127', '9999995', '1112220', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3128', '9999995', '1112219', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3129', '9999995', '1112218', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3130', '9999995', '1112217', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3131', '9999995', '1112216', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3132', '9999995', '1112215', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3133', '9999995', '1112214', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3134', '9999995', '1112213', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3135', '9999995', '1112212', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3136', '9999995', '1112211', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3137', '9999995', '1112210', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3138', '9999995', '1112209', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3139', '9999995', '1112208', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3140', '9999995', '1112207', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3141', '9999995', '1112206', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3142', '9999995', '1112205', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3143', '9999995', '1112204', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3144', '9999995', '1112203', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3145', '9999995', '1112202', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3146', '9999995', '1112201', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3147', '9999995', '1112200', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3148', '9999995', '1112120', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3149', '9999995', '1112119', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3150', '9999995', '1112118', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3151', '9999995', '1112117', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3152', '9999995', '1112116', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3153', '9999995', '1112115', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3154', '9999995', '1112114', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3155', '9999995', '1112113', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3156', '9999995', '1112112', '1', '0', '260');
INSERT INTO `shopitems` VALUES ('3157', '9999995', '1112111', '1', '0', '264');
INSERT INTO `shopitems` VALUES ('3158', '9999995', '1112110', '1', '0', '268');
INSERT INTO `shopitems` VALUES ('3159', '9999995', '1112109', '1', '0', '272');
INSERT INTO `shopitems` VALUES ('3160', '9999995', '1112108', '1', '0', '276');
INSERT INTO `shopitems` VALUES ('3161', '9999995', '1112107', '1', '0', '280');
INSERT INTO `shopitems` VALUES ('3162', '9999995', '1112106', '1', '0', '284');
INSERT INTO `shopitems` VALUES ('3163', '9999995', '1112105', '1', '0', '288');
INSERT INTO `shopitems` VALUES ('3164', '9999995', '1112104', '1', '0', '292');
INSERT INTO `shopitems` VALUES ('3165', '9999995', '1112103', '1', '0', '296');
INSERT INTO `shopitems` VALUES ('3166', '9999995', '1112102', '1', '0', '300');
INSERT INTO `shopitems` VALUES ('3167', '9999995', '1112101', '1', '0', '304');
INSERT INTO `shopitems` VALUES ('3168', '9999995', '1112100', '1', '0', '308');
INSERT INTO `shopitems` VALUES ('3169', '9999996', '1012010', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3170', '9999996', '1011002', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3171', '9999996', '1012000', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3172', '9999996', '1012024', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3173', '9999996', '1012074', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3174', '9999996', '1012083', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3175', '9999996', '1012055', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3176', '9999996', '1011003', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3177', '9999996', '1012028', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3178', '9999996', '1012006', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3179', '9999996', '1012027', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3180', '9999996', '1012032', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3181', '9999996', '1012031', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3182', '9999996', '1022007', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3183', '9999996', '1022006', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3184', '9999996', '1022044', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3185', '9999996', '1022033', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3186', '9999996', '1022019', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3187', '9999996', '1022020', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3188', '9999996', '1022005', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3189', '9999996', '1022004', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3190', '9999996', '1022003', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3191', '9999996', '1022002', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3192', '9999996', '1022001', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3193', '9999996', '1022000', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3194', '9999996', '5160014', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3195', '9999996', '5160013', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3196', '9999996', '5160012', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3197', '9999996', '5160011', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3198', '9999996', '5160009', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3199', '9999996', '5160008', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3200', '9999996', '5160007', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3201', '9999996', '5160006', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3202', '9999996', '5160005', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3203', '9999996', '5160004', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3204', '9999996', '5160003', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3205', '9999996', '5160002', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3206', '9999996', '5160001', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3207', '9999996', '5160000', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3208', '9999997', '1070002', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3209', '9999997', '1071008', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3210', '9999997', '1052049', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3211', '9999997', '1072234', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3212', '9999997', '1072325', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3213', '9999997', '1072326', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3214', '9999997', '1072235', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3215', '9999997', '1072189', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3216', '9999997', '1072257', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3217', '9999997', '1072186', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3218', '9999997', '1072258', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3219', '9999997', '1072260', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3220', '9999997', '1072279', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3221', '9999997', '1072276', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3222', '9999997', '1072153', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3223', '9999997', '1062003', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3224', '9999997', '1062018', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3225', '9999997', '1062040', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3226', '9999997', '1062032', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3227', '9999997', '1082102', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3228', '9999997', '1102156', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3229', '9999997', '1102039', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3230', '9999997', '1042013', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3231', '9999997', '1042018', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3232', '9999997', '1042012', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3233', '9999997', '1042036', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3234', '9999997', '1042037', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3235', '9999997', '1042099', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3236', '9999997', '1042043', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3237', '9999997', '1032054', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3238', '9999997', '1032053', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3239', '9999997', '1032052', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3240', '9999997', '1032024', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3241', '9999997', '1002294', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3242', '9999997', '1002342', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3243', '9999997', '1002485', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3244', '9999997', '1002343', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3245', '9999997', '1002667', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3246', '9999997', '1002234', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3247', '9999997', '1002186', '1', '0', '260');
INSERT INTO `shopitems` VALUES ('3248', '9999997', '1702136', '1', '0', '264');
INSERT INTO `shopitems` VALUES ('3249', '9999997', '1702121', '1', '0', '268');
INSERT INTO `shopitems` VALUES ('3250', '9999997', '1702179', '1', '0', '272');
INSERT INTO `shopitems` VALUES ('3251', '9999997', '1702187', '1', '0', '276');
INSERT INTO `shopitems` VALUES ('3252', '9999997', '1702185', '1', '0', '280');
INSERT INTO `shopitems` VALUES ('3253', '9999997', '1702184', '1', '0', '284');
INSERT INTO `shopitems` VALUES ('3254', '9999997', '1702183', '1', '0', '288');
INSERT INTO `shopitems` VALUES ('3255', '9999997', '1702180', '1', '0', '292');
INSERT INTO `shopitems` VALUES ('3256', '9999997', '1702120', '1', '0', '296');
INSERT INTO `shopitems` VALUES ('3257', '9999997', '1702119', '1', '0', '300');
INSERT INTO `shopitems` VALUES ('3258', '9999997', '1702118', '1', '0', '304');
INSERT INTO `shopitems` VALUES ('3259', '9999998', '2040026', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3260', '9999998', '2040016', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3261', '9999998', '2040031', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3262', '9999998', '2040920', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3263', '9999998', '2040915', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3264', '9999998', '2041057', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3265', '9999998', '2041053', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3266', '9999998', '2041055', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3267', '9999998', '2041051', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3268', '9999998', '2040529', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3269', '9999998', '2040527', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3270', '9999998', '2040506', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3271', '9999998', '2040534', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3272', '9999998', '2040710', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3273', '9999998', '2040709', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3274', '9999998', '2040806', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3275', '9999998', '2040323', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3276', '9999998', '2040303', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3277', '9999998', '2040318', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3278', '9999998', '2044902', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3279', '9999998', '2044802', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3280', '9999998', '2043703', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3281', '9999998', '2044203', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3282', '9999998', '2044103', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3283', '9999998', '2044003', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3284', '9999998', '2043803', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3285', '9999998', '2044303', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3286', '9999998', '2044403', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3287', '9999998', '2043203', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3288', '9999998', '2043103', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3289', '9999998', '2043003', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3290', '9999998', '2040807', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3291', '9999998', '2043303', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3292', '9999998', '2044603', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3293', '9999998', '2044703', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3294', '9999998', '2044503', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3295', '9999998', '2041200', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3296', '9999998', '2049100', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3297', '9999998', '2049002', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3298', '9999998', '2340000', '1', '0', '260');
INSERT INTO `shopitems` VALUES ('3299', '9999999', '1082150', '1', '0', '104');
INSERT INTO `shopitems` VALUES ('3300', '9999999', '1082148', '1', '0', '108');
INSERT INTO `shopitems` VALUES ('3301', '9999999', '1082147', '1', '0', '112');
INSERT INTO `shopitems` VALUES ('3302', '9999999', '1082146', '1', '0', '116');
INSERT INTO `shopitems` VALUES ('3303', '9999999', '1082145', '1', '0', '120');
INSERT INTO `shopitems` VALUES ('3304', '9999999', '1102103', '1', '0', '124');
INSERT INTO `shopitems` VALUES ('3305', '9999999', '1102102', '1', '0', '128');
INSERT INTO `shopitems` VALUES ('3306', '9999999', '1102101', '1', '0', '132');
INSERT INTO `shopitems` VALUES ('3307', '9999999', '1102106', '1', '0', '136');
INSERT INTO `shopitems` VALUES ('3308', '9999999', '1102105', '1', '0', '140');
INSERT INTO `shopitems` VALUES ('3309', '9999999', '1102104', '1', '0', '144');
INSERT INTO `shopitems` VALUES ('3310', '9999999', '1092022', '1', '0', '148');
INSERT INTO `shopitems` VALUES ('3311', '9999999', '1032032', '1', '0', '152');
INSERT INTO `shopitems` VALUES ('3312', '9999999', '1032031', '1', '0', '156');
INSERT INTO `shopitems` VALUES ('3313', '9999999', '1032030', '1', '0', '160');
INSERT INTO `shopitems` VALUES ('3314', '9999999', '1032028', '1', '0', '164');
INSERT INTO `shopitems` VALUES ('3315', '9999999', '1032027', '1', '0', '168');
INSERT INTO `shopitems` VALUES ('3316', '9999999', '1032026', '1', '0', '172');
INSERT INTO `shopitems` VALUES ('3317', '9999999', '1032048', '1', '0', '176');
INSERT INTO `shopitems` VALUES ('3318', '9999999', '1102042', '1', '0', '180');
INSERT INTO `shopitems` VALUES ('3319', '9999999', '1102041', '1', '0', '184');
INSERT INTO `shopitems` VALUES ('3320', '9999999', '1122001', '1', '0', '188');
INSERT INTO `shopitems` VALUES ('3321', '9999999', '1122000', '1', '0', '192');
INSERT INTO `shopitems` VALUES ('3322', '9999999', '1072344', '1', '0', '196');
INSERT INTO `shopitems` VALUES ('3323', '9999999', '1072239', '1', '0', '200');
INSERT INTO `shopitems` VALUES ('3324', '9999999', '1051140', '1', '0', '204');
INSERT INTO `shopitems` VALUES ('3325', '9999999', '1050127', '1', '0', '208');
INSERT INTO `shopitems` VALUES ('3326', '9999999', '1050100', '1', '0', '212');
INSERT INTO `shopitems` VALUES ('3327', '9999999', '1051098', '1', '0', '216');
INSERT INTO `shopitems` VALUES ('3328', '9999999', '1050018', '1', '0', '220');
INSERT INTO `shopitems` VALUES ('3329', '9999999', '1051017', '1', '0', '224');
INSERT INTO `shopitems` VALUES ('3330', '9999999', '1082149', '1', '0', '228');
INSERT INTO `shopitems` VALUES ('3331', '9999999', '1082223', '1', '0', '232');
INSERT INTO `shopitems` VALUES ('3332', '9999999', '1002518', '1', '0', '236');
INSERT INTO `shopitems` VALUES ('3333', '9999999', '1002357', '1', '0', '240');
INSERT INTO `shopitems` VALUES ('3334', '9999999', '1492013', '1', '0', '244');
INSERT INTO `shopitems` VALUES ('3335', '9999999', '1482023', '1', '0', '248');
INSERT INTO `shopitems` VALUES ('3336', '9999999', '1412033', '1', '0', '252');
INSERT INTO `shopitems` VALUES ('3337', '9999999', '1422037', '1', '0', '256');
INSERT INTO `shopitems` VALUES ('3338', '9999999', '1302081', '1', '0', '260');
INSERT INTO `shopitems` VALUES ('3339', '9999999', '1402046', '1', '0', '264');
INSERT INTO `shopitems` VALUES ('3340', '9999999', '1372040', '1', '0', '268');
INSERT INTO `shopitems` VALUES ('3341', '9999999', '1382050', '1', '0', '272');
INSERT INTO `shopitems` VALUES ('3342', '9999999', '1432038', '1', '0', '276');
INSERT INTO `shopitems` VALUES ('3343', '9999999', '1442045', '1', '0', '280');
INSERT INTO `shopitems` VALUES ('3344', '9999999', '1462039', '1', '0', '284');
INSERT INTO `shopitems` VALUES ('3345', '9999999', '1092049', '1', '0', '288');
INSERT INTO `shopitems` VALUES ('3346', '9999999', '1332050', '1', '0', '292');
INSERT INTO `shopitems` VALUES ('3347', '9999999', '1332049', '1', '0', '296');
INSERT INTO `shopitems` VALUES ('3348', '9999999', '1452044', '1', '0', '300');
INSERT INTO `shopitems` VALUES ('3349', '9999999', '1472052', '1', '0', '304');
INSERT INTO `shopitems` VALUES ('3350', '9999999', '2330005', '1', '0', '308');
INSERT INTO `shopitems` VALUES ('3351', '9999999', '2070018', '1', '0', '312');
INSERT INTO `shopitems` VALUES ('3352', '9999999', '4006001', '1', '0', '316');
INSERT INTO `shopitems` VALUES ('3353', '9999999', '4006000', '1', '0', '320');
INSERT INTO `shopitems` VALUES ('3354', '9999999', '1902002', '1', '0', '324');
INSERT INTO `shopitems` VALUES ('3355', '9999999', '1902001', '1', '0', '328');
INSERT INTO `shopitems` VALUES ('3356', '9999999', '1902000', '1', '0', '332');
INSERT INTO `shopitems` VALUES ('3357', '9999999', '1912000', '1', '0', '336');
INSERT INTO `shopitems` VALUES ('3358', '9999999', '2022283', '1', '0', '340');
INSERT INTO `shopitems` VALUES ('3359', '9999999', '2022282', '1', '0', '344');
INSERT INTO `shopitems` VALUES ('3360', '9999999', '2022273', '1', '0', '348');
INSERT INTO `shopitems` VALUES ('3361', '9999999', '2022179', '1', '0', '352');
INSERT INTO `shopitems` VALUES ('3362', '9999999', '1322013', '1', '0', '356');
INSERT INTO `shopitems` VALUES ('3363', '9999999', '1072200', '1', '0', '360');
INSERT INTO `shopitems` VALUES ('3364', '9999999', '1062007', '1', '0', '364');
INSERT INTO `shopitems` VALUES ('3365', '9999999', '1042003', '1', '0', '368');
INSERT INTO `shopitems` VALUES ('3366', '9999999', '1002140', '1', '0', '372');
INSERT INTO `shopitems` VALUES ('6479', '1337', '1002140', '1', '0', '1');
INSERT INTO `shopitems` VALUES ('6480', '1337', '1042003', '1', '0', '2');
INSERT INTO `shopitems` VALUES ('6481', '1337', '1062007', '1', '0', '3');
INSERT INTO `shopitems` VALUES ('6482', '1337', '1322013', '1', '0', '4');
INSERT INTO `shopitems` VALUES ('6483', '1337', '1072010', '1', '0', '5');
INSERT INTO `shopitems` VALUES ('6484', '1337', '2022179', '1', '0', '6');
INSERT INTO `shopitems` VALUES ('6485', '1337', '2022273', '1', '0', '7');
INSERT INTO `shopitems` VALUES ('6486', '1337', '5072000', '1', '0', '8');
INSERT INTO `shopitems` VALUES ('6487', '1337', '5390000', '1', '0', '9');
INSERT INTO `shopitems` VALUES ('6488', '1337', '5390001', '1', '0', '10');
INSERT INTO `shopitems` VALUES ('6489', '1337', '5390001', '1', '0', '11');
INSERT INTO `shopitems` VALUES ('6490', '1337', '1452044', '1', '0', '12');
INSERT INTO `shopitems` VALUES ('6491', '1337', '1472052', '1', '0', '13');
INSERT INTO `shopitems` VALUES ('6492', '1337', '1462039', '1', '0', '14');
INSERT INTO `shopitems` VALUES ('6493', '1337', '1332050', '1', '0', '15');
INSERT INTO `shopitems` VALUES ('6494', '1337', '1312031', '1', '0', '16');
INSERT INTO `shopitems` VALUES ('6495', '1337', '1322052', '1', '0', '17');
INSERT INTO `shopitems` VALUES ('6496', '1337', '1302059', '1', '0', '18');
INSERT INTO `shopitems` VALUES ('6497', '1337', '1442045', '1', '0', '19');
INSERT INTO `shopitems` VALUES ('6498', '1337', '1432038', '1', '0', '20');
INSERT INTO `shopitems` VALUES ('6499', '1337', '1382036', '1', '0', '21');
INSERT INTO `shopitems` VALUES ('6500', '1337', '1412026', '1', '0', '22');
INSERT INTO `shopitems` VALUES ('6501', '1337', '1422028', '1', '0', '23');
INSERT INTO `shopitems` VALUES ('6502', '1337', '1402036', '1', '0', '24');
INSERT INTO `shopitems` VALUES ('6503', '1337', '1122000', '1', '0', '25');
INSERT INTO `shopitems` VALUES ('6504', '1337', '2041200', '1', '0', '26');
INSERT INTO `shopitems` VALUES ('6505', '1337', '4006001', '1', '0', '27');
INSERT INTO `shopitems` VALUES ('6506', '1337', '4001017', '1', '0', '28');
INSERT INTO `shopitems` VALUES ('6507', '1337', '4031179', '1', '0', '29');
INSERT INTO `shopitems` VALUES ('6508', '1337', '1912000', '1', '0', '30');
INSERT INTO `shopitems` VALUES ('6509', '1337', '1902000', '1', '0', '31');
INSERT INTO `shopitems` VALUES ('6510', '1337', '1902001', '1', '0', '32');
INSERT INTO `shopitems` VALUES ('6511', '1337', '1902002', '1', '0', '33');
INSERT INTO `shopitems` VALUES ('6512', '1337', '2044503', '1', '0', '34');
INSERT INTO `shopitems` VALUES ('6513', '1337', '2044703', '1', '0', '35');
INSERT INTO `shopitems` VALUES ('6514', '1337', '2044603', '1', '0', '36');
INSERT INTO `shopitems` VALUES ('6515', '1337', '2043303', '1', '0', '37');
INSERT INTO `shopitems` VALUES ('6516', '1337', '2043103', '1', '0', '38');
INSERT INTO `shopitems` VALUES ('6517', '1337', '2043203', '1', '0', '39');
INSERT INTO `shopitems` VALUES ('6518', '1337', '2043003', '1', '0', '40');
INSERT INTO `shopitems` VALUES ('6519', '1337', '2044403', '1', '0', '41');
INSERT INTO `shopitems` VALUES ('6520', '1337', '2044303', '1', '0', '42');
INSERT INTO `shopitems` VALUES ('6521', '1337', '2043803', '1', '0', '43');
INSERT INTO `shopitems` VALUES ('6522', '1337', '2044103', '1', '0', '44');
INSERT INTO `shopitems` VALUES ('6523', '1337', '2044203', '1', '0', '45');
INSERT INTO `shopitems` VALUES ('6524', '1337', '2044003', '1', '0', '46');
INSERT INTO `shopitems` VALUES ('6525', '1337', '2043703', '1', '0', '47');
INSERT INTO `shopitems` VALUES ('6526', '1337', '2040807', '1', '0', '48');
INSERT INTO `shopitems` VALUES ('6527', '1337', '2040806', '1', '0', '49');
INSERT INTO `shopitems` VALUES ('6528', '1337', '2040007', '1', '0', '50');
INSERT INTO `shopitems` VALUES ('6529', '1337', '2040506', '1', '0', '51');
INSERT INTO `shopitems` VALUES ('6530', '1337', '2040710', '1', '0', '52');
INSERT INTO `shopitems` VALUES ('6531', '1337', '2040711', '1', '0', '53');
INSERT INTO `shopitems` VALUES ('6532', '1337', '2340000', '1', '0', '54');
INSERT INTO `shopitems` VALUES ('20020', '1337', '1082149', '1', '0', '54');
INSERT INTO `shopitems` VALUES ('6533', '9000069', '2022503', '0', '5', '1');
INSERT INTO `shopitems` VALUES ('6534', '9000069', '2000004', '0', '5', '2');
INSERT INTO `shopitems` VALUES ('6535', '9000069', '2022514', '0', '10', '3');
INSERT INTO `shopitems` VALUES ('6536', '9000069', '2000005', '0', '10', '4');
INSERT INTO `shopitems` VALUES ('6537', '9000069', '3010116', '0', '25', '5');
INSERT INTO `shopitems` VALUES ('6538', '9000069', '1122017', '0', '30', '6');
INSERT INTO `shopitems` VALUES ('6539', '9000069', '2049000', '0', '45', '7');
INSERT INTO `shopitems` VALUES ('6540', '9000069', '2049100', '0', '70', '8');
INSERT INTO `shopitems` VALUES ('6541', '9000069', '1003016', '0', '100', '9');

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `shopid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `npcid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shopid`)
) ENGINE=MyISAM AUTO_INCREMENT=10000000 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('11000', '11000');
INSERT INTO `shops` VALUES ('11100', '11100');
INSERT INTO `shops` VALUES ('21000', '21000');
INSERT INTO `shops` VALUES ('1001000', '1001000');
INSERT INTO `shops` VALUES ('1001001', '1001001');
INSERT INTO `shops` VALUES ('1001100', '1001100');
INSERT INTO `shops` VALUES ('1011000', '1011000');
INSERT INTO `shops` VALUES ('1011001', '1011001');
INSERT INTO `shops` VALUES ('1011100', '1011100');
INSERT INTO `shops` VALUES ('1012004', '1012004');
INSERT INTO `shops` VALUES ('1021000', '1021000');
INSERT INTO `shops` VALUES ('1021001', '1021001');
INSERT INTO `shops` VALUES ('1021100', '1021100');
INSERT INTO `shops` VALUES ('1031000', '1031000');
INSERT INTO `shops` VALUES ('1031001', '1031001');
INSERT INTO `shops` VALUES ('1031100', '1031100');
INSERT INTO `shops` VALUES ('1032103', '1032103');
INSERT INTO `shops` VALUES ('1051000', '1051000');
INSERT INTO `shops` VALUES ('1051001', '1051001');
INSERT INTO `shops` VALUES ('1051002', '1051002');
INSERT INTO `shops` VALUES ('1052104', '1052104');
INSERT INTO `shops` VALUES ('1061001', '1061001');
INSERT INTO `shops` VALUES ('1061002', '1061002');
INSERT INTO `shops` VALUES ('1081000', '1081000');
INSERT INTO `shops` VALUES ('1091000', '1091000');
INSERT INTO `shops` VALUES ('1091001', '1091001');
INSERT INTO `shops` VALUES ('1091002', '1091002');
INSERT INTO `shops` VALUES ('1093000', '1093000');
INSERT INTO `shops` VALUES ('1100001', '1100001');
INSERT INTO `shops` VALUES ('1100002', '1100002');
INSERT INTO `shops` VALUES ('2010004', '2010004');
INSERT INTO `shops` VALUES ('2012003', '2012003');
INSERT INTO `shops` VALUES ('2012004', '2012004');
INSERT INTO `shops` VALUES ('2012005', '2012005');
INSERT INTO `shops` VALUES ('2020001', '2020001');
INSERT INTO `shops` VALUES ('2022000', '2022000');
INSERT INTO `shops` VALUES ('2022001', '2022001');
INSERT INTO `shops` VALUES ('2022002', '2022002');
INSERT INTO `shops` VALUES ('2030009', '2030009');
INSERT INTO `shops` VALUES ('2040049', '2040049');
INSERT INTO `shops` VALUES ('2040051', '2040051');
INSERT INTO `shops` VALUES ('2041002', '2041002');
INSERT INTO `shops` VALUES ('2041003', '2041003');
INSERT INTO `shops` VALUES ('2041006', '2041006');
INSERT INTO `shops` VALUES ('2041014', '2041014');
INSERT INTO `shops` VALUES ('2041016', '2041016');
INSERT INTO `shops` VALUES ('2050000', '2050000');
INSERT INTO `shops` VALUES ('2050003', '2050003');
INSERT INTO `shops` VALUES ('2051000', '2051000');
INSERT INTO `shops` VALUES ('2060003', '2060003');
INSERT INTO `shops` VALUES ('2060004', '2060004');
INSERT INTO `shops` VALUES ('2060007', '2060007');
INSERT INTO `shops` VALUES ('2070001', '2070001');
INSERT INTO `shops` VALUES ('2070002', '2070002');
INSERT INTO `shops` VALUES ('2070003', '2070003');
INSERT INTO `shops` VALUES ('2080001', '2080001');
INSERT INTO `shops` VALUES ('2080002', '2080002');
INSERT INTO `shops` VALUES ('2080003', '2080003');
INSERT INTO `shops` VALUES ('2080004', '2080004');
INSERT INTO `shops` VALUES ('2090001', '2090001');
INSERT INTO `shops` VALUES ('2090002', '2090002');
INSERT INTO `shops` VALUES ('2090003', '2090003');
INSERT INTO `shops` VALUES ('2090006', '2090006');
INSERT INTO `shops` VALUES ('2093000', '2093000');
INSERT INTO `shops` VALUES ('2093001', '2093001');
INSERT INTO `shops` VALUES ('2093002', '2093002');
INSERT INTO `shops` VALUES ('2100002', '2100002');
INSERT INTO `shops` VALUES ('2100003', '2100003');
INSERT INTO `shops` VALUES ('2100004', '2100004');
INSERT INTO `shops` VALUES ('2110001', '2110001');
INSERT INTO `shops` VALUES ('2130000', '2130000');
INSERT INTO `shops` VALUES ('9110003', '9110003');
INSERT INTO `shops` VALUES ('9110004', '9110004');
INSERT INTO `shops` VALUES ('9110005', '9110005');
INSERT INTO `shops` VALUES ('9110006', '9110006');
INSERT INTO `shops` VALUES ('9110007', '9110007');
INSERT INTO `shops` VALUES ('9120000', '9120000');
INSERT INTO `shops` VALUES ('9120002', '9120002');
INSERT INTO `shops` VALUES ('9120004', '9120004');
INSERT INTO `shops` VALUES ('9120019', '9120019');
INSERT INTO `shops` VALUES ('9201020', '9201020');
INSERT INTO `shops` VALUES ('9201058', '9201058');
INSERT INTO `shops` VALUES ('9201059', '9201059');
INSERT INTO `shops` VALUES ('9201060', '9201060');
INSERT INTO `shops` VALUES ('9270019', '9270019');
INSERT INTO `shops` VALUES ('9270020', '9270020');
INSERT INTO `shops` VALUES ('9270021', '9270021');
INSERT INTO `shops` VALUES ('9270022', '9270022');
INSERT INTO `shops` VALUES ('9270027', '9270027');
INSERT INTO `shops` VALUES ('9999992', '9001002');
INSERT INTO `shops` VALUES ('9999993', '9001002');
INSERT INTO `shops` VALUES ('9999994', '9001002');
INSERT INTO `shops` VALUES ('9999995', '9001002');
INSERT INTO `shops` VALUES ('9999996', '9001002');
INSERT INTO `shops` VALUES ('9999997', '9001002');
INSERT INTO `shops` VALUES ('9999998', '9001002');
INSERT INTO `shops` VALUES ('9999999', '9001002');
INSERT INTO `shops` VALUES ('1337', '11000');
INSERT INTO `shops` VALUES ('9000069', '9000069');

-- ----------------------------
-- Table structure for `skillmacros`
-- ----------------------------
DROP TABLE IF EXISTS `skillmacros`;
CREATE TABLE `skillmacros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL DEFAULT '0',
  `position` tinyint(1) NOT NULL DEFAULT '0',
  `skill1` int(11) NOT NULL DEFAULT '0',
  `skill2` int(11) NOT NULL DEFAULT '0',
  `skill3` int(11) NOT NULL DEFAULT '0',
  `name` varchar(13) DEFAULT NULL,
  `shout` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of skillmacros
-- ----------------------------

-- ----------------------------
-- Table structure for `skills`
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skillid` int(11) NOT NULL DEFAULT '0',
  `characterid` int(11) NOT NULL DEFAULT '0',
  `skilllevel` int(11) NOT NULL DEFAULT '0',
  `masterlevel` int(11) NOT NULL DEFAULT '0',
  `expiration` bigint(20) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `skills_ibfk_1` (`characterid`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for `specialcashitems`
-- ----------------------------
DROP TABLE IF EXISTS `specialcashitems`;
CREATE TABLE `specialcashitems` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `modifier` int(11) NOT NULL COMMENT '1024 is add/remove',
  `info` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of specialcashitems
-- ----------------------------

-- ----------------------------
-- Table structure for `storages`
-- ----------------------------
DROP TABLE IF EXISTS `storages`;
CREATE TABLE `storages` (
  `storageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `world` int(2) NOT NULL,
  `slots` int(11) NOT NULL DEFAULT '0',
  `meso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`storageid`),
  KEY `accountid` (`accountid`),
  CONSTRAINT `storages_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storages
-- ----------------------------

-- ----------------------------
-- Table structure for `trocklocations`
-- ----------------------------
DROP TABLE IF EXISTS `trocklocations`;
CREATE TABLE `trocklocations` (
  `trockid` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) NOT NULL,
  `mapid` int(11) NOT NULL,
  `vip` int(2) NOT NULL,
  PRIMARY KEY (`trockid`),
  KEY `characterid` (`characterid`) USING BTREE,
  CONSTRAINT `trocklocations_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trocklocations
-- ----------------------------

-- ----------------------------
-- Table structure for `wishlists`
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wishlists
-- ----------------------------

-- ----------------------------
-- Table structure for `zaksquads`
-- ----------------------------
DROP TABLE IF EXISTS `zaksquads`;
CREATE TABLE `zaksquads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel` int(10) unsigned NOT NULL,
  `leaderid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `members` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zaksquads
-- ----------------------------
