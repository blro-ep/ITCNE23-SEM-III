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
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL AUTO_INCREMENT,
  `artikelnummer` varchar(45) DEFAULT NULL,
  `gewicht` varchar(45) DEFAULT NULL,
  `seriennummer` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_artikel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
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
  `lieferschein` int(11) DEFAULT NULL,
  `positionen_total` int(11) DEFAULT NULL,
  `artikel_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_behaelter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaelter`
--

LOCK TABLES `behaelter` WRITE;
/*!40000 ALTER TABLE `behaelter` DISABLE KEYS */;
/*!40000 ALTER TABLE `behaelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benutzer` (
  `id_benutzer` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_benutzer`)
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
-- Table structure for table `datum`
--

DROP TABLE IF EXISTS `datum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datum` (
  `id_datum` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `quartal` int(11) DEFAULT NULL,
  `monat` int(11) DEFAULT NULL,
  `woche` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datum`
--

LOCK TABLES `datum` WRITE;
/*!40000 ALTER TABLE `datum` DISABLE KEYS */;
/*!40000 ALTER TABLE `datum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunde` (
  `id_kunde` int(11) NOT NULL AUTO_INCREMENT,
  `kundennummer` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kunde`)
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
  `ref_kunde` int(11) DEFAULT NULL,
  `ref_artikel` int(11) DEFAULT NULL,
  `ref_behaelter` int(11) DEFAULT NULL,
  `ref_benutzer` int(11) DEFAULT NULL,
  `ref_datum` int(11) DEFAULT NULL,
  `ref_statuscode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lieferschein`),
  KEY `lieferschein_artikel_FK` (`ref_artikel`),
  KEY `lieferschein_behaelter_FK` (`ref_behaelter`),
  KEY `lieferschein_kunde_FK` (`ref_kunde`),
  KEY `lieferschein_benutzer_FK` (`ref_benutzer`),
  KEY `lieferschein_datum_FK` (`ref_datum`),
  KEY `lieferschein_statuscode_FK` (`ref_statuscode`),
  CONSTRAINT `lieferschein_artikel_FK` FOREIGN KEY (`ref_artikel`) REFERENCES `artikel` (`id_artikel`),
  CONSTRAINT `lieferschein_behaelter_FK` FOREIGN KEY (`ref_behaelter`) REFERENCES `behaelter` (`id_behaelter`),
  CONSTRAINT `lieferschein_benutzer_FK` FOREIGN KEY (`ref_benutzer`) REFERENCES `benutzer` (`id_benutzer`),
  CONSTRAINT `lieferschein_datum_FK` FOREIGN KEY (`ref_datum`) REFERENCES `datum` (`id_datum`),
  CONSTRAINT `lieferschein_kunde_FK` FOREIGN KEY (`ref_kunde`) REFERENCES `kunde` (`id_kunde`),
  CONSTRAINT `lieferschein_statuscode_FK` FOREIGN KEY (`ref_statuscode`) REFERENCES `statuscode` (`id_statuscode`)
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

-- Dump completed on 2024-06-19 20:29:10
