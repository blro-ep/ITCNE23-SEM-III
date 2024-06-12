-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dwh
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
  KEY `ref_status` (`ref_status`),
  CONSTRAINT `benutzer_ibfk_1` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
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
  KEY `ref_status` (`ref_status`),
  CONSTRAINT `kunde_ibfk_1` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
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
  KEY `ref_benutzer` (`ref_benutzer`),
  KEY `ref_kunde` (`ref_kunde`),
  KEY `ref_status` (`ref_status`),
  CONSTRAINT `lieferschein_ibfk_1` FOREIGN KEY (`ref_benutzer`) REFERENCES `benutzer` (`id_benutzer`),
  CONSTRAINT `lieferschein_ibfk_2` FOREIGN KEY (`ref_kunde`) REFERENCES `kunde` (`id_kunde`),
  CONSTRAINT `lieferschein_ibfk_3` FOREIGN KEY (`ref_status`) REFERENCES `statuscode` (`id_statuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferschein`
--

LOCK TABLES `lieferschein` WRITE;
/*!40000 ALTER TABLE `lieferschein` DISABLE KEYS */;
/*!40000 ALTER TABLE `lieferschein` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuscode`
--

LOCK TABLES `statuscode` WRITE;
/*!40000 ALTER TABLE `statuscode` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dwh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 20:13:59
