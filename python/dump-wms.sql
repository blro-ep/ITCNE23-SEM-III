-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wms
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL AUTO_INCREMENT,
  `artikelnummer` varchar(45) DEFAULT NULL,
  `ref_status` int(11) DEFAULT NULL,
  `gewicht` varchar(45) DEFAULT NULL,
  `Seriennummer` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_artikel`),
  KEY `fk_artikel_1_idx` (`ref_status`),
  CONSTRAINT `fk_artikel_1` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
INSERT INTO `artikel` VALUES (1,'1011',5,'111',NULL),(2,'1012',5,'112',NULL),(3,'1013',5,'113',NULL),(4,'1014',5,'114',NULL),(5,'1015',5,'115',NULL),(6,'1016',5,'116',NULL),(7,'1017',5,'117',NULL),(8,'1018',5,'118',NULL),(9,'1019',1,'119',NULL),(10,'1020',1,'120',NULL),(11,'1021',1,'121',NULL),(12,'1022',5,'122',NULL),(13,'1023',5,'123',NULL),(14,'1024',5,'124',NULL),(15,'1025',5,'125',NULL),(16,'1026',1,'126',NULL),(17,'1027',1,'127',NULL);
/*!40000 ALTER TABLE `artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behaelter`
--

DROP TABLE IF EXISTS `behaelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behaelter` (
  `id_behaelter` int(11) NOT NULL AUTO_INCREMENT,
  `erstellt_datum` date DEFAULT NULL,
  `boxtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_behaelter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaelter`
--

LOCK TABLES `behaelter` WRITE;
/*!40000 ALTER TABLE `behaelter` DISABLE KEYS */;
INSERT INTO `behaelter` VALUES (1,'2024-06-05','1');
/*!40000 ALTER TABLE `behaelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behaelter_position`
--

DROP TABLE IF EXISTS `behaelter_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behaelter_position` (
  `id_behaelter_position` int(11) NOT NULL AUTO_INCREMENT,
  `ref_behaelter` int(11) DEFAULT NULL,
  `ref_lieferschein_positionen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_behaelter_position`),
  KEY `fk_behaleter_positionen_1_idx` (`ref_behaelter`),
  KEY `fk_behaleter_positionen_4_idx` (`ref_lieferschein_positionen`),
  CONSTRAINT `fk_behaleter_positionen_1` FOREIGN KEY (`ref_behaelter`) REFERENCES `behaelter` (`id_behaelter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_behaleter_positionen_4` FOREIGN KEY (`ref_lieferschein_positionen`) REFERENCES `lieferschein_position` (`id_lieferschein_position`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaelter_position`
--

LOCK TABLES `behaelter_position` WRITE;
/*!40000 ALTER TABLE `behaelter_position` DISABLE KEYS */;
INSERT INTO `behaelter_position` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `behaelter_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benutzer` (
  `id_benutzer` int(11) NOT NULL AUTO_INCREMENT,
  `ref_status` int(11) DEFAULT NULL,
  `unsername` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_benutzer`),
  KEY `fk_benutzer_1_idx` (`ref_status`),
  CONSTRAINT `fk_benutzer_1` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
INSERT INTO `benutzer` VALUES (1,8,'','Meier','Gabor'),(2,8,NULL,'Trötsch','Chaspar'),(3,4,NULL,'Meierisli','Meila');
/*!40000 ALTER TABLE `benutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunde` (
  `id_kunde` int(11) NOT NULL AUTO_INCREMENT,
  `ref_status` int(11) DEFAULT NULL,
  `kundennummer` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `rechnungsadresse` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kunde`),
  KEY `fk_kunde_1_idx` (`ref_status`),
  CONSTRAINT `fk_kunde_1` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` VALUES (1,7,2222,'Hugentoble','Bachstrasse 5, 6010 Kriens'),(2,7,2223,'Gröbbler','Schoggigasse 17, 8604 Schwerzenbach'),(3,7,2224,'Chnuschti','Dättnauerstrasse 99, 8400 Winterthur'),(4,7,2225,'Chnebu','Moosweg 7, 6012 Obernau'),(5,3,2226,'Bluem','im Thon 18, 8762 Schwanden'),(6,7,2227,'Hobler','Seetalstrasse 9, 6005 Luzern');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lagerplatz`
--

DROP TABLE IF EXISTS `lagerplatz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lagerplatz` (
  `id_lagerplatz` int(11) NOT NULL AUTO_INCREMENT,
  `ref_artikel` int(11) DEFAULT NULL,
  `platz` varchar(45) DEFAULT NULL,
  `bestand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lagerplatz`),
  KEY `fk_lagerplatz_1_idx` (`ref_artikel`),
  CONSTRAINT `fk_lagerplatz_1` FOREIGN KEY (`ref_artikel`) REFERENCES `artikel` (`id_artikel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lagerplatz`
--

LOCK TABLES `lagerplatz` WRITE;
/*!40000 ALTER TABLE `lagerplatz` DISABLE KEYS */;
INSERT INTO `lagerplatz` VALUES (1,1,'1',5),(2,2,'2',7),(3,3,'3',44),(4,4,'4',4),(5,5,'5',9),(6,6,'6',2),(7,7,'7',4),(8,8,'8',6),(9,9,'9',22),(10,10,'10',3),(11,11,'11',7),(12,12,'12',9),(13,13,'13',10),(14,14,'14',24),(15,15,'15',9),(16,16,'16',1),(17,17,'17',2);
/*!40000 ALTER TABLE `lagerplatz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieferschein`
--

DROP TABLE IF EXISTS `lieferschein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieferschein` (
  `id_lieferschein` int(11) NOT NULL AUTO_INCREMENT,
  `ref_benutzer` int(11) DEFAULT NULL,
  `ref_kunde` int(11) DEFAULT NULL,
  `ref_status` int(11) DEFAULT NULL,
  `lieferschein_nummer` int(11) DEFAULT NULL,
  `lieferadresse` varchar(45) DEFAULT NULL,
  `bestell_datum` datetime DEFAULT NULL,
  `liefer_datum` date DEFAULT NULL,
  PRIMARY KEY (`id_lieferschein`),
  KEY `fk_lieferschein_1_idx` (`ref_benutzer`),
  KEY `fk_lieferschein_2_idx` (`ref_kunde`),
  KEY `fk_lieferschein_3_idx` (`ref_status`),
  CONSTRAINT `fk_lieferschein_1` FOREIGN KEY (`ref_benutzer`) REFERENCES `benutzer` (`id_benutzer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_2` FOREIGN KEY (`ref_kunde`) REFERENCES `kunde` (`id_kunde`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_3` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferschein`
--

LOCK TABLES `lieferschein` WRITE;
/*!40000 ALTER TABLE `lieferschein` DISABLE KEYS */;
INSERT INTO `lieferschein` VALUES (1,1,1,6,NULL,'Brünigstrasse 44, 6047 Horw','2024-06-01 00:00:00','2024-06-10');
/*!40000 ALTER TABLE `lieferschein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieferschein_position`
--

DROP TABLE IF EXISTS `lieferschein_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieferschein_position` (
  `id_lieferschein_position` int(11) NOT NULL AUTO_INCREMENT,
  `ref_lieferschein` int(11) DEFAULT NULL,
  `ref_artikel` int(11) DEFAULT NULL,
  `menge` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lieferschein_position`),
  KEY `fk_lieferschein_positionen_2_idx` (`ref_artikel`),
  KEY `fk_lieferschein_positionen_1_idx` (`ref_lieferschein`),
  CONSTRAINT `fk_lieferschein_positionen_1` FOREIGN KEY (`ref_lieferschein`) REFERENCES `lieferschein` (`id_lieferschein`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_positionen_2` FOREIGN KEY (`ref_artikel`) REFERENCES `artikel` (`id_artikel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferschein_position`
--

LOCK TABLES `lieferschein_position` WRITE;
/*!40000 ALTER TABLE `lieferschein_position` DISABLE KEYS */;
INSERT INTO `lieferschein_position` VALUES (1,1,1,3),(2,1,2,1);
/*!40000 ALTER TABLE `lieferschein_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seriennummer`
--

DROP TABLE IF EXISTS `seriennummer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seriennummer` (
  `id_seriennummer` int(11) NOT NULL AUTO_INCREMENT,
  `ref_lieferschein_position` int(11) DEFAULT NULL,
  `seriennummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_seriennummer`),
  KEY `fk_seriennummer_1_idx` (`ref_lieferschein_position`),
  CONSTRAINT `fk_seriennummer_1` FOREIGN KEY (`ref_lieferschein_position`) REFERENCES `lieferschein_position` (`id_lieferschein_position`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seriennummer`
--

LOCK TABLES `seriennummer` WRITE;
/*!40000 ALTER TABLE `seriennummer` DISABLE KEYS */;
/*!40000 ALTER TABLE `seriennummer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuscode`
--

DROP TABLE IF EXISTS `statuscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuscode` (
  `id_statuscode` int(11) NOT NULL AUTO_INCREMENT,
  `code_type` int(11) DEFAULT NULL,
  `code_bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_statuscode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuscode`
--

LOCK TABLES `statuscode` WRITE;
/*!40000 ALTER TABLE `statuscode` DISABLE KEYS */;
INSERT INTO `statuscode` VALUES (1,0,'inaktiv_artikel'),(2,0,'inaktiv_lieferschein'),(3,0,'inaktiv_kunde'),(4,0,'inaktiv_benutzer'),(5,10,'aktiv_artikel'),(6,10,'aktiv_lieferschein'),(7,10,'aktiv_kunde'),(8,10,'aktiv_benutzer');
/*!40000 ALTER TABLE `statuscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 11:08:51
