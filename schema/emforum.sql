-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emforum
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
-- Table structure for table `ip_log`
--

DROP TABLE IF EXISTS `ip_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `ip` int(10) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=109433 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminlog`
--

DROP TABLE IF EXISTS `mybb_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  KEY `module` (`module`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminoptions`
--

DROP TABLE IF EXISTS `mybb_adminoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminoptions` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `cpstyle` varchar(50) NOT NULL DEFAULT '',
  `codepress` int(1) NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  `permissions` text NOT NULL,
  `defaultviews` text NOT NULL,
  `loginattempts` int(10) unsigned NOT NULL DEFAULT '0',
  `loginlockoutexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminsessions`
--

DROP TABLE IF EXISTS `mybb_adminsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminsessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminviews`
--

DROP TABLE IF EXISTS `mybb_adminviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminviews` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(6) NOT NULL DEFAULT '',
  `visibility` int(1) NOT NULL DEFAULT '0',
  `fields` text NOT NULL,
  `conditions` text NOT NULL,
  `custom_profile_fields` text NOT NULL,
  `sortby` varchar(20) NOT NULL DEFAULT '',
  `sortorder` varchar(4) NOT NULL DEFAULT '',
  `perpage` int(4) NOT NULL DEFAULT '0',
  `view_type` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_announcements`
--

DROP TABLE IF EXISTS `mybb_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_announcements` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `startdate` bigint(30) NOT NULL DEFAULT '0',
  `enddate` bigint(30) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachments`
--

DROP TABLE IF EXISTS `mybb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachments` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0',
  `posthash` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(120) NOT NULL DEFAULT '',
  `filetype` varchar(120) NOT NULL DEFAULT '',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `attachname` varchar(120) NOT NULL DEFAULT '',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `dateuploaded` bigint(30) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `thumbnail` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  KEY `posthash` (`posthash`),
  KEY `pid` (`pid`,`visible`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1040 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachtypes`
--

DROP TABLE IF EXISTS `mybb_attachtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachtypes` (
  `atid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `mimetype` varchar(120) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `maxsize` int(15) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`atid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_awaitingactivation`
--

DROP TABLE IF EXISTS `mybb_awaitingactivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_awaitingactivation` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `code` varchar(100) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `oldgroup` bigint(30) NOT NULL DEFAULT '0',
  `misc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=12599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_badwords`
--

DROP TABLE IF EXISTS `mybb_badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_badwords` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badword` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banfilters`
--

DROP TABLE IF EXISTS `mybb_banfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banfilters` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(200) NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '0',
  `lastuse` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banned`
--

DROP TABLE IF EXISTS `mybb_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banned` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldgroup` int(10) unsigned NOT NULL DEFAULT '0',
  `oldadditionalgroups` text NOT NULL,
  `olddisplaygroup` int(11) NOT NULL DEFAULT '0',
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `bantime` varchar(50) NOT NULL DEFAULT '',
  `lifted` bigint(30) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendarpermissions`
--

DROP TABLE IF EXISTS `mybb_calendarpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendarpermissions` (
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendars`
--

DROP TABLE IF EXISTS `mybb_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendars` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `disporder` int(10) unsigned NOT NULL DEFAULT '0',
  `startofweek` int(1) NOT NULL DEFAULT '0',
  `showbirthdays` int(1) NOT NULL DEFAULT '0',
  `eventlimit` int(3) NOT NULL DEFAULT '0',
  `moderation` int(1) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_captcha`
--

DROP TABLE IF EXISTS `mybb_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_captcha` (
  `imagehash` varchar(32) NOT NULL DEFAULT '',
  `imagestring` varchar(8) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  KEY `imagehash` (`imagehash`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_datacache`
--

DROP TABLE IF EXISTS `mybb_datacache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_datacache` (
  `title` varchar(50) NOT NULL DEFAULT '',
  `cache` mediumtext NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_delayedmoderation`
--

DROP TABLE IF EXISTS `mybb_delayedmoderation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_delayedmoderation` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `delaydateline` bigint(30) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tids` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `inputs` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_events`
--

DROP TABLE IF EXISTS `mybb_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_events` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `private` int(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(4) NOT NULL DEFAULT '0',
  `ignoretimezone` int(1) NOT NULL DEFAULT '0',
  `usingtime` int(1) NOT NULL DEFAULT '0',
  `repeats` text NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `private` (`private`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumpermissions`
--

DROP TABLE IF EXISTS `mybb_forumpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumpermissions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canonlyviewownthreads` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forums`
--

DROP TABLE IF EXISTS `mybb_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forums` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `linkto` varchar(180) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentlist` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `open` int(1) NOT NULL DEFAULT '0',
  `threads` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposttid` int(10) NOT NULL DEFAULT '0',
  `lastpostsubject` varchar(120) NOT NULL DEFAULT '',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowpicons` int(1) NOT NULL DEFAULT '0',
  `allowtratings` int(1) NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '1',
  `usepostcounts` int(1) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  `showinjump` int(1) NOT NULL DEFAULT '0',
  `modposts` int(1) NOT NULL DEFAULT '0',
  `modthreads` int(1) NOT NULL DEFAULT '0',
  `mod_edit_posts` int(1) NOT NULL DEFAULT '0',
  `modattachments` int(1) NOT NULL DEFAULT '0',
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `overridestyle` int(1) NOT NULL DEFAULT '0',
  `rulestype` smallint(1) NOT NULL DEFAULT '0',
  `rulestitle` varchar(200) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `unapprovedthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `defaultdatecut` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultsortby` varchar(10) NOT NULL DEFAULT '',
  `defaultsortorder` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsread`
--

DROP TABLE IF EXISTS `mybb_forumsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsread` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `fid` (`fid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsubscriptions`
--

DROP TABLE IF EXISTS `mybb_forumsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsubscriptions` (
  `fsid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_groupleaders`
--

DROP TABLE IF EXISTS `mybb_groupleaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_groupleaders` (
  `lid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `canmanagemembers` int(1) NOT NULL DEFAULT '0',
  `canmanagerequests` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpdocs`
--

DROP TABLE IF EXISTS `mybb_helpdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpdocs` (
  `hid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `document` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpsections`
--

DROP TABLE IF EXISTS `mybb_helpsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpsections` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_icons`
--

DROP TABLE IF EXISTS `mybb_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_icons` (
  `iid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `path` varchar(220) NOT NULL DEFAULT '',
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_joinrequests`
--

DROP TABLE IF EXISTS `mybb_joinrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_joinrequests` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailerrors`
--

DROP TABLE IF EXISTS `mybb_mailerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailerrors` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `toaddress` varchar(150) NOT NULL DEFAULT '',
  `fromaddress` varchar(150) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `error` text NOT NULL,
  `smtperror` varchar(200) NOT NULL DEFAULT '',
  `smtpcode` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_maillogs`
--

DROP TABLE IF EXISTS `mybb_maillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_maillogs` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fromuid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromemail` varchar(200) NOT NULL DEFAULT '',
  `touid` bigint(30) NOT NULL DEFAULT '0',
  `toemail` varchar(200) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailqueue`
--

DROP TABLE IF EXISTS `mybb_mailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailqueue` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailto` varchar(200) NOT NULL,
  `mailfrom` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `headers` text NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=60474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_massemails`
--

DROP TABLE IF EXISTS `mybb_massemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_massemails` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `htmlmessage` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `format` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `senddate` bigint(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `totalcount` int(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text NOT NULL,
  `perpage` smallint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderatorlog`
--

DROP TABLE IF EXISTS `mybb_moderatorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderatorlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  `data` text NOT NULL,
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderators`
--

DROP TABLE IF EXISTS `mybb_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderators` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `canviewips` int(1) NOT NULL DEFAULT '0',
  `canopenclosethreads` int(1) NOT NULL DEFAULT '0',
  `canmanagethreads` int(1) NOT NULL DEFAULT '0',
  `canmovetononmodforum` int(1) NOT NULL DEFAULT '0',
  `isgroup` int(1) unsigned NOT NULL DEFAULT '0',
  `canusecustomtools` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `uid` (`id`,`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_modtools`
--

DROP TABLE IF EXISTS `mybb_modtools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_modtools` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `forums` text NOT NULL,
  `type` char(1) NOT NULL DEFAULT '',
  `postoptions` text NOT NULL,
  `threadoptions` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mycode`
--

DROP TABLE IF EXISTS `mybb_mycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mycode` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `regex` text NOT NULL,
  `replacement` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `parseorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_ongoing_operations`
--

DROP TABLE IF EXISTS `mybb_ongoing_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_ongoing_operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_polls`
--

DROP TABLE IF EXISTS `mybb_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_polls` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `question` varchar(200) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `options` text NOT NULL,
  `votes` text NOT NULL,
  `numoptions` smallint(5) unsigned NOT NULL DEFAULT '0',
  `numvotes` text NOT NULL,
  `timeout` bigint(30) NOT NULL DEFAULT '0',
  `closed` int(1) NOT NULL DEFAULT '0',
  `multiple` int(1) NOT NULL DEFAULT '0',
  `public` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_pollvotes`
--

DROP TABLE IF EXISTS `mybb_pollvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_pollvotes` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `voteoption` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `pid` (`pid`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1427 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_posts`
--

DROP TABLE IF EXISTS `mybb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_posts` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `replyto` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  `longipaddress` int(11) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `edituid` int(10) unsigned NOT NULL DEFAULT '0',
  `edittime` int(10) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `posthash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`,`uid`),
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`),
  KEY `visible` (`visible`),
  KEY `longipaddress` (`longipaddress`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM AUTO_INCREMENT=142744 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_privatemessages`
--

DROP TABLE IF EXISTS `mybb_privatemessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_privatemessages` (
  `pmid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `toid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromid` int(10) unsigned NOT NULL DEFAULT '0',
  `recipients` text NOT NULL,
  `folder` smallint(5) unsigned NOT NULL DEFAULT '1',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `deletetime` bigint(30) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `statustime` bigint(30) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `receipt` int(1) NOT NULL DEFAULT '0',
  `readtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `uid` (`uid`,`folder`),
  KEY `uid_2` (`uid`),
  KEY `toid` (`toid`)
) ENGINE=MyISAM AUTO_INCREMENT=25370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_profilefields`
--

DROP TABLE IF EXISTS `mybb_profilefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_profilefields` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `length` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxlength` smallint(5) unsigned NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `hidden` int(1) NOT NULL DEFAULT '0',
  `postnum` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotionlogs`
--

DROP TABLE IF EXISTS `mybb_promotionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotionlogs` (
  `plid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldusergroup` varchar(200) NOT NULL DEFAULT '0',
  `newusergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `type` varchar(9) NOT NULL DEFAULT 'primary',
  PRIMARY KEY (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotions`
--

DROP TABLE IF EXISTS `mybb_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `logging` tinyint(1) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `posttype` char(2) NOT NULL DEFAULT '',
  `registered` int(11) NOT NULL DEFAULT '0',
  `registeredtype` varchar(20) NOT NULL DEFAULT '',
  `reputations` int(11) NOT NULL DEFAULT '0',
  `reputationtype` char(2) NOT NULL DEFAULT '',
  `referrals` int(11) NOT NULL DEFAULT '0',
  `referralstype` varchar(2) NOT NULL DEFAULT '',
  `requirements` varchar(200) NOT NULL DEFAULT '',
  `originalusergroup` varchar(120) NOT NULL DEFAULT '0',
  `newusergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usergrouptype` varchar(120) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reportedposts`
--

DROP TABLE IF EXISTS `mybb_reportedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reportedposts` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `reportstatus` int(1) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `fid` (`fid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=577 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reputation`
--

DROP TABLE IF EXISTS `mybb_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reputation` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `adduid` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=1652 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_searchlog`
--

DROP TABLE IF EXISTS `mybb_searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_searchlog` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `ipaddress` varchar(120) NOT NULL DEFAULT '',
  `threads` longtext NOT NULL,
  `posts` longtext NOT NULL,
  `searchtype` varchar(10) NOT NULL DEFAULT '',
  `resulttype` varchar(10) NOT NULL DEFAULT '',
  `querycache` text NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_sessions`
--

DROP TABLE IF EXISTS `mybb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` bigint(30) NOT NULL DEFAULT '0',
  `location` varchar(150) NOT NULL DEFAULT '',
  `useragent` varchar(100) NOT NULL DEFAULT '',
  `anonymous` int(1) NOT NULL DEFAULT '0',
  `nopermission` int(1) NOT NULL DEFAULT '0',
  `location1` int(10) NOT NULL DEFAULT '0',
  `location2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  KEY `location1` (`location1`),
  KEY `location2` (`location2`),
  KEY `time` (`time`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settinggroups`
--

DROP TABLE IF EXISTS `mybb_settinggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settinggroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(220) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settings`
--

DROP TABLE IF EXISTS `mybb_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settings` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `optionscode` text NOT NULL,
  `value` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_smilies`
--

DROP TABLE IF EXISTS `mybb_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_smilies` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `find` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(220) NOT NULL DEFAULT '',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `showclickable` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_spiders`
--

DROP TABLE IF EXISTS `mybb_spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_spiders` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `theme` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(20) NOT NULL DEFAULT '',
  `usergroup` int(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(200) NOT NULL DEFAULT '',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_stats`
--

DROP TABLE IF EXISTS `mybb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_stats` (
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `numusers` int(10) unsigned NOT NULL DEFAULT '0',
  `numthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `numposts` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasklog`
--

DROP TABLE IF EXISTS `mybb_tasklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasklog` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=465838 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasks`
--

DROP TABLE IF EXISTS `mybb_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasks` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `file` varchar(30) NOT NULL DEFAULT '',
  `minute` varchar(200) NOT NULL DEFAULT '',
  `hour` varchar(200) NOT NULL DEFAULT '',
  `day` varchar(100) NOT NULL DEFAULT '',
  `month` varchar(30) NOT NULL DEFAULT '',
  `weekday` varchar(15) NOT NULL DEFAULT '',
  `nextrun` bigint(30) NOT NULL DEFAULT '0',
  `lastrun` bigint(30) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `logging` int(1) NOT NULL DEFAULT '0',
  `locked` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templategroups`
--

DROP TABLE IF EXISTS `mybb_templategroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templategroups` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templates`
--

DROP TABLE IF EXISTS `mybb_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templates` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `sid` int(10) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=2527 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templatesets`
--

DROP TABLE IF EXISTS `mybb_templatesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templatesets` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themes`
--

DROP TABLE IF EXISTS `mybb_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themes` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `def` smallint(1) NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `stylesheets` text NOT NULL,
  `allowedgroups` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themestylesheets`
--

DROP TABLE IF EXISTS `mybb_themestylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themestylesheets` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `attachedto` text NOT NULL,
  `stylesheet` text NOT NULL,
  `cachefile` varchar(100) NOT NULL DEFAULT '',
  `lastmodified` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadprefixes`
--

DROP TABLE IF EXISTS `mybb_threadprefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadprefixes` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(120) NOT NULL DEFAULT '',
  `displaystyle` varchar(200) NOT NULL DEFAULT '',
  `forums` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadratings`
--

DROP TABLE IF EXISTS `mybb_threadratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadratings` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `tid` (`tid`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threads`
--

DROP TABLE IF EXISTS `mybb_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threads` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `prefix` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poll` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `firstpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(100) NOT NULL DEFAULT '0',
  `replies` int(100) NOT NULL DEFAULT '0',
  `closed` varchar(30) NOT NULL DEFAULT '',
  `sticky` int(1) NOT NULL DEFAULT '0',
  `numratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `totalratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `attachmentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `deletetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`,`visible`,`sticky`),
  KEY `dateline` (`dateline`),
  KEY `lastpost` (`lastpost`,`fid`),
  KEY `firstpost` (`firstpost`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `subject` (`subject`)
) ENGINE=MyISAM AUTO_INCREMENT=16540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsread`
--

DROP TABLE IF EXISTS `mybb_threadsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsread` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `tiduid` (`tid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsubscriptions`
--

DROP TABLE IF EXISTS `mybb_threadsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsubscriptions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `notification` int(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `subscriptionkey` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`,`notification`)
) ENGINE=MyISAM AUTO_INCREMENT=12943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadviews`
--

DROP TABLE IF EXISTS `mybb_threadviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadviews` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_upgrade_data`
--

DROP TABLE IF EXISTS `mybb_upgrade_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_upgrade_data` (
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_userfields`
--

DROP TABLE IF EXISTS `mybb_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_userfields` (
  `ufid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ufid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usergroups`
--

DROP TABLE IF EXISTS `mybb_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usergroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(2) NOT NULL DEFAULT '2',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `namestyle` varchar(200) NOT NULL DEFAULT '{username}',
  `usertitle` varchar(120) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(120) NOT NULL DEFAULT '',
  `disporder` smallint(6) unsigned NOT NULL,
  `isbannedgroup` int(1) NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canviewprofiles` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `canundovotes` int(1) NOT NULL DEFAULT '0',
  `canusepms` int(1) NOT NULL DEFAULT '0',
  `cansendpms` int(1) NOT NULL DEFAULT '0',
  `cantrackpms` int(1) NOT NULL DEFAULT '0',
  `candenypmreceipts` int(1) NOT NULL DEFAULT '0',
  `pmquota` int(3) NOT NULL DEFAULT '0',
  `maxpmrecipients` int(4) NOT NULL DEFAULT '5',
  `cansendemail` int(1) NOT NULL DEFAULT '0',
  `maxemails` int(3) NOT NULL DEFAULT '5',
  `canviewmemberlist` int(1) NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0',
  `canviewonline` int(1) NOT NULL DEFAULT '0',
  `canviewwolinvis` int(1) NOT NULL DEFAULT '0',
  `canviewonlineips` int(1) NOT NULL DEFAULT '0',
  `cancp` int(1) NOT NULL DEFAULT '0',
  `issupermod` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  `canusercp` int(1) NOT NULL DEFAULT '0',
  `canuploadavatars` int(1) NOT NULL DEFAULT '0',
  `canratemembers` int(1) NOT NULL DEFAULT '0',
  `canchangename` int(1) NOT NULL DEFAULT '0',
  `showforumteam` int(1) NOT NULL DEFAULT '0',
  `usereputationsystem` int(1) NOT NULL DEFAULT '0',
  `cangivereputations` int(1) NOT NULL DEFAULT '0',
  `reputationpower` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsday` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperuser` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperthread` bigint(30) NOT NULL DEFAULT '0',
  `candisplaygroup` char(3) NOT NULL DEFAULT '',
  `attachquota` bigint(30) NOT NULL DEFAULT '0',
  `cancustomtitle` char(3) NOT NULL DEFAULT '',
  `canwarnusers` int(1) NOT NULL DEFAULT '0',
  `canreceivewarnings` int(1) NOT NULL DEFAULT '0',
  `maxwarningsday` int(3) NOT NULL DEFAULT '3',
  `canmodcp` int(1) NOT NULL DEFAULT '0',
  `showinbirthdaylist` int(1) NOT NULL DEFAULT '0',
  `canoverridepm` int(1) NOT NULL DEFAULT '0',
  `canusesig` int(1) NOT NULL DEFAULT '0',
  `canusesigxposts` bigint(30) NOT NULL DEFAULT '0',
  `signofollow` int(1) NOT NULL DEFAULT '0',
  `cansendemailoverride` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_users`
--

DROP TABLE IF EXISTS `mybb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(120) NOT NULL DEFAULT '',
  `passwordconvert` text NOT NULL,
  `passwordconverttype` text NOT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(220) NOT NULL DEFAULT '',
  `postnum` int(10) NOT NULL DEFAULT '0',
  `avatar` varchar(200) NOT NULL DEFAULT '',
  `avatardimensions` varchar(10) NOT NULL DEFAULT '',
  `avatartype` varchar(10) NOT NULL DEFAULT '0',
  `usergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `additionalgroups` varchar(200) NOT NULL DEFAULT '',
  `displaygroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(250) NOT NULL DEFAULT '',
  `regdate` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `website` varchar(200) NOT NULL DEFAULT '',
  `icq` varchar(10) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(75) NOT NULL DEFAULT '',
  `birthday` varchar(15) NOT NULL DEFAULT '',
  `birthdayprivacy` varchar(4) NOT NULL DEFAULT 'all',
  `signature` text NOT NULL,
  `allownotices` int(1) NOT NULL DEFAULT '0',
  `hideemail` int(1) NOT NULL DEFAULT '0',
  `subscriptionmethod` int(1) NOT NULL DEFAULT '0',
  `invisible` int(1) NOT NULL DEFAULT '0',
  `receivepms` int(1) NOT NULL DEFAULT '0',
  `pmnotice` int(1) NOT NULL DEFAULT '0',
  `pmnotify` int(1) NOT NULL DEFAULT '0',
  `threadmode` varchar(8) NOT NULL DEFAULT '',
  `showsigs` int(1) NOT NULL DEFAULT '0',
  `showavatars` int(1) NOT NULL DEFAULT '0',
  `showquickreply` int(1) NOT NULL DEFAULT '0',
  `showredirect` int(1) NOT NULL DEFAULT '0',
  `ppp` smallint(6) NOT NULL DEFAULT '0',
  `tpp` smallint(6) NOT NULL DEFAULT '0',
  `daysprune` smallint(6) NOT NULL DEFAULT '0',
  `dateformat` varchar(4) NOT NULL DEFAULT '',
  `timeformat` varchar(4) NOT NULL DEFAULT '',
  `timezone` varchar(4) NOT NULL DEFAULT '',
  `dst` int(1) NOT NULL DEFAULT '0',
  `dstcorrection` int(1) NOT NULL DEFAULT '0',
  `buddylist` text NOT NULL,
  `ignorelist` text NOT NULL,
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `away` int(1) NOT NULL DEFAULT '0',
  `awaydate` int(10) unsigned NOT NULL DEFAULT '0',
  `returndate` varchar(15) NOT NULL DEFAULT '',
  `awayreason` varchar(200) NOT NULL DEFAULT '',
  `pmfolders` text NOT NULL,
  `notepad` text NOT NULL,
  `referrer` int(10) unsigned NOT NULL DEFAULT '0',
  `referrals` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL DEFAULT '',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  `longlastip` int(11) NOT NULL DEFAULT '0',
  `longregip` int(11) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '',
  `timeonline` bigint(30) NOT NULL DEFAULT '0',
  `showcodebuttons` int(1) NOT NULL DEFAULT '1',
  `totalpms` int(10) NOT NULL DEFAULT '0',
  `unreadpms` int(10) NOT NULL DEFAULT '0',
  `warningpoints` int(3) NOT NULL DEFAULT '0',
  `moderateposts` int(1) NOT NULL DEFAULT '0',
  `moderationtime` bigint(30) NOT NULL DEFAULT '0',
  `suspendposting` int(1) NOT NULL DEFAULT '0',
  `suspensiontime` bigint(30) NOT NULL DEFAULT '0',
  `coppauser` int(1) NOT NULL DEFAULT '0',
  `classicpostbit` int(1) NOT NULL DEFAULT '0',
  `receivefrombuddy` int(1) NOT NULL DEFAULT '0',
  `suspendsignature` int(1) NOT NULL DEFAULT '0',
  `suspendsigtime` bigint(30) NOT NULL DEFAULT '0',
  `loginattempts` tinyint(2) NOT NULL DEFAULT '1',
  `usernotes` text NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `usergroup` (`usergroup`),
  KEY `birthday` (`birthday`),
  KEY `lastvisit` (`lastvisit`),
  KEY `regdate` (`regdate`),
  KEY `longregip` (`longregip`),
  KEY `longlastip` (`longlastip`)
) ENGINE=MyISAM AUTO_INCREMENT=12199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usertitles`
--

DROP TABLE IF EXISTS `mybb_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usertitles` (
  `utid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`utid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warninglevels`
--

DROP TABLE IF EXISTS `mybb_warninglevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warninglevels` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentage` int(3) NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warnings`
--

DROP TABLE IF EXISTS `mybb_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warnings` (
  `wid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `issuedby` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` bigint(30) NOT NULL DEFAULT '0',
  `expired` int(1) NOT NULL DEFAULT '0',
  `daterevoked` bigint(30) NOT NULL DEFAULT '0',
  `revokedby` int(10) unsigned NOT NULL DEFAULT '0',
  `revokereason` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warningtypes`
--

DROP TABLE IF EXISTS `mybb_warningtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warningtypes` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `expirationtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `ip` varchar(23) NOT NULL,
  `olduid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4528038 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-29 15:58:33
