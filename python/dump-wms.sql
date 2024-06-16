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
INSERT INTO `artikel` VALUES (1,'1011',5,'111',0),(2,'1012',5,'112',0),(3,'1013',5,'113',0),(4,'1014',5,'114',0),(5,'1015',5,'115',1),(6,'1016',5,'116',0),(7,'1017',5,'117',0),(8,'1018',5,'118',0),(9,'1019',1,'119',0),(10,'1020',1,'120',0),(11,'1021',1,'121',0),(12,'1022',5,'122',0),(13,'1023',5,'123',0),(14,'1024',5,'124',0),(15,'1025',5,'125',0),(16,'1026',1,'126',0),(17,'1027',1,'127',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaelter`
--

LOCK TABLES `behaelter` WRITE;
/*!40000 ALTER TABLE `behaelter` DISABLE KEYS */;
INSERT INTO `behaelter` VALUES (1,'2024-06-05','1'),(2,'2024-06-11','1'),(3,'2024-06-11','2'),(4,'2024-06-11','1'),(5,'2024-06-17','1'),(6,'2024-06-13','1'),(7,'2024-06-15','1'),(8,'2024-06-15','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaelter_position`
--

LOCK TABLES `behaelter_position` WRITE;
/*!40000 ALTER TABLE `behaelter_position` DISABLE KEYS */;
INSERT INTO `behaelter_position` VALUES (1,1,1),(2,1,2),(4,2,5),(5,3,6),(6,4,7),(7,7,3),(8,7,4),(9,8,14),(10,5,8);
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
INSERT INTO `benutzer` VALUES (1,8,'taamega1','Meier','Gabor'),(2,8,'taatrch1','Trötsch','Chaspar'),(3,4,'taameme1','Meierisli','Meila');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferschein`
--

LOCK TABLES `lieferschein` WRITE;
/*!40000 ALTER TABLE `lieferschein` DISABLE KEYS */;
INSERT INTO `lieferschein` VALUES (1,1,1,6,'Brünigstrasse 44, 6047 Horw','2024-06-01 00:00:00','2024-06-10'),(2,2,2,6,'Im Thon 18, 8762 Schwanden','2024-06-16 13:15:22','2024-06-18'),(3,3,3,6,'In der Höh 28, 8604 Schwerzenbach','2024-06-10 23:55:12','2024-06-12'),(6,2,4,6,'Am Hang 99, 4555 Ochstenstein','2024-06-12 03:15:22','2024-06-14');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferschein_position`
--

LOCK TABLES `lieferschein_position` WRITE;
/*!40000 ALTER TABLE `lieferschein_position` DISABLE KEYS */;
INSERT INTO `lieferschein_position` VALUES (1,1,1,3),(2,1,2,1),(3,2,12,4),(4,2,13,1),(5,3,3,3),(6,3,4,12),(7,3,5,9),(8,6,6,1),(14,2,17,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seriennummer`
--

LOCK TABLES `seriennummer` WRITE;
/*!40000 ALTER TABLE `seriennummer` DISABLE KEYS */;
INSERT INTO `seriennummer` VALUES (1,3,'7304582145036'),(2,3,'8159327046802'),(3,3,'6210489753168'),(4,3,'3945701289650'),(5,3,'4829361075412'),(6,3,'1098245368702'),(7,3,'8562147392085'),(8,3,'6259483710594'),(9,3,'2301869547028'),(10,6,'5039726184350'),(11,6,'7261850392475'),(12,6,'9182074653204'),(13,6,'1049587623018');
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

-- Dump completed on 2024-06-16 16:37:35
