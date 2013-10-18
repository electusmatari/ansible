-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emmisc
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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `userid` varchar(32) COLLATE latin1_german2_ci NOT NULL,
  `apikey` varchar(128) COLLATE latin1_german2_ci NOT NULL,
  `last_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `corp` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `alliance` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=414 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emactivity`
--

DROP TABLE IF EXISTS `emactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shift` int(11) DEFAULT NULL,
  `activity` varchar(32) COLLATE latin1_german2_ci DEFAULT NULL,
  `willfc` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emarket_contracts`
--

DROP TABLE IF EXISTS `emarket_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emarket_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `recipient` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `item` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `price` double NOT NULL,
  `done` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=534 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emarket_order`
--

DROP TABLE IF EXISTS `emarket_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emarket_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `comment` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `volentered` int(11) NOT NULL,
  `volremaining` int(11) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `item` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `issued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiresafter` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=490 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gallery_comments`
--

DROP TABLE IF EXISTS `gallery_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagename` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `author` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `comment` text COLLATE latin1_german2_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kmshare`
--

DROP TABLE IF EXISTS `kmshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kmshare` (
  `killid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `upload` datetime DEFAULT NULL,
  `killinfo` text COLLATE latin1_german2_ci,
  PRIMARY KEY (`killid`)
) ENGINE=MyISAM AUTO_INCREMENT=605 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locator_suggestions`
--

DROP TABLE IF EXISTS `locator_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locator_suggestions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locator_trace`
--

DROP TABLE IF EXISTS `locator_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locator_trace` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `target` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `system` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `submitter` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `station` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=832 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` text COLLATE latin1_german2_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2434 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_comments`
--

DROP TABLE IF EXISTS `market_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `comment` text COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_contract`
--

DROP TABLE IF EXISTS `market_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_contract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contracttext` text COLLATE latin1_german2_ci NOT NULL,
  `creator` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `handler` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `queue` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `state` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=393 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_contract_comments`
--

DROP TABLE IF EXISTS `market_contract_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_contract_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contract_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `comment` text COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_order`
--

DROP TABLE IF EXISTS `market_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `item` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `price` double NOT NULL,
  `owner` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `comment` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=757 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_order_old`
--

DROP TABLE IF EXISTS `market_order_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_order_old` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordertext` text COLLATE latin1_german2_ci NOT NULL,
  `price` double DEFAULT NULL,
  `customer` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `producer` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `source` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `state` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_sale`
--

DROP TABLE IF EXISTS `market_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_sale` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,
  `item` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `price` double NOT NULL,
  `owner` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `comment` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1022 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opwarn_list`
--

DROP TABLE IF EXISTS `opwarn_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opwarn_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standings_rc`
--

DROP TABLE IF EXISTS `standings_rc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings_rc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tid` int(11) DEFAULT NULL,
  `entity` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `ticker` varchar(12) COLLATE latin1_german2_ci DEFAULT NULL,
  `old_standing` int(11) DEFAULT NULL,
  `new_standing` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7012 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `description` text COLLATE latin1_german2_ci NOT NULL,
  `creator` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allowed_voters` text COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote_ballot`
--

DROP TABLE IF EXISTS `vote_ballot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_ballot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  `vote_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30655 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote_option`
--

DROP TABLE IF EXISTS `vote_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1598 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-29 15:58:36
