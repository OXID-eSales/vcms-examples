-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mysql    Database: example
-- ------------------------------------------------------
-- Server version	5.7.42

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
-- Table structure for table `ddmedia`
--

DROP TABLE IF EXISTS `ddmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmedia` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `OXSHOPID` int(10) unsigned NOT NULL,
  `DDFILENAME` varchar(255) NOT NULL,
  `DDFILESIZE` int(10) unsigned NOT NULL,
  `DDFILETYPE` varchar(50) NOT NULL,
  `DDTHUMB` varchar(255) NOT NULL,
  `DDIMAGESIZE` varchar(100) DEFAULT NULL,
  `DDFOLDERID` char(32) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmedia`
--

LOCK TABLES `ddmedia` WRITE;
/*!40000 ALTER TABLE `ddmedia` DISABLE KEYS */;
INSERT INTO `ddmedia` (`OXID`, `OXSHOPID`, `DDFILENAME`, `DDFILESIZE`, `DDFILETYPE`, `DDTHUMB`, `DDIMAGESIZE`, `DDFOLDERID`, `OXTIMESTAMP`) VALUES ('f256df3c2343b7e24ef5273c15f11e1b',1,'Folder1',0,'directory','','','','2023-10-31 15:18:43');
/*!40000 ALTER TABLE `ddmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxacceptedterms`
--

DROP TABLE IF EXISTS `oxacceptedterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxacceptedterms` (
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTERMVERSION` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Terms version',
  `OXACCEPTEDTIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when terms were accepted',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXUSERID`,`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows which users has accepted shop terms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxacceptedterms`
--

LOCK TABLES `oxacceptedterms` WRITE;
/*!40000 ALTER TABLE `oxacceptedterms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxacceptedterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxaccessoire2article`
--

DROP TABLE IF EXISTS `oxaccessoire2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxaccessoire2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Accessory Article id (oxarticles)',
  `OXARTICLENID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXARTICLENID` (`OXARTICLENID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between article and its accessory articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxaccessoire2article`
--

LOCK TABLES `oxaccessoire2article` WRITE;
/*!40000 ALTER TABLE `oxaccessoire2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxaccessoire2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxactions`
--

DROP TABLE IF EXISTS `oxactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxactions` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Action id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTYPE` tinyint(1) NOT NULL COMMENT 'Action type: 0 or 1 - action, 2 - promotion, 3 - banner',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description, used for promotion (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXPIC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Picture filename, used for banner (multilanguage)',
  `OXPIC_1` varchar(128) NOT NULL DEFAULT '',
  `OXPIC_2` varchar(128) NOT NULL DEFAULT '',
  `OXPIC_3` varchar(128) NOT NULL DEFAULT '',
  `OXLINK` varchar(128) NOT NULL DEFAULT '' COMMENT 'Link, used on banner (multilanguage)',
  `OXLINK_1` varchar(128) NOT NULL DEFAULT '',
  `OXLINK_2` varchar(128) NOT NULL DEFAULT '',
  `OXLINK_3` varchar(128) NOT NULL DEFAULT '',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXTYPE` (`OXTYPE`,`OXACTIVE`,`OXACTIVETO`,`OXACTIVEFROM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about actions, promotions and banners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxactions`
--

LOCK TABLES `oxactions` WRITE;
/*!40000 ALTER TABLE `oxactions` DISABLE KEYS */;
INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`, `OXLONGDESC`, `OXLONGDESC_1`, `OXLONGDESC_2`, `OXLONGDESC_3`, `OXACTIVE`, `OXACTIVEFROM`, `OXACTIVETO`, `OXPIC`, `OXPIC_1`, `OXPIC_2`, `OXPIC_3`, `OXLINK`, `OXLINK_1`, `OXLINK_2`, `OXLINK_3`, `OXSORT`, `OXTIMESTAMP`) VALUES ('oxbargain',1,0,'Angebot der Woche','Week\'s Special','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35'),
('oxcatoffer',1,0,'Kategorien-Topangebot','Top offer in categories','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35'),
('oxnewest',1,0,'Frisch eingetroffen','Just arrived','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35'),
('oxnewsletter',1,0,'Newsletter','Newsletter','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35'),
('oxtop5',1,0,'Topseller','Top seller','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35'),
('oxtopstart',1,0,'Topangebot Startseite','Top offer start page','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2023-10-31 15:18:35');
/*!40000 ALTER TABLE `oxactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxactions2article`
--

DROP TABLE IF EXISTS `oxactions2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxactions2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIONID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Action id (oxactions)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSORT` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXMAINIDX` (`OXSHOPID`,`OXACTIONID`,`OXSORT`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between actions and articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxactions2article`
--

LOCK TABLES `oxactions2article` WRITE;
/*!40000 ALTER TABLE `oxactions2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxactions2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxaddress`
--

DROP TABLE IF EXISTS `oxaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxaddress` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Address id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXADDRESSUSERID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser)',
  `OXCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Company name',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'House number',
  `OXADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional info',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Country name',
  `OXCOUNTRYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id (oxstate)',
  `OXZIP` varchar(50) NOT NULL DEFAULT '' COMMENT 'Zip code',
  `OXFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'User title prefix (Mr/Mrs)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user shipping addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxaddress`
--

LOCK TABLES `oxaddress` WRITE;
/*!40000 ALTER TABLE `oxaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxadminlog`
--

DROP TABLE IF EXISTS `oxadminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxadminlog` (
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXSQL` text NOT NULL COMMENT 'Logged sql',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXSESSID` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Session id',
  `OXCLASS` varchar(50) NOT NULL COMMENT 'Logged class name',
  `OXFNC` varchar(30) NOT NULL COMMENT 'Logged function name',
  `OXITMID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Item id',
  `OXPARAM` text NOT NULL COMMENT 'Logged parameters',
  KEY `OXITMID` (`OXITMID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logs admin actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxadminlog`
--

LOCK TABLES `oxadminlog` WRITE;
/*!40000 ALTER TABLE `oxadminlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxadminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxartextends`
--

DROP TABLE IF EXISTS `oxartextends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxartextends` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (extends oxarticles article with this id)',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information for articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxartextends`
--

LOCK TABLES `oxartextends` WRITE;
/*!40000 ALTER TABLE `oxartextends` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxartextends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxarticles`
--

DROP TABLE IF EXISTS `oxarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxarticles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id',
  `OXMAPID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Parent article id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXHIDDEN` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hidden',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXARTNUM` varchar(255) NOT NULL DEFAULT '' COMMENT 'Article number',
  `OXEAN` varchar(128) NOT NULL DEFAULT '' COMMENT 'International Article Number (EAN)',
  `OXDISTEAN` varchar(128) NOT NULL DEFAULT '' COMMENT 'Manufacture International Article Number (Man. EAN)',
  `OXMPN` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Manufacture Part Number (MPN)',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Article Price',
  `OXBLFIXEDPRICE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'No Promotions (Price Alert) ',
  `OXPRICEA` double NOT NULL DEFAULT '0' COMMENT 'Price A',
  `OXPRICEB` double NOT NULL DEFAULT '0' COMMENT 'Price B',
  `OXPRICEC` double NOT NULL DEFAULT '0' COMMENT 'Price C',
  `OXBPRICE` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price',
  `OXTPRICE` double NOT NULL DEFAULT '0' COMMENT 'Recommended Retail Price (RRP)',
  `OXUNITNAME` varchar(32) NOT NULL DEFAULT '' COMMENT 'Unit name (kg,g,l,cm etc), used in setting price per quantity unit calculation',
  `OXUNITQUANTITY` double NOT NULL DEFAULT '0' COMMENT 'Article quantity, used in setting price per quantity unit calculation',
  `OXEXTURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'External URL to other information about the article',
  `OXURLDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text for external URL (multilanguage)',
  `OXURLIMG` varchar(128) NOT NULL DEFAULT '' COMMENT 'External URL image',
  `OXVAT` float DEFAULT NULL COMMENT 'Value added tax. If specified, used in all calculations instead of global vat',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXPIC1` varchar(128) NOT NULL DEFAULT '' COMMENT '1# Picture filename',
  `OXPIC2` varchar(128) NOT NULL DEFAULT '' COMMENT '2# Picture filename',
  `OXPIC3` varchar(128) NOT NULL DEFAULT '' COMMENT '3# Picture filename',
  `OXPIC4` varchar(128) NOT NULL DEFAULT '' COMMENT '4# Picture filename',
  `OXPIC5` varchar(128) NOT NULL DEFAULT '' COMMENT '5# Picture filename',
  `OXPIC6` varchar(128) NOT NULL DEFAULT '' COMMENT '6# Picture filename',
  `OXPIC7` varchar(128) NOT NULL DEFAULT '' COMMENT '7# Picture filename',
  `OXPIC8` varchar(128) NOT NULL DEFAULT '' COMMENT '8# Picture filename',
  `OXPIC9` varchar(128) NOT NULL DEFAULT '' COMMENT '9# Picture filename',
  `OXPIC10` varchar(128) NOT NULL DEFAULT '' COMMENT '10# Picture filename',
  `OXPIC11` varchar(128) NOT NULL DEFAULT '' COMMENT '11# Picture filename',
  `OXPIC12` varchar(128) NOT NULL DEFAULT '' COMMENT '12# Picture filename',
  `OXWEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Weight (kg)',
  `OXSTOCK` double NOT NULL DEFAULT '0' COMMENT 'Article quantity in stock',
  `OXSTOCKFLAG` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Delivery Status: 1 - Standard, 2 - If out of Stock, offline, 3 - If out of Stock, not orderable, 4 - External Storehouse',
  `OXSTOCKTEXT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message, which is shown if the article is in stock (multilanguage)',
  `OXNOSTOCKTEXT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message, which is shown if the article is off stock (multilanguage)',
  `OXDELIVERY` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date, when the product will be available again if it is sold out',
  `OXINSERT` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXLENGTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Length',
  `OXWIDTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Width',
  `OXHEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Height',
  `OXFILE` varchar(128) NOT NULL DEFAULT '' COMMENT 'File, shown in article media list',
  `OXSEARCHKEYS` varchar(255) NOT NULL DEFAULT '' COMMENT 'Search terms (multilanguage)',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (if empty, default is used)',
  `OXQUESTIONEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'E-mail for question',
  `OXISSEARCH` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Should article be shown in search',
  `OXISCONFIGURABLE` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Can article be customized',
  `OXVARNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of variants selection lists (different lists are separated by | ) (multilanguage)',
  `OXVARSTOCK` int(5) NOT NULL DEFAULT '0' COMMENT 'Sum of active article variants stock quantity',
  `OXVARCOUNT` int(1) NOT NULL DEFAULT '0' COMMENT 'Total number of variants that article has (active and inactive)',
  `OXVARSELECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Variant article selections (separated by | ) (multilanguage)',
  `OXVARMINPRICE` double NOT NULL DEFAULT '0' COMMENT 'Lowest price in active article variants',
  `OXVARMAXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Highest price in active article variants',
  `OXVARNAME_1` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXVARNAME_2` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXVARNAME_3` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_3` varchar(255) NOT NULL DEFAULT '',
  `OXBUNDLEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Bundled article id',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder',
  `OXSUBCLASS` varchar(32) NOT NULL DEFAULT '' COMMENT 'Subclass',
  `OXSTOCKTEXT_1` varchar(255) NOT NULL DEFAULT '',
  `OXSTOCKTEXT_2` varchar(255) NOT NULL DEFAULT '',
  `OXSTOCKTEXT_3` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_1` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_2` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXSOLDAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Amount of sold articles including variants (used only for parent articles)',
  `OXNONMATERIAL` int(1) NOT NULL DEFAULT '0' COMMENT 'Intangible article, free shipping is used (variants inherits parent setting)',
  `OXFREESHIPPING` int(1) NOT NULL DEFAULT '0' COMMENT 'Free shipping (variants inherits parent setting)',
  `OXREMINDACTIVE` int(1) NOT NULL DEFAULT '0' COMMENT 'Enables sending of notification email when oxstock field value falls below oxremindamount value',
  `OXREMINDAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Defines the amount, below which notification email will be sent if oxremindactive is set to 1',
  `OXAMITEMID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `OXAMTASKID` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `OXVENDORID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Vendor id (oxvendor)',
  `OXMANUFACTURERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Manufacturer id (oxmanufacturers)',
  `OXSKIPDISCOUNTS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Skips all negative Discounts (Discounts, Vouchers, Delivery ...)',
  `OXORDERINFO` varchar(255) NOT NULL COMMENT 'Additional info in order confirmation mail',
  `OXPIXIEXPORT` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Field for 3rd party modules export',
  `OXPIXIEXPORTED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Field for 3rd party modules export',
  `OXVPE` int(11) NOT NULL DEFAULT '1' COMMENT 'Packing unit',
  `OXRATING` double NOT NULL DEFAULT '0' COMMENT 'Article rating',
  `OXRATINGCNT` int(11) NOT NULL DEFAULT '0' COMMENT 'Rating votes count',
  `OXMINDELTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimal delivery time (unit is set in oxdeltimeunit)',
  `OXMAXDELTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Maximum delivery time (unit is set in oxdeltimeunit)',
  `OXDELTIMEUNIT` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery time unit: DAY, WEEK, MONTH',
  `OXUPDATEPRICE` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxprice will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEA` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricea will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEB` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpriceb will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEC` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricec will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICETIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date, when oxprice[a,b,c] should be updated to oxupdateprice[a,b,c] values',
  `OXISDOWNLOADABLE` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable download of files for this product',
  `OXSHOWCUSTOMAGREEMENT` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Show custom agreement check in checkout',
  PRIMARY KEY (`OXID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXISSEARCH` (`OXISSEARCH`),
  KEY `OXSTOCKFLAG` (`OXSTOCKFLAG`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXACTIVEFROM` (`OXACTIVEFROM`),
  KEY `OXACTIVETO` (`OXACTIVETO`),
  KEY `OXVENDORID` (`OXVENDORID`),
  KEY `OXMANUFACTURERID` (`OXMANUFACTURERID`),
  KEY `OXSOLDAMOUNT` (`OXSOLDAMOUNT`),
  KEY `parentsort` (`OXPARENTID`,`OXSORT`),
  KEY `OXUPDATEPRICETIME` (`OXUPDATEPRICETIME`),
  KEY `OXISDOWNLOADABLE` (`OXISDOWNLOADABLE`),
  KEY `OXPRICE` (`OXPRICE`),
  KEY `OXPARENTID` (`OXPARENTID`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxarticles`
--

LOCK TABLES `oxarticles` WRITE;
/*!40000 ALTER TABLE `oxarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxarticles2shop`
--

DROP TABLE IF EXISTS `oxarticles2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxarticles2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` bigint(20) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxarticles2shop`
--

LOCK TABLES `oxarticles2shop` WRITE;
/*!40000 ALTER TABLE `oxarticles2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxarticles2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxattribute`
--

DROP TABLE IF EXISTS `oxattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxattribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Attribute id',
  `OXMAPID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXPOS` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXDISPLAYINBASKET` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Display attribute`s value for articles in checkout',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Article attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxattribute`
--

LOCK TABLES `oxattribute` WRITE;
/*!40000 ALTER TABLE `oxattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxattribute2shop`
--

DROP TABLE IF EXISTS `oxattribute2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxattribute2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxattribute2shop`
--

LOCK TABLES `oxattribute2shop` WRITE;
/*!40000 ALTER TABLE `oxattribute2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxattribute2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcache`
--

DROP TABLE IF EXISTS `oxcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcache` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Cache id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXEXPIRE` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Expiration time',
  `OXRESETON` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Reset id (e.g. View Reset Id)',
  `OXSIZE` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'The length of content to be added',
  `OXHITS` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Increases when a certain id is retrieved from cache',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXEXPIRE` (`OXEXPIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcache`
--

LOCK TABLES `oxcache` WRITE;
/*!40000 ALTER TABLE `oxcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcategories`
--

DROP TABLE IF EXISTS `oxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcategories` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Category id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'oxrootid' COMMENT 'Parent category id',
  `OXLEFT` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for building category tree',
  `OXRIGHT` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for building category tree',
  `OXROOTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Root category id',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active (multilanguage)',
  `OXHIDDEN` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hidden (Can be accessed by direct link, but is not visible in lists and menu)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(254) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description (multilanguage)',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename (multilanguage)',
  `OXTHUMB_1` varchar(128) NOT NULL DEFAULT '',
  `OXTHUMB_2` varchar(128) NOT NULL DEFAULT '',
  `OXTHUMB_3` varchar(128) NOT NULL DEFAULT '',
  `OXEXTLINK` varchar(255) NOT NULL DEFAULT '' COMMENT 'External link, that if specified is opened instead of category content',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (if empty, default is used)',
  `OXDEFSORT` varchar(64) NOT NULL DEFAULT '' COMMENT 'Default field for sorting of articles in this category (most of oxarticles fields)',
  `OXDEFSORTMODE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default mode of sorting of articles in this category (0 - asc, 1 - desc)',
  `OXPRICEFROM` double NOT NULL DEFAULT '0' COMMENT 'If specified, all articles, with price higher than specified, will be shown in this category',
  `OXPRICETO` double NOT NULL DEFAULT '0' COMMENT 'If specified, all articles, with price lower than specified, will be shown in this category',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_1` text NOT NULL,
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_2` text NOT NULL,
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_3` text NOT NULL,
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXPROMOICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Promotion icon filename',
  `OXVAT` float DEFAULT NULL COMMENT 'VAT, used for articles in this category (only if oxarticles.oxvat is not set)',
  `OXSKIPDISCOUNTS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Skip all negative Discounts for articles in this category (Discounts, Vouchers, Delivery ...) ',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXROOTID` (`OXROOTID`),
  KEY `OXPARENTID` (`OXPARENTID`),
  KEY `OXPRICEFROM` (`OXPRICEFROM`),
  KEY `OXPRICETO` (`OXPRICETO`),
  KEY `OXHIDDEN` (`OXHIDDEN`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXVAT` (`OXVAT`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Article categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcategories`
--

LOCK TABLES `oxcategories` WRITE;
/*!40000 ALTER TABLE `oxcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcategories2shop`
--

DROP TABLE IF EXISTS `oxcategories2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcategories2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcategories2shop`
--

LOCK TABLES `oxcategories2shop` WRITE;
/*!40000 ALTER TABLE `oxcategories2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcategories2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcategory2attribute`
--

DROP TABLE IF EXISTS `oxcategory2attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcategory2attribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Category id (oxcategories)',
  `OXATTRID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Attribute id (oxattributes)',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between categories and attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcategory2attribute`
--

LOCK TABLES `oxcategory2attribute` WRITE;
/*!40000 ALTER TABLE `oxcategory2attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcategory2attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxconfig`
--

DROP TABLE IF EXISTS `oxconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxconfig` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Config id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXMODULE` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Module or theme specific config (theme:themename, module:modulename)',
  `OXVARNAME` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable name',
  `OXVARTYPE` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable type',
  `OXVARVALUE` text NOT NULL COMMENT 'Variable value',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXVARNAME` (`OXVARNAME`),
  KEY `listall` (`OXSHOPID`,`OXMODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop configuration values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxconfig`
--

LOCK TABLES `oxconfig` WRITE;
/*!40000 ALTER TABLE `oxconfig` DISABLE KEYS */;
INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES ('11296159b7641d31b93423972af6150a',1,'','iTopNaviCatCount','str','4','2023-10-31 15:18:35'),
('13c44abc1eb0e08c9.55267104',1,'','iCacheLifeTime','str','36000','2023-10-31 15:18:39'),
('13c44abc1eb0e6841.92235277',1,'','aCachableClasses','arr','a:5:{i:0;s:4:\"info\";i:1;s:5:\"start\";i:2;s:7:\"details\";i:3;s:5:\"alist\";i:4;s:10:\"vendorlist\";}','2023-10-31 15:18:39'),
('15342e4cab0ee774acb390583838498a',1,'','blShowBirthdayFields','bool','1','2023-10-31 15:18:35'),
('1545423fe8ce213a043534555223029a',1,'','aNrofCatArticles','arr','a:4:{i:0;s:2:\"10\";i:1;s:2:\"20\";i:2;s:2:\"50\";i:3;s:3:\"100\";}','2023-10-31 15:18:35'),
('18a12329124850cd8f63cda6e8e7b4ea',1,'','bl_showWishlist','bool','1','2023-10-31 15:18:35'),
('18a23429124850cd8f63cda6e8e7b4ea',1,'','bl_showVouchers','bool','1','2023-10-31 15:18:35'),
('18a34529124850cd8f63cda6e8e7b4ea',1,'','bl_showGiftWrapping','bool','1','2023-10-31 15:18:35'),
('18a9473894d473f6ed28f04e80d929fa',1,'','bl_showCompareList','bool','1','2023-10-31 15:18:35'),
('18acb2f595da54b5f865e54aa5cdb96a',1,'','bl_showListmania','bool','1','2023-10-31 15:18:35'),
('1eada690d18be312ef5e49b8451440e7',1,'','blShowTSCODMessage','bool','1','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884847a',1,'','iNewBasketItemMessage','select','1','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884879a',1,'','sCatIconsize','str','168*100','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884898a',1,'','sDefaultListDisplayType','select','infogrid','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884898x',1,'','sCatPromotionsize','str','370*107','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884899a',1,'','aNrofCatArticlesInGrid','arr','a:4:{i:0;s:2:\"12\";i:1;s:2:\"16\";i:2;s:2:\"24\";i:3;s:2:\"32\";}','2023-10-31 15:18:35'),
('1ec42a395d0595ee774109189884899x',1,'','blShowListDisplayType','bool','1','2023-10-31 15:18:35'),
('21798f6956c099662a61067f6b4e6a99',1,'','iOlcSuccess','str','1376060550','2023-10-31 15:18:39'),
('2a944b2cc31311e8957700163e4021bf',1,'','includeProductReviewLinksInEmail','bool','','2023-10-31 15:18:35'),
('2ca4277aa49a5bd27.44511187',1,'','blStockOnDefaultMessage','bool','1','2023-10-31 15:18:35'),
('2ca4277aa49a634f8.76432326',1,'','blStockOffDefaultMessage','bool','1','2023-10-31 15:18:35'),
('2e244d9a2f78077d1.36913924',1,'','bl_perfLoadSelectListsInAList','bool','','2023-10-31 15:18:39'),
('32ddeaf2694e06b47b6ff74eafc69b65',1,'','sParcelService','str','http://www.dpd.de/cgi-bin/delistrack?typ=1&amp;lang=de&amp;pknr=##ID##','2023-10-31 15:18:35'),
('33341949f476b65e8.17282442',1,'','iAttributesPercent','str','70','2023-10-31 15:18:35'),
('36d42513de8cab671.54909813',1,'','bl_perfShowActionCatArticleCnt','bool','1','2023-10-31 15:18:35'),
('39893a0ef6a6e11645d4beee4fd0cd51',1,'','aLanguageParams','aarr','a:2:{s:2:\"de\";a:3:{s:6:\"baseId\";i:0;s:6:\"active\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";}s:2:\"en\";a:3:{s:6:\"baseId\";i:1;s:6:\"active\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";}}','2023-10-31 15:18:35'),
('3c4f033dfb8fd4fe692715dda19ecd28',1,'','aCurrencies','arr','a:4:{i:0;s:23:\"EUR@ 1.00@ ,@ .@ €@ 2\";i:1;s:24:\"GBP@ 0.8565@ .@  @ £@ 2\";i:2;s:40:\"CHF@ 1.4326@ ,@ .@ <small>CHF</small>@ 2\";i:3;s:23:\"USD@ 1.2994@ .@  @ $@ 2\";}','2023-10-31 15:18:35'),
('43040112c71dfb0f2.40367454',1,'','sDefaultImageQuality','str','75','2023-10-31 15:18:35'),
('44bcd90bd1d059.053753111',1,'','sTagList','str','1153227019','2023-10-31 15:18:35'),
('4994145b9e8678993.26056670',1,'','blShowSorting','bool','1','2023-10-31 15:18:35'),
('4994145b9e8736eb6.03785000',1,'','iTop5Mode','str','1','2023-10-31 15:18:35'),
('4994145b9e87481c5.69580772',1,'','aSortCols','arr','a:2:{i:0;s:7:\"oxtitle\";i:1;s:13:\"oxvarminprice\";}','2023-10-31 15:18:35'),
('51e44d9a1e3bc2571.58800338',1,'','blShopStopped','bool','1','2023-10-31 15:18:39'),
('5i1c49faf83b3fe3d6bdbfa301e2704d',1,'','iLinkExpirationTime','str','168','2023-10-31 15:18:35'),
('5i1d215fe1d6f0e1061ba1134e0ee4f2',1,'','iDownloadExpirationTime','str','24','2023-10-31 15:18:35'),
('603a1a28ff2a421b64c631ffaf97f324',1,'','sGiCsvFieldEncloser','str','\"','2023-10-31 15:18:35'),
('62642dfaa1d87d064.50653921',1,'','aDetailImageSizes','aarr','a:12:{s:6:\"oxpic1\";s:7:\"250*200\";s:6:\"oxpic2\";s:7:\"250*200\";s:6:\"oxpic3\";s:7:\"250*200\";s:6:\"oxpic4\";s:7:\"250*200\";s:6:\"oxpic5\";s:7:\"250*200\";s:6:\"oxpic6\";s:7:\"250*200\";s:6:\"oxpic7\";s:7:\"250*200\";s:6:\"oxpic8\";s:7:\"250*200\";s:6:\"oxpic9\";s:7:\"250*200\";s:7:\"oxpic10\";s:7:\"250*200\";s:7:\"oxpic11\";s:7:\"250*200\";s:7:\"oxpic12\";s:7:\"250*200\";}','2023-10-31 15:18:35'),
('62642dfaa1d88b1b2.94593071',1,'','sZoomImageSize','str','450*450','2023-10-31 15:18:35'),
('65f089c999116081a60ac4f3e102dfd0',1,'','sBackTag','string','1698765521','2023-10-31 15:18:41'),
('6ec4235c2aa997942.70260123',1,'','blWarnOnSameArtNums','bool','1','2023-10-31 15:18:35'),
('6ec4235c2aaa45d77.87437919',1,'','sIconsize','str','56*42','2023-10-31 15:18:35'),
('6ec4235c2aaa8eec5.99966057',1,'','sMidlleCustPrice','str','40','2023-10-31 15:18:35'),
('6ec4235c2aaa97585.69723730',1,'','sLargeCustPrice','str','100','2023-10-31 15:18:35'),
('6ec4235c5182c3620.11050422',1,'','iNrofNewcomerArticles','str','4','2023-10-31 15:18:35'),
('6f8453f77d174e0a0.31854175',1,'','blOtherCountryOrder','bool','1','2023-10-31 15:18:35'),
('7044252b61dcb8ac9.31672388',1,'','bl_perfLoadPriceForAddList','bool','1','2023-10-31 15:18:35'),
('77c425a29db68f0d9.00182375',1,'','bl_perfLoadManufacturerTree','bool','1','2023-10-31 15:18:35'),
('79c3fbc9897c0d159.27469500',1,'','blLoadVariants','bool','1','2023-10-31 15:18:35'),
('79e417a3916b910c8.31517473',1,'','bl_perfLoadAktion','bool','1','2023-10-31 15:18:35'),
('79e417a4201010a12.85717286',1,'','bl_perfLoadReviews','bool','1','2023-10-31 15:18:35'),
('79e417a420101f3e6.18536996',1,'','bl_perfLoadCrossselling','bool','1','2023-10-31 15:18:35'),
('79e417a4201028c21.24163259',1,'','bl_perfLoadAccessoires','bool','1','2023-10-31 15:18:35'),
('79e417a420103a598.95673089',1,'','bl_perfLoadCustomerWhoBoughtThis','bool','1','2023-10-31 15:18:35'),
('79e417a4201044603.06076651',1,'','bl_perfLoadSimilar','bool','1','2023-10-31 15:18:35'),
('79e417a420104dbd8.25267555',1,'','bl_perfLoadSelectLists','bool','1','2023-10-31 15:18:35'),
('79e417a4201062a60.33852458',1,'','bl_perfLoadDiscounts','bool','1','2023-10-31 15:18:35'),
('79e417a420106baa7.25594072',1,'','bl_perfLoadDelivery','bool','1','2023-10-31 15:18:35'),
('79e417a420107ab46.59697382',1,'','bl_perfLoadPrice','bool','1','2023-10-31 15:18:35'),
('79e417a442934fcb9.11733184',1,'','bl_perfLoadCatTree','bool','1','2023-10-31 15:18:35'),
('79e417a45558d97f6.76133435',1,'','bl_perfLoadCurrency','bool','1','2023-10-31 15:18:35'),
('79e417a45558e7851.36128674',1,'','bl_perfLoadLanguages','bool','1','2023-10-31 15:18:35'),
('79e417a4eaad1a593.54850808',1,'','blStoreIPs','bool','','2023-10-31 15:18:35'),
('7a59f9000f39e5d9549a5d1e29c076a0',1,'','blUseMultidimensionVariants','bool','1','2023-10-31 15:18:35'),
('7a59f9000f39e5d9549a5d1e29c076a2',1,'','blOrderOptInEmail','bool','1','2023-10-31 15:18:35'),
('7e9426025ff199d75.57820200',1,'','sStockWarningLimit','str','10','2023-10-31 15:18:35'),
('8563fba1965a11df3.12345678',1,'','blWrappingVatOnTop','bool','','2023-10-31 15:18:35'),
('8563fba1965a11df3.34244997',1,'','blEnterNetPrice','bool','','2023-10-31 15:18:35'),
('8563fba1965a1cc34.52696792',1,'','blCalculateDelCostIfNotLoggedIn','bool','','2023-10-31 15:18:35'),
('8563fba1965a1f266.82484369',1,'','blAllowUnevenAmounts','bool','','2023-10-31 15:18:35'),
('8563fba1965a219c9.51133344',1,'','blUseStock','bool','1','2023-10-31 15:18:35'),
('8563fba1965a25500.87856483',1,'','dDefaultVAT','num','19','2023-10-31 15:18:35'),
('8563fba1965a27185.06428911',1,'','sDefaultLang','str','0','2023-10-31 15:18:35'),
('8563fba1965a2b330.65668120',1,'','sMerchantID','str','','2023-10-31 15:18:35'),
('8563fba1965a2d181.97927980',1,'','sHost','str','https://txms.gzs.de:51384/','2023-10-31 15:18:35'),
('8563fba1965a2eee6.68137602',1,'','sPaymentUser','str','','2023-10-31 15:18:35'),
('8563fba1965a30cf7.41846088',1,'','sPaymentPwd','str','','2023-10-31 15:18:35'),
('8563fba1baec4d3b7.61553539',1,'','iNrofSimilarArticles','str','5','2023-10-31 15:18:35'),
('8563fba1baec4f6d3.38812651',1,'','iNrofCustomerWhoArticles','str','5','2023-10-31 15:18:35'),
('8563fba1baec515d0.57265727',1,'','iNrofCrossellArticles','str','5','2023-10-31 15:18:35'),
('8563fba1baec55dc8.04115259',1,'','iUseGDVersion','str','2','2023-10-31 15:18:35'),
('8563fba1baec57c19.08644217',1,'','sThumbnailsize','str','100*100','2023-10-31 15:18:35'),
('8563fba1baec599d5.89404456',1,'','sCatThumbnailsize','str','555*200','2023-10-31 15:18:35'),
('8563fba1baec5b7d3.75515041',1,'','sCSVSign','str',';','2023-10-31 15:18:35'),
('8563fba1baec5d615.45874801',1,'','iExportNrofLines','str','250','2023-10-31 15:18:35'),
('8563fba1baec6eaf2.01241384',1,'','iCntofMails','str','20','2023-10-31 15:18:35'),
('8563fba1baec73b00.28734905',1,'','aOrderfolder','aarr','a:3:{s:15:\"ORDERFOLDER_NEW\";s:7:\"#0000FF\";s:20:\"ORDERFOLDER_FINISHED\";s:7:\"#0A9E18\";s:20:\"ORDERFOLDER_PROBLEMS\";s:7:\"#FF0000\";}','2023-10-31 15:18:35'),
('8563fba1c39367724.92308656',1,'','blCheckTemplates','bool','1','2023-10-31 15:18:35'),
('8563fba1c39367724.92308656123111',1,'','sDownloadsDir','str','out/downloads','2023-10-31 15:18:35'),
('8563fba1c39370d88.58444180',1,'','blLogChangesInAdmin','bool','','2023-10-31 15:18:35'),
('8563fba1c393750a0.46170041',1,'','sUtilModule','str','','2023-10-31 15:18:35'),
('8563fba1c3937ee60.91079898',1,'','iMallMode','str','1','2023-10-31 15:18:35'),
('8563fba1c39381962.39392958',1,'','aCacheViews','arr','a:3:{i:0;s:5:\"start\";i:1;s:5:\"alist\";i:2;s:7:\"details\";}','2023-10-31 15:18:35'),
('8563fba1c39386cf4.18302736',1,'','aSkipTags','arr','a:36:{i:0;s:3:\"der\";i:1;s:3:\"die\";i:2;s:3:\"das\";i:3;s:3:\"was\";i:4;s:3:\"wie\";i:5;s:3:\"wer\";i:6;s:2:\"in\";i:7;s:3:\"sie\";i:8;s:2:\"du\";i:9;s:3:\"aus\";i:10;s:3:\"von\";i:11;s:3:\"des\";i:12;s:3:\"hat\";i:13;s:5:\"einen\";i:14;s:4:\"eine\";i:15;s:3:\"ist\";i:16;s:5:\"einem\";i:17;s:4:\"dann\";i:18;s:5:\"haben\";i:19;s:6:\"dieser\";i:20;s:6:\"dieser\";i:21;s:3:\"dem\";i:22;s:4:\"sich\";i:23;s:2:\"er\";i:24;s:3:\"ich\";i:25;s:3:\"was\";i:26;s:4:\"fÜr\";i:27;s:3:\"und\";i:28;s:3:\"nur\";i:29;s:3:\"auf\";i:30;s:2:\"an\";i:31;s:4:\"this\";i:32;s:4:\"that\";i:33;s:2:\"if\";i:34;s:3:\"you\";i:35;s:3:\"the\";}','2023-10-31 15:18:35'),
('8563fba1c3938ebe7.95075058',1,'','aLogSkipTags','arr','a:0:{}','2023-10-31 15:18:35'),
('89e42b02704ce5589.91950338',1,'','iNewestArticlesMode','str','1','2023-10-31 15:18:35'),
('8b831f739c5d16cf4571b14a76006568',1,'','aSEOReservedWords','arr','a:7:{i:0;s:5:\"admin\";i:1;s:4:\"core\";i:2;s:6:\"export\";i:3;s:7:\"modules\";i:4;s:3:\"out\";i:5;s:5:\"setup\";i:6;s:5:\"views\";}','2023-10-31 15:18:35'),
('9135a582a6971656110b9a98ca5be6d2',1,'','blShippingCountryVat','bool','','2023-10-31 15:18:35'),
('99065ff58e9d2c1b2e362e54c0bb54f3',1,'','blNewArtByInsert','bool','1','2023-10-31 15:18:35'),
('9a8426df9d36443e7.48701626',1,'','blSearchUseAND','bool','','2023-10-31 15:18:35'),
('a104164f96fa51c41.58873414',1,'','aSearchCols','arr','a:4:{i:0;s:7:\"oxtitle\";i:1;s:11:\"oxshortdesc\";i:2;s:12:\"oxsearchkeys\";i:3;s:8:\"oxartnum\";}','2023-10-31 15:18:35'),
('a1544b76735df7bd7.33980003',1,'','blEnableIntangibleProdAgreement','bool','1','2023-10-31 15:18:35'),
('a1544b76735e2d8e8.37455553',1,'','blShowVATForDelivery','bool','1','2023-10-31 15:18:39'),
('a1544b76735e421e0.22942938',1,'','blShowVATForPayCharge','bool','1','2023-10-31 15:18:39'),
('a1544b76735e48c05.33803554',1,'','blExclNonMaterialFromDelivery','bool','','2023-10-31 15:18:39'),
('a1544b76735e63209.62380160',1,'','blShowVATForWrapping','bool','','2023-10-31 15:18:39'),
('a1544b76735edac06.77267220',1,'','sLocalDateFormat','str','ISO','2023-10-31 15:18:39'),
('a1544b76735ede2e3.94589565',1,'','sLocalTimeFormat','str','ISO','2023-10-31 15:18:39'),
('a7a425c02819f7253.64374401',1,'','blAutoIcons','bool','1','2023-10-31 15:18:35'),
('a99427345bf85a602.27736147',1,'','blDontShowEmptyCategories','bool','','2023-10-31 15:18:35'),
('a99427345bf8fcff2.83464949',1,'','bl_perfUseSelectlistPrice','bool','','2023-10-31 15:18:35'),
('a99427345bf9a27a1.04791092',1,'','bl_perfCalcVatOnlyForBasketOrder','bool','','2023-10-31 15:18:35'),
('b0b4d221756b49c8d60a904c0b91b877',1,'','blCheckSysReq','bool','1','2023-10-31 15:18:35'),
('b2b400dd011bf6273.08965005',1,'','blVariantsSelection','bool','','2023-10-31 15:18:35'),
('bd320d322fa2f638086787c512329eec',1,'','dPointsForRegistration','str','10','2023-10-31 15:18:35'),
('bd3e73e699331eb92c557113bac02fc4',1,'','dPointsForInvitation','str','10','2023-10-31 15:18:35'),
('bf041bd98dacd9021.61732877',1,'','aInterfaceProfiles','aarr','a:4:{s:8:\"Standard\";s:2:\"10\";s:8:\"1024x768\";s:2:\"10\";s:9:\"1280x1024\";s:2:\"17\";s:9:\"1600x1200\";s:2:\"22\";}','2023-10-31 15:18:35'),
('c20424bf2f8e71271.42955545',1,'','bl_perfLoadTreeForSearch','bool','1','2023-10-31 15:18:35'),
('c3218be9780011eebb110242ac130003',1,'','contactFormRequiredFields','arr','a:1:{i:0;s:5:\"email\";}','2023-10-31 15:18:36'),
('ce143201f7e03e110.09792514',1,'','aMustFillFields','arr','a:14:{i:0;s:15:\"oxuser__oxfname\";i:1;s:15:\"oxuser__oxlname\";i:2;s:16:\"oxuser__oxstreet\";i:3;s:18:\"oxuser__oxstreetnr\";i:4;s:13:\"oxuser__oxzip\";i:5;s:14:\"oxuser__oxcity\";i:6;s:19:\"oxuser__oxcountryid\";i:7;s:18:\"oxaddress__oxfname\";i:8;s:18:\"oxaddress__oxlname\";i:9;s:19:\"oxaddress__oxstreet\";i:10;s:21:\"oxaddress__oxstreetnr\";i:11;s:16:\"oxaddress__oxzip\";i:12;s:17:\"oxaddress__oxcity\";i:13;s:22:\"oxaddress__oxcountryid\";}','2023-10-31 15:18:35'),
('d144175015dcd2a39.15131643',1,'','aHomeCountry','arr','a:1:{i:0;s:26:\"a7c40f631fc920687.20179984\";}','2023-10-31 15:18:35'),
('d592e41daa2d93b8244e6871282ab8c1',1,'','blConvertImagesToWebP','bool','0','2023-10-31 15:18:35'),
('d8d44bbdea56b3ed0.58768595',1,'','blMallCustomPrice','bool','1','2023-10-31 15:18:39'),
('e1142ca231becd5c4.00590616',1,'','blConfirmAGB','bool','','2023-10-31 15:18:35'),
('e7744be1b5fb6ac06.91704848',1,'','blVariantParentBuyable','bool','','2023-10-31 15:18:39'),
('e7744be1b5fb6e4a9.96876633',1,'','blShowVariantReviews','bool','','2023-10-31 15:18:39'),
('e7744be1b5fb6e4a9.96876634',1,'','blVariantInheritAmountPrice','bool','','2023-10-31 15:18:39'),
('e7744be1b5fb8aef2.33450414',1,'','blGBModerate','bool','','2023-10-31 15:18:39'),
('e7744be1b5fb9ece3.82840270',1,'','iAdminLogTime','str','60','2023-10-31 15:18:39'),
('e7744be1b5fbacf84.23562842',1,'','iSessionTimeoutAdmin','str','','2023-10-31 15:18:39'),
('e7744be1b5fbb4cf1.34834569',1,'','iServerTimeShift','str','','2023-10-31 15:18:39'),
('e8e41bda6fa7631d8.13775806',1,'','iSessionTimeout','str','60','2023-10-31 15:18:35'),
('e924478126bb80968.65249125',1,'','blMallPriceAdditionPercent','bool','1','2023-10-31 15:18:39'),
('e9244781359d1dd18.54146261',1,'','iMallPriceAddition','str','0','2023-10-31 15:18:39'),
('fd770460540c32422b415a65fefb8f90',1,'','blSendTechnicalInformationToOxid','bool','','2023-10-31 15:18:35'),
('fde4559837789b3c7.26965372',1,'','aCMSfolder','aarr','a:3:{s:16:\"CMSFOLDER_EMAILS\";s:7:\"#706090\";s:18:\"CMSFOLDER_USERINFO\";s:7:\"#303030\";s:14:\"CMSFOLDER_NONE\";s:7:\"#904040\";}','2023-10-31 15:18:39'),
('fecfcd8dbd01a491a94557448425acc8',1,'','blShowTSInternationalFeesMessage','bool','1','2023-10-31 15:18:35'),
('l8g3e140a4bc7993d7d715df951dfe25',1,'','iMaxDownloadsCountUnregistered','str','1','2023-10-31 15:18:35'),
('l8g957be9e7b13412960c7670f71ba31',1,'','sAdditionalServVATCalcMethod','str','biggest_net','2023-10-31 15:18:35'),
('l8g957be9e7b13412960c7670f71ba3b',1,'','iMaxDownloadsCount','str','0','2023-10-31 15:18:35'),
('mhjf24905a5b49c8d60aa31087b97971',1,'','blEnableSeoCache','bool','1','2023-10-31 15:18:35'),
('mhjf24905a5b49c8d60aa31087b9797f',1,'','blShowRememberMe','bool','1','2023-10-31 15:18:35'),
('mla50c74dd79703312ffb8cfd82c3741',1,'','aLanguageURLs','arr','a:2:{i:0;s:0:\"\";i:1;N;}','2023-10-31 15:18:35'),
('mlabefd7ebdb5946e8f3f7e7a953b323',1,'','aLanguageSSLURLs','arr','a:2:{i:0;s:0:\"\";i:1;N;}','2023-10-31 15:18:35'),
('mlae44cdad808d9b994c58540db39e7a',1,'','aLanguages','aarr','a:2:{s:2:\"de\";s:7:\"Deutsch\";s:2:\"en\";s:7:\"English\";}','2023-10-31 15:18:35'),
('omc4555952125c3c2.98253113',1,'','blDisableNavBars','bool','','2023-10-31 15:18:39');
/*!40000 ALTER TABLE `oxconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxconfigdisplay`
--

DROP TABLE IF EXISTS `oxconfigdisplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxconfigdisplay` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Config id (extends oxconfig record with this id)',
  `OXCFGMODULE` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Module or theme specific config (theme:themename, module:modulename)',
  `OXCFGVARNAME` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable name',
  `OXGROUPING` varchar(255) NOT NULL DEFAULT '' COMMENT 'Grouping (groups config fields to array with specified value as key)',
  `OXVARCONSTRAINT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Serialized constraints',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `list` (`OXCFGMODULE`,`OXCFGVARNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional configuraion fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxconfigdisplay`
--

LOCK TABLES `oxconfigdisplay` WRITE;
/*!40000 ALTER TABLE `oxconfigdisplay` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxconfigdisplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcontents`
--

DROP TABLE IF EXISTS `oxcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcontents` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Content id',
  `OXLOADID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Id, specified by admin and can be used instead of oxid',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXSNIPPET` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Snippet (can be included to other oxcontents records)',
  `OXTYPE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Type: 0 - Snippet, 1 - Upper Menu, 2 - Category, 3 - Manual',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active (multilanguage)',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '0',
  `OXPOSITION` varchar(32) NOT NULL DEFAULT '' COMMENT 'Position',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXCONTENT` mediumtext NOT NULL COMMENT 'Content (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_1` mediumtext NOT NULL,
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_2` mediumtext NOT NULL,
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_3` mediumtext NOT NULL,
  `OXCATID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Category id (oxcategories), used only when type = 2',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Content Folder (available options at oxconfig.OXVARNAME = aCMSfolder)',
  `OXTERMVERSION` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Term and Conditions version (used only when OXLOADID = oxagb)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `DDHIDETITLE` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDHIDESIDEBAR` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDISBLOCK` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDBLOCK` varchar(250) NOT NULL DEFAULT '',
  `DDOBJECTTYPE` varchar(50) NOT NULL DEFAULT '',
  `DDOBJECTID` char(32) NOT NULL DEFAULT '',
  `DDISLANDING` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDISTMPL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDACTIVEFROM` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DDACTIVEUNTIL` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DDCSSCLASS` varchar(100) NOT NULL DEFAULT '',
  `DDCUSTOMCSS` text NOT NULL,
  `DDTMPLTARGETID` char(32) NOT NULL DEFAULT '',
  `DDTMPLTARGETDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DDPARENTCONTENT` char(32) NOT NULL DEFAULT '',
  `DDSORTING` int(11) NOT NULL DEFAULT '0',
  `DDFULLWIDTH` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DDPLAINTEXT` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXLOADID` (`OXLOADID`,`OXSHOPID`),
  KEY `cat_search` (`OXTYPE`,`OXSHOPID`,`OXSNIPPET`,`OXCATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Content pages (Snippets, Menu, Categories, Manual)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcontents`
--

LOCK TABLES `oxcontents` WRITE;
/*!40000 ALTER TABLE `oxcontents` DISABLE KEYS */;
INSERT INTO `oxcontents` (`OXID`, `OXLOADID`, `OXSHOPID`, `OXSNIPPET`, `OXTYPE`, `OXACTIVE`, `OXACTIVE_1`, `OXPOSITION`, `OXTITLE`, `OXCONTENT`, `OXTITLE_1`, `OXCONTENT_1`, `OXACTIVE_2`, `OXTITLE_2`, `OXCONTENT_2`, `OXACTIVE_3`, `OXTITLE_3`, `OXCONTENT_3`, `OXCATID`, `OXFOLDER`, `OXTERMVERSION`, `OXTIMESTAMP`, `DDHIDETITLE`, `DDHIDESIDEBAR`, `DDISBLOCK`, `DDBLOCK`, `DDOBJECTTYPE`, `DDOBJECTID`, `DDISLANDING`, `DDISTMPL`, `DDACTIVEFROM`, `DDACTIVEUNTIL`, `DDCSSCLASS`, `DDCUSTOMCSS`, `DDTMPLTARGETID`, `DDTMPLTARGETDATE`, `DDPARENTCONTENT`, `DDSORTING`, `DDFULLWIDTH`, `DDPLAINTEXT`) VALUES ('1074279e67a85f5b1.96907412','oxorderinfo',1,1,0,1,1,'','Wie bestellen?','<div>Beispieltext:</div>\r\n<div> </div>\r\n<div>{{  oxcmp_shop.oxshops__oxname.value  }}, Ihr Online-Shop für ... <br />\r\n<br />\r\nBei uns haben Sie die Wahl aus mehr als ... Artikeln von bester Qualität und namhaften Herstellern. Schauen Sie sich um, stöbern Sie in unseren Angeboten! <br />\r\n{{  oxcmp_shop.oxshops__oxname.value  }} steht Ihnen im Internet rund um die Uhr und 7 Tage die Woche offen.<br />\r\n<br />\r\nWenn Sie eine Bestellung aufgeben möchten, können Sie das:\r\n<ul>\r\n<li class=\"font11\">direkt im Internet über unseren Shop </li>\r\n<li class=\"font11\">per Fax unter {{  oxcmp_shop.oxshops__oxtelefax.value  }} </li>\r\n<li class=\"font11\">per Telefon unter {{  oxcmp_shop.oxshops__oxtelefon.value  }} </li>\r\n<li class=\"font11\">oder per E-Mail unter <a href=\"mailto:{{  oxcmp_shop.oxshops__oxowneremail.value  }}?subject=Bestellung\"><strong>{{  oxcmp_shop.oxshops__oxowneremail.value  }}</strong></a> </li></ul>Telefonisch sind wir für Sie <br />\r\nMontag bis Freitag von 10 bis 18 Uhr erreichbar. <br />\r\nWenn Sie auf der Suche nach einem Artikel sind, der zum Sortiment von {{  oxcmp_shop.oxshops__oxname.value  }} passen könnte, ihn aber nirgends finden, lassen Sie es uns wissen. Gern bemühen wir uns um eine Lösung für Sie. <br />\r\n<br />\r\nSchreiben Sie an <a href=\"mailto:{{  oxcmp_shop.oxshops__oxowneremail.value  }}?subject=Produktidee\"><strong>{{  oxcmp_shop.oxshops__oxowneremail.value  }}</strong></a>.</div>','How to order?','<h1>Text Example</h1>\r\n<h2>{{  oxcmp_shop.oxshops__oxname.value  }}, your online store for ...</h2>\r\n<p>With us, you can choose from more than ... products of high quality and reputable manufacturers. Take a look around and browse through our offers!<br />\r\nOn the internet {{  oxcmp_shop.oxshops__oxname.value  }} is open 24/7.</p>\r\n<p>If you want to place an order you can purchase</p>\r\n<ul>\r\n<li class=\"font11\">via our online store</li>\r\n<li class=\"font11\">via fax {{  oxcmp_shop.oxshops__oxtelefax.value  }} </li>\r\n<li class=\"font11\">via telephone {{  oxcmp_shop.oxshops__oxtelefon.value  }} </li>\r\n<li class=\"font11\">or via e-mail <a href=\"mailto:{{  oxcmp_shop.oxshops__oxowneremail.value  }}?subject=Order\"><strong>{{  oxcmp_shop.oxshops__oxowneremail.value  }}</strong></a></li></ul>\r\n<p>By telephone, we are available<br />\r\nMonday to Friday 10 AM thru 6 PM. </p>\r\n<p>If you are looking for an item that did not match the range of {{  oxcmp_shop.oxshops__oxname.value  }}, let\'s us know. We are happy to find a solution for you.</p>\r\n<p>Write to <a href=\"mailto:{{  oxcmp_shop.oxshops__oxowneremail.value  }}?subject=Product idea\"><strong>{{  oxcmp_shop.oxshops__oxowneremail.value  }}</strong></a></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('1544167b4666ccdc1.28484600','oxblocked',1,1,0,1,1,'','Benutzer geblockt','<div><span style=\"color: #ff0000;\"><strong>Der Zugang wurde Ihnen verweigert!</strong></span></div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>','user blocked','<div>\r\n   <span style=\"color: #ff0000;\"><strong>Permission denied!</strong></span>\r\n</div>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('1ea45574543b21636.29288751','oxrightofwithdrawal',1,1,0,1,1,'','Widerrufsrecht','<div>Fügen Sie hier Ihre Widerrufsbelehrung ein.</div>','Right of Withdrawal','<div>Insert here the Right of Withdrawal policy.</div>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('220404cee0caf470e227c1c9f1ec4ae2','oxrighttocancellegend',1,1,0,1,1,'','AGB und Widerrufsrecht','{% ifcontent ident \"oxagb\" set oCont %}\r\n    Ich habe die <a id=\"test_OrderOpenAGBBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">AGB</a> gelesen und erkläre mich mit ihnen einverstanden.&nbsp;\r\n{% endifcontent %}\r\n{% ifcontent ident \"oxrightofwithdrawal\" set oCont %}\r\n    Ich wurde über mein <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">{{  oCont.oxcontents__oxtitle.value  }}</a> informiert.\r\n{% endifcontent %}','Terms and Conditions and Right to Withdrawal','{% ifcontent ident \"oxagb\" set oCont %} I agree to the <a id=\"test_OrderOpenAGBBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">Terms and Conditions</a>.&nbsp;\r\n{% endifcontent %}\r\n{% ifcontent ident \"oxrightofwithdrawal\" set oCont %}\r\n    I have been informed about my <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">{{  oCont.oxcontents__oxtitle.value  }}</a>.\r\n{% endifcontent %}',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('220404cee0caf470e227c1c9f1ec4ae3','oxrighttocancellegend2',1,1,0,1,1,'','AGB und Widerrufsrecht','{% ifcontent ident \"oxagb\" set oCont %}\r\n    Es gelten unsere <a rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">Allgemeinen Geschäftsbedingungen</a>.&nbsp;\r\n{% endifcontent %}\r\n{% ifcontent ident \"oxrightofwithdrawal\" set oCont %}\r\n    Hier finden Sie <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">Einzelheiten zum Widerrufsrecht</a>.\r\n{% endifcontent %}','Terms and Conditions and Right to Withdrawal','{% ifcontent ident \"oxagb\" set oCont %} Our general <a rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">terms and conditions</a> apply.&nbsp;\r\n{% endifcontent %}\r\n{% ifcontent ident \"oxrightofwithdrawal\" set oCont %}\r\n    Read details about  <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"{{  oCont.getLink()  }}\" onclick=\"window.open(\'{{  oCont.getLink()|add_url_parameters(\"plain=1\") }}\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">right of withdrawal</a>.\r\n{% endifcontent %}',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('220404cee0caf470e227c1c9f1ec4aL3','oxdownloadableproductsagreement',1,1,0,1,1,'','Für digitale Inhalte','Ja, ich möchte sofort Zugang zu dem digitalen Inhalt und weiß, dass mein Widerrufsrecht mit dem Zugang erlischt.','For the supply of digital content','I want immediate access to the digital content and I acknowledge that thereby I lose my right to cancel once the service has begun.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('220404cee0caf470e227c1c9f1ec4aL4','oxserviceproductsagreement',1,1,0,1,1,'','Für Dienstleistungen','Ja, bitte beginnen Sie sofort mit der Dienstleistung. Mein Widerrufsrecht erlischt mit vollständiger Ausführung.','For service contracts','I agree to the starting of the service and I acknowledge that I lose my right to cancel once the service has been fully performed.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('29142e76dd32dd477.41262508','oxforgotpwd',1,1,0,1,1,'','Passwort vergessen','Sollten Sie innerhalb der nächsten Minuten KEINE E-Mail mit Ihren Zugangsdaten erhalten, so überprüfen Sie bitte: Haben Sie sich in unserem Shop bereits registriert? Wenn nicht, so tun Sie dies bitte einmalig im Rahmen des Bestellprozesses. Sie können dann selbst ein Passwort festlegen. Sobald Sie registriert sind, können Sie sich in Zukunft mit Ihrer E-Mail-Adresse und Ihrem Passwort einloggen.\r\n<ul>\r\n<li class=\"font11\">Wenn Sie sich sicher sind, dass Sie sich in unserem Shop bereits registriert haben, dann überprüfen Sie bitte, ob Sie sich bei der Eingabe Ihrer E-Mail-Adresse evtl. vertippt haben.</li></ul>\r\n<p>Sollten Sie trotz korrekter E-Mail-Adresse und bereits bestehender Registrierung weiterhin Probleme mit dem Login haben und auch keine \"Passwort vergessen\"-E-Mail erhalten, so wenden Sie sich bitte per E-Mail an: <a href=\"mailto:{{  oxcmp_shop.oxshops__oxinfoemail.value  }}?subject=Passwort\"><strong>{{  oxcmp_shop.oxshops__oxinfoemail.value  }}</strong></a></p>','Forgot password','<p>If you don\'t get an e-mail with your access data, please make sure that you have already registered with us. As soon as you are registered, you can login with your e-mail address and your password.</p>\r\n<ul>\r\n<li>\r\nIf you are sure you are already registered, please check the e-mail address you entered as user name.</li></ul>\r\n<p>\r\nIn case you still have problems logging in, please turn to us by e-mail: <a href=\"mailto:{{  oxcmp_shop.oxshops__oxinfoemail.value  }}?subject=Password\"><strong>{{  oxcmp_shop.oxshops__oxinfoemail.value  }}</strong></a></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('2eb46767947d21851.22681675','oximpressum',1,1,0,1,1,'','Impressum','<p>Fügen Sie hier Ihre Anbieterkennzeichnung ein.</p>','About Us','<p>Add provider identification here.</p>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('2eb4676806a3d2e87.06076523','oxagb',1,1,0,1,1,'','AGB','<div><strong>AGB</strong></div>\r\n<div><strong>&nbsp;</strong></div>\r\n<div>Fügen Sie hier Ihre allgemeinen Geschäftsbedingungen ein:</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"font-weight: bold\">Strukturvorschlag:</span><br>\r\n<br>\r\n<ol>\r\n<li>Geltungsbereich </li>\r\n<li>Vertragspartner </li>\r\n<li>Angebot und Vertragsschluss </li>\r\n<li>Widerrufsrecht, Widerrufsbelehrung, Widerrufsfolgen </li>\r\n<li>Preise und Versandkosten </li>\r\n<li>Lieferung </li>\r\n<li>Zahlung </li>\r\n<li>Eigentumsvorbehalt </li>\r\n<li>Gewährleistung </li>\r\n<li>Weitere Informationen</li></ol></div>','Terms and Conditions','Insert your terms and conditions here.',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','1','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('3194668fde854d711.73798992','oxemailfooterplain',1,1,0,1,1,'','E-Mail Fußtext Plain','-- Bitte fügen Sie hier Ihre vollständige Anbieterkennzeichnung ein.','E-mail footer plain','-- Please insert your imprint here.',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('42e4667ffcf844be0.22563656','oxemailfooter',1,1,0,1,1,'','E-Mail Fußtext','<p align=\"left\">--</p>\r\n<p>Bitte fügen Sie hier Ihre vollständige Anbieterkennzeichnung ein.</p>','E-mail footer','<p align=\"left\">--</p>\r\n<p>Please insert your imprint here</p>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('460273f2ae78b9c40c536a1c331317ee','oxregisterplainaltemail',1,1,0,1,1,'','Alternative E-Mail zur Registrierung PLAIN','Hallo {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }},\r\n\r\ndanke für die Registrierung im {{  shop.oxshops__oxname.getRawValue()  }}!\r\nVon jetzt an können Sie sich mit Ihrer E-Mail-Adresse {{  user.oxuser__oxusername.value  }}.\r\n\r\nFolgen Sie diesem Link, um die Registrierung zu bestätigen:\r\n{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}\r\n\r\nSie können diesen Link in den nächsten {{  user.getUpdateLinkTerm() / 3600  }} Stunden verwenden.</p>\r\n\r\n\r\nIhr Team vom {{  shop.oxshops__oxname.getRawValue()  }}','Alternative Registration Email PLAIN','Hello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }},\r\n\r\nthanks for your registration at {{  shop.oxshops__oxname.getRawValue()  }}!\r\nFrom now on, you can log in with your email address {{  user.oxuser__oxusername.value  }}.\r\n\r\nFollow this link to confirm your registration:\r\n{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}\r\n\r\nYou can use this link within the next {{  user.getUpdateLinkTerm() / 3600  }} hours.<br />\r\n\r\n\r\nYour {{  shop.oxshops__oxname.getRawValue()  }} team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('460f3d25a752eeca8f8dbd66d04277c1','oxregisteraltemail',1,1,0,1,1,'','Alternative E-Mail zur Registrierung HTML','Hallo {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }}, <br />\r\n<br />\r\n<p>\r\ndanke für die Registrierung im {{  shop.oxshops__oxname.value  }}!</p>\r\nVon jetzt an können Sie sich mit Ihrer E-Mail-Adresse <strong>{{  user.oxuser__oxusername.value  }}</strong>.<br />\r\n<br />\r\nFolgen Sie diesem Link, um die Registrierung zu bestätigen:<br />\r\n<br /><a href=\"{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}\">{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}</a><br />\r\n<br />\r\nSie können diesen Link in den nächsten {{  user.getUpdateLinkTerm() / 3600  }} Stunden verwenden.<br />\r\n<br /><br />\r\nIhr Team vom {{  shop.oxshops__oxname.value  }}','Alternative Registration Email HTML','Hello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }}, <br />\r\n<br />\r\nthanks for your registration at {{  shop.oxshops__oxname.value  }}!<br />\r\nFrom now on, you can log in with your email address <strong>{{  user.oxuser__oxusername.value  }}</strong>.<br />\r\n<br />\r\nFollow this link to confirm your registration:<br />\r\n<br /><a href=\"{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}\">{{  oViewConf.getBaseDir()  }}index.php?cl=register&fnc=confirmRegistration&uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&shp={{  shop.oxshops__oxid.value  }}</a><br />\r\n<br />\r\nYou can use this link within the next {{  user.getUpdateLinkTerm() / 3600  }} hours.<br />\r\n<br />\r\n<br />\r\nYour {{  shop.oxshops__oxname.value  }} team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('4a63033aa27409f15484340011e74e55','oxcookiesexplanation',1,1,0,1,1,'','Cookies Explanation','Sie haben sich entschieden, keine Cookies von unserem Online-Shop zu akzeptieren. Die Cookies wurden gelöscht. Sie können in den Einstellungen Ihres Browsers die Verwendung von Cookies deaktivieren und den Online-Shop mit einigen funktionellen Einschränkungen nutzen. Sie können auch zurück zum Shop gehen, ohne die Einstellungen zu ändern, und den vollen Funktionsumfang des Online-Shops genießen.<br />\r\n<br />Informationen zu Cookies auf Wikipedia: <a href=\"http://de.wikipedia.org/wiki/HTTP-Cookie\"><strong>http://de.wikipedia.org/wiki/HTTP-Cookie</strong></a>','Cookies Explanation','You have decided to not accept cookies from our online shop. The cookies have been removed. You can deactivate the usage of cookies in the settings of your browser and visit the online shop with some functional limitations. You can also return to the shop without changing the browser settings and enjoy the full functionality.<br />\r\n<br />Information about cookies at Wikipedia: <a href=\"http://en.wikipedia.org/wiki/HTTP_cookie\"><strong>http://en.wikipedia.org/wiki/HTTP_cookie</strong></a>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('67c5bcf75ee346bd9566bce6c8','oxcredits',1,0,3,0,1,'','Credits','','Credits','Please add your text here.',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('84a42e66105998a86.14045828','oxuserorderemailend',1,1,0,1,1,'','Ihre Bestellung Abschluss','<div align=\"left\">Fügen Sie hier Ihre Widerrufsbelehrung ein.</div>','your order terms','<p>Right to Withdrawal can be inserted here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('84a42e66123887821.29772527','oxuserorderemailendplain',1,1,0,1,1,'','Ihre Bestellung Abschluss Plain','Fügen Sie hier Ihre Widerrufsbelehrung ein.','your order terms plain','<p>Right to Withdrawal can be inserted here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('8709e45f31a86909e9f999222e80b1d0','oxstdfooter',1,1,0,1,1,'','Standard Footer','<div>OXID Online Shop - Alles rund um das Thema Wassersport, Sportbekleidung und Mode </div>','standard footer','<div>OXID Online Shop - All about watersports, sportswear and fashion </div>',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49541c1add','oxupdatepassinfoemail',1,1,0,1,1,'','Ihr Passwort im eShop','Hallo {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }},\r\n<br /><br />\r\nöffnen Sie den folgenden Link, um ein neues Passwort für {{  shop.oxshops__oxname.value  }} einzurichten:\r\n<br /><br />\r\n<a href=\"{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}\">{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}</a>\r\n<br /><br />\r\nDiesen Link können Sie innerhalb der nächsten {{  user.getUpdateLinkTerm() / 3600  }} Stunden aufrufen.\r\n<br /><br />\r\nIhr {{  shop.oxshops__oxname.value  }} Team\r\n<br />','password update info','Hello {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }},<br />\r\n<br />\r\nfollow this link to generate a new password for {{  shop.oxshops__oxname.value  }}:<br />\r\n<br /><a href=\"{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId()  }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}\">{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}</a><br />\r\n<br />\r\nYou can use this link within the next {{  user.getUpdateLinkTerm() / 3600  }} hours.<br />\r\n<br />\r\nYour {{  shop.oxshops__oxname.value  }} team<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e495c392c6e','oxupdatepassinfoplainemail',1,1,0,1,1,'','Ihr Passwort im eShop Plain','Hallo {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }},\r\n\r\nöffnen Sie den folgenden Link, um ein neues Passwort für {{  shop.oxshops__oxname.getRawValue()  }} einzurichten:\r\n\r\n{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}\r\n\r\nDiesen Link können Sie innerhalb der nächsten {{  user.getUpdateLinkTerm() / 3600  }} Stunden aufrufen.\r\n\r\nIhr {{  shop.oxshops__oxname.getRawValue()  }} Team','password update info plain','Hello {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }},\r\n\r\nfollow this link to generate a new password for {{  shop.oxshops__oxname.getRawValue()  }}:\r\n\r\n{{  oViewConf.getBaseDir()  }}index.php?cl=forgotpwd&amp;uid={{  user.getUpdateId() }}&amp;lang={{  oViewConf.getActLanguageId()  }}&amp;shp={{  shop.oxshops__oxid.value  }}\r\n\r\nYou can use this link within the next {{  user.getUpdateLinkTerm() / 3600  }} hours.\r\n\r\nYour {{  shop.oxshops__oxname.getRawValue()  }} team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ad542e49975709a72.52261121','oxnewsletteremail',1,1,0,1,1,'','Newsletter eShop','Hallo, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }},<br>\r\nvielen Dank für Ihre Anmeldung zu unserem Newsletter.<br>\r\n<br>\r\nUm den Newsletter freizuschalten klicken Sie bitte auf folgenden Link:<br>\r\n<br>\r\n<a href=\"{{ subscribeLink|raw }}\">{{ subscribeLink|raw }}</a><br>\r\n<br>\r\nIhr {{  shop.oxshops__oxname.value  }} Team<br>','newsletter confirmation','Hello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }},<br>\r\nthank you for your newsletter subscription.<br>\r\n<br>\r\nFor final registration, please click on this link:<br>\r\n<br>\r\n<a href=\"{{ subscribeLink|raw }}\">{{ subscribeLink|raw }}</a><br>\r\n<br>\r\nYour {{  shop.oxshops__oxname.value  }} Team<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e4999ec01dd3.07214049','oxnewsletterplainemail',1,1,0,1,1,'','Newsletter eShop Plain','{{  shop.oxshops__oxname.getRawValue()  }} Newsletter Hallo, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }}, vielen Dank für Ihre Anmeldung zu unserem Newsletter. Um den Newsletter freizuschalten klicken Sie bitte auf folgenden Link: {{ subscribeLink|raw }} Ihr {{  shop.oxshops__oxname.getRawValue()  }} Team','newsletter confirmation plain','{{  shop.oxshops__oxname.getRawValue()  }} Newsletter \r\n\r\nHello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }}, \r\n\r\nthank you for your newsletter subscription. For final registration, please click on this link: \r\n{{ subscribeLink }} \r\n\r\nYour {{  shop.oxshops__oxname.getRawValue()  }} Team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ad542e49ae50c60f0.64307543','oxuserorderemail',1,1,0,1,1,'','Ihre Bestellung','Vielen Dank für Ihre Bestellung!<br>\r\n<br>\r\nNachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.<br>\r\nBei Fragen sind wir jederzeit für Sie da: Schreiben Sie einfach an {{  shop.oxshops__oxorderemail.value  }}!<br>\r\n<br>','your order','Thank you for your order!<br />\r\n<br />\r\nBelow, we have listed your order.<br />\r\nIf you have any questions, don\'t hesitate to drop us an e-mail {{  shop.oxshops__oxorderemail.value  }}!<br />\r\n<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49b08c65017.19848749','oxuserorderplainemail',1,1,0,1,1,'','Ihre Bestellung Plain','Vielen Dank für Ihre Bestellung!\r\n\r\nNachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.\r\nBei Fragen sind wir jederzeit für Sie da: Schreiben Sie einfach an {{  shop.oxshops__oxorderemail.value  }}!','your order plain','Thank you for your order!\r\n\r\nBelow we have listed your order.\r\nIf you have any questions, don\'t hesitate to drop us an e-mail {{  shop.oxshops__oxorderemail.value  }}!',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ad542e49bff479009.64538090','oxadminorderemail',1,1,0,1,1,'','Ihre Bestellung Admin','Folgende Artikel wurden soeben unter {{  shop.oxshops__oxname.value  }} bestellt:<br>\r\n<br>','your order admin','The following products have been ordered in {{  shop.oxshops__oxname.value  }} right now:<br>\r\n<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49c19109ad6.04198712','oxadminorderplainemail',1,1,0,1,1,'','Ihre Bestellung Admin Plain','<p>Folgende Artikel wurden soeben unter {{  shop.oxshops__oxname.getRawValue()  }} bestellt:</p>','your order admin plain','The following products have been ordered in {{  shop.oxshops__oxname.getRawValue()  }} right now:',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ad542e49c585394e4.36951640','oxpricealarmemail',1,1,0,1,1,'','Preisalarm','Preisalarm im {{  shop.oxshops__oxname.value  }}!<br>\r\n<br>\r\n{{  email  }} bietet für Artikel {{  product.oxarticles__oxtitle.value  }}, Artnum. {{  product.oxarticles__oxartnum.value  }}<br>\r\n<br>\r\nOriginalpreis: {{  product.getFPrice()  }} {{  currency.name }}<br>\r\nGEBOTEN: {{  bidprice  }} {{  currency.name }}<br>\r\n<br>\r\n<br>\r\nIhr Shop.<br>','price alert','Price alert at {{  shop.oxshops__oxname.value  }}!<br>\r\n<br>\r\n{{  email  }} bids for product {{  product.oxarticles__oxtitle.value  }}, product # {{  product.oxarticles__oxartnum.value  }}<br>\r\n<br>\r\nOriginal price: {{  currency.name }}{{  product.getFPrice()  }}<br>\r\nBid: {{  currency.name }}{{  bidprice  }}<br>\r\n<br>\r\n<br>\r\nYour store<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49c8ec04201.39247735','oxregisteremail',1,1,0,1,1,'','Vielen Dank für Ihre Registrierung','Hallo, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }}, vielen Dank für Ihre Registrierung bei {{  shop.oxshops__oxname.value  }}!<br>\r\n<br>\r\nSie können sich ab sofort auch mit Ihrer E-Mail-Adresse <strong>{{  user.oxuser__oxusername.value  }}</strong> einloggen.<br>\r\n<br>\r\nIhr {{  shop.oxshops__oxname.value  }} Team<br>','thanks for your registration','Hello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.value  }} {{  user.oxuser__oxlname.value  }}, <br />\r\n<br />\r\n<p>\r\nthank you for your registration at {{  shop.oxshops__oxname.value  }}!</p>\r\nFrom now on, you can log in with your email address <strong>{{  user.oxuser__oxusername.value  }}</strong>.<br />\r\n<br />\r\nYour {{  shop.oxshops__oxname.value  }} team<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49ca4750015.09588134','oxregisterplainemail',1,1,0,1,1,'','Vielen Dank für Ihre Registrierung Plain','<p>{{  shop.oxshops__oxregistersubject.getRawValue()  }} Hallo, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }}, vielen Dank für Ihre Registrierung bei {{  shop.oxshops__oxname.getRawValue()  }}! Sie können sich ab sofort auch mit Ihrer E-Mail-Adresse ({{  user.oxuser__oxusername.value  }}) einloggen. Ihr {{  shop.oxshops__oxname.getRawValue()  }} Team</p>','thanks for your registration plain','<p>Hello, {{  user.oxuser__oxsal.value|translate_salutation  }} {{  user.oxuser__oxfname.getRawValue()  }} {{  user.oxuser__oxlname.getRawValue()  }},\r\n\r\nthank you for your registration at {{  shop.oxshops__oxname.getRawValue()  }}!\r\nFrom now on, you can log in with your email address {{  user.oxuser__oxusername.value  }}.\r\n\r\nYour {{  shop.oxshops__oxname.getRawValue()  }} team</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ad542e49d6de4a4f4.88594616','oxordersendemail',1,1,0,1,1,'','Ihre Bestellung wurde versandt','Guten Tag, {{  order.oxorder__oxbillsal.value|translate_salutation  }} {{  order.oxorder__oxbillfname.value  }} {{  order.oxorder__oxbilllname.value  }},<br>\r\n<br>\r\nunser Vertriebszentrum hat soeben folgende Artikel versandt.<br>\r\n<br>','your order has been shipped','Hello {{  order.oxorder__oxbillsal.value|translate_salutation  }} {{  order.oxorder__oxbillfname.value  }} {{  order.oxorder__oxbilllname.value  }},<br />\r\n<br />\r\n<p>\r\nour distribution center just shipped this product:</p><br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('ad542e49d856b5b68.98220446','oxordersendplainemail',1,1,0,1,1,'','Ihre Bestellung wurde versandt Plain','Guten Tag {{  order.oxorder__oxbillsal.value|translate_salutation  }} {{  order.oxorder__oxbillfname.getRawValue()  }} {{  order.oxorder__oxbilllname.getRawValue()  }},\r\n\r\nunser Vertriebszentrum hat soeben folgende Artikel versandt.','your order has been shipped plain','<p>Hello {{  order.oxorder__oxbillsal.value|translate_salutation  }} {{  order.oxorder__oxbillfname.getRawValue()  }} {{  order.oxorder__oxbilllname.getRawValue()  }},\r\n\r\nour distribution center just shipped this product:</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('c4241316b2e5c1966.96997011','oxhelpalist',1,1,0,1,1,'','Hilfe - Die Produktliste','<p>Hier können zusätzliche Informationen, weiterführende Links, Bedienungshinweise etc. für die Hilfe-Funktion in den <em>Produktlisten</em> eingefügt werden. </p>','Help - Product List','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on <em>product pages</em>.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c4241316b2e5c1966.96997012','oxhelpdefault',1,1,0,1,1,'','Hilfe - Main','<p>Hier können zusätzliche Informationen, weiterführende Links, Bedienungshinweise etc. für die Hilfe-Funktion in der <em>Kategorieansicht</em> eingefügt werden. </p>','Help - Main','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on <em>category pages</em>.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c4241316b2e5c1966.96997013','oxhelpstart',1,1,0,1,1,'','Hilfe - Die Startseite','<p>Hier können zusätzliche Informationen, weiterführende Links, Bedienungshinweise etc. für die Hilfe-Funktion auf der <em>Startseite</em> eingefügt werden. </p>\r\n<p>&nbsp;</p>','Help - Start page','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on the <em>start page</em>.</p><br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c4241316c6e7b9503.93160420','oxbargain',1,1,0,1,1,'','Angebot der Woche','<table>{% for articlebargain_item in oView.getBargainArticleList() %} <tbody><tr><td>\r\n<div class=\"product_image_s_container\"><a href=\"{{ articlebargain_item.getLink() }}\"><img border=\"0\" alt=\"{{  articlebargain_item.oxarticles__oxtitle.value  }}{% if articlebargain_item.oxarticles__oxvarselect.value  %} {{  articlebargain_item.oxarticles__oxvarselect.value  }}{% endif %} {{ oxcmp_shop.oxshops__oxtitlesuffix.value }}\" src=\"{{  articlebargain_item.getDynImageDir() }}/{{ articlebargain_item.oxarticles__oxicon.value }}\"></a></div> </td><td class=\"boxrightproduct-td\"> <a href=\"{{ articlebargain_item.getLink() }}\" class=\"boxrightproduct-td\"><strong>{{  articlebargain_item.oxarticles__oxtitle.value|cat(\"\r\n\")|cat(articlebargain_item.oxarticles__oxvarselect.value)|striptags|smart_wordwrap(15, \"<br>\r\n\", 2, 1, \"...\")  }}</strong></a><br>\r\n {% if articlebargain_item.isBuyable()  %} <a href=\"{{ articlebargain_item.getToBasketLink() }}&amp;am=1\" class=\"details\" onclick=\"showBasketWnd();\" rel=\"nofollow\"><img border=\"0\" src=\"{{ oViewConf.getImageUrl(\'arrow_details.gif\') }}\" alt=\"\"> Jetzt bestellen! </a> {% endif %} </td></tr>{% endfor %}\r\n</tbody></table>','Week\'s Special','<table>{% for articlebargain_item in oView.getBargainArticleList() %} <tbody><tr><td>\r\n<div class=\"product_image_s_container\"><a href=\"{{ articlebargain_item.getLink() }}\"><img border=\"0\" src=\"{{  articlebargain_item.getDynImageDir() }}/{{ articlebargain_item.oxarticles__oxicon.value }}\" alt=\"{{  articlebargain_item.oxarticles__oxtitle.value  }}{% if articlebargain_item.oxarticles__oxvarselect.value  %} {{  articlebargain_item.oxarticles__oxvarselect.value  }}{% endif %} {{ oxcmp_shop.oxshops__oxtitlesuffix.value }}\"></a></div> </td><td class=\"boxrightproduct-td\"> <a class=\"boxrightproduct-td\" href=\"{{ articlebargain_item.getLink() }}\"><strong>{{  articlebargain_item.oxarticles__oxtitle.value|cat(\"\r\n\")|cat(articlebargain_item.oxarticles__oxvarselect.value)|striptags|smart_wordwrap(15, \"<br>\r\n) \":2:1:\"...\"  }}</strong></a><br>\r\n {% if articlebargain_item.isBuyable() %} <a onclick=\"showBasketWnd();\" class=\"details\" href=\"{{ articlebargain_item.getToBasketLink() }}&amp;am=1\" rel=\"nofollow\"><img border=\"0\" alt=\"\" src=\"{{ oViewConf.getImageUrl(\'arrow_details.gif\') }}\"> Order now! </a> {% endif %} </td></tr>{% endfor %} </tbody></table>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c8d45408c08bbaf79.09887022','oxuserordernpemail',1,1,0,1,1,'','Ihre Bestellung (Fremdländer)','<div>Vielen Dank für Ihre Bestellung!</div>\r\n<p><strong><span style=\"color: #ff0000\">Hinweis:</span></strong> Derzeit ist uns keine Versandmethode für dieses Land bekannt. Wir werden versuchen, Versandmethoden zu finden und Sie über das Ergebnis unter Angabe der Versandkosten informieren. </p>Bei Fragen sind wir jederzeit für Sie da: Schreiben Sie einfach an {{  shop.oxshops__oxorderemail.value  }}! <br />\r\n<br />','your order (other country)','<p>Thank you for your order!</p>\r\n<p><strong><span style=\"color: #ff0000\">Information:</span></strong> Currently, there is no shipping method defined for your country. We will find a method to deliver the goods you purchased and will inform you as soon as possible.</p>\r\n<p>If you have any requests, don\'t hesitate to contact us! {{  shop.oxshops__oxorderemail.value  }}</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c8d45408c4998f421.15746968','oxadminordernpemail',1,1,0,1,1,'','Ihre Bestellung Admin (Fremdländer)','<div>\r\n<p> <span style=\"color: #ff0000;\"><strong>Hinweis:</strong></span> Derzeit ist keine Liefermethode für dieses Land bekannt. Bitte Liefermöglichkeiten suchen und den Besteller unter Angabe der <strong>Lieferkosten</strong> informieren!\r\n&nbsp;</p> </div>\r\n<div>Folgende Artikel wurden soeben unter {{  shop.oxshops__oxname.value  }} bestellt:<br>\r\n<br>\r\n</div>','your order admin (other country)','<p> <span style=\"color: #ff0000\"><strong>Information:</strong></span> Currently, there is no shipping method defined for this country. Please find a delivery option and inform the customer about the <strong>shipping costs</strong>.</p>\r\n<p>The following products have been ordered on {{  shop.oxshops__oxname.value  }}:<br />\r\n<br /></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('c8d45408c5c39ea22.75925645','oxuserordernpplainemail',1,1,0,1,1,'','Ihre Bestellung (Fremdländer) Plain','Vielen Dank für Ihre Bestellung!\r\n\r\nHinweis: Derzeit ist uns keine Versandmethode für dieses Land bekannt. Wir werden versuchen, Versandmethoden zu finden und Sie über das Ergebnis unter Angabe der Versandkosten informieren.\r\n\r\nBei Fragen sind wir jederzeit für Sie da: Schreiben Sie einfach an {{  shop.oxshops__oxorderemail.value  }}!','your order plain (other country)','Thank you for your order!\r\nInformation: Currently, there is no shipping method defined for your country. We will find a method to deliver the goods you purchased and will inform you as soon as possible.\r\n\r\nIf you have any requests don\'t hesitate to contact us! {{  shop.oxshops__oxorderemail.value  }}',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('c8d45408c718782f3.21298666','oxadminordernpplainemail',1,1,0,1,1,'','Ihre Bestellung Admin (Fremdländer) Plain','Hinweis: Derzeit ist keine Liefermethode für dieses Land bekannt. Bitte Liefermöglichkeiten suchen und den Besteller informieren!\r\n\r\nFolgende Artikel wurden soeben unter {{  shop.oxshops__oxname.getRawValue()  }} bestellt:','your order admin plain (other country)','<p>Information: Currently, there is no shipping method defined for this country. Please find a delivery option and inform the customer about the shipping costs.\r\n\r\nThe following products have been ordered on {{  shop.oxshops__oxname.getRawValue()  }}:</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ce77743c334edf92b0cab924a7','oxstartmetakeywords',1,1,0,1,1,'','META Keywords Startseite','kite, kites, kiteboarding, kiteboards, wakeboarding, wakeboards, boards, strand, sommer, wassersport, mode, fashion, style, shirts, jeans, accessoires, angebote','META keywords start page','kite, kites, kiteboarding, kiteboards, wakeboarding, wakeboards, boards, beach, summer, watersports, funsports, fashion, style, shirts, jeans, accessories, special offers',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('ce79015b6f6f07612270975889','oxstartmetadescription',1,1,0,1,1,'','META Description Startseite','Alles zum Thema Wassersport, Sportbekleidung und Mode. Umfangreiches Produktsortiment mit den neusten Trendprodukten. Blitzschneller Versand.<br />','META description start page','<p>All about watersports, sportswear and fashion. Extensive product range including several trendy products. Fast shipping.</p>\r\n<p>&nbsp;</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:41',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,1),
('d0f7ac8b29909908dc20d854224944fe','oxnopaymentmethod',1,1,0,1,1,'','No payment method text','<p>Derzeit ist keine Versandart für dieses Land\r\ndefiniert.</p>\r\n<p>Wir werden versuchen, Liefermöglichkeiten zu\r\nfinden und Sie über die Versandkosten informieren.</p>','No payment method text','<p>Currently we have no shipping method set up\r\nfor this country.</p>\r\n<p>We are aiming to find a possible delivery\r\nmethod and we will inform you as soon as possible via e-mail about the result,\r\nincluding further information about delivery costs.</p>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('d74fdc1ed22a0d469bdcc5f003ca6575','oxregistrationdescription',1,1,0,1,1,'','Registration Description','<p>Mit einem persönlichen Kundenkonto haben Sie folgende Vorteile:<br />\r\n - Verwaltung der Lieferadressen<br />\r\n - Prüfung des Bestellstatus<br />\r\n - Bestellhistorie<br />\r\n - persönlicher Merkzettel<br />\r\n - persönliche Wunschliste<br />\r\n - Newsletter-Verwaltung<br />\r\n - Sonder- und Rabattaktionen</p>','Registration Description','<p>A customer with an account has advantages like:<br />\r\n - Administration of shipping addresses<br />\r\n - Check order status<br />\r\n - Order History<br />\r\n - Personal Wish List<br />\r\n - Personal Gift Registry<br />\r\n - Newsletter subscription<br />\r\n - Special offers and discounts</p>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('f41427a07519469f1.34718981','oxdeliveryinfo',1,1,0,1,1,'','Zahlung und Lieferung','<p>Fügen Sie hier Ihre Versandinformationen und -kosten ein.</p>','Shipping and Charges','<p>Add your shipping information and costs here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('f41427a099a603773.44301043','oxsecurityinfo',1,1,0,1,1,'','Datenschutz','Fügen Sie hier Ihre Datenschutzbestimmungen ein.','Privacy Policy','Enter your privacy policy here.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0),
('f41427a10afab8641.52768563','oxnewstlerinfo',1,1,0,1,1,'','Neuigkeiten bei uns','<div>Mit dem {{  oxcmp_shop.oxshops__oxname.value  }}-Newsletter alle paar Wochen. <br>\r\nMit Tipps, Infos, Aktionen ... <br>\r\n<br>\r\nDas Abo kann jederzeit durch Austragen der E-Mail-Adresse beendet werden. <br>\r\nEine <span class=\"newsletter_title\">Weitergabe Ihrer Daten an Dritte lehnen wir ab</span>. <br>\r\n<br>\r\nSie bekommen zur Bestätigung nach dem Abonnement eine E-Mail - so stellen wir sicher, dass kein Unbefugter Sie in unseren Newsletter eintragen kann (sog. \"Double Opt-In\").<br>\r\n<br>\r\n</div>','newsletter info','<p>Stay in touch with the periodic {{  oxcmp_shop.oxshops__oxname.value  }}-newsletter every couple of weeks. We gladly inform you about recent tips, promotions and new products.</p>\r\n<p>You can unsubscribe any time from the newsletter.</p>\r\n<p>We strictly refuse <span class=\"newsletter_title\">transferring your data to 3rd parties</span>.</p>\r\n<p>For subscription we use the so called &quot;double opt-in&quot; procedure to guarantee that no unauthorized person will register with your e-mail address.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2023-10-31 15:18:35',0,0,0,'','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','0000-00-00 00:00:00','',0,0,0);
/*!40000 ALTER TABLE `oxcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcounters`
--

DROP TABLE IF EXISTS `oxcounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcounters` (
  `OXIDENT` char(32) NOT NULL COMMENT 'Counter id',
  `OXCOUNT` int(11) NOT NULL COMMENT 'Counted number',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop counters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcounters`
--

LOCK TABLES `oxcounters` WRITE;
/*!40000 ALTER TABLE `oxcounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcountry`
--

DROP TABLE IF EXISTS `oxcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcountry` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Country id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXISOALPHA2` char(2) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 alpha-2',
  `OXISOALPHA3` char(3) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 alpha-3',
  `OXUNNUM3` char(3) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 numeric',
  `OXVATINPREFIX` char(2) NOT NULL DEFAULT '' COMMENT 'VAT identification number prefix',
  `OXORDER` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXLONGDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Long description (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_1` varchar(255) NOT NULL,
  `OXLONGDESC_2` varchar(255) NOT NULL,
  `OXLONGDESC_3` varchar(255) NOT NULL,
  `OXVATSTATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Vat status: 0 - Do not bill VAT, 1 - Do not bill VAT only if provided valid VAT ID',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcountry`
--

LOCK TABLES `oxcountry` WRITE;
/*!40000 ALTER TABLE `oxcountry` DISABLE KEYS */;
INSERT INTO `oxcountry` (`OXID`, `OXACTIVE`, `OXTITLE`, `OXISOALPHA2`, `OXISOALPHA3`, `OXUNNUM3`, `OXVATINPREFIX`, `OXORDER`, `OXSHORTDESC`, `OXLONGDESC`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`, `OXSHORTDESC_1`, `OXSHORTDESC_2`, `OXSHORTDESC_3`, `OXLONGDESC_1`, `OXLONGDESC_2`, `OXLONGDESC_3`, `OXVATSTATUS`, `OXTIMESTAMP`) VALUES ('2db455824e4a19cc7.14731328',0,'Anderes Land','','','','',10000,'','Select this if you can not find your country.','Other country','','','','','','Select this if you can not find your country.','','',0,'2023-10-31 15:18:35'),
('56d308a822c18e106.3ba59048',0,'Montenegro','ME','MNE','499','ME',9999,'Rest Europa','','Montenegro','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('56d308a822c18e106.3ba59099',0,'Guernsey','GG','GGY','831','GG',9999,'Rest Welt','','Guernsey','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095306451.36998225',0,'Afghanistan','AF','AFG','4','AF',9999,'Rest Welt','','Afghanistan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953265a5.25286134',0,'Albanien','AL','ALB','8','AL',9999,'Rest Europa','','Albania','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109533b943.50287900',0,'Algerien','DZ','DZA','12','DZ',9999,'Rest Welt','','Algeria','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109533b943.50287999',0,'Südgeorgien und die Südlichen Sandwichinseln','GS','SGS','239','GS',9999,'Rest Welt','','South Georgia and The South Sandwich Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109533b944.50289999',0,'Nordirland','XI','NIR','826','XI',9999,'EU2','','Northern Ireland','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('8f241f1109534f8c7.80349931',0,'Amerikanisch Samoa','AS','ASM','16','AS',9999,'Rest Welt','','American Samoa','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095363464.89657222',0,'Andorra','AD','AND','20','AD',9999,'Europa','','Andorra','','','Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095377d33.28678901',0,'Angola','AO','AGO','24','AO',9999,'Rest Welt','','Angola','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095392e41.74397491',0,'Anguilla','AI','AIA','660','AI',9999,'Rest Welt','','Anguilla','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953a8d10.29474848',0,'Antarktis','AQ','ATA','10','AQ',9999,'Rest Welt','','Antarctica','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953be8f2.56248134',0,'Antigua und Barbuda','AG','ATG','28','AG',9999,'Rest Welt','','Antigua and Barbuda','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953d2fb0.54260547',0,'Argentinien','AR','ARG','32','AR',9999,'Rest Welt','','Argentina','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953e7993.88180360',0,'Armenien','AM','ARM','51','AM',9999,'Rest Europa','','Armenia','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110953facc6.31621036',0,'Aruba','AW','ABW','533','AW',9999,'Rest Welt','','Aruba','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095410f38.37165361',0,'Australien','AU','AUS','36','AU',9999,'Rest Welt','','Australia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109543cf47.17877015',0,'Aserbaidschan','AZ','AZE','31','AZ',9999,'Rest Welt','','Azerbaijan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095451379.72078871',0,'Bahamas','BS','BHS','44','BS',9999,'Rest Welt','','Bahamas','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110954662e3.27051654',0,'Bahrain','BH','BHR','48','BH',9999,'Welt','','Bahrain','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109547ae49.60154431',0,'Bangladesch','BD','BGD','50','BD',9999,'Rest Welt','','Bangladesh','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095497083.21181725',0,'Barbados','BB','BRB','52','BB',9999,'Rest Welt','','Barbados','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110954ac5b9.63105203',0,'Weißrussland','BY','BLR','112','BY',9999,'Rest Europa','','Belarus','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110954d3621.45362515',0,'Belize','BZ','BLZ','84','BZ',9999,'Rest Welt','','Belize','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110954ea065.41455848',0,'Benin','BJ','BEN','204','BJ',9999,'Rest Welt','','Benin','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110954fee13.50011948',0,'Bermuda','BM','BMU','60','BM',9999,'Rest Welt','','Bermuda','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095513ca0.75349731',0,'Bhutan','BT','BTN','64','BT',9999,'Rest Welt','','Bhutan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109552aee2.91004965',0,'Bolivien','BO','BOL','68','BO',9999,'Rest Welt','','Bolivia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109553f902.06960438',0,'Bosnien und Herzegowina','BA','BIH','70','BA',9999,'Rest Europa','','Bosnia and Herzegovina','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095554834.54199483',0,'Botsuana','BW','BWA','72','BW',9999,'Rest Welt','','Botswana','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109556dd57.84292282',0,'Bouvetinsel','BV','BVT','74','BV',9999,'Rest Welt','','Bouvet Island','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095592407.89986143',0,'Brasilien','BR','BRA','76','BR',9999,'Rest Welt','','Brazil','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110955a7644.68859180',0,'Britisches Territorium im Indischen Ozean','IO','IOT','86','IO',9999,'Rest Welt','','British Indian Ocean Territory','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110955bde61.63256042',0,'Brunei Darussalam','BN','BRN','96','BN',9999,'Rest Welt','','Brunei Darussalam','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110955d3260.55487539',0,'Bulgarien','BG','BGR','100','BG',9999,'Rest Europa','','Bulgaria','','','Rest Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110955ea7c8.36762654',0,'Burkina Faso','BF','BFA','854','BF',9999,'Rest Welt','','Burkina Faso','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956004d5.11534182',0,'Burundi','BI','BDI','108','BI',9999,'Rest Welt','','Burundi','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956175f9.81682035',0,'Kambodscha','KH','KHM','116','KH',9999,'Rest Welt','','Cambodia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095632828.20263574',0,'Kamerun','CM','CMR','120','CM',9999,'Rest Welt','','Cameroon','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095649d18.02676059',0,'Kanada','CA','CAN','124','CA',9999,'Welt','','Canada','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109565e671.48876354',0,'Kap Verde','CV','CPV','132','CV',9999,'Rest Welt','','Cape Verde','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095673248.50405852',0,'Kaimaninseln','KY','CYM','136','KY',9999,'Rest Welt','','Cayman Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109568a509.03566030',0,'Zentralafrikanische Republik','CF','CAF','140','CF',9999,'Rest Welt','','Central African Republic','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109569d4c2.42800039',0,'Tschad','TD','TCD','148','TD',9999,'Rest Welt','','Chad','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956b3ea7.11168270',0,'Chile','CL','CHL','152','CL',9999,'Rest Welt','','Chile','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956c8860.37981845',0,'China','CN','CHN','156','CN',9999,'Rest Welt','','China','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956df6b2.52283428',0,'Weihnachtsinsel','CX','CXR','162','CX',9999,'Rest Welt','','Christmas Island','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110956f54b4.26327849',0,'Kokosinseln (Keelinginseln)','CC','CCK','166','CC',9999,'Rest Welt','','Cocos (Keeling) Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109570a1e3.69772638',0,'Kolumbien','CO','COL','170','CO',9999,'Rest Welt','','Colombia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109571f018.46251535',0,'Komoren','KM','COM','174','KM',9999,'Rest Welt','','Comoros','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095732184.72771986',0,'Kongo','CG','COG','178','CG',9999,'Rest Welt','','Congo','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095746a92.94878441',0,'Cookinseln','CK','COK','184','CK',9999,'Rest Welt','','Cook Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109575d708.20084150',0,'Costa Rica','CR','CRI','188','CR',9999,'Rest Welt','','Costa Rica','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109575d708.20084199',0,'Kongo, Dem. Rep.','CD','COD','180','CD',9999,'Rest Welt','','Congo, The Democratic Republic Of The','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095771f76.87904122',0,'Cote dŽIvoire','CI','CIV','384','CI',9999,'Rest Welt','','Cote d\'Ivoire','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095789a04.65154246',0,'Kroatien','HR','HRV','191','HR',9999,'Rest Europäische Union','','Croatia','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('8f241f1109579ef49.91803242',0,'Kuba','CU','CUB','192','CU',9999,'Rest Welt','','Cuba','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110957b6896.52725150',0,'Zypern','CY','CYP','196','CY',9999,'Rest Europa','','Cyprus','','','Rest Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110957cb457.97820918',0,'Tschechische Republik','CZ','CZE','203','CZ',9999,'Europa','','Czech Republic','','','Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110957e6ef8.56458418',0,'Dänemark','DK','DNK','208','DK',9999,'Europa','','Denmark','','','Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110957fd356.02918645',0,'Dschibuti','DJ','DJI','262','DJ',9999,'Rest Welt','','Djibouti','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095811ea5.84717844',0,'Dominica','DM','DMA','212','DM',9999,'Rest Welt','','Dominica','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095825bf2.61063355',0,'Dominikanische Republik','DO','DOM','214','DO',9999,'Rest Welt','','Dominican Republic','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095839323.86755169',0,'Timor-Leste','TL','TLS','626','TL',9999,'Rest Welt','','Timor-Leste','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109584d512.06663789',0,'Ecuador','EC','ECU','218','EC',9999,'Rest Welt','','Ecuador','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095861fb7.55278256',0,'Ägypten','EG','EGY','818','EG',9999,'Welt','','Egypt','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110958736a9.06061237',0,'El Salvador','SV','SLV','222','SV',9999,'Rest Welt','','El Salvador','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109588d077.74284490',0,'Äquatorialguinea','GQ','GNQ','226','GQ',9999,'Rest Welt','','Equatorial Guinea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110958a2216.38324531',0,'Eritrea','ER','ERI','232','ER',9999,'Rest Welt','','Eritrea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110958b69e4.93886171',0,'Estland','EE','EST','233','EE',9999,'Rest Europäische Union','','Estonia','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110958caf67.08982313',0,'Äthiopien','ET','ETH','210','ET',9999,'Rest Welt','','Ethiopia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110958e2cc3.90770249',0,'Falklandinseln (Malwinen)','FK','FLK','238','FK',9999,'Rest Welt','','Falkland Islands (Malvinas)','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110958f7ba4.96908065',0,'Färöer','FO','FRO','234','FO',9999,'Rest Welt','','Faroe Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109590d226.07938729',0,'Fidschi','FJ','FJI','242','FJ',9999,'Rest Welt','','Fiji','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109594fcb1.79441780',0,'Französisch Guiana','GF','GUF','254','GF',9999,'Rest Welt','','French Guiana','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959636f5.71476354',0,'Französisch-Polynesien','PF','PYF','258','PF',9999,'Rest Welt','','French Polynesia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959784a3.34264829',0,'Französische Südgebiete','TF','ATF','260','TF',9999,'Rest Welt','','French Southern Territories','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095994cb6.59353392',0,'Gabun','GA','GAB','266','GA',9999,'Rest Welt','','Gabon','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959ace77.17379319',0,'Gambia','GM','GMB','270','GM',9999,'Rest Welt','','Gambia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959c2341.01830199',0,'Georgien','GE','GEO','268','GE',9999,'Rest Europa','','Georgia','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959e96b3.05752152',0,'Ghana','GH','GHA','288','GH',9999,'Rest Welt','','Ghana','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110959fdde0.68919405',0,'Gibraltar','GI','GIB','292','GI',9999,'Rest Welt','','Gibraltar','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a29f47.04102343',0,'Grönland','GL','GRL','304','GL',9999,'Europa','','Greenland','','','Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a3f195.88886789',0,'Grenada','GD','GRD','308','GD',9999,'Rest Welt','','Grenada','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a52578.45413493',0,'Guadeloupe','GP','GLP','312','GP',9999,'Rest Welt','','Guadeloupe','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a717b3.68126681',0,'Guam','GU','GUM','316','GU',9999,'Rest Welt','','Guam','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a870a5.42235635',0,'Guatemala','GT','GTM','320','GT',9999,'Rest Welt','','Guatemala','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095a9bf82.19989557',0,'Guinea','GN','GIN','324','GN',9999,'Rest Welt','','Guinea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ab2b56.83049280',0,'Guinea-Bissau','GW','GNB','624','GW',9999,'Rest Welt','','Guinea-Bissau','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ac9d30.56640429',0,'Guyana','GY','GUY','328','GY',9999,'Rest Welt','','Guyana','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095aebb06.34405179',0,'Haiti','HT','HTI','332','HT',9999,'Rest Welt','','Haiti','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095aff2c3.98054755',0,'Heard Insel und McDonald Inseln','HM','HMD','334','HM',9999,'Rest Welt','','Heard Island And Mcdonald Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b13f57.56022305',0,'Honduras','HN','HND','340','HN',9999,'Rest Welt','','Honduras','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b29021.49657118',0,'Hong Kong','HK','HKG','344','HK',9999,'Rest Welt','','Hong Kong','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b3e016.98213173',0,'Ungarn','HU','HUN','348','HU',9999,'Rest Europa','','Hungary','','','Rest Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11095b55846.26192602',0,'Island','IS','ISL','352','IS',9999,'Rest Europa','','Iceland','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b6bb86.01364904',0,'Indien','IN','IND','356','IN',9999,'Rest Welt','','India','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b80526.59927631',0,'Indonesien','ID','IDN','360','ID',9999,'Rest Welt','','Indonesia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095b94476.05195832',0,'Iran','IR','IRN','364','IR',9999,'Welt','','Iran','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095bad5b2.42645724',0,'Irak','IQ','IRQ','368','IQ',9999,'Welt','','Iraq','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095bd65e1.59459683',0,'Israel','IL','ISR','376','IL',9999,'Rest Europa','','Israel','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095bfe834.63390185',0,'Jamaika','JM','JAM','388','JM',9999,'Rest Welt','','Jamaica','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c11d43.73419747',0,'Japan','JP','JPN','392','JP',9999,'Rest Welt','','Japan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c2b304.75906962',0,'Jordanien','JO','JOR','400','JO',9999,'Rest Welt','','Jordan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c3e2d1.36714463',0,'Kasachstan','KZ','KAZ','398','KZ',9999,'Rest Europa','','Kazakhstan','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c5b8e8.66333679',0,'Kenia','KE','KEN','404','KE',9999,'Rest Welt','','Kenya','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c6e184.21450618',0,'Kiribati','KI','KIR','296','KI',9999,'Rest Welt','','Kiribati','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c87284.37982544',0,'Nordkorea','KP','PRK','408','KP',9999,'Rest Welt','','North Korea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095c9de64.01275726',0,'Südkorea','KR','KOR','410','KR',9999,'Rest Welt','','South Korea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095cb1546.46652174',0,'Kuwait','KW','KWT','414','KW',9999,'Welt','','Kuwait','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095cc7ef5.28043767',0,'Kirgisistan','KG','KGZ','417','KG',9999,'Rest Welt','','Kyrgyzstan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095cdccd5.96388808',0,'Laos','LA','LAO','418','LA',9999,'Rest Welt','','Laos','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095cf2ea6.73925511',0,'Lettland','LV','LVA','428','LV',9999,'Rest Europäische Union','','Latvia','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11095d07d87.58986129',0,'Libanon','LB','LBN','422','LB',9999,'Welt','','Lebanon','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095d1c9b2.21548132',0,'Lesotho','LS','LSO','426','LS',9999,'Rest Welt','','Lesotho','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095d2fd28.91858908',0,'Liberia','LR','LBR','430','LR',9999,'Welt','','Liberia','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095d46188.64679605',0,'Libyen','LY','LBY','434','LY',9999,'Rest Welt','','Libya','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095d6ffa8.86593236',0,'Litauen','LT','LTU','440','LT',9999,'Rest Europäische Union','','Lithuania','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11095d9c1b2.13577033',0,'Macao','MO','MAC','446','MO',9999,'Rest Welt','','Macao','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095db2291.58912887',0,'Mazedonien','MK','MKD','807','MK',9999,'Rest Europa','','Macedonia','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095dccf17.06266806',0,'Madagaskar','MG','MDG','450','MG',9999,'Rest Welt','','Madagascar','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095de2119.60795833',0,'Malawi','MW','MWI','454','MW',9999,'Rest Welt','','Malawi','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095df78a8.44559506',0,'Malaysia','MY','MYS','458','MY',9999,'Rest Welt','','Malaysia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e0c6c9.43746477',0,'Malediven','MV','MDV','462','MV',9999,'Rest Welt','','Maldives','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e24006.17141715',0,'Mali','ML','MLI','466','ML',9999,'Rest Welt','','Mali','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e36eb3.69050509',0,'Malta','MT','MLT','470','MT',9999,'Rest Welt','','Malta','','','Rest World','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11095e4e338.26817244',0,'Marshallinseln','MH','MHL','584','MH',9999,'Rest Welt','','Marshall Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e631e1.29476484',0,'Martinique','MQ','MTQ','474','MQ',9999,'Rest Welt','','Martinique','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e7bff9.09518271',0,'Mauretanien','MR','MRT','478','MR',9999,'Rest Welt','','Mauritania','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095e90a81.01156393',0,'Mauritius','MU','MUS','480','MU',9999,'Rest Welt','','Mauritius','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ea6249.81474246',0,'Mayotte','YT','MYT','175','YT',9999,'Rest Welt','','Mayotte','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ebf3a6.86388577',0,'Mexiko','MX','MEX','484','MX',9999,'Rest Welt','','Mexico','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ed4902.49276197',0,'Mikronesien, Föderierte Staaten von','FM','FSM','583','FM',9999,'Rest Welt','','Micronesia, Federated States Of','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095ee9923.85175653',0,'Moldawien','MD','MDA','498','MD',9999,'Rest Europa','','Moldova','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095f00d65.30318330',0,'Monaco','MC','MCO','492','MC',9999,'Europa','','Monaco','','','Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095f160c9.41059441',0,'Mongolei','MN','MNG','496','MN',9999,'Rest Welt','','Mongolia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11095f314f5.05830324',0,'Montserrat','MS','MSR','500','MS',9999,'Rest Welt','','Montserrat','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096006828.49285591',0,'Marokko','MA','MAR','504','MA',9999,'Welt','','Morocco','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109601b419.55269691',0,'Mosambik','MZ','MOZ','508','MZ',9999,'Rest Welt','','Mozambique','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096030af5.65449043',0,'Myanmar','MM','MMR','104','MM',9999,'Rest Welt','','Myanmar','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096046575.31382060',0,'Namibia','NA','NAM','516','NA',9999,'Rest Welt','','Namibia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109605b1f4.20574895',0,'Nauru','NR','NRU','520','NR',9999,'Rest Welt','','Nauru','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109607a9e7.03486450',0,'Nepal','NP','NPL','524','NP',9999,'Rest Welt','','Nepal','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110960aeb64.09757010',0,'Niederländische Antillen','AN','ANT','530','AN',9999,'Rest Welt','','Netherlands Antilles','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110960c3e97.21901471',0,'Neukaledonien','NC','NCL','540','NC',9999,'Rest Welt','','New Caledonia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110960d8e58.96466103',0,'Neuseeland','NZ','NZL','554','NZ',9999,'Rest Welt','','New Zealand','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110960ec345.71805056',0,'Nicaragua','NI','NIC','558','NI',9999,'Rest Welt','','Nicaragua','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096101a79.70513227',0,'Niger','NE','NER','562','NE',9999,'Rest Welt','','Niger','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096116744.92008092',0,'Nigeria','NG','NGA','566','NG',9999,'Rest Welt','','Nigeria','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109612dc68.63806992',0,'Niue','NU','NIU','570','NU',9999,'Rest Welt','','Niue','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961442c2.82573898',0,'Norfolkinsel','NF','NFK','574','NF',9999,'Rest Welt','','Norfolk Island','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096162678.71164081',0,'Nördliche Marianen','MP','MNP','580','MP',9999,'Rest Welt','','Northern Mariana Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096176795.61257067',0,'Norwegen','NO','NOR','578','NO',9999,'Rest Europa','','Norway','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109618d825.87661926',0,'Oman','OM','OMN','512','OM',9999,'Rest Welt','','Oman','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961a2401.59039740',0,'Pakistan','PK','PAK','586','PK',9999,'Rest Welt','','Pakistan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961b7729.14290490',0,'Palau','PW','PLW','585','PW',9999,'Rest Welt','','Palau','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961cc384.18166560',0,'Panama','PA','PAN','591','PA',9999,'Rest Welt','','Panama','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961e3538.78435307',0,'Papua-Neuguinea','PG','PNG','598','PG',9999,'Rest Welt','','Papua New Guinea','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110961f9d61.52794273',0,'Paraguay','PY','PRY','600','PY',9999,'Rest Welt','','Paraguay','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109620b245.16261506',0,'Peru','PE','PER','604','PE',9999,'Rest Welt','','Peru','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109621faf8.40135556',0,'Philippinen','PH','PHL','608','PH',9999,'Rest Welt','','Philippines','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096234d62.44125992',0,'Pitcairn','PN','PCN','612','PN',9999,'Rest Welt','','Pitcairn','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109624d3f8.50953605',0,'Polen','PL','POL','616','PL',9999,'Europa','','Poland','','','Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11096279a22.50582479',0,'Puerto Rico','PR','PRI','630','PR',9999,'Rest Welt','','Puerto Rico','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109628f903.51478291',0,'Katar','QA','QAT','634','QA',9999,'Rest Welt','','Qatar','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110962a3ec5.65857240',0,'Réunion','RE','REU','638','RE',9999,'Rest Welt','','Réunion','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110962c3007.60363573',0,'Rumänien','RO','ROU','642','RO',9999,'Rest Europa','','Romania','','','Rest Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110962e40e6.75062153',0,'Russische Föderation','RU','RUS','643','RU',9999,'Rest Europa','','Russian Federation','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110962f8615.93666560',0,'Ruanda','RW','RWA','646','RW',9999,'Rest Welt','','Rwanda','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110963177a7.49289900',0,'St. Kitts und Nevis','KN','KNA','659','KN',9999,'Rest Welt','','Saint Kitts and Nevis','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109632fab4.68646740',0,'St. Lucia','LC','LCA','662','LC',9999,'Rest Welt','','Saint Lucia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110963443c3.29598809',0,'St. Vincent und die Grenadinen','VC','VCT','670','VC',9999,'Rest Welt','','Saint Vincent and The Grenadines','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096359986.06476221',0,'Samoa','WS','WSM','882','WS',9999,'Rest Welt','','Samoa','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096375757.44126946',0,'San Marino','SM','SMR','674','SM',9999,'Europa','','San Marino','','','Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109639b8c4.57484984',0,'Sao Tome und Principe','ST','STP','678','ST',9999,'Rest Welt','','Sao Tome and Principe','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110963b9b20.41500709',0,'Saudi-Arabien','SA','SAU','682','SA',9999,'Welt','','Saudi Arabia','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110963d9962.36307144',0,'Senegal','SN','SEN','686','SN',9999,'Rest Welt','','Senegal','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110963f98d8.68428379',0,'Serbien','RS','SRB','688','RS',9999,'Rest Europa','','Serbia','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096418496.77253079',0,'Seychellen','SC','SYC','690','SC',9999,'Rest Welt','','Seychelles','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096436968.69551351',0,'Sierra Leone','SL','SLE','694','SL',9999,'Rest Welt','','Sierra Leone','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096456a48.79608805',0,'Singapur','SG','SGP','702','SG',9999,'Rest Welt','','Singapore','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109647a265.29938154',0,'Slowakei','SK','SVK','703','SK',9999,'Europa','','Slovakia','','','Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f11096497149.85116254',0,'Slowenien','SI','SVN','705','SI',9999,'Rest Europa','','Slovenia','','','Rest Europe','','','','','',1,'2023-10-31 15:18:35'),
('8f241f110964b7bf9.49501835',0,'Salomonen','SB','SLB','90','SB',9999,'Rest Welt','','Solomon Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110964d5f29.11398308',0,'Somalia','SO','SOM','706','SO',9999,'Rest Welt','','Somalia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110964f2623.74976876',0,'Südafrika','ZA','ZAF','710','ZA',9999,'Rest Welt','','South Africa','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096531330.03198083',0,'Sri Lanka','LK','LKA','144','LK',9999,'Rest Welt','','Sri Lanka','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109654dca4.99466434',0,'Saint Helena','SH','SHN','654','SH',9999,'Rest Welt','','Saint Helena','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109656cde9.10816078',0,'Saint Pierre und Miquelon','PM','SPM','666','PM',9999,'Rest Welt','','Saint Pierre and Miquelon','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109658cbe5.08293991',0,'Sudan','SD','SDN','736','SD',9999,'Rest Welt','','Sudan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110965c7347.75108681',0,'Suriname','SR','SUR','740','SR',9999,'Rest Welt','','Suriname','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110965eb7b7.26149742',0,'Svalbard und Jan Mayen','SJ','SJM','744','SJ',9999,'Rest Welt','','Svalbard and Jan Mayen','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109660c113.62780718',0,'Swasiland','SZ','SWZ','748','SZ',9999,'Rest Welt','','Swaziland','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109666b7f3.81435898',0,'Syrien','SY','SYR','760','SY',9999,'Rest Welt','','Syria','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096687ec7.58824735',0,'Republik China (Taiwan)','TW','TWN','158','TW',9999,'Rest Welt','','Taiwan, Province of China','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110966a54d1.43798997',0,'Tadschikistan','TJ','TJK','762','TJ',9999,'Rest Welt','','Tajikistan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110966c3a75.68297960',0,'Tansania','TZ','TZA','834','TZ',9999,'Rest Welt','','Tanzania','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096707e08.60512709',0,'Thailand','TH','THA','764','TH',9999,'Rest Welt','','Thailand','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110967241e1.34925220',0,'Togo','TG','TGO','768','TG',9999,'Rest Welt','','Togo','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096742565.72138875',0,'Tokelau','TK','TKL','772','TK',9999,'Rest Welt','','Tokelau','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096762b31.03069244',0,'Tonga','TO','TON','776','TO',9999,'Rest Welt','','Tonga','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109677ed23.84886671',0,'Trinidad und Tobago','TT','TTO','780','TT',9999,'Rest Welt','','Trinidad and Tobago','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109679d988.46004322',0,'Tunesien','TN','TUN','788','TN',9999,'Welt','','Tunisia','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110967bba40.88233204',0,'Türkei','TR','TUR','792','TR',9999,'Rest Europa','','Turkey','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110967d8f65.52699796',0,'Turkmenistan','TM','TKM','795','TM',9999,'Rest Welt','','Turkmenistan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110967f73f8.13141492',0,'Turks- und Caicosinseln','TC','TCA','796','TC',9999,'Rest Welt','','Turks and Caicos Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109680ec30.97426963',0,'Tuvalu','TV','TUV','798','TV',9999,'Rest Welt','','Tuvalu','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096823019.47846368',0,'Uganda','UG','UGA','800','UG',9999,'Rest Welt','','Uganda','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968391d2.37199812',0,'Ukraine','UA','UKR','804','UA',9999,'Rest Europa','','Ukraine','','','Rest Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109684bf15.63071279',0,'Vereinigte Arabische Emirate','AE','ARE','784','AE',9999,'Rest Welt','','United Arab Emirates','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096877ac0.98748826',1,'Vereinigte Staaten von Amerika','US','USA','840','US',9999,'Welt','','United States','','','World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096894977.41239553',0,'United States Minor Outlying Islands','UM','UMI','581','UM',9999,'Rest Welt','','United States Minor Outlying Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968a7cc9.56710143',0,'Uruguay','UY','URY','858','UY',9999,'Rest Welt','','Uruguay','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968a7cc9.56710199',0,'Saint-Barthélemy','BL','BLM','652','BL',9999,'Rest Welt','','Saint Barthélemy','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968bec45.44161857',0,'Usbekistan','UZ','UZB','860','UZ',9999,'Rest Welt','','Uzbekistan','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968d3f03.13630334',0,'Vanuatu','VU','VUT','548','VU',9999,'Rest Welt','','Vanuatu','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968ebc30.63792746',0,'Heiliger Stuhl (Vatikanstadt)','VA','VAT','336','VA',9999,'Europa','','Holy See (Vatican City State)','','','Europe','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110968ebc30.63792799',0,'Palästinische Gebiete','PS','PSE','275','PS',9999,'Rest Welt','','Palestinian Territory, Occupied','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096902d92.14742486',0,'Venezuela','VE','VEN','862','VE',9999,'Rest Welt','','Venezuela','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096919d00.92534927',0,'Vietnam','VN','VNM','704','VN',9999,'Rest Welt','','Vietnam','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109692fc04.15216034',0,'Britische Jungferninseln','VG','VGB','92','VG',9999,'Rest Welt','','Virgin Islands, British','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096944468.61956573',0,'Amerikanische Jungferninseln','VI','VIR','850','VI',9999,'Rest Welt','','Virgin Islands, U.S.','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096944468.61956599',0,'Jersey','JE','JEY','832','JE',9999,'Rest Welt','','Jersey','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110969598c8.76966113',0,'Wallis und Futuna','WF','WLF','876','WF',9999,'Rest Welt','','Wallis and Futuna','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f1109696e4e9.33006292',0,'Westsahara','EH','ESH','732','EH',9999,'Rest Welt','','Western Sahara','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096982354.73448958',0,'Jemen','YE','YEM','887','YE',9999,'Rest Welt','','Yemen','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f11096982354.73448999',0,'Isle of Man','IM','IMN','833','IM',9999,'Rest Welt','','Isle Of Man','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110969c34a2.42564730',0,'Sambia','ZM','ZMB','894','ZM',9999,'Rest Welt','','Zambia','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('8f241f110969da699.04185888',0,'Simbabwe','ZW','ZWE','716','ZW',9999,'Rest Welt','','Zimbabwe','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('a7c40f631fc920687.20179984',1,'Deutschland','DE','DEU','276','DE',9999,'EU1','','Germany','','','EU1','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f6320aeb2ec2.72885259',1,'Österreich','AT','AUT','40','AT',9999,'EU1','','Austria','','','EU1','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f6321c6f6109.43859248',1,'Schweiz','CH','CHE','756','CH',9999,'EU1','','Switzerland','','','EU1','','','','','',0,'2023-10-31 15:18:35'),
('a7c40f6322d842ae3.83331920',0,'Liechtenstein','LI','LIE','438','LI',9999,'EU1','','Liechtenstein','','','EU1','','','','','',0,'2023-10-31 15:18:35'),
('a7c40f6323c4bfb36.59919433',0,'Italien','IT','ITA','380','IT',9999,'EU1','','Italy','','','EU1','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f63264309e05.58576680',0,'Luxemburg','LU','LUX','442','LU',9999,'EU1','','Luxembourg','','','EU1','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f63272a57296.32117580',0,'Frankreich','FR','FRA','250','FR',9999,'EU1','','France','','','EU1','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632848c5217.53322339',0,'Schweden','SE','SWE','752','SE',9999,'EU2','','Sweden','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f63293c19d65.37472814',0,'Finnland','FI','FIN','246','FI',9999,'EU2','','Finland','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632a0804ab5.18804076',1,'Vereinigtes Königreich','GB','GBR','826','GB',9999,'EU2','','United Kingdom','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632a0804ab5.18804099',0,'Åland Inseln','AX','ALA','248','AX',9999,'Rest Welt','','Åland Islands','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('a7c40f632be4237c2.48517912',0,'Irland','IE','IRL','372','IE',9999,'EU2','','Ireland','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632cdd63c52.64272623',0,'Niederlande','NL','NLD','528','NL',9999,'EU2','','Netherlands','','','EU2','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632e04633c9.47194042',0,'Belgien','BE','BEL','56','BE',9999,'Rest Europäische Union','','Belgium','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632f65bd8e2.84963272',0,'Portugal','PT','PRT','620','PT',9999,'Rest Europäische Union','','Portugal','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f632f65bd8e2.84963299',0,'Saint-Martin','MF','MAF','663','MF',9999,'Rest Welt','','Saint Martin','','','Rest World','','','','','',0,'2023-10-31 15:18:35'),
('a7c40f633038cd578.22975442',0,'Spanien','ES','ESP','724','ES',9999,'Rest Europäische Union','','Spain','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35'),
('a7c40f633114e8fc6.25257477',0,'Griechenland','GR','GRC','300','EL',9999,'Rest Europäische Union','','Greece','','','Rest of EU','','','','','',1,'2023-10-31 15:18:35');
/*!40000 ALTER TABLE `oxcountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdel2delset`
--

DROP TABLE IF EXISTS `oxdel2delset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdel2delset` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDELID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping cost rule id (oxdelivery)',
  `OXDELSETID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery method id (oxdeliveryset)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXDELID` (`OXDELID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between Shipping cost rules (oxdelivery) and delivery methods (oxdeliveryset)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdel2delset`
--

LOCK TABLES `oxdel2delset` WRITE;
/*!40000 ALTER TABLE `oxdel2delset` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdel2delset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdelivery`
--

DROP TABLE IF EXISTS `oxdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdelivery` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Delivery shipping cost rule id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXADDSUMTYPE` enum('%','abs') NOT NULL DEFAULT 'abs' COMMENT 'Price Surcharge/Reduction type (abs|%)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Price Surcharge/Reduction amount',
  `OXDELTYPE` enum('a','s','w','p') NOT NULL DEFAULT 'a' COMMENT 'Condition type: a - Amount, s - Size, w - Weight, p - Price',
  `OXPARAM` double NOT NULL DEFAULT '0' COMMENT 'Condition param from (e.g. amount from 1)',
  `OXPARAMEND` double NOT NULL DEFAULT '0' COMMENT 'Condition param to (e.g. amount to 10)',
  `OXFIXED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Calculation Rules: 0 - Once per Cart, 1 - Once for each different product, 2 - For each product',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Order of Rules Processing',
  `OXFINALIZE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Do not run further rules if this rule is valid and is being run',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Delivery shipping cost rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdelivery`
--

LOCK TABLES `oxdelivery` WRITE;
/*!40000 ALTER TABLE `oxdelivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdelivery2shop`
--

DROP TABLE IF EXISTS `oxdelivery2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdelivery2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdelivery2shop`
--

LOCK TABLES `oxdelivery2shop` WRITE;
/*!40000 ALTER TABLE `oxdelivery2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdelivery2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdeliveryset`
--

DROP TABLE IF EXISTS `oxdeliveryset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdeliveryset` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Delivery method id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` char(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` char(255) NOT NULL DEFAULT '',
  `OXTITLE_2` char(255) NOT NULL DEFAULT '',
  `OXTITLE_3` char(255) NOT NULL DEFAULT '',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  `OXTRACKINGURL` varchar(255) NOT NULL,
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Delivery (shipping) methods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdeliveryset`
--

LOCK TABLES `oxdeliveryset` WRITE;
/*!40000 ALTER TABLE `oxdeliveryset` DISABLE KEYS */;
INSERT INTO `oxdeliveryset` (`OXID`, `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXACTIVEFROM`, `OXACTIVETO`, `OXTITLE`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`, `OXPOS`, `OXTIMESTAMP`, `OXTRACKINGURL`) VALUES ('oxidstandard',901,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Standard','Standard','','',10,'2023-10-31 15:18:39','');
/*!40000 ALTER TABLE `oxdeliveryset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdeliveryset2shop`
--

DROP TABLE IF EXISTS `oxdeliveryset2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdeliveryset2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdeliveryset2shop`
--

LOCK TABLES `oxdeliveryset2shop` WRITE;
/*!40000 ALTER TABLE `oxdeliveryset2shop` DISABLE KEYS */;
INSERT INTO `oxdeliveryset2shop` (`OXSHOPID`, `OXMAPOBJECTID`, `OXTIMESTAMP`) VALUES (1,901,'2023-10-31 15:18:39');
/*!40000 ALTER TABLE `oxdeliveryset2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdiscount`
--

DROP TABLE IF EXISTS `oxdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdiscount` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Discount id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL,
  `OXTITLE_2` varchar(128) NOT NULL,
  `OXTITLE_3` varchar(128) NOT NULL,
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Valid from specified amount of articles',
  `OXAMOUNTTO` double NOT NULL DEFAULT '999999' COMMENT 'Valid to specified amount of articles',
  `OXPRICETO` double NOT NULL DEFAULT '999999' COMMENT 'Valid to specified purchase price',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Valid from specified purchase price',
  `OXADDSUMTYPE` enum('%','abs','itm') NOT NULL DEFAULT '%' COMMENT 'Discount type (%,abs,itm)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Magnitude of the discount',
  `OXITMARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Free article id, that will be added as a discount',
  `OXITMAMOUNT` double NOT NULL DEFAULT '1' COMMENT 'The quantity of free article that will be added to basket with discounted article',
  `OXITMMULTIPLE` int(1) NOT NULL DEFAULT '0' COMMENT 'Should free article amount be multiplied by discounted item quantity in basket',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Defines the order discounts are applied to basket or product',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `UNIQ_OXSORT` (`OXSHOPID`,`OXSORT`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXACTIVEFROM` (`OXACTIVEFROM`),
  KEY `OXACTIVETO` (`OXACTIVETO`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Article discounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdiscount`
--

LOCK TABLES `oxdiscount` WRITE;
/*!40000 ALTER TABLE `oxdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdiscount2shop`
--

DROP TABLE IF EXISTS `oxdiscount2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdiscount2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdiscount2shop`
--

LOCK TABLES `oxdiscount2shop` WRITE;
/*!40000 ALTER TABLE `oxdiscount2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdiscount2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxfield2role`
--

DROP TABLE IF EXISTS `oxfield2role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxfield2role` (
  `OXFIELDID` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Field id',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Field type',
  `OXROLEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Roles id (oxroles)',
  `OXIDX` int(1) NOT NULL COMMENT 'Role permission: 0 - Deny, 1 - Read, 2 - Full',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXFIELDID`,`OXTYPE`,`OXROLEID`),
  KEY `OXIDX` (`OXIDX`),
  KEY `OXROLEID` (`OXROLEID`),
  KEY `OXTYPE` (`OXTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between fields and roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxfield2role`
--

LOCK TABLES `oxfield2role` WRITE;
/*!40000 ALTER TABLE `oxfield2role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxfield2role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxfield2shop`
--

DROP TABLE IF EXISTS `oxfield2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxfield2shop` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (oxarticles)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXPRICE` double NOT NULL COMMENT 'Price',
  `OXPRICEA` double NOT NULL COMMENT 'Price A',
  `OXPRICEB` double NOT NULL COMMENT 'Price B',
  `OXPRICEC` double NOT NULL COMMENT 'Price C',
  `OXUPDATEPRICE` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxprice will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEA` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricea will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEB` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpriceb will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEC` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricec will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICETIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date, when oxprice[a,b,c] should be updated to oxupdateprice[a,b,c] values',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXARTID` (`OXARTID`,`OXSHOPID`),
  KEY `OXUPDATEPRICETIME` (`OXUPDATEPRICETIME`),
  KEY `OXPRICE` (`OXPRICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between fields and shops (multishops fields)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxfield2shop`
--

LOCK TABLES `oxfield2shop` WRITE;
/*!40000 ALTER TABLE `oxfield2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxfield2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxfiles`
--

DROP TABLE IF EXISTS `oxfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxfiles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'File id',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (oxarticles)',
  `OXFILENAME` varchar(128) NOT NULL COMMENT 'Filename',
  `OXSTOREHASH` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed filename, used for file directory path creation',
  `OXPURCHASEDONLY` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Download is available only after purchase',
  `OXMAXDOWNLOADS` int(11) NOT NULL DEFAULT '-1' COMMENT 'Maximum count of downloads after order',
  `OXMAXUNREGDOWNLOADS` int(11) NOT NULL DEFAULT '-1' COMMENT 'Maximum count of downloads for not registered users after order',
  `OXLINKEXPTIME` int(11) NOT NULL DEFAULT '-1' COMMENT 'Expiration time of download link in hours',
  `OXDOWNLOADEXPTIME` int(11) NOT NULL DEFAULT '-1' COMMENT 'Expiration time of download link after the first download in hours',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`OXID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files available for users to download';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxfiles`
--

LOCK TABLES `oxfiles` WRITE;
/*!40000 ALTER TABLE `oxfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxgroups`
--

DROP TABLE IF EXISTS `oxgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxgroups` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Group id',
  `OXRRID` bigint(21) unsigned NOT NULL COMMENT 'Group numeric index',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxgroups`
--

LOCK TABLES `oxgroups` WRITE;
/*!40000 ALTER TABLE `oxgroups` DISABLE KEYS */;
INSERT INTO `oxgroups` (`OXID`, `OXRRID`, `OXACTIVE`, `OXTITLE`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`, `OXTIMESTAMP`) VALUES ('oxidadmin',9,1,'Shop-Admin','Store Administrator','','','2023-10-31 15:18:39'),
('oxidblacklist',0,1,'Blacklist','Blacklist','','','2023-10-31 15:18:35'),
('oxidblocked',13,1,'BLOCKED','BLOCKED','','','2023-10-31 15:18:39'),
('oxidcustomer',14,1,'Kunde','Customer','','','2023-10-31 15:18:39'),
('oxiddealer',7,1,'Händler','Retailer','','','2023-10-31 15:18:39'),
('oxidforeigncustomer',4,1,'Auslandskunde','Foreign Customer','','','2023-10-31 15:18:39'),
('oxidgoodcust',3,1,'Grosser Umsatz','Huge Turnover','','','2023-10-31 15:18:39'),
('oxidmiddlecust',2,1,'Mittlerer Umsatz','Medium Turnover','','','2023-10-31 15:18:39'),
('oxidnewcustomer',5,1,'Inlandskunde','Domestic Customer','','','2023-10-31 15:18:39'),
('oxidnewsletter',8,1,'Newsletter-Abonnenten','Newsletter Recipients','','','2023-10-31 15:18:39'),
('oxidnotyetordered',15,1,'Noch nicht gekauft','Not Yet Purchased','','','2023-10-31 15:18:39'),
('oxidpowershopper',6,1,'Powershopper','Powershopper','','','2023-10-31 15:18:39'),
('oxidpricea',11,1,'Preis A','Price A','','','2023-10-31 15:18:39'),
('oxidpriceb',10,1,'Preis B','Price B','','','2023-10-31 15:18:39'),
('oxidpricec',12,1,'Preis C','Price C','','','2023-10-31 15:18:39'),
('oxidsmallcust',1,1,'Geringer Umsatz','Less Turnover','','','2023-10-31 15:18:39');
/*!40000 ALTER TABLE `oxgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxinvitations`
--

DROP TABLE IF EXISTS `oxinvitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxinvitations` (
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser), who sent invitation',
  `OXDATE` date NOT NULL COMMENT 'Creation time',
  `OXEMAIL` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Recipient email',
  `OXPENDING` mediumint(9) NOT NULL COMMENT 'Has recipient user registered',
  `OXACCEPTED` mediumint(9) NOT NULL COMMENT 'Is recipient user accepted',
  `OXTYPE` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Invitation type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXDATE` (`OXDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User sent invitations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxinvitations`
--

LOCK TABLES `oxinvitations` WRITE;
/*!40000 ALTER TABLE `oxinvitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxinvitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxlinks`
--

DROP TABLE IF EXISTS `oxlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxlinks` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Link id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link url',
  `OXURLDESC` text NOT NULL COMMENT 'Description (multilanguage)',
  `OXURLDESC_1` text NOT NULL,
  `OXURLDESC_2` text NOT NULL,
  `OXURLDESC_3` text NOT NULL,
  `OXINSERT` datetime DEFAULT NULL COMMENT 'Creation time (set by user)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXINSERT` (`OXINSERT`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxlinks`
--

LOCK TABLES `oxlinks` WRITE;
/*!40000 ALTER TABLE `oxlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxlinks2shop`
--

DROP TABLE IF EXISTS `oxlinks2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxlinks2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxlinks2shop`
--

LOCK TABLES `oxlinks2shop` WRITE;
/*!40000 ALTER TABLE `oxlinks2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxlinks2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmanufacturers`
--

DROP TABLE IF EXISTS `oxmanufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmanufacturers` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Manufacturer id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXICON_ALT` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative Icon filename',
  `OXPICTURE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Picture filename',
  `OXTHUMBNAIL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Picture thumbnail filename',
  `OXPROMOTION_ICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon for promotion filename',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXSORT` int(11) NOT NULL DEFAULT '0',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXMAPID` (`OXMAPID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop manufacturers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmanufacturers`
--

LOCK TABLES `oxmanufacturers` WRITE;
/*!40000 ALTER TABLE `oxmanufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxmanufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmanufacturers2shop`
--

DROP TABLE IF EXISTS `oxmanufacturers2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmanufacturers2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmanufacturers2shop`
--

LOCK TABLES `oxmanufacturers2shop` WRITE;
/*!40000 ALTER TABLE `oxmanufacturers2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxmanufacturers2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmediaurls`
--

DROP TABLE IF EXISTS `oxmediaurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmediaurls` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Media id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (oxarticles)',
  `OXURL` varchar(255) NOT NULL COMMENT 'Media url or filename',
  `OXDESC` varchar(255) NOT NULL COMMENT 'Description (multilanguage)',
  `OXDESC_1` varchar(255) NOT NULL,
  `OXDESC_2` varchar(255) NOT NULL,
  `OXDESC_3` varchar(255) NOT NULL,
  `OXISUPLOADED` int(1) NOT NULL DEFAULT '0' COMMENT 'Is oxurl field used for filename or url',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores objects media';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmediaurls`
--

LOCK TABLES `oxmediaurls` WRITE;
/*!40000 ALTER TABLE `oxmediaurls` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxmediaurls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmigrations_ce`
--

DROP TABLE IF EXISTS `oxmigrations_ce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmigrations_ce` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmigrations_ce`
--

LOCK TABLES `oxmigrations_ce` WRITE;
/*!40000 ALTER TABLE `oxmigrations_ce` DISABLE KEYS */;
INSERT INTO `oxmigrations_ce` (`version`, `executed_at`, `execution_time`) VALUES ('OxidEsales\\EshopCommunity\\Migrations\\Version20170718124421','2023-10-31 16:18:36',100),
('OxidEsales\\EshopCommunity\\Migrations\\Version20171018144650','2023-10-31 16:18:36',33),
('OxidEsales\\EshopCommunity\\Migrations\\Version20180214152228','2023-10-31 16:18:36',0),
('OxidEsales\\EshopCommunity\\Migrations\\Version20180228160418','2023-10-31 16:18:36',16),
('OxidEsales\\EshopCommunity\\Migrations\\Version20180703135728','2023-10-31 16:18:36',2),
('OxidEsales\\EshopCommunity\\Migrations\\Version20180928072235','2023-10-31 16:18:36',0),
('OxidEsales\\EshopCommunity\\Migrations\\Version20191007144155','2023-10-31 16:18:36',19),
('OxidEsales\\EshopCommunity\\Migrations\\Version20201029110624','2023-10-31 16:18:36',355),
('OxidEsales\\EshopCommunity\\Migrations\\Version20201103010101','2023-10-31 16:18:36',55),
('OxidEsales\\EshopCommunity\\Migrations\\Version20201203101929','2023-10-31 16:18:36',14),
('OxidEsales\\EshopCommunity\\Migrations\\Version20211117193324','2023-10-31 16:18:36',105),
('OxidEsales\\EshopCommunity\\Migrations\\Version20230109135625','2023-10-31 16:18:36',66),
('OxidEsales\\EshopCommunity\\Migrations\\Version20230301123522','2023-10-31 16:18:37',132);
/*!40000 ALTER TABLE `oxmigrations_ce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmigrations_ddoemedialibrary`
--

DROP TABLE IF EXISTS `oxmigrations_ddoemedialibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmigrations_ddoemedialibrary` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmigrations_ddoemedialibrary`
--

LOCK TABLES `oxmigrations_ddoemedialibrary` WRITE;
/*!40000 ALTER TABLE `oxmigrations_ddoemedialibrary` DISABLE KEYS */;
INSERT INTO `oxmigrations_ddoemedialibrary` (`version`, `executed_at`, `execution_time`) VALUES ('OxidEsales\\MediaLibrary\\Migrations\\Version20230125140859','2023-10-31 16:18:39',17),
('OxidEsales\\MediaLibrary\\Migrations\\Version20230125141525','2023-10-31 16:18:39',396),
('OxidEsales\\MediaLibrary\\Migrations\\Version20230203134229','2023-10-31 16:18:39',329);
/*!40000 ALTER TABLE `oxmigrations_ddoemedialibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmigrations_ee`
--

DROP TABLE IF EXISTS `oxmigrations_ee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmigrations_ee` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmigrations_ee`
--

LOCK TABLES `oxmigrations_ee` WRITE;
/*!40000 ALTER TABLE `oxmigrations_ee` DISABLE KEYS */;
INSERT INTO `oxmigrations_ee` (`version`, `executed_at`, `execution_time`) VALUES ('OxidEsales\\EshopEnterprise\\Migrations\\Version20160919103142','2023-10-31 16:18:37',1507),
('OxidEsales\\EshopEnterprise\\Migrations\\Version20171018144650','2023-10-31 16:18:39',153),
('OxidEsales\\EshopEnterprise\\Migrations\\Version20181114132800','2023-10-31 16:18:39',1),
('OxidEsales\\EshopEnterprise\\Migrations\\Version20190917101922','2023-10-31 16:18:39',41);
/*!40000 ALTER TABLE `oxmigrations_ee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmigrations_pe`
--

DROP TABLE IF EXISTS `oxmigrations_pe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmigrations_pe` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmigrations_pe`
--

LOCK TABLES `oxmigrations_pe` WRITE;
/*!40000 ALTER TABLE `oxmigrations_pe` DISABLE KEYS */;
INSERT INTO `oxmigrations_pe` (`version`, `executed_at`, `execution_time`) VALUES ('OxidEsales\\EshopProfessional\\Migrations\\Version20160919103142','2023-10-31 16:18:37',382),
('OxidEsales\\EshopProfessional\\Migrations\\Version20230104155434','2023-10-31 16:18:37',1);
/*!40000 ALTER TABLE `oxmigrations_pe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmigrations_visualcms`
--

DROP TABLE IF EXISTS `oxmigrations_visualcms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmigrations_visualcms` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmigrations_visualcms`
--

LOCK TABLES `oxmigrations_visualcms` WRITE;
/*!40000 ALTER TABLE `oxmigrations_visualcms` DISABLE KEYS */;
INSERT INTO `oxmigrations_visualcms` (`version`, `executed_at`, `execution_time`) VALUES ('OxidEsales\\VisualCmsModule\\Migrations\\Version20220809094719','2023-10-31 16:18:40',1613);
/*!40000 ALTER TABLE `oxmigrations_visualcms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxnewssubscribed`
--

DROP TABLE IF EXISTS `oxnewssubscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxnewssubscribed` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Subscription id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXSAL` varchar(64) NOT NULL DEFAULT '' COMMENT 'User title prefix (Mr/Mrs)',
  `OXFNAME` char(128) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` char(128) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXEMAIL` char(128) NOT NULL DEFAULT '' COMMENT 'Email',
  `OXDBOPTIN` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Subscription status: 0 - not subscribed, 1 - subscribed, 2 - not confirmed',
  `OXEMAILFAILED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Subscription email sending status',
  `OXSUBSCRIBED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Subscription date',
  `OXUNSUBSCRIBED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Unsubscription date',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXEMAIL` (`OXEMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxnewssubscribed`
--

LOCK TABLES `oxnewssubscribed` WRITE;
/*!40000 ALTER TABLE `oxnewssubscribed` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxnewssubscribed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2action`
--

DROP TABLE IF EXISTS `oxobject2action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2action` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXACTIONID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Action id (oxactions)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table set by oxclass)',
  `OXCLASS` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object table name',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXACTIONID` (`OXACTIONID`,`OXCLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between actions (oxactions) and objects (table set by oxclass)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2action`
--

LOCK TABLES `oxobject2action` WRITE;
/*!40000 ALTER TABLE `oxobject2action` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2article`
--

DROP TABLE IF EXISTS `oxobject2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Cross-selling Article id (oxarticles)',
  `OXARTICLENID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Main Article id (oxarticles)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXARTICLENID` (`OXARTICLENID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between cross-selling articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2article`
--

LOCK TABLES `oxobject2article` WRITE;
/*!40000 ALTER TABLE `oxobject2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2attribute`
--

DROP TABLE IF EXISTS `oxobject2attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2attribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXATTRID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Attribute id (oxattributes)',
  `OXVALUE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Attribute value (multilanguage)',
  `OXPOS` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXVALUE_1` varchar(255) NOT NULL DEFAULT '',
  `OXVALUE_2` varchar(255) NOT NULL DEFAULT '',
  `OXVALUE_3` varchar(255) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `mainidx` (`OXATTRID`,`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2attribute`
--

LOCK TABLES `oxobject2attribute` WRITE;
/*!40000 ALTER TABLE `oxobject2attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2category`
--

DROP TABLE IF EXISTS `oxobject2category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2category` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXCATNID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Category id (oxcategory)',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXMAINIDXU` (`OXCATNID`,`OXOBJECTID`,`OXSHOPID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXPOS` (`OXPOS`),
  KEY `OXTIME` (`OXTIME`),
  KEY `OXMAINIDX` (`OXCATNID`,`OXOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2category`
--

LOCK TABLES `oxobject2category` WRITE;
/*!40000 ALTER TABLE `oxobject2category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2delivery`
--

DROP TABLE IF EXISTS `oxobject2delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2delivery` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDELIVERYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery id (oxdelivery)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXDELIVERYID` (`OXDELIVERYID`,`OXTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between delivery cost rules and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2delivery`
--

LOCK TABLES `oxobject2delivery` WRITE;
/*!40000 ALTER TABLE `oxobject2delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2discount`
--

DROP TABLE IF EXISTS `oxobject2discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2discount` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDISCOUNTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Discount id (oxdiscount)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxdiscidx` (`OXDISCOUNTID`,`OXTYPE`),
  KEY `mainidx` (`OXOBJECTID`,`OXDISCOUNTID`,`OXTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between discounts and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2discount`
--

LOCK TABLES `oxobject2discount` WRITE;
/*!40000 ALTER TABLE `oxobject2discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2group`
--

DROP TABLE IF EXISTS `oxobject2group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2group` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id',
  `OXGROUPSID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Group id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `UNIQ_OBJECTGROUP` (`OXGROUPSID`,`OXOBJECTID`,`OXSHOPID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between users and groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2group`
--

LOCK TABLES `oxobject2group` WRITE;
/*!40000 ALTER TABLE `oxobject2group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2list`
--

DROP TABLE IF EXISTS `oxobject2list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2list` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXLISTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Listmania id (oxrecommlists)',
  `OXDESC` text NOT NULL COMMENT 'Description',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXLISTID` (`OXLISTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and listmania lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2list`
--

LOCK TABLES `oxobject2list` WRITE;
/*!40000 ALTER TABLE `oxobject2list` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2payment`
--

DROP TABLE IF EXISTS `oxobject2payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2payment` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXPAYMENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXPAYMENTID` (`OXPAYMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between payments and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2payment`
--

LOCK TABLES `oxobject2payment` WRITE;
/*!40000 ALTER TABLE `oxobject2payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2role`
--

DROP TABLE IF EXISTS `oxobject2role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2role` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Object id (e.g. oxgroups, oxuser)',
  `OXROLEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Role id (oxroles)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Type (t.g. oxgroups, oxuser)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXROLEID` (`OXROLEID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between roles and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2role`
--

LOCK TABLES `oxobject2role` WRITE;
/*!40000 ALTER TABLE `oxobject2role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2selectlist`
--

DROP TABLE IF EXISTS `oxobject2selectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2selectlist` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSELNID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Selection list id (oxselectlist)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXSELNID` (`OXSELNID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and selection lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2selectlist`
--

LOCK TABLES `oxobject2selectlist` WRITE;
/*!40000 ALTER TABLE `oxobject2selectlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2selectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2seodata`
--

DROP TABLE IF EXISTS `oxobject2seodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2seodata` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Objects id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXKEYWORDS` text NOT NULL COMMENT 'Keywords',
  `OXDESCRIPTION` text NOT NULL COMMENT 'Description',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXOBJECTID`,`OXSHOPID`,`OXLANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2seodata`
--

LOCK TABLES `oxobject2seodata` WRITE;
/*!40000 ALTER TABLE `oxobject2seodata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2seodata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobjectrights`
--

DROP TABLE IF EXISTS `oxobjectrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobjectrights` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops), value 1 in case no shop was specified',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Object id ()',
  `OXGROUPIDX` bigint(20) unsigned NOT NULL COMMENT 'Group index',
  `OXOFFSET` int(10) unsigned NOT NULL COMMENT 'Group numeric index',
  `OXACTION` int(10) unsigned NOT NULL COMMENT 'Action',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXOBJECTID`,`OXOFFSET`,`OXACTION`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXOFFSET` (`OXOFFSET`),
  KEY `OXACTION` (`OXACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Object rights';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobjectrights`
--

LOCK TABLES `oxobjectrights` WRITE;
/*!40000 ALTER TABLE `oxobjectrights` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobjectrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorder`
--

DROP TABLE IF EXISTS `oxorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorder` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXORDERDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Order date',
  `OXORDERNR` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Order number',
  `OXBILLCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Company name',
  `OXBILLEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Email',
  `OXBILLFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: First name',
  `OXBILLLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Last name',
  `OXBILLSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Street name',
  `OXBILLSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'Billing info: House number',
  `OXBILLADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Additional info',
  `OXBILLUSTID` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: VAT ID No.',
  `OXBILLUSTIDSTATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'User VAT id status: 1 - valid, 0 - invalid',
  `OXBILLCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: City',
  `OXBILLCOUNTRYID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Billing info: Country id (oxcountry)',
  `OXBILLSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Billing info: US State id (oxstates)',
  `OXBILLZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'Billing info: Zip code',
  `OXBILLFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: Phone number',
  `OXBILLFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: Fax number',
  `OXBILLSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: User title prefix (Mr/Mrs)',
  `OXDELCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Company name',
  `OXDELFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: First name',
  `OXDELLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Last name',
  `OXDELSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Street name',
  `OXDELSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'Shipping info: House number',
  `OXDELADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Additional info',
  `OXDELCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: City',
  `OXDELCOUNTRYID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping info: Country id (oxcountry)',
  `OXDELSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping info: US State id (oxstates)',
  `OXDELZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'Shipping info: Zip code',
  `OXDELFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: Phone number',
  `OXDELFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: Fax number',
  `OXDELSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: User title prefix (Mr/Mrs)',
  `OXPAYMENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User payment id (oxuserpayments)',
  `OXPAYMENTTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXTOTALNETSUM` double NOT NULL DEFAULT '0' COMMENT 'Total net sum',
  `OXTOTALBRUTSUM` double NOT NULL DEFAULT '0' COMMENT 'Total brut sum',
  `OXTOTALORDERSUM` double NOT NULL DEFAULT '0' COMMENT 'Total order sum',
  `OXARTVAT1` double NOT NULL DEFAULT '0' COMMENT 'First VAT',
  `OXARTVATPRICE1` double NOT NULL DEFAULT '0' COMMENT 'First calculated VAT price',
  `OXARTVAT2` double NOT NULL DEFAULT '0' COMMENT 'Second VAT',
  `OXARTVATPRICE2` double NOT NULL DEFAULT '0' COMMENT 'Second calculated VAT price',
  `OXDELCOST` double NOT NULL DEFAULT '0' COMMENT 'Delivery price',
  `OXDELVAT` double NOT NULL DEFAULT '0' COMMENT 'Delivery VAT',
  `OXPAYCOST` double NOT NULL DEFAULT '0' COMMENT 'Payment cost',
  `OXPAYVAT` double NOT NULL DEFAULT '0' COMMENT 'Payment VAT',
  `OXWRAPCOST` double NOT NULL DEFAULT '0' COMMENT 'Wrapping cost',
  `OXWRAPVAT` double NOT NULL DEFAULT '0' COMMENT 'Wrapping VAT',
  `OXGIFTCARDCOST` double NOT NULL DEFAULT '0' COMMENT 'Giftcard cost',
  `OXGIFTCARDVAT` double NOT NULL DEFAULT '0' COMMENT 'Giftcard VAT',
  `OXCARDID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Gift card id (oxwrapping)',
  `OXCARDTEXT` text NOT NULL COMMENT 'Gift card text',
  `OXDISCOUNT` double NOT NULL DEFAULT '0' COMMENT 'Additional discount for order (abs)',
  `OXEXPORT` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is exported',
  `OXBILLNR` varchar(128) NOT NULL DEFAULT '' COMMENT 'Invoice No.',
  `OXBILLDATE` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Invoice sent date',
  `OXTRACKCODE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Tracking code',
  `OXSENDDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Order shipping date',
  `OXREMARK` text NOT NULL COMMENT 'User remarks',
  `OXVOUCHERDISCOUNT` double NOT NULL DEFAULT '0' COMMENT 'Coupon (voucher) discount price',
  `OXCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Currency',
  `OXCURRATE` double NOT NULL DEFAULT '0' COMMENT 'Currency rate',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder: ORDERFOLDER_FINISHED, ORDERFOLDER_NEW, ORDERFOLDER_PROBLEMS',
  `OXTRANSID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Paypal: Transaction id',
  `OXPAYID` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `OXXID` varchar(64) NOT NULL DEFAULT '',
  `OXPAID` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when order was paid',
  `OXSTORNO` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Order cancelled',
  `OXIP` varchar(39) NOT NULL DEFAULT '' COMMENT 'User ip address',
  `OXTRANSSTATUS` varchar(30) NOT NULL DEFAULT '' COMMENT 'Order status: NOT_FINISHED, OK, ERROR',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXINVOICENR` int(11) NOT NULL DEFAULT '0' COMMENT 'Invoice number',
  `OXDELTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery id (oxdeliveryset)',
  `OXPIXIEXPORT` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Field for 3rd party modules export',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXISNETTOMODE` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Order created in netto mode',
  PRIMARY KEY (`OXID`),
  KEY `MAINIDX` (`OXSHOPID`,`OXORDERDATE`),
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXORDERNR` (`OXORDERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop orders information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorder`
--

LOCK TABLES `oxorder` WRITE;
/*!40000 ALTER TABLE `oxorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorderarticles`
--

DROP TABLE IF EXISTS `oxorderarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorderarticles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order article id',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Order id (oxorder)',
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Amount',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXARTNUM` varchar(255) NOT NULL DEFAULT '' COMMENT 'Article number',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description',
  `OXSELVARIANT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Selected variant',
  `OXNETPRICE` double NOT NULL DEFAULT '0' COMMENT 'Full netto price (oxnprice * oxamount)',
  `OXBRUTPRICE` double NOT NULL DEFAULT '0' COMMENT 'Full brutto price (oxbprice * oxamount)',
  `OXVATPRICE` double NOT NULL DEFAULT '0' COMMENT 'Calculated VAT price',
  `OXVAT` double NOT NULL DEFAULT '0' COMMENT 'VAT',
  `OXPERSPARAM` text NOT NULL COMMENT 'Serialized persistent parameters',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Base price',
  `OXBPRICE` double NOT NULL DEFAULT '0' COMMENT 'Brutto price for one item',
  `OXNPRICE` double NOT NULL DEFAULT '0' COMMENT 'Netto price for one item',
  `OXWRAPID` varchar(32) NOT NULL DEFAULT '' COMMENT 'Wrapping id (oxwrapping)',
  `OXEXTURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'External URL to other information about the article',
  `OXURLDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text for external URL',
  `OXURLIMG` varchar(128) NOT NULL DEFAULT '' COMMENT 'External URL image',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename',
  `OXPIC1` varchar(128) NOT NULL DEFAULT '' COMMENT '1# Picture filename',
  `OXPIC2` varchar(128) NOT NULL DEFAULT '' COMMENT '2# Picture filename',
  `OXPIC3` varchar(128) NOT NULL DEFAULT '' COMMENT '3# Picture filename',
  `OXPIC4` varchar(128) NOT NULL DEFAULT '' COMMENT '4# Picture filename',
  `OXPIC5` varchar(128) NOT NULL DEFAULT '' COMMENT '5# Picture filename',
  `OXWEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Weight (kg)',
  `OXSTOCK` double NOT NULL DEFAULT '-1' COMMENT 'Articles quantity in stock',
  `OXDELIVERY` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date, when the product will be available again if it is sold out',
  `OXINSERT` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXLENGTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Length',
  `OXWIDTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Width',
  `OXHEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Height',
  `OXFILE` varchar(128) NOT NULL DEFAULT '' COMMENT 'File, shown in article media list',
  `OXSEARCHKEYS` varchar(255) NOT NULL DEFAULT '' COMMENT 'Search terms',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (use default, if empty)',
  `OXQUESTIONEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'E-mail for question',
  `OXISSEARCH` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is article shown in search',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder: ORDERFOLDER_FINISHED, ORDERFOLDER_NEW, ORDERFOLDER_PROBLEMS',
  `OXSUBCLASS` varchar(32) NOT NULL DEFAULT '' COMMENT 'Subclass',
  `OXSTORNO` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Order cancelled',
  `OXORDERSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops), in which order was done',
  `OXERPSTATUS` text NOT NULL COMMENT 'serialized ERP statuses array',
  `OXISBUNDLE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bundled article',
  PRIMARY KEY (`OXID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXARTID` (`OXARTID`),
  KEY `OXARTNUM` (`OXARTNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ordered articles information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorderarticles`
--

LOCK TABLES `oxorderarticles` WRITE;
/*!40000 ALTER TABLE `oxorderarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorderarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorderfiles`
--

DROP TABLE IF EXISTS `oxorderfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorderfiles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order file id',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order id (oxorder)',
  `OXFILENAME` varchar(128) NOT NULL COMMENT 'Filename',
  `OXFILEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'File id (oxfiles)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXORDERARTICLEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Ordered article id (oxorderarticles)',
  `OXFIRSTDOWNLOAD` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'First time downloaded time',
  `OXLASTDOWNLOAD` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last time downloaded time',
  `OXDOWNLOADCOUNT` int(10) unsigned NOT NULL COMMENT 'Downloads count',
  `OXMAXDOWNLOADCOUNT` int(10) unsigned NOT NULL COMMENT 'Maximum count of downloads',
  `OXDOWNLOADEXPIRATIONTIME` int(10) unsigned NOT NULL COMMENT 'Download expiration time in hours',
  `OXLINKEXPIRATIONTIME` int(10) unsigned NOT NULL COMMENT 'Link expiration time in hours',
  `OXRESETCOUNT` int(10) unsigned NOT NULL COMMENT 'Count of resets',
  `OXVALIDUNTIL` datetime NOT NULL COMMENT 'Download is valid until time specified',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXFILEID` (`OXFILEID`),
  KEY `OXORDERARTICLEID` (`OXORDERARTICLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files, given to users to download after order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorderfiles`
--

LOCK TABLES `oxorderfiles` WRITE;
/*!40000 ALTER TABLE `oxorderfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorderfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxpayments`
--

DROP TABLE IF EXISTS `oxpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxpayments` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Payment id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXDESC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Description (multilanguage)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Price Surcharge/Reduction amount',
  `OXADDSUMTYPE` enum('abs','%') NOT NULL DEFAULT 'abs' COMMENT 'Price Surcharge/Reduction type (abs|%)',
  `OXADDSUMRULES` int(11) NOT NULL DEFAULT '0' COMMENT 'Base of price surcharge/reduction: 1 - Value of all goods in cart, 2 - Discounts, 4 - Vouchers, 8 - Shipping costs, 16 - Gift Wrapping/Greeting Card',
  `OXFROMBONI` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimal Credit Rating ',
  `OXFROMAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price: From',
  `OXTOAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price: To',
  `OXVALDESC` text NOT NULL COMMENT 'Payment additional fields, separated by "field1__@@field2" (multilanguage)',
  `OXCHECKED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Selected as the default method',
  `OXDESC_1` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_1` text NOT NULL,
  `OXDESC_2` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_2` text NOT NULL,
  `OXDESC_3` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_3` text NOT NULL,
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment methods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxpayments`
--

LOCK TABLES `oxpayments` WRITE;
/*!40000 ALTER TABLE `oxpayments` DISABLE KEYS */;
INSERT INTO `oxpayments` (`OXID`, `OXACTIVE`, `OXDESC`, `OXADDSUM`, `OXADDSUMTYPE`, `OXADDSUMRULES`, `OXFROMBONI`, `OXFROMAMOUNT`, `OXTOAMOUNT`, `OXVALDESC`, `OXCHECKED`, `OXDESC_1`, `OXVALDESC_1`, `OXDESC_2`, `OXVALDESC_2`, `OXDESC_3`, `OXVALDESC_3`, `OXLONGDESC`, `OXLONGDESC_1`, `OXLONGDESC_2`, `OXLONGDESC_3`, `OXSORT`, `OXTIMESTAMP`) VALUES ('oxempty',1,'Empty',0,'abs',0,0,0,0,'',0,'Empty','','','','','','for other countries','An example. Maybe for use with other countries','','',100,'2023-10-31 15:18:35'),
('oxidcashondel',1,'Nachnahme',7.5,'abs',0,0,0,1000000,'',1,'COD (Cash on Delivery)','','','','','','','','','',600,'2023-10-31 15:18:35'),
('oxiddebitnote',1,'Bankeinzug/Lastschrift',0,'abs',0,0,0,1000000,'lsbankname__@@lsblz__@@lsktonr__@@lsktoinhaber__@@',0,'Direct Debit','lsbankname__@@lsblz__@@lsktonr__@@lsktoinhaber__@@','','','','','Die Belastung Ihres Kontos erfolgt mit dem Versand der Ware.','Your bank account will be charged when the order is shipped.','','',400,'2023-10-31 15:18:35'),
('oxidinvoice',1,'Rechnung',0,'abs',0,800,0,1000000,'',0,'Invoice','','','','','','','','','',200,'2023-10-31 15:18:35'),
('oxidpayadvance',1,'Vorauskasse',0,'abs',0,0,0,1000000,'',1,'Cash in advance','','','','','','','','','',300,'2023-10-31 15:18:35');
/*!40000 ALTER TABLE `oxpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxprice2article`
--

DROP TABLE IF EXISTS `oxprice2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxprice2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXADDABS` double NOT NULL DEFAULT '0' COMMENT 'Price, that will be used for specified article if basket amount is between oxamount and oxamountto',
  `OXADDPERC` double NOT NULL DEFAULT '0' COMMENT 'Discount, that will be used for specified article if basket amount is between oxamount and oxamountto',
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Quantity: From',
  `OXAMOUNTTO` double NOT NULL DEFAULT '0' COMMENT 'Quantity: To',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Article scale prices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxprice2article`
--

LOCK TABLES `oxprice2article` WRITE;
/*!40000 ALTER TABLE `oxprice2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxprice2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxpricealarm`
--

DROP TABLE IF EXISTS `oxpricealarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxpricealarm` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Price alarm id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXEMAIL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Recipient email',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Expected (user) price, when notification email should be sent',
  `OXCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Currency',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXINSERT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXSENDED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when notification was sent',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Price fall alarm requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxpricealarm`
--

LOCK TABLES `oxpricealarm` WRITE;
/*!40000 ALTER TABLE `oxpricealarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxpricealarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxratings`
--

DROP TABLE IF EXISTS `oxratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxratings` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Rating id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTYPE` enum('oxarticle','oxrecommlist') NOT NULL COMMENT 'Rating type (oxarticle, oxrecommlist)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article or Listmania id (oxarticles or oxrecommlists)',
  `OXRATING` int(1) NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxobjectsearch` (`OXTYPE`,`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles and Listmania ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxratings`
--

LOCK TABLES `oxratings` WRITE;
/*!40000 ALTER TABLE `oxratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxrecommlists`
--

DROP TABLE IF EXISTS `oxrecommlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxrecommlists` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Listmania id',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXAUTHOR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Author first and last name',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXDESC` text NOT NULL COMMENT 'Description',
  `OXRATINGCNT` int(11) NOT NULL DEFAULT '0' COMMENT 'Rating votes count',
  `OXRATING` double NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listmania';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxrecommlists`
--

LOCK TABLES `oxrecommlists` WRITE;
/*!40000 ALTER TABLE `oxrecommlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxrecommlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxremark`
--

DROP TABLE IF EXISTS `oxremark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxremark` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTYPE` enum('o','r','n','c') NOT NULL DEFAULT 'r' COMMENT 'Record type: o - order, r - remark, n - newsletter, c - registration',
  `OXHEADER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Header (default: Creation time)',
  `OXTEXT` text NOT NULL COMMENT 'Remark text',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXPARENTID` (`OXPARENTID`),
  KEY `OXTYPE` (`OXTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxremark`
--

LOCK TABLES `oxremark` WRITE;
/*!40000 ALTER TABLE `oxremark` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxremark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxreviews`
--

DROP TABLE IF EXISTS `oxreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxreviews` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Review id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article or Listmania id (oxarticles or oxrecommlist)',
  `OXTYPE` enum('oxarticle','oxrecommlist') NOT NULL COMMENT 'Review type (oxarticle, oxrecommlist)',
  `OXTEXT` text NOT NULL COMMENT 'Review text',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXLANG` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXRATING` int(1) NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxobjectsearch` (`OXTYPE`,`OXOBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles and Listmania reviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxreviews`
--

LOCK TABLES `oxreviews` WRITE;
/*!40000 ALTER TABLE `oxreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxrolefields`
--

DROP TABLE IF EXISTS `oxrolefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxrolefields` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Field id',
  `OXNAME` varchar(255) NOT NULL COMMENT 'Role name',
  `OXPARAM` varchar(255) NOT NULL COMMENT 'Parameters',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxrolefields`
--

LOCK TABLES `oxrolefields` WRITE;
/*!40000 ALTER TABLE `oxrolefields` DISABLE KEYS */;
INSERT INTO `oxrolefields` (`OXID`, `OXNAME`, `OXPARAM`, `OXTIMESTAMP`) VALUES ('42b44bc9934bdb406.85935627','TOBASKET','tobasket;basket','2023-10-31 15:18:39'),
('42b44bc9941a46fd3.13180499','SHOWLONGDESCRIPTION','','2023-10-31 15:18:39'),
('42b44bc99488c66b1.94059993','SHOWARTICLEPRICE','','2023-10-31 15:18:39'),
('42b44bc9950334951.12393781','SHOWSHORTDESCRIPTION','','2023-10-31 15:18:39');
/*!40000 ALTER TABLE `oxrolefields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxroles`
--

DROP TABLE IF EXISTS `oxroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxroles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Role id',
  `OXTITLE` varchar(255) NOT NULL COMMENT 'Role title',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` int(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXAREA` int(1) NOT NULL COMMENT 'Which area this role belongs: 0 - Admin, 1 - Shop',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXAREA` (`OXAREA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop and Admin Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxroles`
--

LOCK TABLES `oxroles` WRITE;
/*!40000 ALTER TABLE `oxroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxselectlist`
--

DROP TABLE IF EXISTS `oxselectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxselectlist` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Selection list id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(254) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXIDENT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Working Title',
  `OXVALDESC` text NOT NULL COMMENT 'List fields, separated by "[field_name]!P![price]__@@[field_name]__@@" (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_1` text NOT NULL,
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_2` text NOT NULL,
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_3` text NOT NULL,
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXMAPID` (`OXMAPID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXTITLE` (`OXTITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Selection lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxselectlist`
--

LOCK TABLES `oxselectlist` WRITE;
/*!40000 ALTER TABLE `oxselectlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxselectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxselectlist2shop`
--

DROP TABLE IF EXISTS `oxselectlist2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxselectlist2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxselectlist2shop`
--

LOCK TABLES `oxselectlist2shop` WRITE;
/*!40000 ALTER TABLE `oxselectlist2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxselectlist2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseo`
--

DROP TABLE IF EXISTS `oxseo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseo` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Hashed seo url (md5)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXSTDURL` varchar(2048) NOT NULL COMMENT 'Primary url, not seo encoded',
  `OXSEOURL` varchar(2048) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Old seo url',
  `OXTYPE` enum('static','oxarticle','oxcategory','oxvendor','oxcontent','dynamic','oxmanufacturer') NOT NULL COMMENT 'Record type',
  `OXFIXED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Fixed',
  `OXEXPIRED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Expired',
  `OXPARAMS` char(32) NOT NULL DEFAULT '' COMMENT 'Params',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`),
  UNIQUE KEY `search` (`OXTYPE`,`OXOBJECTID`,`OXSHOPID`,`OXLANG`,`OXPARAMS`),
  KEY `OXOBJECTID` (`OXOBJECTID`,`OXSHOPID`,`OXLANG`),
  KEY `SEARCHSTD` (`OXSTDURL`(100),`OXSHOPID`),
  KEY `SEARCHSEO` (`OXSEOURL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo urls information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseo`
--

LOCK TABLES `oxseo` WRITE;
/*!40000 ALTER TABLE `oxseo` DISABLE KEYS */;
INSERT INTO `oxseo` (`OXOBJECTID`, `OXIDENT`, `OXSHOPID`, `OXLANG`, `OXSTDURL`, `OXSEOURL`, `OXTYPE`, `OXFIXED`, `OXEXPIRED`, `OXPARAMS`, `OXTIMESTAMP`) VALUES ('c8edd7319fdc59a0f28db056f72b4d17','023abc17c853f9bccc201c5afd549a92',1,1,'index.php?cl=account_wishlist','en/my-gift-registry/','static',0,0,'','2023-10-31 15:18:35'),
('e5340b054530ea779fb1802e93c8183e','02b4c1e4049b1baffba090c95a7edbf7',1,0,'index.php?cl=invite','Laden-Sie-Ihre-Freunde/','static',0,0,'','2023-10-31 15:18:35'),
('f52b25bb4e58480a2df8c06b65b4901c','063c82502d9dd528ce2cc40ceb76ade7',1,1,'index.php?cl=compare','en/my-product-comparison/','static',0,0,'','2023-10-31 15:18:35'),
('67c5bcf75ee346bd9566bce6c8','0d2f22b49c64eaa138d717ec752e3be3',1,0,'index.php?cl=credits&amp;oxcid=67c5bcf75ee346bd9566bce6c8','Credits/','oxcontent',1,0,'','2023-10-31 15:18:35'),
('8854fb64f8934f8d399eac52cca4136f','1368f5e45468ca1e1c7c84f174785c35',1,1,'index.php?cl=account_noticelist','en/my-wish-list/','static',0,0,'','2023-10-31 15:18:35'),
('c8edd7319fdc59a0f28db056f72b4d17','1f30ae9b1c78b7dc89d3e5fe9eb0de59',1,0,'index.php?cl=account_wishlist','mein-wunschzettel/','static',0,0,'','2023-10-31 15:18:35'),
('d21804a99d13c9cc50c0c6206547922f','295d6617dc22b6d8186667ecd6e3ae87',1,0,'index.php?cl=clearcookies','cookies/','static',0,0,'','2023-10-31 15:18:35'),
('a9d28c6f1eae708a031d930117fc3740','3a41965fb36fb45df7f4f9a4377f6364',1,1,'index.php?cl=newsletter','en/newsletter/','static',0,0,'','2023-10-31 15:18:35'),
('5abe5ca9e2a5166fb64f0eb76f45edac','3bdd64bd8073d044d8fd60334ed9b725',1,1,'index.php?cl=start','en/home/','static',0,0,'','2023-10-31 15:18:35'),
('9c08d8934d13b2af47383f5a24fedb5c','4a70a4cd11d63fdce96fbe4ba8e714e6',1,1,'index.php?cnid=oxmore&amp;cl=alist','en/more/','static',0,0,'','2023-10-31 15:18:35'),
('9c08d8934d13b2af47383f5a24fedb5c','4d3d4d70b09b5d2bd992991361374c67',1,0,'index.php?cnid=oxmore&amp;cl=alist','mehr/','static',0,0,'','2023-10-31 15:18:35'),
('21eddcf0e16b9fbdb044f4d9678b55c6','510fef34e5d9b86f6a77af949d15950e',1,1,'index.php?cl=account','en/my-account/','static',0,0,'','2023-10-31 15:18:35'),
('9d0f22a4f43ea825f9cd3ebf5a7bde23','5668048844927ca2767140c219e04efc',1,1,'index.php?cl=account_user','en/my-address/','static',0,0,'','2023-10-31 15:18:35'),
('3ebbaef4dd461b3c12020f8a076f0212','5cc081514a72b0ce3d7eec4fb1e6f1dd',1,1,'index.php?cl=forgotpwd','en/forgot-password/','static',0,0,'','2023-10-31 15:18:35'),
('c4b506be468a1f71f2eb6e7bbceb0c57','5d752e9e8302eeb21df24d1aee573234',1,0,'index.php?cl=wishlist','wunschzettel/','static',0,0,'','2023-10-31 15:18:35'),
('70cc13db1bda9cdb8403879a11032e5a','5eb126725ba500e6bbf1aecaa876dc48',1,1,'index.php?cl=review','en/product-review/','static',0,0,'','2023-10-31 15:18:35'),
('0b1c46ce2b6d34d1a25e1719809f9f8d','6b30b01fe01b80894efc0f29610e5215',1,0,'index.php?cl=account_password','mein-passwort/','static',0,0,'','2023-10-31 15:18:35'),
('0b1c46ce2b6d34d1a25e1719809f9f8d','6c890ac1255a99f8d1eb46f1193843d6',1,1,'index.php?cl=account_password','en/my-password/','static',0,0,'','2023-10-31 15:18:35'),
('e2af574a8e963c354d4555159e54a516','7685924d3f3fb7e9bda421c57f665af4',1,1,'index.php?cl=contact','en/contact/','static',0,0,'','2023-10-31 15:18:35'),
('21eddcf0e16b9fbdb044f4d9678b55c6','89c5e6bf1b5441599c4815281debe8df',1,0,'index.php?cl=account','mein-konto/','static',0,0,'','2023-10-31 15:18:35'),
('fc0914f85af554513b2bfc8f09368244','8afe769d3de8b5db0a872b23f959dd36',1,1,'index.php?cl=download','en/download/','static',0,0,'','2023-10-31 15:18:35'),
('67a55f21d85ee47a3431b8292758a7a1','8e7ebaebb0a810576453082e1f8f2fa3',1,1,'index.php?cl=account_recommlist','en/my-listmania-list/','static',0,0,'','2023-10-31 15:18:35'),
('f41fdc9d234527d959c9d4c412c8cca7','9372b6be2d98021fb93302a6a34bfc8c',1,1,'index.php?cl=recommlist','en/Recommendation-Lists/','static',0,0,'','2023-10-31 15:18:35'),
('7ec4cddc7e3fe3bcf0410569355ff84e','9508bb0d70121d49e4d4554c5b1af81d',1,0,'index.php?cl=links','links/','static',0,0,'','2023-10-31 15:18:35'),
('bb8c75b6c8a3932f504250014529b78b','9ff5c21cbc84dbfe815013236e132baf',1,1,'index.php?cl=account_order','en/order-history/','static',0,0,'','2023-10-31 15:18:35'),
('67c5bcf75ee346bd9566bce6c8','a150a7b6945213daa7f138e1a042cbb4',1,1,'index.php?cl=credits&amp;oxcid=67c5bcf75ee346bd9566bce6c8','en/Credits/','oxcontent',1,0,'','2023-10-31 15:18:35'),
('2b3cb8ed3e86f31772f1ac6ac83315db','a1b330b85c6f51fd9b50b1eb19707d84',1,1,'index.php?cl=register','en/open-account/','static',0,0,'','2023-10-31 15:18:35'),
('8854fb64f8934f8d399eac52cca4136f','a24b03f1a3f73c325a7647e6039e2359',1,0,'index.php?cl=account_noticelist','mein-merkzettel/','static',0,0,'','2023-10-31 15:18:35'),
('f41fdc9d234527d959c9d4c412c8cca7','a4e5995182ade3cf039800c0ec2d512d',1,0,'index.php?cl=recommlist','Empfehlungslisten/','static',0,0,'','2023-10-31 15:18:35'),
('e5340b054530ea779fb1802e93c8183e','a6b775aec57d06b46a958efbafdc7875',1,1,'index.php?cl=invite','en/Invite-your-friends/','static',0,0,'','2023-10-31 15:18:35'),
('9d0f22a4f43ea825f9cd3ebf5a7bde23','a7d5ab5a4e87693998c5aec066dda6e6',1,0,'index.php?cl=account_user','meine-adressen/','static',0,0,'','2023-10-31 15:18:35'),
('3ebbaef4dd461b3c12020f8a076f0212','a9afb500184c584fb5ab2ad9b4162e96',1,0,'index.php?cl=forgotpwd','passwort-vergessen/','static',0,0,'','2023-10-31 15:18:35'),
('2b3cb8ed3e86f31772f1ac6ac83315db','acddcfef9c25bcae3b96eb00669541ff',1,0,'index.php?cl=register','konto-eroeffnen/','static',0,0,'','2023-10-31 15:18:35'),
('c4b506be468a1f71f2eb6e7bbceb0c57','b93b703d313e89662773cffaab750f1d',1,1,'index.php?cl=wishlist','en/gift-registry/','static',0,0,'','2023-10-31 15:18:35'),
('67a55f21d85ee47a3431b8292758a7a1','baa3b653a618696b06c70a6dda95ebde',1,0,'index.php?cl=account_recommlist','meine-lieblingslisten/','static',0,0,'','2023-10-31 15:18:35'),
('fc0914f85af554513b2bfc8f09368244','c552cb8718cde5cb792e181f78f5fde1',1,0,'index.php?cl=download','download/','static',0,0,'','2023-10-31 15:18:35'),
('882acc7454f973844d4917515181dcba','c74bbaf961498de897ba7eb98fea8274',1,1,'index.php?cl=account_downloads','en/my-downloads/','static',0,0,'','2023-10-31 15:18:35'),
('70cc13db1bda9cdb8403879a11032e5a','cc28156a4f728c1b33e7e02fd846628e',1,0,'index.php?cl=review','bewertungen/','static',0,0,'','2023-10-31 15:18:35'),
('5abe5ca9e2a5166fb64f0eb76f45edac','ccca27059506a916fb64d673a5dd676b',1,0,'index.php?cl=start','startseite/','static',0,0,'','2023-10-31 15:18:35'),
('d21804a99d13c9cc50c0c6206547922f','d50c753d406338d92f52fe55de1e98dd',1,1,'index.php?cl=clearcookies','en/cookies/','static',0,0,'','2023-10-31 15:18:35'),
('f52b25bb4e58480a2df8c06b65b4901c','e0dd29a75947539da6b1924d31c9849f',1,0,'index.php?cl=compare','mein-produktvergleich/','static',0,0,'','2023-10-31 15:18:35'),
('a9d28c6f1eae708a031d930117fc3740','e604233c5a2804d21ec0252a445e93d3',1,0,'index.php?cl=newsletter','newsletter/','static',0,0,'','2023-10-31 15:18:35'),
('8be5f76ba0ed85f4c2fd9e57cd137a05','e6331d115f5323610c639ef2f0369f8a',1,0,'index.php?cl=basket','warenkorb/','static',0,0,'','2023-10-31 15:18:35'),
('bb8c75b6c8a3932f504250014529b78b','eb692d07ec8608d943db0a3bca29c4ce',1,0,'index.php?cl=account_order','bestellhistorie/','static',0,0,'','2023-10-31 15:18:35'),
('8be5f76ba0ed85f4c2fd9e57cd137a05','ecaf0240f9f46bbee5ffc6dd73d0b7f0',1,1,'index.php?cl=basket','en/cart/','static',0,0,'','2023-10-31 15:18:35'),
('882acc7454f973844d4917515181dcba','f1c7ccb53fc8d6f239b39d2fc2b76829',1,0,'index.php?cl=account_downloads','de/my-downloads/','static',0,0,'','2023-10-31 15:18:35'),
('7ec4cddc7e3fe3bcf0410569355ff84e','f80ace8f87e1d7f446ab1fa58f275f4c',1,1,'index.php?cl=links','en/links/','static',0,0,'','2023-10-31 15:18:35'),
('943173edecf6d6870a0f357b8ac84d32','f8335c84c1daa5b13657124f45c0e08b',1,0,'index.php?cl=alist&amp;cnid=943173edecf6d6870a0f357b8ac84d32','Wakeboarding/','oxcategory',0,0,'','2023-10-31 15:18:35'),
('e2af574a8e963c354d4555159e54a516','f9d1a02ab749dc360c4e21f21de1beaf',1,0,'index.php?cl=contact','kontakt/','static',0,0,'','2023-10-31 15:18:35'),
('0f4270b89fbef1481958381410a0dbca','fad614c0f4922228623ae0696b55481f',1,1,'index.php?cl=alist&amp;cnid=0f4270b89fbef1481958381410a0dbca','en/Wakeboarding/Wakeboards/','oxcategory',1,0,'','2023-10-31 15:18:35');
/*!40000 ALTER TABLE `oxseo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseohistory`
--

DROP TABLE IF EXISTS `oxseohistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseohistory` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Object id',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed url (md5)',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXHITS` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Hits',
  `OXINSERT` timestamp NULL DEFAULT NULL COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`),
  KEY `search` (`OXOBJECTID`,`OXSHOPID`,`OXLANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo urls history. If url does not exists in oxseo, then checks here and redirects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseohistory`
--

LOCK TABLES `oxseohistory` WRITE;
/*!40000 ALTER TABLE `oxseohistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxseohistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseologs`
--

DROP TABLE IF EXISTS `oxseologs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseologs` (
  `OXSTDURL` text NOT NULL COMMENT 'Primary url, not seo encoded',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed seo url',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(11) NOT NULL COMMENT 'Language id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo logging. Logs bad requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseologs`
--

LOCK TABLES `oxseologs` WRITE;
/*!40000 ALTER TABLE `oxseologs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxseologs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxshops`
--

DROP TABLE IF EXISTS `oxshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxshops` (
  `OXID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id',
  `OXPARENTID` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXISINHERITED` int(11) NOT NULL DEFAULT '0' COMMENT 'Shop inherits all inheritable items (products, discounts etc) from it`s parent shop',
  `OXISMULTISHOP` int(11) NOT NULL DEFAULT '0' COMMENT 'Shop is multishop (loads all products from all shops)',
  `OXISSUPERSHOP` int(11) NOT NULL DEFAULT '0' COMMENT 'Shop is supershop (you can assign products to any shop)',
  `OXPRODUCTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Productive Mode (if 0, debug info displayed)',
  `OXDEFCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Default currency',
  `OXDEFLANGUAGE` int(11) NOT NULL DEFAULT '0' COMMENT 'Default language id',
  `OXNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shop name',
  `OXTITLEPREFIX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Seo title prefix (multilanguage)',
  `OXTITLEPREFIX_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLEPREFIX_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLEPREFIX_3` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Seo title suffix (multilanguage)',
  `OXTITLESUFFIX_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX_3` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Start page title (multilanguage)',
  `OXSTARTTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXINFOEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Informational email address',
  `OXORDEREMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order email address',
  `OXOWNEREMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Owner email address',
  `OXORDERSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order email subject (multilanguage)',
  `OXREGISTERSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Registration email subject (multilanguage)',
  `OXFORGOTPWDSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Forgot password email subject (multilanguage)',
  `OXSENDEDNOWSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order sent email subject (multilanguage)',
  `OXORDERSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXORDERSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXORDERSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSMTP` varchar(255) NOT NULL DEFAULT '' COMMENT 'SMTP server',
  `OXSMTPUSER` varchar(128) NOT NULL DEFAULT '' COMMENT 'SMTP user',
  `OXSMTPPWD` varchar(128) NOT NULL DEFAULT '' COMMENT 'SMTP password',
  `OXCOMPANY` varchar(128) NOT NULL DEFAULT '' COMMENT 'Your company',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXZIP` varchar(255) NOT NULL DEFAULT '' COMMENT 'ZIP code',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Country',
  `OXBANKNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank name',
  `OXBANKNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Account Number',
  `OXBANKCODE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Routing Number',
  `OXVATNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sales Tax ID',
  `OXTAXNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax ID',
  `OXBICCODE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank BIC',
  `OXIBANNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank IBAN',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXTELEFON` varchar(255) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXTELEFAX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shop url',
  `OXDEFCAT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Default category id',
  `OXHRBNR` varchar(64) NOT NULL DEFAULT '' COMMENT 'CBR',
  `OXCOURT` varchar(128) NOT NULL DEFAULT '' COMMENT 'District Court',
  `OXADBUTLERID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Adbutler code (belboon.de) - deprecated',
  `OXAFFILINETID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affilinet code (webmasterplan.com) - deprecated',
  `OXSUPERCLICKSID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Superclix code (superclix.de) - deprecated',
  `OXAFFILIWELTID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affiliwelt code (affiliwelt.net) - deprecated',
  `OXAFFILI24ID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affili24 code (affili24.com) - deprecated',
  `OXEDITION` char(2) NOT NULL COMMENT 'Shop Edition (CE,PE,EE (@deprecated since v6.0.0-RC.2 (2017-08-24))',
  `OXVERSION` char(16) NOT NULL COMMENT 'Shop Version (@deprecated since v6.0.0-RC.2 (2017-08-22))',
  `OXSEOACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Seo active (multilanguage)',
  `OXSEOACTIVE_1` tinyint(1) NOT NULL DEFAULT '1',
  `OXSEOACTIVE_2` tinyint(1) NOT NULL DEFAULT '1',
  `OXSEOACTIVE_3` tinyint(1) NOT NULL DEFAULT '1',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXSERIAL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shop license number',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxshops`
--

LOCK TABLES `oxshops` WRITE;
/*!40000 ALTER TABLE `oxshops` DISABLE KEYS */;
INSERT INTO `oxshops` (`OXID`, `OXPARENTID`, `OXACTIVE`, `OXISINHERITED`, `OXISMULTISHOP`, `OXISSUPERSHOP`, `OXPRODUCTIVE`, `OXDEFCURRENCY`, `OXDEFLANGUAGE`, `OXNAME`, `OXTITLEPREFIX`, `OXTITLEPREFIX_1`, `OXTITLEPREFIX_2`, `OXTITLEPREFIX_3`, `OXTITLESUFFIX`, `OXTITLESUFFIX_1`, `OXTITLESUFFIX_2`, `OXTITLESUFFIX_3`, `OXSTARTTITLE`, `OXSTARTTITLE_1`, `OXSTARTTITLE_2`, `OXSTARTTITLE_3`, `OXINFOEMAIL`, `OXORDEREMAIL`, `OXOWNEREMAIL`, `OXORDERSUBJECT`, `OXREGISTERSUBJECT`, `OXFORGOTPWDSUBJECT`, `OXSENDEDNOWSUBJECT`, `OXORDERSUBJECT_1`, `OXREGISTERSUBJECT_1`, `OXFORGOTPWDSUBJECT_1`, `OXSENDEDNOWSUBJECT_1`, `OXORDERSUBJECT_2`, `OXREGISTERSUBJECT_2`, `OXFORGOTPWDSUBJECT_2`, `OXSENDEDNOWSUBJECT_2`, `OXORDERSUBJECT_3`, `OXREGISTERSUBJECT_3`, `OXFORGOTPWDSUBJECT_3`, `OXSENDEDNOWSUBJECT_3`, `OXSMTP`, `OXSMTPUSER`, `OXSMTPPWD`, `OXCOMPANY`, `OXSTREET`, `OXZIP`, `OXCITY`, `OXCOUNTRY`, `OXBANKNAME`, `OXBANKNUMBER`, `OXBANKCODE`, `OXVATNUMBER`, `OXTAXNUMBER`, `OXBICCODE`, `OXIBANNUMBER`, `OXFNAME`, `OXLNAME`, `OXTELEFON`, `OXTELEFAX`, `OXURL`, `OXDEFCAT`, `OXHRBNR`, `OXCOURT`, `OXADBUTLERID`, `OXAFFILINETID`, `OXSUPERCLICKSID`, `OXAFFILIWELTID`, `OXAFFILI24ID`, `OXEDITION`, `OXVERSION`, `OXSEOACTIVE`, `OXSEOACTIVE_1`, `OXSEOACTIVE_2`, `OXSEOACTIVE_3`, `OXTIMESTAMP`, `OXSERIAL`) VALUES (1,0,1,0,0,1,0,'',0,'OXID eShop','OXID eShop','OXID eShop','','','online kaufen','purchase online','','','Der Onlineshop','Online Shop','','','info@myoxideshop.com','reply@myoxideshop.com','order@myoxideshop.com','Ihre Bestellung bei OXID eSales','Vielen Dank für Ihre Registrierung im OXID eShop','Ihr Passwort im OXID eShop','Ihre OXID eSales Bestellung wurde versandt','Your order at OXID eShop','Thank you for your registration at OXID eShop','Your OXID eShop password','Your OXID eSales Order has been shipped','','','','','','','','','','','','Your Company Name','2425 Maple Street','9041','Any City, CA','United States','Bank of America','1234567890','900 1234567','','','','','John','Doe','217-8918712','217-8918713','www.myoxideshop.com','','','','','','','','','EE','6.0.0',1,1,0,0,'2023-10-31 15:18:39','');
/*!40000 ALTER TABLE `oxshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxstates`
--

DROP TABLE IF EXISTS `oxstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxstates` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id',
  `OXCOUNTRYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXTITLE` char(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXISOALPHA2` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'SEO short name',
  `OXTITLE_1` char(128) NOT NULL DEFAULT '',
  `OXTITLE_2` char(128) NOT NULL DEFAULT '',
  `OXTITLE_3` char(128) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`,`OXCOUNTRYID`),
  KEY `OXCOUNTRYID` (`OXCOUNTRYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='US States list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxstates`
--

LOCK TABLES `oxstates` WRITE;
/*!40000 ALTER TABLE `oxstates` DISABLE KEYS */;
INSERT INTO `oxstates` (`OXID`, `OXCOUNTRYID`, `OXTITLE`, `OXISOALPHA2`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`, `OXTIMESTAMP`) VALUES ('AA','8f241f11096877ac0.98748826','Armed Forces Americas','AA','Armed Forces Americas','','','2023-10-31 15:18:35'),
('AB','8f241f11095649d18.02676059','Alberta','AB','Alberta','','','2023-10-31 15:18:35'),
('AE','8f241f11096877ac0.98748826','Armed Forces','AE','Armed Forces','','','2023-10-31 15:18:35'),
('AK','8f241f11096877ac0.98748826','Alaska','AK','Alaska','','','2023-10-31 15:18:35'),
('AL','8f241f11096877ac0.98748826','Alabama','AL','Alabama','','','2023-10-31 15:18:35'),
('AP','8f241f11096877ac0.98748826','Armed Forces Pacific','AP','Armed Forces Pacific','','','2023-10-31 15:18:35'),
('AR','8f241f11096877ac0.98748826','Arkansas','AR','Arkansas','','','2023-10-31 15:18:35'),
('AS','8f241f11096877ac0.98748826','Amerikanisch-Samoa','AS','American Samoa','','','2023-10-31 15:18:35'),
('AZ','8f241f11096877ac0.98748826','Arizona','AZ','Arizona','','','2023-10-31 15:18:35'),
('BC','8f241f11095649d18.02676059','Britisch-Kolumbien','BC','British Columbia','','','2023-10-31 15:18:35'),
('CA','8f241f11096877ac0.98748826','Kalifornien','CA','California','','','2023-10-31 15:18:35'),
('CO','8f241f11096877ac0.98748826','Colorado','CO','Colorado','','','2023-10-31 15:18:35'),
('CT','8f241f11096877ac0.98748826','Connecticut','CT','Connecticut','','','2023-10-31 15:18:35'),
('DC','8f241f11096877ac0.98748826','District of Columbia','DC','District of Columbia','','','2023-10-31 15:18:35'),
('DE','8f241f11096877ac0.98748826','Delaware','DE','Delaware','','','2023-10-31 15:18:35'),
('FL','8f241f11096877ac0.98748826','Florida','FL','Florida','','','2023-10-31 15:18:35'),
('FM','8f241f11096877ac0.98748826','Föderierten Staaten von Mikronesien','FM','Federated States of Micronesia','','','2023-10-31 15:18:35'),
('GA','8f241f11096877ac0.98748826','Georgia','GA','Georgia','','','2023-10-31 15:18:35'),
('GU','8f241f11096877ac0.98748826','Guam','GU','Guam','','','2023-10-31 15:18:35'),
('HI','8f241f11096877ac0.98748826','Hawaii','HI','Hawaii','','','2023-10-31 15:18:35'),
('IA','8f241f11096877ac0.98748826','Iowa','IA','Iowa','','','2023-10-31 15:18:35'),
('ID','8f241f11096877ac0.98748826','Idaho','ID','Idaho','','','2023-10-31 15:18:35'),
('IL','8f241f11096877ac0.98748826','Illinois','IL','Illinois','','','2023-10-31 15:18:35'),
('IN','8f241f11096877ac0.98748826','Indiana','IN','Indiana','','','2023-10-31 15:18:35'),
('KS','8f241f11096877ac0.98748826','Kansas','KS','Kansas','','','2023-10-31 15:18:35'),
('KY','8f241f11096877ac0.98748826','Kentucky','KY','Kentucky','','','2023-10-31 15:18:35'),
('LA','8f241f11096877ac0.98748826','Louisiana','LA','Louisiana','','','2023-10-31 15:18:35'),
('MA','8f241f11096877ac0.98748826','Massachusetts','MA','Massachusetts','','','2023-10-31 15:18:35'),
('MB','8f241f11095649d18.02676059','Manitoba','MB','Manitoba','','','2023-10-31 15:18:35'),
('MD','8f241f11096877ac0.98748826','Maryland','MD','Maryland','','','2023-10-31 15:18:35'),
('ME','8f241f11096877ac0.98748826','Maine','ME','Maine','','','2023-10-31 15:18:35'),
('MH','8f241f11096877ac0.98748826','Marshallinseln','MH','Marshall Islands','','','2023-10-31 15:18:35'),
('MI','8f241f11096877ac0.98748826','Michigan','MI','Michigan','','','2023-10-31 15:18:35'),
('MN','8f241f11096877ac0.98748826','Minnesota','MN','Minnesota','','','2023-10-31 15:18:35'),
('MO','8f241f11096877ac0.98748826','Missouri','MO','Missouri','','','2023-10-31 15:18:35'),
('MP','8f241f11096877ac0.98748826','Nördlichen Marianen','MP','Northern Mariana Islands','','','2023-10-31 15:18:35'),
('MS','8f241f11096877ac0.98748826','Mississippi','MS','Mississippi','','','2023-10-31 15:18:35'),
('MT','8f241f11096877ac0.98748826','Montana','MT','Montana','','','2023-10-31 15:18:35'),
('NB','8f241f11095649d18.02676059','Neubraunschweig','NB','New Brunswick','','','2023-10-31 15:18:35'),
('NC','8f241f11096877ac0.98748826','North Carolina','NC','North Carolina','','','2023-10-31 15:18:35'),
('ND','8f241f11096877ac0.98748826','North Dakota','ND','North Dakota','','','2023-10-31 15:18:35'),
('NE','8f241f11096877ac0.98748826','Nebraska','NE','Nebraska','','','2023-10-31 15:18:35'),
('NF','8f241f11095649d18.02676059','Neufundland und Labrador','NF','Newfoundland and Labrador','','','2023-10-31 15:18:35'),
('NH','8f241f11096877ac0.98748826','New Hampshire','NH','New Hampshire','','','2023-10-31 15:18:35'),
('NJ','8f241f11096877ac0.98748826','New Jersey','NJ','New Jersey','','','2023-10-31 15:18:35'),
('NM','8f241f11096877ac0.98748826','Neumexiko','NM','New Mexico','','','2023-10-31 15:18:35'),
('NS','8f241f11095649d18.02676059','Nova Scotia','NS','Nova Scotia','','','2023-10-31 15:18:35'),
('NT','8f241f11095649d18.02676059','Nordwest-Territorien','NT','Northwest Territories','','','2023-10-31 15:18:35'),
('NU','8f241f11095649d18.02676059','Nunavut','NU','Nunavut','','','2023-10-31 15:18:35'),
('NV','8f241f11096877ac0.98748826','Nevada','NV','Nevada','','','2023-10-31 15:18:35'),
('NY','8f241f11096877ac0.98748826','New York','NY','New York','','','2023-10-31 15:18:35'),
('OH','8f241f11096877ac0.98748826','Ohio','OH','Ohio','','','2023-10-31 15:18:35'),
('OK','8f241f11096877ac0.98748826','Oklahoma','OK','Oklahoma','','','2023-10-31 15:18:35'),
('ON','8f241f11095649d18.02676059','Ontario','ON','Ontario','','','2023-10-31 15:18:35'),
('OR','8f241f11096877ac0.98748826','Oregon','OR','Oregon','','','2023-10-31 15:18:35'),
('PA','8f241f11096877ac0.98748826','Pennsylvania','PA','Pennsylvania','','','2023-10-31 15:18:35'),
('PE','8f241f11095649d18.02676059','Prince Edward Island','PE','Prince Edward Island','','','2023-10-31 15:18:35'),
('PR','8f241f11096877ac0.98748826','Puerto Rico','PR','Puerto Rico','','','2023-10-31 15:18:35'),
('PW','8f241f11096877ac0.98748826','Palau','PW','Palau','','','2023-10-31 15:18:35'),
('QC','8f241f11095649d18.02676059','Quebec','QC','Quebec','','','2023-10-31 15:18:35'),
('RI','8f241f11096877ac0.98748826','Rhode Island','RI','Rhode Island','','','2023-10-31 15:18:35'),
('SC','8f241f11096877ac0.98748826','Südkarolina','SC','South Carolina','','','2023-10-31 15:18:35'),
('SD','8f241f11096877ac0.98748826','Süddakota','SD','South Dakota','','','2023-10-31 15:18:35'),
('SK','8f241f11095649d18.02676059','Saskatchewan','SK','Saskatchewan','','','2023-10-31 15:18:35'),
('TN','8f241f11096877ac0.98748826','Tennessee','TN','Tennessee','','','2023-10-31 15:18:35'),
('TX','8f241f11096877ac0.98748826','Texas','TX','Texas','','','2023-10-31 15:18:35'),
('UT','8f241f11096877ac0.98748826','Utah','UT','Utah','','','2023-10-31 15:18:35'),
('VA','8f241f11096877ac0.98748826','Virginia','VA','Virginia','','','2023-10-31 15:18:35'),
('VI','8f241f11096877ac0.98748826','Jungferninseln','VI','Virgin Islands','','','2023-10-31 15:18:35'),
('VT','8f241f11096877ac0.98748826','Vermont','VT','Vermont','','','2023-10-31 15:18:35'),
('WA','8f241f11096877ac0.98748826','Washington','WA','Washington','','','2023-10-31 15:18:35'),
('WI','8f241f11096877ac0.98748826','Wisconsin','WI','Wisconsin','','','2023-10-31 15:18:35'),
('WV','8f241f11096877ac0.98748826','West Virginia','WV','West Virginia','','','2023-10-31 15:18:35'),
('WY','8f241f11096877ac0.98748826','Wyoming','WY','Wyoming','','','2023-10-31 15:18:35'),
('YK','8f241f11095649d18.02676059','Yukon','YK','Yukon','','','2023-10-31 15:18:35');
/*!40000 ALTER TABLE `oxstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxtplblocks`
--

DROP TABLE IF EXISTS `oxtplblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxtplblocks` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Block id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXTHEME` char(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Shop theme id',
  `OXTEMPLATE` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Template filename (with rel. path), where block is located',
  `OXBLOCKNAME` char(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Block name',
  `OXPOS` int(11) NOT NULL COMMENT 'Sorting',
  `OXFILE` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Module template filename, where block replacement is located',
  `OXMODULE` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Module, which uses this template',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxtheme` (`OXTHEME`),
  KEY `search` (`OXACTIVE`,`OXSHOPID`,`OXTEMPLATE`,`OXPOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module template blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxtplblocks`
--

LOCK TABLES `oxtplblocks` WRITE;
/*!40000 ALTER TABLE `oxtplblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxtplblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuser`
--

DROP TABLE IF EXISTS `oxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuser` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXRIGHTS` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User rights: user, malladmin',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXUSERNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Username',
  `OXPASSWORD` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hashed password',
  `OXPASSSALT` char(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Password salt',
  `OXCUSTNR` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Customer number',
  `OXUSTID` varchar(255) NOT NULL DEFAULT '' COMMENT 'VAT ID No.',
  `OXUSTIDSTATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'User VAT id status: 1 - valid, 0 - invalid',
  `OXCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Company',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'House number',
  `OXADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional info',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id (oxstates)',
  `OXZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'ZIP code',
  `OXFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'User title (Mr/Mrs)',
  `OXBONI` int(11) NOT NULL DEFAULT '0' COMMENT 'Credit points',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXREGISTER` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Registration time',
  `OXPRIVFON` varchar(64) NOT NULL DEFAULT '' COMMENT 'Personal phone number',
  `OXMOBFON` varchar(64) NOT NULL DEFAULT '' COMMENT 'Mobile phone number',
  `OXBIRTHDATE` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Birthday date',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url',
  `OXWRONGLOGINS` int(11) NOT NULL DEFAULT '0' COMMENT 'Wrong logins count',
  `OXUPDATEKEY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Update key',
  `OXUPDATEEXP` int(11) NOT NULL DEFAULT '0' COMMENT 'Update key expiration time',
  `OXPOINTS` double NOT NULL DEFAULT '0' COMMENT 'User points (for registration, invitation, etc)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXUSERNAME` (`OXUSERNAME`,`OXSHOPID`),
  KEY `OXPASSWORD` (`OXPASSWORD`),
  KEY `OXCUSTNR` (`OXCUSTNR`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXLNAME` (`OXLNAME`),
  KEY `OXUPDATEEXP` (`OXUPDATEEXP`),
  KEY `OXRIGHTS` (`OXRIGHTS`),
  KEY `OXSHOPID` (`OXSHOPID`,`OXUSERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop administrators and users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuser`
--

LOCK TABLES `oxuser` WRITE;
/*!40000 ALTER TABLE `oxuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserbasketitems`
--

DROP TABLE IF EXISTS `oxuserbasketitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserbasketitems` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Item id',
  `OXBASKETID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Basket id (oxuserbaskets)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXAMOUNT` char(32) NOT NULL DEFAULT '' COMMENT 'Amount',
  `OXSELLIST` varchar(255) NOT NULL DEFAULT '' COMMENT 'Selection list',
  `OXPERSPARAM` text NOT NULL COMMENT 'Serialized persistent parameters',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXBASKETID` (`OXBASKETID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User basket items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserbasketitems`
--

LOCK TABLES `oxuserbasketitems` WRITE;
/*!40000 ALTER TABLE `oxuserbasketitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserbasketitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserbaskets`
--

DROP TABLE IF EXISTS `oxuserbaskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserbaskets` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Basket id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Basket title',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXPUBLIC` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is public',
  `OXUPDATE` int(11) NOT NULL DEFAULT '0' COMMENT 'Update timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUPDATE` (`OXUPDATE`),
  KEY `OXTITLE` (`OXTITLE`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Active User baskets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserbaskets`
--

LOCK TABLES `oxuserbaskets` WRITE;
/*!40000 ALTER TABLE `oxuserbaskets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserbaskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserpayments`
--

DROP TABLE IF EXISTS `oxuserpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserpayments` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Payment id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxusers)',
  `OXPAYMENTSID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXVALUE` text NOT NULL COMMENT 'DYN payment values array as string',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User payments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserpayments`
--

LOCK TABLES `oxuserpayments` WRITE;
/*!40000 ALTER TABLE `oxuserpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `oxv_oxactions`
--

DROP TABLE IF EXISTS `oxv_oxactions`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxactions` AS SELECT
 1 AS `OXID`,
  1 AS `OXSHOPID`,
  1 AS `OXTYPE`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXLONGDESC`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXPIC`,
  1 AS `OXPIC_1`,
  1 AS `OXPIC_2`,
  1 AS `OXPIC_3`,
  1 AS `OXLINK`,
  1 AS `OXLINK_1`,
  1 AS `OXLINK_2`,
  1 AS `OXLINK_3`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxactions_de`
--

DROP TABLE IF EXISTS `oxv_oxactions_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxactions_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXSHOPID`,
  1 AS `OXTYPE`,
  1 AS `OXTITLE`,
  1 AS `OXLONGDESC`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXPIC`,
  1 AS `OXLINK`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxactions_en`
--

DROP TABLE IF EXISTS `oxv_oxactions_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxactions_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXSHOPID`,
  1 AS `OXTYPE`,
  1 AS `OXTITLE`,
  1 AS `OXLONGDESC`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXPIC`,
  1 AS `OXLINK`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends`
--

DROP TABLE IF EXISTS `oxv_oxartextends`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxartextends` AS SELECT
 1 AS `OXID`,
  1 AS `OXLONGDESC`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends_de`
--

DROP TABLE IF EXISTS `oxv_oxartextends_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxartextends_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXLONGDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends_en`
--

DROP TABLE IF EXISTS `oxv_oxartextends_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxartextends_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXLONGDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles`
--

DROP TABLE IF EXISTS `oxv_oxarticles`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXVARNAME_1`,
  1 AS `OXVARSELECT_1`,
  1 AS `OXVARNAME_2`,
  1 AS `OXVARSELECT_2`,
  1 AS `OXVARNAME_3`,
  1 AS `OXVARSELECT_3`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXURLDESC_1`,
  1 AS `OXSEARCHKEYS_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXURLDESC_2`,
  1 AS `OXSEARCHKEYS_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXURLDESC_3`,
  1 AS `OXSEARCHKEYS_3`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSTOCKTEXT_1`,
  1 AS `OXSTOCKTEXT_2`,
  1 AS `OXSTOCKTEXT_3`,
  1 AS `OXNOSTOCKTEXT_1`,
  1 AS `OXNOSTOCKTEXT_2`,
  1 AS `OXNOSTOCKTEXT_3`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_1`
--

DROP TABLE IF EXISTS `oxv_oxarticles_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXVARNAME_1`,
  1 AS `OXVARSELECT_1`,
  1 AS `OXVARNAME_2`,
  1 AS `OXVARSELECT_2`,
  1 AS `OXVARNAME_3`,
  1 AS `OXVARSELECT_3`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXURLDESC_1`,
  1 AS `OXSEARCHKEYS_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXURLDESC_2`,
  1 AS `OXSEARCHKEYS_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXURLDESC_3`,
  1 AS `OXSEARCHKEYS_3`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSTOCKTEXT_1`,
  1 AS `OXSTOCKTEXT_2`,
  1 AS `OXSTOCKTEXT_3`,
  1 AS `OXNOSTOCKTEXT_1`,
  1 AS `OXNOSTOCKTEXT_2`,
  1 AS `OXNOSTOCKTEXT_3`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_1_de`
--

DROP TABLE IF EXISTS `oxv_oxarticles_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_1_en`
--

DROP TABLE IF EXISTS `oxv_oxarticles_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_de`
--

DROP TABLE IF EXISTS `oxv_oxarticles_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_en`
--

DROP TABLE IF EXISTS `oxv_oxarticles_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxarticles_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXARTNUM`,
  1 AS `OXEAN`,
  1 AS `OXDISTEAN`,
  1 AS `OXMPN`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXPRICE`,
  1 AS `OXBLFIXEDPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXBPRICE`,
  1 AS `OXTPRICE`,
  1 AS `OXUNITNAME`,
  1 AS `OXUNITQUANTITY`,
  1 AS `OXEXTURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLIMG`,
  1 AS `OXVAT`,
  1 AS `OXTHUMB`,
  1 AS `OXICON`,
  1 AS `OXPIC1`,
  1 AS `OXPIC2`,
  1 AS `OXPIC3`,
  1 AS `OXPIC4`,
  1 AS `OXPIC5`,
  1 AS `OXPIC6`,
  1 AS `OXPIC7`,
  1 AS `OXPIC8`,
  1 AS `OXPIC9`,
  1 AS `OXPIC10`,
  1 AS `OXPIC11`,
  1 AS `OXPIC12`,
  1 AS `OXWEIGHT`,
  1 AS `OXSTOCK`,
  1 AS `OXSTOCKFLAG`,
  1 AS `OXSTOCKTEXT`,
  1 AS `OXNOSTOCKTEXT`,
  1 AS `OXDELIVERY`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXLENGTH`,
  1 AS `OXWIDTH`,
  1 AS `OXHEIGHT`,
  1 AS `OXFILE`,
  1 AS `OXSEARCHKEYS`,
  1 AS `OXTEMPLATE`,
  1 AS `OXQUESTIONEMAIL`,
  1 AS `OXISSEARCH`,
  1 AS `OXISCONFIGURABLE`,
  1 AS `OXVARNAME`,
  1 AS `OXVARSTOCK`,
  1 AS `OXVARCOUNT`,
  1 AS `OXVARSELECT`,
  1 AS `OXVARMINPRICE`,
  1 AS `OXVARMAXPRICE`,
  1 AS `OXBUNDLEID`,
  1 AS `OXFOLDER`,
  1 AS `OXSUBCLASS`,
  1 AS `OXSORT`,
  1 AS `OXSOLDAMOUNT`,
  1 AS `OXNONMATERIAL`,
  1 AS `OXFREESHIPPING`,
  1 AS `OXREMINDACTIVE`,
  1 AS `OXREMINDAMOUNT`,
  1 AS `OXAMITEMID`,
  1 AS `OXAMTASKID`,
  1 AS `OXVENDORID`,
  1 AS `OXMANUFACTURERID`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXORDERINFO`,
  1 AS `OXPIXIEXPORT`,
  1 AS `OXPIXIEXPORTED`,
  1 AS `OXVPE`,
  1 AS `OXRATING`,
  1 AS `OXRATINGCNT`,
  1 AS `OXMINDELTIME`,
  1 AS `OXMAXDELTIME`,
  1 AS `OXDELTIMEUNIT`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXISDOWNLOADABLE`,
  1 AS `OXSHOWCUSTOMAGREEMENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute`
--

DROP TABLE IF EXISTS `oxv_oxattribute`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_1`
--

DROP TABLE IF EXISTS `oxv_oxattribute_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_1_de`
--

DROP TABLE IF EXISTS `oxv_oxattribute_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_1_en`
--

DROP TABLE IF EXISTS `oxv_oxattribute_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_de`
--

DROP TABLE IF EXISTS `oxv_oxattribute_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_en`
--

DROP TABLE IF EXISTS `oxv_oxattribute_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxattribute_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXDISPLAYINBASKET` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories`
--

DROP TABLE IF EXISTS `oxv_oxcategories`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXTHUMB_1`,
  1 AS `OXTHUMB_2`,
  1 AS `OXTHUMB_3`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXACTIVE_1`,
  1 AS `OXTITLE_1`,
  1 AS `OXDESC_1`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXACTIVE_2`,
  1 AS `OXTITLE_2`,
  1 AS `OXDESC_2`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXACTIVE_3`,
  1 AS `OXTITLE_3`,
  1 AS `OXDESC_3`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_1`
--

DROP TABLE IF EXISTS `oxv_oxcategories_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXTHUMB_1`,
  1 AS `OXTHUMB_2`,
  1 AS `OXTHUMB_3`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXACTIVE_1`,
  1 AS `OXTITLE_1`,
  1 AS `OXDESC_1`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXACTIVE_2`,
  1 AS `OXTITLE_2`,
  1 AS `OXDESC_2`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXACTIVE_3`,
  1 AS `OXTITLE_3`,
  1 AS `OXDESC_3`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_1_de`
--

DROP TABLE IF EXISTS `oxv_oxcategories_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_1_en`
--

DROP TABLE IF EXISTS `oxv_oxcategories_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_de`
--

DROP TABLE IF EXISTS `oxv_oxcategories_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_en`
--

DROP TABLE IF EXISTS `oxv_oxcategories_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcategories_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXPARENTID`,
  1 AS `OXLEFT`,
  1 AS `OXRIGHT`,
  1 AS `OXROOTID`,
  1 AS `OXSORT`,
  1 AS `OXACTIVE`,
  1 AS `OXHIDDEN`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTHUMB`,
  1 AS `OXEXTLINK`,
  1 AS `OXTEMPLATE`,
  1 AS `OXDEFSORT`,
  1 AS `OXDEFSORTMODE`,
  1 AS `OXPRICEFROM`,
  1 AS `OXPRICETO`,
  1 AS `OXICON`,
  1 AS `OXPROMOICON`,
  1 AS `OXVAT`,
  1 AS `OXSKIPDISCOUNTS`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents`
--

DROP TABLE IF EXISTS `oxv_oxcontents`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcontents` AS SELECT
 1 AS `OXID`,
  1 AS `OXLOADID`,
  1 AS `OXSHOPID`,
  1 AS `OXSNIPPET`,
  1 AS `OXTYPE`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVE_1`,
  1 AS `OXPOSITION`,
  1 AS `OXTITLE`,
  1 AS `OXCONTENT`,
  1 AS `OXTITLE_1`,
  1 AS `OXCONTENT_1`,
  1 AS `OXACTIVE_2`,
  1 AS `OXTITLE_2`,
  1 AS `OXCONTENT_2`,
  1 AS `OXACTIVE_3`,
  1 AS `OXTITLE_3`,
  1 AS `OXCONTENT_3`,
  1 AS `OXCATID`,
  1 AS `OXFOLDER`,
  1 AS `OXTERMVERSION`,
  1 AS `OXTIMESTAMP`,
  1 AS `DDHIDETITLE`,
  1 AS `DDHIDESIDEBAR`,
  1 AS `DDISBLOCK`,
  1 AS `DDBLOCK`,
  1 AS `DDOBJECTTYPE`,
  1 AS `DDOBJECTID`,
  1 AS `DDISLANDING`,
  1 AS `DDISTMPL`,
  1 AS `DDACTIVEFROM`,
  1 AS `DDACTIVEUNTIL`,
  1 AS `DDCSSCLASS`,
  1 AS `DDCUSTOMCSS`,
  1 AS `DDTMPLTARGETID`,
  1 AS `DDTMPLTARGETDATE`,
  1 AS `DDPARENTCONTENT`,
  1 AS `DDSORTING`,
  1 AS `DDFULLWIDTH`,
  1 AS `DDPLAINTEXT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents_de`
--

DROP TABLE IF EXISTS `oxv_oxcontents_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcontents_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXLOADID`,
  1 AS `OXSHOPID`,
  1 AS `OXSNIPPET`,
  1 AS `OXTYPE`,
  1 AS `OXACTIVE`,
  1 AS `OXPOSITION`,
  1 AS `OXTITLE`,
  1 AS `OXCONTENT`,
  1 AS `OXCATID`,
  1 AS `OXFOLDER`,
  1 AS `OXTERMVERSION`,
  1 AS `OXTIMESTAMP`,
  1 AS `DDHIDETITLE`,
  1 AS `DDHIDESIDEBAR`,
  1 AS `DDISBLOCK`,
  1 AS `DDBLOCK`,
  1 AS `DDOBJECTTYPE`,
  1 AS `DDOBJECTID`,
  1 AS `DDISLANDING`,
  1 AS `DDISTMPL`,
  1 AS `DDACTIVEFROM`,
  1 AS `DDACTIVEUNTIL`,
  1 AS `DDCSSCLASS`,
  1 AS `DDCUSTOMCSS`,
  1 AS `DDTMPLTARGETID`,
  1 AS `DDTMPLTARGETDATE`,
  1 AS `DDPARENTCONTENT`,
  1 AS `DDSORTING`,
  1 AS `DDFULLWIDTH`,
  1 AS `DDPLAINTEXT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents_en`
--

DROP TABLE IF EXISTS `oxv_oxcontents_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcontents_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXLOADID`,
  1 AS `OXSHOPID`,
  1 AS `OXSNIPPET`,
  1 AS `OXTYPE`,
  1 AS `OXACTIVE`,
  1 AS `OXPOSITION`,
  1 AS `OXTITLE`,
  1 AS `OXCONTENT`,
  1 AS `OXCATID`,
  1 AS `OXFOLDER`,
  1 AS `OXTERMVERSION`,
  1 AS `OXTIMESTAMP`,
  1 AS `DDHIDETITLE`,
  1 AS `DDHIDESIDEBAR`,
  1 AS `DDISBLOCK`,
  1 AS `DDBLOCK`,
  1 AS `DDOBJECTTYPE`,
  1 AS `DDOBJECTID`,
  1 AS `DDISLANDING`,
  1 AS `DDISTMPL`,
  1 AS `DDACTIVEFROM`,
  1 AS `DDACTIVEUNTIL`,
  1 AS `DDCSSCLASS`,
  1 AS `DDCUSTOMCSS`,
  1 AS `DDTMPLTARGETID`,
  1 AS `DDTMPLTARGETDATE`,
  1 AS `DDPARENTCONTENT`,
  1 AS `DDSORTING`,
  1 AS `DDFULLWIDTH`,
  1 AS `DDPLAINTEXT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry`
--

DROP TABLE IF EXISTS `oxv_oxcountry`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcountry` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXISOALPHA3`,
  1 AS `OXUNNUM3`,
  1 AS `OXVATINPREFIX`,
  1 AS `OXORDER`,
  1 AS `OXSHORTDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXVATSTATUS`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry_de`
--

DROP TABLE IF EXISTS `oxv_oxcountry_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcountry_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXISOALPHA3`,
  1 AS `OXUNNUM3`,
  1 AS `OXVATINPREFIX`,
  1 AS `OXORDER`,
  1 AS `OXSHORTDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXVATSTATUS`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry_en`
--

DROP TABLE IF EXISTS `oxv_oxcountry_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxcountry_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXISOALPHA3`,
  1 AS `OXUNNUM3`,
  1 AS `OXVATINPREFIX`,
  1 AS `OXORDER`,
  1 AS `OXSHORTDESC`,
  1 AS `OXLONGDESC`,
  1 AS `OXVATSTATUS`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery`
--

DROP TABLE IF EXISTS `oxv_oxdelivery`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_1`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_1_de`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_1_en`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_de`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_en`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdelivery_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXDELTYPE`,
  1 AS `OXPARAM`,
  1 AS `OXPARAMEND`,
  1 AS `OXFIXED`,
  1 AS `OXSORT`,
  1 AS `OXFINALIZE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_1`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_1_de`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_1_en`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_de`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_en`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdeliveryset_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXTRACKINGURL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount`
--

DROP TABLE IF EXISTS `oxv_oxdiscount`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_1`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_1_de`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_1_en`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_de`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_en`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxdiscount_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVEFROM`,
  1 AS `OXACTIVETO`,
  1 AS `OXTITLE`,
  1 AS `OXAMOUNT`,
  1 AS `OXAMOUNTTO`,
  1 AS `OXPRICETO`,
  1 AS `OXPRICE`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUM`,
  1 AS `OXITMARTID`,
  1 AS `OXITMAMOUNT`,
  1 AS `OXITMMULTIPLE`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxfield2shop`
--

DROP TABLE IF EXISTS `oxv_oxfield2shop`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxfield2shop` AS SELECT
 1 AS `OXID`,
  1 AS `OXARTID`,
  1 AS `OXSHOPID`,
  1 AS `OXPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxfield2shop_de`
--

DROP TABLE IF EXISTS `oxv_oxfield2shop_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxfield2shop_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXARTID`,
  1 AS `OXSHOPID`,
  1 AS `OXPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxfield2shop_en`
--

DROP TABLE IF EXISTS `oxv_oxfield2shop_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxfield2shop_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXARTID`,
  1 AS `OXSHOPID`,
  1 AS `OXPRICE`,
  1 AS `OXPRICEA`,
  1 AS `OXPRICEB`,
  1 AS `OXPRICEC`,
  1 AS `OXUPDATEPRICE`,
  1 AS `OXUPDATEPRICEA`,
  1 AS `OXUPDATEPRICEB`,
  1 AS `OXUPDATEPRICEC`,
  1 AS `OXUPDATEPRICETIME`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups`
--

DROP TABLE IF EXISTS `oxv_oxgroups`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxgroups` AS SELECT
 1 AS `OXID`,
  1 AS `OXRRID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups_de`
--

DROP TABLE IF EXISTS `oxv_oxgroups_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxgroups_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXRRID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups_en`
--

DROP TABLE IF EXISTS `oxv_oxgroups_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxgroups_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXRRID`,
  1 AS `OXACTIVE`,
  1 AS `OXTITLE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks`
--

DROP TABLE IF EXISTS `oxv_oxlinks`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLDESC_1`,
  1 AS `OXURLDESC_2`,
  1 AS `OXURLDESC_3`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_1`
--

DROP TABLE IF EXISTS `oxv_oxlinks_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXURLDESC_1`,
  1 AS `OXURLDESC_2`,
  1 AS `OXURLDESC_3`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_1_de`
--

DROP TABLE IF EXISTS `oxv_oxlinks_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_1_en`
--

DROP TABLE IF EXISTS `oxv_oxlinks_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_de`
--

DROP TABLE IF EXISTS `oxv_oxlinks_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_en`
--

DROP TABLE IF EXISTS `oxv_oxlinks_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxlinks_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXURL`,
  1 AS `OXURLDESC`,
  1 AS `OXINSERT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_1`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_1_de`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_1_en`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_de`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_en`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmanufacturers_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXICON_ALT`,
  1 AS `OXPICTURE`,
  1 AS `OXTHUMBNAIL`,
  1 AS `OXPROMOTION_ICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmediaurls` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXURL`,
  1 AS `OXDESC`,
  1 AS `OXDESC_1`,
  1 AS `OXDESC_2`,
  1 AS `OXDESC_3`,
  1 AS `OXISUPLOADED`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls_de`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmediaurls_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXURL`,
  1 AS `OXDESC`,
  1 AS `OXISUPLOADED`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls_en`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxmediaurls_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXURL`,
  1 AS `OXDESC`,
  1 AS `OXISUPLOADED`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxobject2attribute` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXATTRID`,
  1 AS `OXVALUE`,
  1 AS `OXPOS`,
  1 AS `OXVALUE_1`,
  1 AS `OXVALUE_2`,
  1 AS `OXVALUE_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute_de`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxobject2attribute_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXATTRID`,
  1 AS `OXVALUE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute_en`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxobject2attribute_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXOBJECTID`,
  1 AS `OXATTRID`,
  1 AS `OXVALUE`,
  1 AS `OXPOS`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2category`
--

DROP TABLE IF EXISTS `oxv_oxobject2category`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxobject2category` AS SELECT
 1 AS `OXID`,
  1 AS `OXSHOPID`,
  1 AS `OXOBJECTID`,
  1 AS `OXCATNID`,
  1 AS `OXPOS`,
  1 AS `OXTIME`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2category_1`
--

DROP TABLE IF EXISTS `oxv_oxobject2category_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2category_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxobject2category_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXSHOPID`,
  1 AS `OXOBJECTID`,
  1 AS `OXCATNID`,
  1 AS `OXPOS`,
  1 AS `OXTIME`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments`
--

DROP TABLE IF EXISTS `oxv_oxpayments`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxpayments` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXDESC`,
  1 AS `OXADDSUM`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUMRULES`,
  1 AS `OXFROMBONI`,
  1 AS `OXFROMAMOUNT`,
  1 AS `OXTOAMOUNT`,
  1 AS `OXVALDESC`,
  1 AS `OXCHECKED`,
  1 AS `OXDESC_1`,
  1 AS `OXVALDESC_1`,
  1 AS `OXDESC_2`,
  1 AS `OXVALDESC_2`,
  1 AS `OXDESC_3`,
  1 AS `OXVALDESC_3`,
  1 AS `OXLONGDESC`,
  1 AS `OXLONGDESC_1`,
  1 AS `OXLONGDESC_2`,
  1 AS `OXLONGDESC_3`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments_de`
--

DROP TABLE IF EXISTS `oxv_oxpayments_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxpayments_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXDESC`,
  1 AS `OXADDSUM`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUMRULES`,
  1 AS `OXFROMBONI`,
  1 AS `OXFROMAMOUNT`,
  1 AS `OXTOAMOUNT`,
  1 AS `OXVALDESC`,
  1 AS `OXCHECKED`,
  1 AS `OXLONGDESC`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments_en`
--

DROP TABLE IF EXISTS `oxv_oxpayments_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxpayments_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXACTIVE`,
  1 AS `OXDESC`,
  1 AS `OXADDSUM`,
  1 AS `OXADDSUMTYPE`,
  1 AS `OXADDSUMRULES`,
  1 AS `OXFROMBONI`,
  1 AS `OXFROMAMOUNT`,
  1 AS `OXTOAMOUNT`,
  1 AS `OXVALDESC`,
  1 AS `OXCHECKED`,
  1 AS `OXLONGDESC`,
  1 AS `OXSORT`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist`
--

DROP TABLE IF EXISTS `oxv_oxselectlist`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXVALDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXVALDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXVALDESC_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_1`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXVALDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXVALDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXVALDESC_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_1_de`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_1_en`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_de`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_en`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxselectlist_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXTITLE`,
  1 AS `OXIDENT`,
  1 AS `OXVALDESC`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops`
--

DROP TABLE IF EXISTS `oxv_oxshops`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxshops` AS SELECT
 1 AS `OXID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXISINHERITED`,
  1 AS `OXISMULTISHOP`,
  1 AS `OXISSUPERSHOP`,
  1 AS `OXPRODUCTIVE`,
  1 AS `OXDEFCURRENCY`,
  1 AS `OXDEFLANGUAGE`,
  1 AS `OXNAME`,
  1 AS `OXTITLEPREFIX`,
  1 AS `OXTITLEPREFIX_1`,
  1 AS `OXTITLEPREFIX_2`,
  1 AS `OXTITLEPREFIX_3`,
  1 AS `OXTITLESUFFIX`,
  1 AS `OXTITLESUFFIX_1`,
  1 AS `OXTITLESUFFIX_2`,
  1 AS `OXTITLESUFFIX_3`,
  1 AS `OXSTARTTITLE`,
  1 AS `OXSTARTTITLE_1`,
  1 AS `OXSTARTTITLE_2`,
  1 AS `OXSTARTTITLE_3`,
  1 AS `OXINFOEMAIL`,
  1 AS `OXORDEREMAIL`,
  1 AS `OXOWNEREMAIL`,
  1 AS `OXORDERSUBJECT`,
  1 AS `OXREGISTERSUBJECT`,
  1 AS `OXFORGOTPWDSUBJECT`,
  1 AS `OXSENDEDNOWSUBJECT`,
  1 AS `OXORDERSUBJECT_1`,
  1 AS `OXREGISTERSUBJECT_1`,
  1 AS `OXFORGOTPWDSUBJECT_1`,
  1 AS `OXSENDEDNOWSUBJECT_1`,
  1 AS `OXORDERSUBJECT_2`,
  1 AS `OXREGISTERSUBJECT_2`,
  1 AS `OXFORGOTPWDSUBJECT_2`,
  1 AS `OXSENDEDNOWSUBJECT_2`,
  1 AS `OXORDERSUBJECT_3`,
  1 AS `OXREGISTERSUBJECT_3`,
  1 AS `OXFORGOTPWDSUBJECT_3`,
  1 AS `OXSENDEDNOWSUBJECT_3`,
  1 AS `OXSMTP`,
  1 AS `OXSMTPUSER`,
  1 AS `OXSMTPPWD`,
  1 AS `OXCOMPANY`,
  1 AS `OXSTREET`,
  1 AS `OXZIP`,
  1 AS `OXCITY`,
  1 AS `OXCOUNTRY`,
  1 AS `OXBANKNAME`,
  1 AS `OXBANKNUMBER`,
  1 AS `OXBANKCODE`,
  1 AS `OXVATNUMBER`,
  1 AS `OXTAXNUMBER`,
  1 AS `OXBICCODE`,
  1 AS `OXIBANNUMBER`,
  1 AS `OXFNAME`,
  1 AS `OXLNAME`,
  1 AS `OXTELEFON`,
  1 AS `OXTELEFAX`,
  1 AS `OXURL`,
  1 AS `OXDEFCAT`,
  1 AS `OXHRBNR`,
  1 AS `OXCOURT`,
  1 AS `OXADBUTLERID`,
  1 AS `OXAFFILINETID`,
  1 AS `OXSUPERCLICKSID`,
  1 AS `OXAFFILIWELTID`,
  1 AS `OXAFFILI24ID`,
  1 AS `OXEDITION`,
  1 AS `OXVERSION`,
  1 AS `OXSEOACTIVE`,
  1 AS `OXSEOACTIVE_1`,
  1 AS `OXSEOACTIVE_2`,
  1 AS `OXSEOACTIVE_3`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXSERIAL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops_de`
--

DROP TABLE IF EXISTS `oxv_oxshops_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxshops_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXISINHERITED`,
  1 AS `OXISMULTISHOP`,
  1 AS `OXISSUPERSHOP`,
  1 AS `OXPRODUCTIVE`,
  1 AS `OXDEFCURRENCY`,
  1 AS `OXDEFLANGUAGE`,
  1 AS `OXNAME`,
  1 AS `OXTITLEPREFIX`,
  1 AS `OXTITLESUFFIX`,
  1 AS `OXSTARTTITLE`,
  1 AS `OXINFOEMAIL`,
  1 AS `OXORDEREMAIL`,
  1 AS `OXOWNEREMAIL`,
  1 AS `OXORDERSUBJECT`,
  1 AS `OXREGISTERSUBJECT`,
  1 AS `OXFORGOTPWDSUBJECT`,
  1 AS `OXSENDEDNOWSUBJECT`,
  1 AS `OXSMTP`,
  1 AS `OXSMTPUSER`,
  1 AS `OXSMTPPWD`,
  1 AS `OXCOMPANY`,
  1 AS `OXSTREET`,
  1 AS `OXZIP`,
  1 AS `OXCITY`,
  1 AS `OXCOUNTRY`,
  1 AS `OXBANKNAME`,
  1 AS `OXBANKNUMBER`,
  1 AS `OXBANKCODE`,
  1 AS `OXVATNUMBER`,
  1 AS `OXTAXNUMBER`,
  1 AS `OXBICCODE`,
  1 AS `OXIBANNUMBER`,
  1 AS `OXFNAME`,
  1 AS `OXLNAME`,
  1 AS `OXTELEFON`,
  1 AS `OXTELEFAX`,
  1 AS `OXURL`,
  1 AS `OXDEFCAT`,
  1 AS `OXHRBNR`,
  1 AS `OXCOURT`,
  1 AS `OXADBUTLERID`,
  1 AS `OXAFFILINETID`,
  1 AS `OXSUPERCLICKSID`,
  1 AS `OXAFFILIWELTID`,
  1 AS `OXAFFILI24ID`,
  1 AS `OXEDITION`,
  1 AS `OXVERSION`,
  1 AS `OXSEOACTIVE`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXSERIAL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops_en`
--

DROP TABLE IF EXISTS `oxv_oxshops_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxshops_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXPARENTID`,
  1 AS `OXACTIVE`,
  1 AS `OXISINHERITED`,
  1 AS `OXISMULTISHOP`,
  1 AS `OXISSUPERSHOP`,
  1 AS `OXPRODUCTIVE`,
  1 AS `OXDEFCURRENCY`,
  1 AS `OXDEFLANGUAGE`,
  1 AS `OXNAME`,
  1 AS `OXTITLEPREFIX`,
  1 AS `OXTITLESUFFIX`,
  1 AS `OXSTARTTITLE`,
  1 AS `OXINFOEMAIL`,
  1 AS `OXORDEREMAIL`,
  1 AS `OXOWNEREMAIL`,
  1 AS `OXORDERSUBJECT`,
  1 AS `OXREGISTERSUBJECT`,
  1 AS `OXFORGOTPWDSUBJECT`,
  1 AS `OXSENDEDNOWSUBJECT`,
  1 AS `OXSMTP`,
  1 AS `OXSMTPUSER`,
  1 AS `OXSMTPPWD`,
  1 AS `OXCOMPANY`,
  1 AS `OXSTREET`,
  1 AS `OXZIP`,
  1 AS `OXCITY`,
  1 AS `OXCOUNTRY`,
  1 AS `OXBANKNAME`,
  1 AS `OXBANKNUMBER`,
  1 AS `OXBANKCODE`,
  1 AS `OXVATNUMBER`,
  1 AS `OXTAXNUMBER`,
  1 AS `OXBICCODE`,
  1 AS `OXIBANNUMBER`,
  1 AS `OXFNAME`,
  1 AS `OXLNAME`,
  1 AS `OXTELEFON`,
  1 AS `OXTELEFAX`,
  1 AS `OXURL`,
  1 AS `OXDEFCAT`,
  1 AS `OXHRBNR`,
  1 AS `OXCOURT`,
  1 AS `OXADBUTLERID`,
  1 AS `OXAFFILINETID`,
  1 AS `OXSUPERCLICKSID`,
  1 AS `OXAFFILIWELTID`,
  1 AS `OXAFFILI24ID`,
  1 AS `OXEDITION`,
  1 AS `OXVERSION`,
  1 AS `OXSEOACTIVE`,
  1 AS `OXTIMESTAMP`,
  1 AS `OXSERIAL` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates`
--

DROP TABLE IF EXISTS `oxv_oxstates`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxstates` AS SELECT
 1 AS `OXID`,
  1 AS `OXCOUNTRYID`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXTITLE_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates_de`
--

DROP TABLE IF EXISTS `oxv_oxstates_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxstates_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXCOUNTRYID`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates_en`
--

DROP TABLE IF EXISTS `oxv_oxstates_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxstates_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXCOUNTRYID`,
  1 AS `OXTITLE`,
  1 AS `OXISOALPHA2`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor`
--

DROP TABLE IF EXISTS `oxv_oxvendor`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_1`
--

DROP TABLE IF EXISTS `oxv_oxvendor_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXTITLE_1`,
  1 AS `OXSHORTDESC_1`,
  1 AS `OXTITLE_2`,
  1 AS `OXSHORTDESC_2`,
  1 AS `OXTITLE_3`,
  1 AS `OXSHORTDESC_3`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_1_de`
--

DROP TABLE IF EXISTS `oxv_oxvendor_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_1_en`
--

DROP TABLE IF EXISTS `oxv_oxvendor_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_de`
--

DROP TABLE IF EXISTS `oxv_oxvendor_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_en`
--

DROP TABLE IF EXISTS `oxv_oxvendor_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvendor_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXICON`,
  1 AS `OXTITLE`,
  1 AS `OXSHORTDESC`,
  1 AS `OXSHOWSUFFIX`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvoucherseries`
--

DROP TABLE IF EXISTS `oxv_oxvoucherseries`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvoucherseries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvoucherseries` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXSERIENR`,
  1 AS `OXSERIEDESCRIPTION`,
  1 AS `OXDISCOUNT`,
  1 AS `OXDISCOUNTTYPE`,
  1 AS `OXBEGINDATE`,
  1 AS `OXENDDATE`,
  1 AS `OXALLOWSAMESERIES`,
  1 AS `OXALLOWOTHERSERIES`,
  1 AS `OXALLOWUSEANOTHER`,
  1 AS `OXMINIMUMVALUE`,
  1 AS `OXCALCULATEONCE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvoucherseries_1`
--

DROP TABLE IF EXISTS `oxv_oxvoucherseries_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvoucherseries_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxvoucherseries_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXSERIENR`,
  1 AS `OXSERIEDESCRIPTION`,
  1 AS `OXDISCOUNT`,
  1 AS `OXDISCOUNTTYPE`,
  1 AS `OXBEGINDATE`,
  1 AS `OXENDDATE`,
  1 AS `OXALLOWSAMESERIES`,
  1 AS `OXALLOWOTHERSERIES`,
  1 AS `OXALLOWUSEANOTHER`,
  1 AS `OXMINIMUMVALUE`,
  1 AS `OXCALCULATEONCE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping`
--

DROP TABLE IF EXISTS `oxv_oxwrapping`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVE_1`,
  1 AS `OXACTIVE_2`,
  1 AS `OXACTIVE_3`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXNAME_1`,
  1 AS `OXNAME_2`,
  1 AS `OXNAME_3`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_1`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_1`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping_1` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXACTIVE_1`,
  1 AS `OXACTIVE_2`,
  1 AS `OXACTIVE_3`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXNAME_1`,
  1 AS `OXNAME_2`,
  1 AS `OXNAME_3`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_1_de`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_1_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping_1_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_1_en`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_1_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping_1_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_de`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping_de` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_en`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oxv_oxwrapping_en` AS SELECT
 1 AS `OXID`,
  1 AS `OXMAPID`,
  1 AS `OXSHOPID`,
  1 AS `OXACTIVE`,
  1 AS `OXTYPE`,
  1 AS `OXNAME`,
  1 AS `OXPIC`,
  1 AS `OXPRICE`,
  1 AS `OXTIMESTAMP` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oxvendor`
--

DROP TABLE IF EXISTS `oxvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvendor` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Vendor id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXMAPID` (`OXMAPID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Distributors list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvendor`
--

LOCK TABLES `oxvendor` WRITE;
/*!40000 ALTER TABLE `oxvendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvendor2shop`
--

DROP TABLE IF EXISTS `oxvendor2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvendor2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvendor2shop`
--

LOCK TABLES `oxvendor2shop` WRITE;
/*!40000 ALTER TABLE `oxvendor2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvendor2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvouchers`
--

DROP TABLE IF EXISTS `oxvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvouchers` (
  `OXDATEUSED` date DEFAULT NULL COMMENT 'Date, when coupon was used (set on order complete)',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Order id (oxorder)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXRESERVED` int(11) NOT NULL DEFAULT '0' COMMENT 'Time, when coupon is added to basket',
  `OXVOUCHERNR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Coupon number',
  `OXVOUCHERSERIEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Coupon Series id (oxvoucherseries)',
  `OXDISCOUNT` float(9,2) DEFAULT NULL COMMENT 'Discounted amount (if discount was used)',
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Coupon id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXVOUCHERSERIEID` (`OXVOUCHERSERIEID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXVOUCHERNR` (`OXVOUCHERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generated coupons';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvouchers`
--

LOCK TABLES `oxvouchers` WRITE;
/*!40000 ALTER TABLE `oxvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvoucherseries`
--

DROP TABLE IF EXISTS `oxvoucherseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvoucherseries` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Series id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXSERIENR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Series name',
  `OXSERIEDESCRIPTION` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description',
  `OXDISCOUNT` float(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Discount amount',
  `OXDISCOUNTTYPE` enum('percent','absolute') NOT NULL DEFAULT 'absolute' COMMENT 'Discount type (percent, absolute)',
  `OXBEGINDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Valid from',
  `OXENDDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Valid to',
  `OXALLOWSAMESERIES` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of this series can be used with single order',
  `OXALLOWOTHERSERIES` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of different series can be used with single order',
  `OXALLOWUSEANOTHER` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of this series can be used in multiple orders',
  `OXMINIMUMVALUE` float(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Minimum Order Sum ',
  `OXCALCULATEONCE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Calculate only once (valid only for product or category vouchers)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSERIENR` (`OXSERIENR`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXMAPID` (`OXMAPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon series';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvoucherseries`
--

LOCK TABLES `oxvoucherseries` WRITE;
/*!40000 ALTER TABLE `oxvoucherseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvoucherseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvoucherseries2shop`
--

DROP TABLE IF EXISTS `oxvoucherseries2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvoucherseries2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvoucherseries2shop`
--

LOCK TABLES `oxvoucherseries2shop` WRITE;
/*!40000 ALTER TABLE `oxvoucherseries2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvoucherseries2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxwrapping`
--

DROP TABLE IF EXISTS `oxwrapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxwrapping` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Wrapping id',
  `OXMAPID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Integer mapping identifier',
  `OXSHOPID` int(11) NOT NULL DEFAULT '1' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active (multilanguage)',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '1',
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '1',
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '1',
  `OXTYPE` varchar(4) NOT NULL DEFAULT 'WRAP' COMMENT 'Wrapping type: WRAP,CARD',
  `OXNAME` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name (multilanguage)',
  `OXNAME_1` varchar(128) NOT NULL DEFAULT '',
  `OXNAME_2` varchar(128) NOT NULL DEFAULT '',
  `OXNAME_3` varchar(128) NOT NULL DEFAULT '',
  `OXPIC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Image filename',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Price',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXMAPID` (`OXMAPID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wrappings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxwrapping`
--

LOCK TABLES `oxwrapping` WRITE;
/*!40000 ALTER TABLE `oxwrapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxwrapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxwrapping2shop`
--

DROP TABLE IF EXISTS `oxwrapping2shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxwrapping2shop` (
  `OXSHOPID` int(11) NOT NULL COMMENT 'Mapped shop id',
  `OXMAPOBJECTID` int(11) NOT NULL COMMENT 'Mapped object id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  UNIQUE KEY `OXMAPIDX` (`OXSHOPID`,`OXMAPOBJECTID`),
  KEY `OXMAPOBJECTID` (`OXMAPOBJECTID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping table for element subshop assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxwrapping2shop`
--

LOCK TABLES `oxwrapping2shop` WRITE;
/*!40000 ALTER TABLE `oxwrapping2shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxwrapping2shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `oxv_oxactions`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE` AS `OXTITLE`,`oxactions`.`OXTITLE_1` AS `OXTITLE_1`,`oxactions`.`OXTITLE_2` AS `OXTITLE_2`,`oxactions`.`OXTITLE_3` AS `OXTITLE_3`,`oxactions`.`OXLONGDESC` AS `OXLONGDESC`,`oxactions`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxactions`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxactions`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC` AS `OXPIC`,`oxactions`.`OXPIC_1` AS `OXPIC_1`,`oxactions`.`OXPIC_2` AS `OXPIC_2`,`oxactions`.`OXPIC_3` AS `OXPIC_3`,`oxactions`.`OXLINK` AS `OXLINK`,`oxactions`.`OXLINK_1` AS `OXLINK_1`,`oxactions`.`OXLINK_2` AS `OXLINK_2`,`oxactions`.`OXLINK_3` AS `OXLINK_3`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxactions_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions_de` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE` AS `OXTITLE`,`oxactions`.`OXLONGDESC` AS `OXLONGDESC`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC` AS `OXPIC`,`oxactions`.`OXLINK` AS `OXLINK`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxactions_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions_en` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE_1` AS `OXTITLE`,`oxactions`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC_1` AS `OXPIC`,`oxactions`.`OXLINK_1` AS `OXLINK`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC` AS `OXLONGDESC`,`oxartextends`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxartextends`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxartextends`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends_de` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC` AS `OXLONGDESC`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends_en` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME_1`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT_1`,`oxarticles`.`OXVARNAME_2` AS `OXVARNAME_2`,`oxarticles`.`OXVARSELECT_2` AS `OXVARSELECT_2`,`oxarticles`.`OXVARNAME_3` AS `OXVARNAME_3`,`oxarticles`.`OXVARSELECT_3` AS `OXVARSELECT_3`,`oxarticles`.`OXTITLE_1` AS `OXTITLE_1`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS_1`,`oxarticles`.`OXTITLE_2` AS `OXTITLE_2`,`oxarticles`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxarticles`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxarticles`.`OXSEARCHKEYS_2` AS `OXSEARCHKEYS_2`,`oxarticles`.`OXTITLE_3` AS `OXTITLE_3`,`oxarticles`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxarticles`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxarticles`.`OXSEARCHKEYS_3` AS `OXSEARCHKEYS_3`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT_1`,`oxarticles`.`OXSTOCKTEXT_2` AS `OXSTOCKTEXT_2`,`oxarticles`.`OXSTOCKTEXT_3` AS `OXSTOCKTEXT_3`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT_1`,`oxarticles`.`OXNOSTOCKTEXT_2` AS `OXNOSTOCKTEXT_2`,`oxarticles`.`OXNOSTOCKTEXT_3` AS `OXNOSTOCKTEXT_3`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_1` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME_1`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT_1`,`oxarticles`.`OXVARNAME_2` AS `OXVARNAME_2`,`oxarticles`.`OXVARSELECT_2` AS `OXVARSELECT_2`,`oxarticles`.`OXVARNAME_3` AS `OXVARNAME_3`,`oxarticles`.`OXVARSELECT_3` AS `OXVARSELECT_3`,`oxarticles`.`OXTITLE_1` AS `OXTITLE_1`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS_1`,`oxarticles`.`OXTITLE_2` AS `OXTITLE_2`,`oxarticles`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxarticles`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxarticles`.`OXSEARCHKEYS_2` AS `OXSEARCHKEYS_2`,`oxarticles`.`OXTITLE_3` AS `OXTITLE_3`,`oxarticles`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxarticles`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxarticles`.`OXSEARCHKEYS_3` AS `OXSEARCHKEYS_3`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT_1`,`oxarticles`.`OXSTOCKTEXT_2` AS `OXSTOCKTEXT_2`,`oxarticles`.`OXSTOCKTEXT_3` AS `OXSTOCKTEXT_3`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT_1`,`oxarticles`.`OXNOSTOCKTEXT_2` AS `OXNOSTOCKTEXT_2`,`oxarticles`.`OXNOSTOCKTEXT_3` AS `OXNOSTOCKTEXT_3`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from (`oxarticles` join `oxarticles2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxarticles`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_1_de` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from (`oxarticles` join `oxarticles2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxarticles`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_1_en` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE_1` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from (`oxarticles` join `oxarticles2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxarticles`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_de` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_en` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXMAPID` AS `OXMAPID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXHIDDEN` AS `OXHIDDEN`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE_1` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXORDERINFO` AS `OXORDERINFO`,`oxarticles`.`OXPIXIEXPORT` AS `OXPIXIEXPORT`,`oxarticles`.`OXPIXIEXPORTED` AS `OXPIXIEXPORTED`,`oxarticles`.`OXVPE` AS `OXVPE`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXTITLE_1` AS `OXTITLE_1`,`oxattribute`.`OXTITLE_2` AS `OXTITLE_2`,`oxattribute`.`OXTITLE_3` AS `OXTITLE_3`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_1` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXTITLE_1` AS `OXTITLE_1`,`oxattribute`.`OXTITLE_2` AS `OXTITLE_2`,`oxattribute`.`OXTITLE_3` AS `OXTITLE_3`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from (`oxattribute` join `oxattribute2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxattribute`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_1_de` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from (`oxattribute` join `oxattribute2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxattribute`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_1_en` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE_1` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from (`oxattribute` join `oxattribute2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxattribute`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_de` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_en` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXMAPID` AS `OXMAPID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE_1` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB_1`,`oxcategories`.`OXTHUMB_2` AS `OXTHUMB_2`,`oxcategories`.`OXTHUMB_3` AS `OXTHUMB_3`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxcategories`.`OXTITLE_1` AS `OXTITLE_1`,`oxcategories`.`OXDESC_1` AS `OXDESC_1`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxcategories`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxcategories`.`OXTITLE_2` AS `OXTITLE_2`,`oxcategories`.`OXDESC_2` AS `OXDESC_2`,`oxcategories`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxcategories`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxcategories`.`OXTITLE_3` AS `OXTITLE_3`,`oxcategories`.`OXDESC_3` AS `OXDESC_3`,`oxcategories`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_1` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB_1`,`oxcategories`.`OXTHUMB_2` AS `OXTHUMB_2`,`oxcategories`.`OXTHUMB_3` AS `OXTHUMB_3`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxcategories`.`OXTITLE_1` AS `OXTITLE_1`,`oxcategories`.`OXDESC_1` AS `OXDESC_1`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxcategories`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxcategories`.`OXTITLE_2` AS `OXTITLE_2`,`oxcategories`.`OXDESC_2` AS `OXDESC_2`,`oxcategories`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxcategories`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxcategories`.`OXTITLE_3` AS `OXTITLE_3`,`oxcategories`.`OXDESC_3` AS `OXDESC_3`,`oxcategories`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxcategories` join `oxcategories2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxcategories`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_1_de` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxcategories` join `oxcategories2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxcategories`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_1_en` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE_1` AS `OXTITLE`,`oxcategories`.`OXDESC_1` AS `OXDESC`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxcategories` join `oxcategories2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxcategories`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_de` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_en` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXMAPID` AS `OXMAPID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE_1` AS `OXTITLE`,`oxcategories`.`OXDESC_1` AS `OXDESC`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE` AS `OXACTIVE`,`oxcontents`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE` AS `OXTITLE`,`oxcontents`.`OXCONTENT` AS `OXCONTENT`,`oxcontents`.`OXTITLE_1` AS `OXTITLE_1`,`oxcontents`.`OXCONTENT_1` AS `OXCONTENT_1`,`oxcontents`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxcontents`.`OXTITLE_2` AS `OXTITLE_2`,`oxcontents`.`OXCONTENT_2` AS `OXCONTENT_2`,`oxcontents`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxcontents`.`OXTITLE_3` AS `OXTITLE_3`,`oxcontents`.`OXCONTENT_3` AS `OXCONTENT_3`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxcontents`.`DDHIDETITLE` AS `DDHIDETITLE`,`oxcontents`.`DDHIDESIDEBAR` AS `DDHIDESIDEBAR`,`oxcontents`.`DDISBLOCK` AS `DDISBLOCK`,`oxcontents`.`DDBLOCK` AS `DDBLOCK`,`oxcontents`.`DDOBJECTTYPE` AS `DDOBJECTTYPE`,`oxcontents`.`DDOBJECTID` AS `DDOBJECTID`,`oxcontents`.`DDISLANDING` AS `DDISLANDING`,`oxcontents`.`DDISTMPL` AS `DDISTMPL`,`oxcontents`.`DDACTIVEFROM` AS `DDACTIVEFROM`,`oxcontents`.`DDACTIVEUNTIL` AS `DDACTIVEUNTIL`,`oxcontents`.`DDCSSCLASS` AS `DDCSSCLASS`,`oxcontents`.`DDCUSTOMCSS` AS `DDCUSTOMCSS`,`oxcontents`.`DDTMPLTARGETID` AS `DDTMPLTARGETID`,`oxcontents`.`DDTMPLTARGETDATE` AS `DDTMPLTARGETDATE`,`oxcontents`.`DDPARENTCONTENT` AS `DDPARENTCONTENT`,`oxcontents`.`DDSORTING` AS `DDSORTING`,`oxcontents`.`DDFULLWIDTH` AS `DDFULLWIDTH`,`oxcontents`.`DDPLAINTEXT` AS `DDPLAINTEXT` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents_de` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE` AS `OXACTIVE`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE` AS `OXTITLE`,`oxcontents`.`OXCONTENT` AS `OXCONTENT`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxcontents`.`DDHIDETITLE` AS `DDHIDETITLE`,`oxcontents`.`DDHIDESIDEBAR` AS `DDHIDESIDEBAR`,`oxcontents`.`DDISBLOCK` AS `DDISBLOCK`,`oxcontents`.`DDBLOCK` AS `DDBLOCK`,`oxcontents`.`DDOBJECTTYPE` AS `DDOBJECTTYPE`,`oxcontents`.`DDOBJECTID` AS `DDOBJECTID`,`oxcontents`.`DDISLANDING` AS `DDISLANDING`,`oxcontents`.`DDISTMPL` AS `DDISTMPL`,`oxcontents`.`DDACTIVEFROM` AS `DDACTIVEFROM`,`oxcontents`.`DDACTIVEUNTIL` AS `DDACTIVEUNTIL`,`oxcontents`.`DDCSSCLASS` AS `DDCSSCLASS`,`oxcontents`.`DDCUSTOMCSS` AS `DDCUSTOMCSS`,`oxcontents`.`DDTMPLTARGETID` AS `DDTMPLTARGETID`,`oxcontents`.`DDTMPLTARGETDATE` AS `DDTMPLTARGETDATE`,`oxcontents`.`DDPARENTCONTENT` AS `DDPARENTCONTENT`,`oxcontents`.`DDSORTING` AS `DDSORTING`,`oxcontents`.`DDFULLWIDTH` AS `DDFULLWIDTH`,`oxcontents`.`DDPLAINTEXT` AS `DDPLAINTEXT` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents_en` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE_1` AS `OXACTIVE`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE_1` AS `OXTITLE`,`oxcontents`.`OXCONTENT_1` AS `OXCONTENT`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxcontents`.`DDHIDETITLE` AS `DDHIDETITLE`,`oxcontents`.`DDHIDESIDEBAR` AS `DDHIDESIDEBAR`,`oxcontents`.`DDISBLOCK` AS `DDISBLOCK`,`oxcontents`.`DDBLOCK` AS `DDBLOCK`,`oxcontents`.`DDOBJECTTYPE` AS `DDOBJECTTYPE`,`oxcontents`.`DDOBJECTID` AS `DDOBJECTID`,`oxcontents`.`DDISLANDING` AS `DDISLANDING`,`oxcontents`.`DDISTMPL` AS `DDISTMPL`,`oxcontents`.`DDACTIVEFROM` AS `DDACTIVEFROM`,`oxcontents`.`DDACTIVEUNTIL` AS `DDACTIVEUNTIL`,`oxcontents`.`DDCSSCLASS` AS `DDCSSCLASS`,`oxcontents`.`DDCUSTOMCSS` AS `DDCUSTOMCSS`,`oxcontents`.`DDTMPLTARGETID` AS `DDTMPLTARGETID`,`oxcontents`.`DDTMPLTARGETDATE` AS `DDTMPLTARGETDATE`,`oxcontents`.`DDPARENTCONTENT` AS `DDPARENTCONTENT`,`oxcontents`.`DDSORTING` AS `DDSORTING`,`oxcontents`.`DDFULLWIDTH` AS `DDFULLWIDTH`,`oxcontents`.`DDPLAINTEXT` AS `DDPLAINTEXT` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC` AS `OXLONGDESC`,`oxcountry`.`OXTITLE_1` AS `OXTITLE_1`,`oxcountry`.`OXTITLE_2` AS `OXTITLE_2`,`oxcountry`.`OXTITLE_3` AS `OXTITLE_3`,`oxcountry`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxcountry`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxcountry`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxcountry`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxcountry`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxcountry`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry_de` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC` AS `OXLONGDESC`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry_en` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE_1` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE_1`,`oxdelivery`.`OXTITLE_2` AS `OXTITLE_2`,`oxdelivery`.`OXTITLE_3` AS `OXTITLE_3`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_1` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE_1`,`oxdelivery`.`OXTITLE_2` AS `OXTITLE_2`,`oxdelivery`.`OXTITLE_3` AS `OXTITLE_3`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdelivery` join `oxdelivery2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdelivery`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_1_de` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdelivery` join `oxdelivery2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdelivery`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_1_en` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdelivery` join `oxdelivery2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdelivery`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_de` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_en` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXMAPID` AS `OXMAPID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE_1`,`oxdeliveryset`.`OXTITLE_2` AS `OXTITLE_2`,`oxdeliveryset`.`OXTITLE_3` AS `OXTITLE_3`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_1` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE_1`,`oxdeliveryset`.`OXTITLE_2` AS `OXTITLE_2`,`oxdeliveryset`.`OXTITLE_3` AS `OXTITLE_3`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from (`oxdeliveryset` join `oxdeliveryset2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdeliveryset`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_1_de` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from (`oxdeliveryset` join `oxdeliveryset2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdeliveryset`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_1_en` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from (`oxdeliveryset` join `oxdeliveryset2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdeliveryset`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_de` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_en` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXMAPID` AS `OXMAPID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxdeliveryset`.`OXTRACKINGURL` AS `OXTRACKINGURL` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE_1`,`oxdiscount`.`OXTITLE_2` AS `OXTITLE_2`,`oxdiscount`.`OXTITLE_3` AS `OXTITLE_3`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_1` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE_1`,`oxdiscount`.`OXTITLE_2` AS `OXTITLE_2`,`oxdiscount`.`OXTITLE_3` AS `OXTITLE_3`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdiscount` join `oxdiscount2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdiscount`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_1_de` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdiscount` join `oxdiscount2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdiscount`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_1_en` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxdiscount` join `oxdiscount2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxdiscount`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_de` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_en` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXMAPID` AS `OXMAPID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXSORT` AS `OXSORT`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxfield2shop`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxfield2shop` AS select `oxfield2shop`.`OXID` AS `OXID`,`oxfield2shop`.`OXARTID` AS `OXARTID`,`oxfield2shop`.`OXSHOPID` AS `OXSHOPID`,`oxfield2shop`.`OXPRICE` AS `OXPRICE`,`oxfield2shop`.`OXPRICEA` AS `OXPRICEA`,`oxfield2shop`.`OXPRICEB` AS `OXPRICEB`,`oxfield2shop`.`OXPRICEC` AS `OXPRICEC`,`oxfield2shop`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxfield2shop`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxfield2shop`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxfield2shop`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxfield2shop`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxfield2shop`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxfield2shop` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxfield2shop_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxfield2shop_de` AS select `oxfield2shop`.`OXID` AS `OXID`,`oxfield2shop`.`OXARTID` AS `OXARTID`,`oxfield2shop`.`OXSHOPID` AS `OXSHOPID`,`oxfield2shop`.`OXPRICE` AS `OXPRICE`,`oxfield2shop`.`OXPRICEA` AS `OXPRICEA`,`oxfield2shop`.`OXPRICEB` AS `OXPRICEB`,`oxfield2shop`.`OXPRICEC` AS `OXPRICEC`,`oxfield2shop`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxfield2shop`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxfield2shop`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxfield2shop`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxfield2shop`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxfield2shop`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxfield2shop` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxfield2shop_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxfield2shop_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxfield2shop_en` AS select `oxfield2shop`.`OXID` AS `OXID`,`oxfield2shop`.`OXARTID` AS `OXARTID`,`oxfield2shop`.`OXSHOPID` AS `OXSHOPID`,`oxfield2shop`.`OXPRICE` AS `OXPRICE`,`oxfield2shop`.`OXPRICEA` AS `OXPRICEA`,`oxfield2shop`.`OXPRICEB` AS `OXPRICEB`,`oxfield2shop`.`OXPRICEC` AS `OXPRICEC`,`oxfield2shop`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxfield2shop`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxfield2shop`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxfield2shop`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxfield2shop`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxfield2shop`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxfield2shop` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXRRID` AS `OXRRID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE` AS `OXTITLE`,`oxgroups`.`OXTITLE_1` AS `OXTITLE_1`,`oxgroups`.`OXTITLE_2` AS `OXTITLE_2`,`oxgroups`.`OXTITLE_3` AS `OXTITLE_3`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups_de` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXRRID` AS `OXRRID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE` AS `OXTITLE`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups_en` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXRRID` AS `OXRRID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE_1` AS `OXTITLE`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxlinks`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxlinks`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_1` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxlinks`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxlinks`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxlinks` join `oxlinks2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxlinks`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_1_de` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxlinks` join `oxlinks2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxlinks`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_1_en` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxlinks` join `oxlinks2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxlinks`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_de` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_en` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXMAPID` AS `OXMAPID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE_1`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxmanufacturers`.`OXTITLE_2` AS `OXTITLE_2`,`oxmanufacturers`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxmanufacturers`.`OXTITLE_3` AS `OXTITLE_3`,`oxmanufacturers`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_1` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE_1`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxmanufacturers`.`OXTITLE_2` AS `OXTITLE_2`,`oxmanufacturers`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxmanufacturers`.`OXTITLE_3` AS `OXTITLE_3`,`oxmanufacturers`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxmanufacturers` join `oxmanufacturers2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxmanufacturers`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_1_de` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxmanufacturers` join `oxmanufacturers2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxmanufacturers`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_1_en` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxmanufacturers` join `oxmanufacturers2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxmanufacturers`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_de` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_en` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXMAPID` AS `OXMAPID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXICON_ALT` AS `OXICON_ALT`,`oxmanufacturers`.`OXPICTURE` AS `OXPICTURE`,`oxmanufacturers`.`OXTHUMBNAIL` AS `OXTHUMBNAIL`,`oxmanufacturers`.`OXPROMOTION_ICON` AS `OXPROMOTION_ICON`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXSORT` AS `OXSORT`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC` AS `OXDESC`,`oxmediaurls`.`OXDESC_1` AS `OXDESC_1`,`oxmediaurls`.`OXDESC_2` AS `OXDESC_2`,`oxmediaurls`.`OXDESC_3` AS `OXDESC_3`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls_de` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC` AS `OXDESC`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls_en` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC_1` AS `OXDESC`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXVALUE_1` AS `OXVALUE_1`,`oxobject2attribute`.`OXVALUE_2` AS `OXVALUE_2`,`oxobject2attribute`.`OXVALUE_3` AS `OXVALUE_3`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute_de` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute_en` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE_1` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2category`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2category` AS select `oxobject2category`.`OXID` AS `OXID`,`oxobject2category`.`OXSHOPID` AS `OXSHOPID`,`oxobject2category`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2category`.`OXCATNID` AS `OXCATNID`,`oxobject2category`.`OXPOS` AS `OXPOS`,`oxobject2category`.`OXTIME` AS `OXTIME`,`oxobject2category`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2category` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2category_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2category_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2category_1` AS select `oxobject2category`.`OXID` AS `OXID`,`oxobject2category`.`OXSHOPID` AS `OXSHOPID`,`oxobject2category`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2category`.`OXCATNID` AS `OXCATNID`,`oxobject2category`.`OXPOS` AS `OXPOS`,`oxobject2category`.`OXTIME` AS `OXTIME`,`oxobject2category`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2category` where (`oxobject2category`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXDESC_1` AS `OXDESC_1`,`oxpayments`.`OXVALDESC_1` AS `OXVALDESC_1`,`oxpayments`.`OXDESC_2` AS `OXDESC_2`,`oxpayments`.`OXVALDESC_2` AS `OXVALDESC_2`,`oxpayments`.`OXDESC_3` AS `OXDESC_3`,`oxpayments`.`OXVALDESC_3` AS `OXVALDESC_3`,`oxpayments`.`OXLONGDESC` AS `OXLONGDESC`,`oxpayments`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxpayments`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxpayments`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments_de` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXLONGDESC` AS `OXLONGDESC`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments_en` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC_1` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC_1` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE_1`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC_1`,`oxselectlist`.`OXTITLE_2` AS `OXTITLE_2`,`oxselectlist`.`OXVALDESC_2` AS `OXVALDESC_2`,`oxselectlist`.`OXTITLE_3` AS `OXTITLE_3`,`oxselectlist`.`OXVALDESC_3` AS `OXVALDESC_3`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_1` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE_1`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC_1`,`oxselectlist`.`OXTITLE_2` AS `OXTITLE_2`,`oxselectlist`.`OXVALDESC_2` AS `OXVALDESC_2`,`oxselectlist`.`OXTITLE_3` AS `OXTITLE_3`,`oxselectlist`.`OXVALDESC_3` AS `OXVALDESC_3`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxselectlist` join `oxselectlist2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxselectlist`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_1_de` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxselectlist` join `oxselectlist2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxselectlist`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_1_en` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxselectlist` join `oxselectlist2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxselectlist`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_de` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_en` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXMAPID` AS `OXMAPID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxshops`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXPARENTID` AS `OXPARENTID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXISINHERITED` AS `OXISINHERITED`,`oxshops`.`OXISMULTISHOP` AS `OXISMULTISHOP`,`oxshops`.`OXISSUPERSHOP` AS `OXISSUPERSHOP`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLEPREFIX_1` AS `OXTITLEPREFIX_1`,`oxshops`.`OXTITLEPREFIX_2` AS `OXTITLEPREFIX_2`,`oxshops`.`OXTITLEPREFIX_3` AS `OXTITLEPREFIX_3`,`oxshops`.`OXTITLESUFFIX` AS `OXTITLESUFFIX`,`oxshops`.`OXTITLESUFFIX_1` AS `OXTITLESUFFIX_1`,`oxshops`.`OXTITLESUFFIX_2` AS `OXTITLESUFFIX_2`,`oxshops`.`OXTITLESUFFIX_3` AS `OXTITLESUFFIX_3`,`oxshops`.`OXSTARTTITLE` AS `OXSTARTTITLE`,`oxshops`.`OXSTARTTITLE_1` AS `OXSTARTTITLE_1`,`oxshops`.`OXSTARTTITLE_2` AS `OXSTARTTITLE_2`,`oxshops`.`OXSTARTTITLE_3` AS `OXSTARTTITLE_3`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXORDERSUBJECT_1` AS `OXORDERSUBJECT_1`,`oxshops`.`OXREGISTERSUBJECT_1` AS `OXREGISTERSUBJECT_1`,`oxshops`.`OXFORGOTPWDSUBJECT_1` AS `OXFORGOTPWDSUBJECT_1`,`oxshops`.`OXSENDEDNOWSUBJECT_1` AS `OXSENDEDNOWSUBJECT_1`,`oxshops`.`OXORDERSUBJECT_2` AS `OXORDERSUBJECT_2`,`oxshops`.`OXREGISTERSUBJECT_2` AS `OXREGISTERSUBJECT_2`,`oxshops`.`OXFORGOTPWDSUBJECT_2` AS `OXFORGOTPWDSUBJECT_2`,`oxshops`.`OXSENDEDNOWSUBJECT_2` AS `OXSENDEDNOWSUBJECT_2`,`oxshops`.`OXORDERSUBJECT_3` AS `OXORDERSUBJECT_3`,`oxshops`.`OXREGISTERSUBJECT_3` AS `OXREGISTERSUBJECT_3`,`oxshops`.`OXFORGOTPWDSUBJECT_3` AS `OXFORGOTPWDSUBJECT_3`,`oxshops`.`OXSENDEDNOWSUBJECT_3` AS `OXSENDEDNOWSUBJECT_3`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE` AS `OXSEOACTIVE`,`oxshops`.`OXSEOACTIVE_1` AS `OXSEOACTIVE_1`,`oxshops`.`OXSEOACTIVE_2` AS `OXSEOACTIVE_2`,`oxshops`.`OXSEOACTIVE_3` AS `OXSEOACTIVE_3`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxshops`.`OXSERIAL` AS `OXSERIAL` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops_de` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXPARENTID` AS `OXPARENTID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXISINHERITED` AS `OXISINHERITED`,`oxshops`.`OXISMULTISHOP` AS `OXISMULTISHOP`,`oxshops`.`OXISSUPERSHOP` AS `OXISSUPERSHOP`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLESUFFIX` AS `OXTITLESUFFIX`,`oxshops`.`OXSTARTTITLE` AS `OXSTARTTITLE`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE` AS `OXSEOACTIVE`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxshops`.`OXSERIAL` AS `OXSERIAL` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops_en` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXPARENTID` AS `OXPARENTID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXISINHERITED` AS `OXISINHERITED`,`oxshops`.`OXISMULTISHOP` AS `OXISMULTISHOP`,`oxshops`.`OXISSUPERSHOP` AS `OXISSUPERSHOP`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX_1` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLESUFFIX_1` AS `OXTITLESUFFIX`,`oxshops`.`OXSTARTTITLE_1` AS `OXSTARTTITLE`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT_1` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT_1` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT_1` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT_1` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE_1` AS `OXSEOACTIVE`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxshops`.`OXSERIAL` AS `OXSERIAL` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxstates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTITLE_1` AS `OXTITLE_1`,`oxstates`.`OXTITLE_2` AS `OXTITLE_2`,`oxstates`.`OXTITLE_3` AS `OXTITLE_3`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates_de` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates_en` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE_1` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXTITLE_1` AS `OXTITLE_1`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxvendor`.`OXTITLE_2` AS `OXTITLE_2`,`oxvendor`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxvendor`.`OXTITLE_3` AS `OXTITLE_3`,`oxvendor`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_1` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXTITLE_1` AS `OXTITLE_1`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxvendor`.`OXTITLE_2` AS `OXTITLE_2`,`oxvendor`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxvendor`.`OXTITLE_3` AS `OXTITLE_3`,`oxvendor`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxvendor` join `oxvendor2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxvendor`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_1_de` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxvendor` join `oxvendor2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxvendor`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_1_en` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE_1` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxvendor` join `oxvendor2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxvendor`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_de` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_en` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXMAPID` AS `OXMAPID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE_1` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvoucherseries`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvoucherseries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvoucherseries` AS select `oxvoucherseries`.`OXID` AS `OXID`,`oxvoucherseries`.`OXMAPID` AS `OXMAPID`,`oxvoucherseries`.`OXSHOPID` AS `OXSHOPID`,`oxvoucherseries`.`OXSERIENR` AS `OXSERIENR`,`oxvoucherseries`.`OXSERIEDESCRIPTION` AS `OXSERIEDESCRIPTION`,`oxvoucherseries`.`OXDISCOUNT` AS `OXDISCOUNT`,`oxvoucherseries`.`OXDISCOUNTTYPE` AS `OXDISCOUNTTYPE`,`oxvoucherseries`.`OXBEGINDATE` AS `OXBEGINDATE`,`oxvoucherseries`.`OXENDDATE` AS `OXENDDATE`,`oxvoucherseries`.`OXALLOWSAMESERIES` AS `OXALLOWSAMESERIES`,`oxvoucherseries`.`OXALLOWOTHERSERIES` AS `OXALLOWOTHERSERIES`,`oxvoucherseries`.`OXALLOWUSEANOTHER` AS `OXALLOWUSEANOTHER`,`oxvoucherseries`.`OXMINIMUMVALUE` AS `OXMINIMUMVALUE`,`oxvoucherseries`.`OXCALCULATEONCE` AS `OXCALCULATEONCE`,`oxvoucherseries`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvoucherseries` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvoucherseries_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxvoucherseries_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvoucherseries_1` AS select `oxvoucherseries`.`OXID` AS `OXID`,`oxvoucherseries`.`OXMAPID` AS `OXMAPID`,`oxvoucherseries`.`OXSHOPID` AS `OXSHOPID`,`oxvoucherseries`.`OXSERIENR` AS `OXSERIENR`,`oxvoucherseries`.`OXSERIEDESCRIPTION` AS `OXSERIEDESCRIPTION`,`oxvoucherseries`.`OXDISCOUNT` AS `OXDISCOUNT`,`oxvoucherseries`.`OXDISCOUNTTYPE` AS `OXDISCOUNTTYPE`,`oxvoucherseries`.`OXBEGINDATE` AS `OXBEGINDATE`,`oxvoucherseries`.`OXENDDATE` AS `OXENDDATE`,`oxvoucherseries`.`OXALLOWSAMESERIES` AS `OXALLOWSAMESERIES`,`oxvoucherseries`.`OXALLOWOTHERSERIES` AS `OXALLOWOTHERSERIES`,`oxvoucherseries`.`OXALLOWUSEANOTHER` AS `OXALLOWUSEANOTHER`,`oxvoucherseries`.`OXMINIMUMVALUE` AS `OXMINIMUMVALUE`,`oxvoucherseries`.`OXCALCULATEONCE` AS `OXCALCULATEONCE`,`oxvoucherseries`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxvoucherseries` join `oxvoucherseries2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxvoucherseries`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxwrapping`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxwrapping`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXNAME_1` AS `OXNAME_1`,`oxwrapping`.`OXNAME_2` AS `OXNAME_2`,`oxwrapping`.`OXNAME_3` AS `OXNAME_3`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_1`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_1` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxwrapping`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxwrapping`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXNAME_1` AS `OXNAME_1`,`oxwrapping`.`OXNAME_2` AS `OXNAME_2`,`oxwrapping`.`OXNAME_3` AS `OXNAME_3`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxwrapping` join `oxwrapping2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxwrapping`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_1_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_1_de` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxwrapping` join `oxwrapping2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxwrapping`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_1_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_1_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_1_en` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME_1` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from (`oxwrapping` join `oxwrapping2shop` `t2s` on((`t2s`.`OXMAPOBJECTID` = `oxwrapping`.`OXMAPID`))) where (`t2s`.`OXSHOPID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_de`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_de` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_en`
--

/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_en` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXMAPID` AS `OXMAPID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME_1` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 15:18:45
