-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emkillboard
-- ------------------------------------------------------
-- Server version	5.1.66-0+squeeze1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kb3_alliances`
--

DROP TABLE IF EXISTS `kb3_alliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_alliances` (
  `all_id` int(11) NOT NULL AUTO_INCREMENT,
  `all_name` varchar(64) NOT NULL DEFAULT '',
  `all_external_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`all_id`),
  UNIQUE KEY `all_name` (`all_name`),
  UNIQUE KEY `all_external_id` (`all_external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1931 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_api_keys`
--

DROP TABLE IF EXISTS `kb3_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_api_keys` (
  `key_name` varchar(50) NOT NULL,
  `key_id` int(11) NOT NULL,
  `key_key` varchar(64) NOT NULL,
  `key_kbsite` varchar(16) NOT NULL,
  `key_flags` tinyint(4) NOT NULL,
  PRIMARY KEY (`key_name`,`key_id`,`key_key`,`key_kbsite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_apicache`
--

DROP TABLE IF EXISTS `kb3_apicache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_apicache` (
  `cfg_site` varchar(16) COLLATE latin1_german2_ci NOT NULL DEFAULT '',
  `cfg_key` varchar(32) COLLATE latin1_german2_ci NOT NULL DEFAULT '',
  `cfg_value` text COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`cfg_site`,`cfg_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_apilog`
--

DROP TABLE IF EXISTS `kb3_apilog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_apilog` (
  `log_site` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `log_keyname` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `log_posted` int(11) NOT NULL,
  `log_errors` int(11) NOT NULL,
  `log_ignored` int(11) NOT NULL,
  `log_verified` int(11) NOT NULL,
  `log_totalmails` int(11) NOT NULL,
  `log_source` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `log_type` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `log_errorcode` int(11) NOT NULL DEFAULT '0',
  `log_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_banned_mails`
--

DROP TABLE IF EXISTS `kb3_banned_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_banned_mails` (
  `bml_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bml_ip` varchar(32) NOT NULL DEFAULT '',
  `bml_mail` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_comments`
--

DROP TABLE IF EXISTS `kb3_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` char(16) DEFAULT NULL,
  `kll_id` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `name` tinytext NOT NULL,
  `posttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varbinary(39) NOT NULL DEFAULT '0:0:0:0',
  PRIMARY KEY (`id`),
  KEY `kll_site_id` (`kll_id`,`site`)
) ENGINE=MyISAM AUTO_INCREMENT=30280 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_config`
--

DROP TABLE IF EXISTS `kb3_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_config` (
  `cfg_site` varchar(16) NOT NULL DEFAULT '',
  `cfg_key` varchar(32) NOT NULL DEFAULT '',
  `cfg_value` text NOT NULL,
  PRIMARY KEY (`cfg_site`,`cfg_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_constellations`
--

DROP TABLE IF EXISTS `kb3_constellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_constellations` (
  `con_id` int(11) NOT NULL DEFAULT '0',
  `con_name` char(128) NOT NULL DEFAULT '',
  `con_reg_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`con_id`),
  KEY `con_reg_id` (`con_reg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_contract_details`
--

DROP TABLE IF EXISTS `kb3_contract_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_contract_details` (
  `ctd_ctr_id` int(11) NOT NULL DEFAULT '0',
  `ctd_crp_id` int(11) NOT NULL DEFAULT '0',
  `ctd_all_id` int(11) NOT NULL DEFAULT '0',
  `ctd_reg_id` int(11) NOT NULL DEFAULT '0',
  `ctd_sys_id` int(11) NOT NULL DEFAULT '0',
  KEY `ctd_ctr_id` (`ctd_ctr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_contracts`
--

DROP TABLE IF EXISTS `kb3_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_contracts` (
  `ctr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctr_name` varchar(128) NOT NULL DEFAULT '',
  `ctr_site` varchar(64) NOT NULL DEFAULT '',
  `ctr_campaign` smallint(6) NOT NULL DEFAULT '0',
  `ctr_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ctr_ended` datetime DEFAULT '0000-00-00 00:00:00',
  `ctr_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ctr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_corps`
--

DROP TABLE IF EXISTS `kb3_corps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_corps` (
  `crp_id` int(11) NOT NULL AUTO_INCREMENT,
  `crp_name` varchar(64) NOT NULL DEFAULT '',
  `crp_all_id` int(11) NOT NULL DEFAULT '0',
  `crp_updated` datetime DEFAULT NULL,
  `crp_external_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`crp_id`),
  UNIQUE KEY `crp_name` (`crp_name`),
  UNIQUE KEY `crp_external_id` (`crp_external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17617 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_dgmattributetypes`
--

DROP TABLE IF EXISTS `kb3_dgmattributetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_dgmattributetypes` (
  `attributeID` int(11) NOT NULL DEFAULT '0',
  `attributeName` char(100) NOT NULL,
  `defaultValue` int(11) NOT NULL DEFAULT '0',
  `published` enum('true','false') NOT NULL DEFAULT 'true',
  `displayName` char(100) NOT NULL,
  `unitID` int(11) DEFAULT NULL,
  `stackable` enum('true','false') NOT NULL DEFAULT 'true',
  `highIsGood` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`attributeID`),
  KEY `attributeName` (`attributeName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_dgmeffects`
--

DROP TABLE IF EXISTS `kb3_dgmeffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_dgmeffects` (
  `effectID` smallint(5) NOT NULL DEFAULT '0',
  `effectName` text NOT NULL,
  `effectCategory` smallint(5) NOT NULL DEFAULT '0',
  `preExpression` int(11) DEFAULT NULL,
  `postExpression` int(11) DEFAULT NULL,
  `description` text,
  `guid` char(60) DEFAULT NULL,
  `graphicID` smallint(5) DEFAULT NULL,
  `isOffensive` enum('true','false') NOT NULL DEFAULT 'false',
  `isAssistance` enum('true','false') NOT NULL DEFAULT 'false',
  `durationAttributeID` smallint(5) DEFAULT NULL,
  `trackingSpeedAttributeID` smallint(5) DEFAULT NULL,
  `dischargeAttributeID` smallint(5) DEFAULT NULL,
  `rangeAttributeID` smallint(5) DEFAULT NULL,
  `falloffAttributeID` smallint(5) DEFAULT NULL,
  `disallowAutoRepeat` enum('true','false') NOT NULL DEFAULT 'false',
  `published` enum('true','false') NOT NULL DEFAULT 'true',
  `displayName` char(100) NOT NULL,
  `isWarpSafe` enum('true','false') NOT NULL DEFAULT 'false',
  `rangeChance` enum('true','false') NOT NULL DEFAULT 'false',
  `electronicChance` enum('true','false') NOT NULL DEFAULT 'false',
  `propulsionChance` enum('true','false') NOT NULL DEFAULT 'false',
  `distribution` int(11) DEFAULT NULL,
  `sfxName` char(20) NOT NULL,
  `npcUsageChanceAttributeID` smallint(5) DEFAULT NULL,
  `npcActivationChanceAttributeID` smallint(5) DEFAULT NULL,
  `fittingUsageChanceAttributeID` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`effectID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_dgmtypeattributes`
--

DROP TABLE IF EXISTS `kb3_dgmtypeattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_dgmtypeattributes` (
  `typeID` int(11) NOT NULL DEFAULT '0',
  `attributeID` smallint(5) NOT NULL DEFAULT '0',
  `value` double NOT NULL,
  KEY `typeID` (`typeID`),
  KEY `attributeID` (`attributeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_dgmtypeeffects`
--

DROP TABLE IF EXISTS `kb3_dgmtypeeffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_dgmtypeeffects` (
  `typeID` int(11) NOT NULL DEFAULT '0',
  `effectID` int(11) NOT NULL DEFAULT '0',
  `isDefault` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`typeID`,`effectID`),
  KEY `isDefault` (`isDefault`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_eveunits`
--

DROP TABLE IF EXISTS `kb3_eveunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_eveunits` (
  `unitID` int(5) NOT NULL DEFAULT '0',
  `unitName` char(100) DEFAULT NULL,
  `displayName` char(20) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`unitID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_feeds`
--

DROP TABLE IF EXISTS `kb3_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_feeds` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_url` text NOT NULL,
  `feed_lastkill` int(11) NOT NULL,
  `feed_updated` datetime DEFAULT '0000-00-00 00:00:00',
  `feed_kbsite` varchar(16) NOT NULL,
  `feed_flags` tinyint(4) NOT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_inv_all`
--

DROP TABLE IF EXISTS `kb3_inv_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_inv_all` (
  `ina_kll_id` int(6) NOT NULL DEFAULT '0',
  `ina_all_id` int(3) NOT NULL DEFAULT '0',
  `ina_timestamp` datetime NOT NULL,
  PRIMARY KEY (`ina_kll_id`,`ina_all_id`),
  KEY `ina_all_time` (`ina_all_id`,`ina_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_inv_crp`
--

DROP TABLE IF EXISTS `kb3_inv_crp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_inv_crp` (
  `inc_kll_id` int(6) NOT NULL DEFAULT '0',
  `inc_crp_id` int(3) NOT NULL DEFAULT '0',
  `inc_timestamp` datetime NOT NULL,
  PRIMARY KEY (`inc_kll_id`,`inc_crp_id`),
  KEY `inc_crp_time` (`inc_crp_id`,`inc_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_inv_detail`
--

DROP TABLE IF EXISTS `kb3_inv_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_inv_detail` (
  `ind_kll_id` int(6) NOT NULL DEFAULT '0',
  `ind_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ind_plt_id` int(6) NOT NULL DEFAULT '0',
  `ind_sec_status` varchar(5) DEFAULT NULL,
  `ind_all_id` int(3) NOT NULL DEFAULT '0',
  `ind_crp_id` int(5) NOT NULL DEFAULT '0',
  `ind_shp_id` int(3) NOT NULL DEFAULT '0',
  `ind_wep_id` int(5) NOT NULL DEFAULT '0',
  `ind_order` int(2) NOT NULL DEFAULT '0',
  `ind_dmgdone` int(11) NOT NULL DEFAULT '0',
  KEY `ind_shp_id` (`ind_shp_id`),
  KEY `ind_kll_id` (`ind_kll_id`),
  KEY `ind_plt_id` (`ind_plt_id`),
  KEY `ind_timestamp` (`ind_timestamp`),
  KEY `ind_plt_time` (`ind_plt_id`,`ind_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_invtypes`
--

DROP TABLE IF EXISTS `kb3_invtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_invtypes` (
  `typeID` int(11) NOT NULL DEFAULT '0',
  `groupID` int(11) NOT NULL DEFAULT '0',
  `typeName` char(100) NOT NULL,
  `icon` char(5) DEFAULT NULL,
  `description` text NOT NULL,
  `mass` float NOT NULL DEFAULT '0',
  `volume` float NOT NULL DEFAULT '0',
  `capacity` float NOT NULL DEFAULT '0',
  `portionSize` int(11) NOT NULL DEFAULT '1',
  `raceID` int(11) DEFAULT NULL,
  `basePrice` float NOT NULL DEFAULT '0',
  `marketGroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeID`),
  KEY `groupID` (`groupID`),
  KEY `marketGroupID` (`marketGroupID`),
  KEY `typeName` (`typeName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_ip_bans`
--

DROP TABLE IF EXISTS `kb3_ip_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_ip_bans` (
  `ipb_ip` varchar(32) NOT NULL DEFAULT '',
  `ipb_comment` varchar(128) NOT NULL DEFAULT '',
  UNIQUE KEY `ipb_ip` (`ipb_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_item_locations`
--

DROP TABLE IF EXISTS `kb3_item_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_item_locations` (
  `itl_id` int(11) NOT NULL AUTO_INCREMENT,
  `itl_location` char(24) NOT NULL,
  PRIMARY KEY (`itl_id`),
  KEY `itl_id` (`itl_location`,`itl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_item_price`
--

DROP TABLE IF EXISTS `kb3_item_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_item_price` (
  `typeID` int(11) NOT NULL,
  `price` bigint(11) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_item_types`
--

DROP TABLE IF EXISTS `kb3_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_item_types` (
  `itt_id` int(11) NOT NULL DEFAULT '0',
  `itt_cat` int(11) NOT NULL,
  `itt_name` char(120) NOT NULL,
  `itt_slot` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_items_destroyed`
--

DROP TABLE IF EXISTS `kb3_items_destroyed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_items_destroyed` (
  `itd_kll_id` int(11) NOT NULL DEFAULT '0',
  `itd_itm_id` int(11) NOT NULL DEFAULT '0',
  `itd_quantity` int(11) NOT NULL DEFAULT '1',
  `itd_itl_id` smallint(11) NOT NULL DEFAULT '0',
  KEY `itd_kll_id` (`itd_kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_items_dropped`
--

DROP TABLE IF EXISTS `kb3_items_dropped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_items_dropped` (
  `itd_kll_id` int(11) NOT NULL DEFAULT '0',
  `itd_itm_id` int(11) NOT NULL DEFAULT '0',
  `itd_quantity` int(11) NOT NULL DEFAULT '1',
  `itd_itl_id` smallint(11) NOT NULL DEFAULT '0',
  KEY `itd_kll_id` (`itd_kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_kills`
--

DROP TABLE IF EXISTS `kb3_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_kills` (
  `kll_id` int(11) NOT NULL AUTO_INCREMENT,
  `kll_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `kll_victim_id` int(6) NOT NULL DEFAULT '0',
  `kll_all_id` int(3) NOT NULL DEFAULT '0',
  `kll_crp_id` int(6) NOT NULL DEFAULT '0',
  `kll_ship_id` int(3) NOT NULL DEFAULT '0',
  `kll_system_id` int(4) NOT NULL DEFAULT '0',
  `kll_fb_plt_id` int(6) DEFAULT NULL,
  `kll_points` int(11) NOT NULL DEFAULT '0',
  `kll_dmgtaken` int(11) NOT NULL DEFAULT '0',
  `kll_external_id` int(11) unsigned DEFAULT NULL,
  `kll_isk_loss` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`kll_id`),
  UNIQUE KEY `kll_external_id` (`kll_external_id`),
  KEY `kll_ship_id` (`kll_ship_id`),
  KEY `kll_victim_id` (`kll_victim_id`),
  KEY `kll_timestamp` (`kll_timestamp`),
  KEY `kll_all_id` (`kll_all_id`),
  KEY `kll_crp_id` (`kll_crp_id`),
  KEY `kll_system_id` (`kll_system_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32733 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_log`
--

DROP TABLE IF EXISTS `kb3_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_log` (
  `log_kll_id` int(11) NOT NULL DEFAULT '0',
  `log_site` varchar(20) NOT NULL DEFAULT '',
  `log_ip_address` varchar(100) NOT NULL,
  `log_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `log_kll_id` (`log_kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_mails`
--

DROP TABLE IF EXISTS `kb3_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_mails` (
  `kll_id` int(11) NOT NULL AUTO_INCREMENT,
  `kll_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `kll_external_id` int(8) DEFAULT NULL,
  `kll_hash` binary(16) NOT NULL,
  `kll_trust` tinyint(4) NOT NULL DEFAULT '0',
  `kll_modified_time` datetime NOT NULL,
  PRIMARY KEY (`kll_id`),
  UNIQUE KEY `time_hash` (`kll_timestamp`,`kll_hash`),
  UNIQUE KEY `external_id` (`kll_external_id`),
  KEY `kll_modified_time` (`kll_modified_time`)
) ENGINE=InnoDB AUTO_INCREMENT=32733 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_moons`
--

DROP TABLE IF EXISTS `kb3_moons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_moons` (
  `itemID` int(11) NOT NULL,
  `itemName` varchar(127) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `itemName` (`itemName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_navigation`
--

DROP TABLE IF EXISTS `kb3_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_navigation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nav_type` tinytext NOT NULL,
  `intern` int(1) NOT NULL DEFAULT '0',
  `descr` tinytext NOT NULL,
  `url` tinytext NOT NULL,
  `target` varchar(10) NOT NULL DEFAULT '',
  `posnr` int(11) NOT NULL DEFAULT '0',
  `page` tinytext NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `KBSITE` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_pilots`
--

DROP TABLE IF EXISTS `kb3_pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_pilots` (
  `plt_id` int(11) NOT NULL AUTO_INCREMENT,
  `plt_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `plt_crp_id` int(11) NOT NULL DEFAULT '0',
  `plt_externalid` int(11) NOT NULL DEFAULT '0',
  `plt_updated` datetime DEFAULT NULL,
  `plt_kpoints` int(11) NOT NULL DEFAULT '0',
  `plt_lpoints` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plt_id`),
  UNIQUE KEY `plt_name` (`plt_name`)
) ENGINE=MyISAM AUTO_INCREMENT=66020 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_races`
--

DROP TABLE IF EXISTS `kb3_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_races` (
  `rce_id` int(11) NOT NULL AUTO_INCREMENT,
  `rce_race` char(30) NOT NULL,
  PRIMARY KEY (`rce_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_regions`
--

DROP TABLE IF EXISTS `kb3_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_regions` (
  `reg_id` int(11) NOT NULL DEFAULT '0',
  `reg_name` char(64) NOT NULL,
  `reg_x` float NOT NULL DEFAULT '0',
  `reg_y` float NOT NULL DEFAULT '0',
  `reg_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`reg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_roles`
--

DROP TABLE IF EXISTS `kb3_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_roles` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_site` varchar(16) NOT NULL DEFAULT '',
  `rol_name` varchar(200) NOT NULL DEFAULT '',
  `rol_descr` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`rol_site`,`rol_id`),
  UNIQUE KEY `rol_name` (`rol_name`),
  KEY `rol_id` (`rol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2012344971 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_scout`
--

DROP TABLE IF EXISTS `kb3_scout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_scout` (
  `scout_id` int(6) NOT NULL AUTO_INCREMENT,
  `inp_kll_id` int(6) NOT NULL DEFAULT '0',
  `inp_plt_id` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scout_id`),
  KEY `inp_plt_id` (`inp_plt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2154 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_ship_classes`
--

DROP TABLE IF EXISTS `kb3_ship_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_ship_classes` (
  `scl_id` int(11) NOT NULL AUTO_INCREMENT,
  `scl_class` char(32) NOT NULL,
  `scl_value` bigint(4) NOT NULL DEFAULT '0',
  `scl_points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scl_id`),
  UNIQUE KEY `scl_class` (`scl_class`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_ships`
--

DROP TABLE IF EXISTS `kb3_ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_ships` (
  `shp_id` int(11) NOT NULL AUTO_INCREMENT,
  `shp_class` int(11) NOT NULL DEFAULT '18',
  PRIMARY KEY (`shp_id`),
  KEY `shp_class` (`shp_class`)
) ENGINE=MyISAM AUTO_INCREMENT=33329 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_standings`
--

DROP TABLE IF EXISTS `kb3_standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_standings` (
  `sta_from` int(11) NOT NULL DEFAULT '0',
  `sta_to` int(11) NOT NULL DEFAULT '0',
  `sta_from_type` enum('a','c') NOT NULL DEFAULT 'a',
  `sta_to_type` enum('a','c') NOT NULL DEFAULT 'a',
  `sta_value` float NOT NULL DEFAULT '0',
  `sta_comment` varchar(200) NOT NULL DEFAULT '',
  KEY `sta_from` (`sta_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_stations`
--

DROP TABLE IF EXISTS `kb3_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_stations` (
  `sta_id` int(10) NOT NULL,
  `sta_sys_id` int(10) NOT NULL,
  `sta_con_id` int(10) NOT NULL,
  `sta_reg_id` int(10) NOT NULL,
  `sta_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_sum_alliance`
--

DROP TABLE IF EXISTS `kb3_sum_alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_sum_alliance` (
  `asm_all_id` int(11) NOT NULL DEFAULT '0',
  `asm_shp_id` int(3) NOT NULL DEFAULT '0',
  `asm_kill_count` int(11) NOT NULL DEFAULT '0',
  `asm_kill_isk` float NOT NULL DEFAULT '0',
  `asm_loss_count` int(11) NOT NULL DEFAULT '0',
  `asm_loss_isk` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`asm_all_id`,`asm_shp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_sum_corp`
--

DROP TABLE IF EXISTS `kb3_sum_corp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_sum_corp` (
  `csm_crp_id` int(11) NOT NULL DEFAULT '0',
  `csm_shp_id` int(3) NOT NULL DEFAULT '0',
  `csm_kill_count` int(11) NOT NULL DEFAULT '0',
  `csm_kill_isk` float NOT NULL DEFAULT '0',
  `csm_loss_count` int(11) NOT NULL DEFAULT '0',
  `csm_loss_isk` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`csm_crp_id`,`csm_shp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_sum_pilot`
--

DROP TABLE IF EXISTS `kb3_sum_pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_sum_pilot` (
  `psm_plt_id` int(11) NOT NULL DEFAULT '0',
  `psm_shp_id` int(3) NOT NULL DEFAULT '0',
  `psm_kill_count` int(11) NOT NULL DEFAULT '0',
  `psm_kill_isk` float NOT NULL DEFAULT '0',
  `psm_loss_count` int(11) NOT NULL DEFAULT '0',
  `psm_loss_isk` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`psm_plt_id`,`psm_shp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_system_jumps`
--

DROP TABLE IF EXISTS `kb3_system_jumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_system_jumps` (
  `sjp_from` int(11) NOT NULL DEFAULT '0',
  `sjp_to` int(11) NOT NULL DEFAULT '0',
  KEY `sjp_from` (`sjp_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_systems`
--

DROP TABLE IF EXISTS `kb3_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_systems` (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_con_id` int(11) NOT NULL DEFAULT '0',
  `sys_name` char(128) NOT NULL,
  `sys_x` float NOT NULL DEFAULT '0',
  `sys_y` float NOT NULL DEFAULT '0',
  `sys_z` float NOT NULL DEFAULT '0',
  `sys_sec` decimal(12,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`sys_id`),
  KEY `sys_con_id` (`sys_con_id`),
  KEY `sys_name` (`sys_name`)
) ENGINE=MyISAM AUTO_INCREMENT=31002505 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_titles`
--

DROP TABLE IF EXISTS `kb3_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_titles` (
  `ttl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ttl_name` varchar(100) NOT NULL DEFAULT '',
  `ttl_descr` varchar(200) NOT NULL DEFAULT '',
  `ttl_site` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`ttl_id`),
  UNIQUE KEY `ttl_name` (`ttl_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_titles_roles`
--

DROP TABLE IF EXISTS `kb3_titles_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_titles_roles` (
  `ttl_id` int(11) NOT NULL DEFAULT '0',
  `rol_id` int(11) NOT NULL DEFAULT '0',
  KEY `ttl_id` (`ttl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_user`
--

DROP TABLE IF EXISTS `kb3_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_site` varchar(16) NOT NULL DEFAULT '',
  `usr_login` varchar(40) NOT NULL DEFAULT '',
  `usr_pass` varchar(32) NOT NULL DEFAULT '',
  `usr_pilot_id` int(11) NOT NULL DEFAULT '0',
  `usr_state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `sitelogin` (`usr_site`,`usr_login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_user_extra`
--

DROP TABLE IF EXISTS `kb3_user_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_user_extra` (
  `use_usr_id` int(11) NOT NULL DEFAULT '0',
  `use_key` varchar(60) NOT NULL DEFAULT '',
  `use_value` varchar(200) NOT NULL DEFAULT '',
  KEY `use_usr_id` (`use_usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_user_roles`
--

DROP TABLE IF EXISTS `kb3_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_user_roles` (
  `uro_usr_id` int(11) NOT NULL DEFAULT '0',
  `uro_rol_id` int(11) NOT NULL DEFAULT '0',
  KEY `uro_usr_id` (`uro_usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb3_user_titles`
--

DROP TABLE IF EXISTS `kb3_user_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb3_user_titles` (
  `ust_usr_id` int(11) NOT NULL DEFAULT '0',
  `ust_ttl_id` int(11) NOT NULL DEFAULT '0',
  KEY `ust_usr_id` (`ust_usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `killmails`
--

DROP TABLE IF EXISTS `killmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `killmails` (
  `id` int(11) DEFAULT NULL,
  `info` text COLLATE latin1_german2_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_price_destroyed`
--

DROP TABLE IF EXISTS `tmp_price_destroyed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_price_destroyed` (
  `kll_id` int(11) NOT NULL DEFAULT '0',
  `value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_price_dropped`
--

DROP TABLE IF EXISTS `tmp_price_dropped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_price_dropped` (
  `kll_id` int(11) NOT NULL DEFAULT '0',
  `value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_price_ship`
--

DROP TABLE IF EXISTS `tmp_price_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_price_ship` (
  `kll_id` int(11) NOT NULL DEFAULT '0',
  `value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`kll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-29 15:58:46
