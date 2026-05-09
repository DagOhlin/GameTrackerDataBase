-- MySQL dump 10.13  Distrib 9.6.0, for Linux (x86_64)
--
-- Host: localhost    Database: GameTracker
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Developers`
--

DROP TABLE IF EXISTS `Developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Developers` (
  `DeveloperID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DeveloperID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Developers`
--

LOCK TABLES `Developers` WRITE;
/*!40000 ALTER TABLE `Developers` DISABLE KEYS */;
INSERT INTO `Developers` VALUES (1,'Nintendo EPD'),(2,'FromSoftware'),(3,'Rockstar Games'),(4,'Naughty Dog'),(5,'CD Projekt Red'),(6,'Bethesda Game Studios'),(7,'Valve'),(8,'Square Enix'),(9,'Capcom'),(10,'Larian Studios');
/*!40000 ALTER TABLE `Developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Games` (
  `GameID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `DeveloperID` int unsigned DEFAULT NULL,
  `AverageScore` float DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `DeveloperID` (`DeveloperID`),
  CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`DeveloperID`) REFERENCES `Developers` (`DeveloperID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES (1,'The Legend of Zelda: Breath of the Wild',1,5.8125),(2,'Super Mario Odyssey',1,5.38889),(3,'Splatoon 2',1,4.94737),(4,'Dark Souls III',2,6.28571),(5,'Sekiro: Shadows Die Twice',2,5.04167),(6,'Bloodborne',2,5.56522),(7,'Grand Theft Auto V',3,6.88889),(8,'Red Dead Redemption 2',3,6.29412),(9,'The Last of Us Part I',4,4.47826),(10,'Uncharted 4: A Thief\'s End',4,6.53333),(11,'The Witcher 3: Wild Hunt',5,5.35294),(12,'Cyberpunk 2077',5,6.36842),(13,'The Elder Scrolls V: Skyrim',6,5.21429),(14,'Fallout 4',6,4.76),(15,'Starfield',6,5.1),(16,'Half-Life 2',7,5.07143),(17,'Portal 2',7,5.26316),(18,'Left 4 Dead 2',7,5.625),(19,'Final Fantasy VII Remake',8,4.68421),(20,'Kingdom Hearts III',8,4.52632),(21,'Resident Evil 4 Remake',9,6.08333),(22,'Monster Hunter: World',9,5.61111),(23,'Devil May Cry 5',9,5.11765),(24,'Divinity: Original Sin 2',10,3.61905),(25,'Baldur\'s Gate 3',10,5.93333);
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HasPlayed`
--

DROP TABLE IF EXISTS `HasPlayed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HasPlayed` (
  `PlayerID` int unsigned NOT NULL,
  `GameID` int unsigned NOT NULL,
  `Score` int DEFAULT NULL,
  `DateFinished` date DEFAULT NULL,
  PRIMARY KEY (`PlayerID`,`GameID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `HasPlayed_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`),
  CONSTRAINT `HasPlayed_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HasPlayed`
--

LOCK TABLES `HasPlayed` WRITE;
/*!40000 ALTER TABLE `HasPlayed` DISABLE KEYS */;
INSERT INTO `HasPlayed` VALUES (1,1,5,'2019-04-30'),(1,2,4,'2017-01-26'),(1,4,7,'2015-03-23'),(1,5,5,'2020-10-15'),(1,7,8,'2020-05-10'),(1,11,8,'2020-03-28'),(1,13,3,'2015-10-05'),(1,14,3,'2025-05-07'),(1,17,10,'2023-11-25'),(2,4,2,'2024-08-13'),(2,5,2,'2017-07-13'),(2,6,8,'2021-12-28'),(2,7,3,'2024-09-17'),(2,9,3,'2019-10-28'),(2,11,7,'2025-01-17'),(2,15,3,'2020-06-02'),(2,17,2,'2024-12-05'),(2,19,2,'2021-06-12'),(2,21,10,'2022-10-25'),(4,13,8,'2019-11-27'),(4,19,9,'2021-03-29'),(4,22,2,'2017-08-01'),(5,3,10,'2025-03-03'),(5,5,6,'2022-05-10'),(5,7,1,'2024-12-19'),(5,10,9,'2021-01-19'),(5,14,5,'2026-03-22'),(5,18,8,'2025-08-12'),(5,24,3,'2015-10-29'),(5,25,8,'2017-06-14'),(6,3,2,'2020-01-28'),(6,11,10,'2017-04-05'),(6,13,8,'2018-03-08'),(6,14,7,'2022-10-26'),(6,17,6,'2017-02-22'),(6,19,4,'2022-10-09'),(6,21,6,'2020-07-30'),(6,24,5,'2021-11-06'),(6,25,5,'2015-05-07'),(7,1,6,'2022-12-17'),(7,6,9,'2025-07-31'),(7,9,1,'2018-04-19'),(7,12,8,'2019-12-25'),(7,16,4,'2020-06-04'),(7,25,7,'2018-06-23'),(9,5,6,'2019-03-18'),(9,12,10,'2019-06-01'),(9,20,5,'2026-02-27'),(10,2,3,'2016-12-24'),(10,3,2,'2019-07-08'),(10,5,2,'2020-05-22'),(10,11,3,'2023-08-16'),(10,12,9,'2019-08-25'),(10,13,4,'2015-11-27'),(10,14,7,'2024-12-05'),(10,22,4,'2026-02-02'),(10,23,6,'2018-03-09'),(10,24,1,'2026-01-09'),(11,2,9,'2020-03-27'),(11,5,3,'2023-05-12'),(11,19,7,'2022-12-26'),(11,21,4,'2017-01-23'),(11,24,3,'2017-12-20'),(12,5,5,'2015-01-03'),(12,9,1,'2020-09-27'),(12,14,1,'2022-01-14'),(12,15,4,'2023-11-23'),(12,22,9,'2017-09-24'),(12,24,1,'2024-05-03'),(14,2,9,'2015-07-13'),(14,25,4,'2021-02-22'),(15,2,2,'2023-08-20'),(15,4,10,'2015-07-03'),(15,8,6,'2024-12-22'),(15,9,4,'2022-02-13'),(15,14,7,'2021-11-25'),(15,19,2,'2024-08-29'),(15,20,8,'2016-07-23'),(15,22,6,'2017-10-07'),(15,24,5,'2020-12-16'),(16,8,9,'2022-10-20'),(16,12,10,'2023-04-13'),(16,13,5,'2022-04-01'),(16,14,7,'2019-07-23'),(16,19,2,'2016-07-09'),(16,20,1,'2016-09-20'),(16,21,7,'2020-03-13'),(16,22,7,'2023-07-01'),(17,2,8,'2025-08-29'),(17,5,1,'2021-06-15'),(17,9,6,'2021-09-13'),(17,12,5,'2025-02-22'),(17,14,2,'2021-08-09'),(17,16,9,'2024-09-12'),(17,18,9,'2020-10-12'),(17,21,10,'2024-05-21'),(17,22,10,'2021-12-13'),(17,25,4,'2019-03-09'),(18,11,5,'2016-11-17'),(19,4,4,'2017-05-08'),(19,5,10,'2023-06-13'),(19,8,6,'2023-06-06'),(19,11,7,'2024-01-30'),(19,12,5,'2018-01-28'),(19,18,10,'2022-02-25'),(19,24,5,'2021-06-23'),(20,7,6,'2024-08-29'),(21,5,4,'2016-12-24'),(21,8,2,'2022-01-04'),(22,1,8,'2019-09-29'),(22,6,9,'2017-01-29'),(22,10,4,'2023-04-05'),(22,14,9,'2025-04-19'),(22,15,6,'2024-03-04'),(22,19,5,'2024-03-16'),(22,22,3,'2015-12-31'),(22,23,8,'2018-12-03'),(23,5,3,'2024-12-03'),(23,23,8,'2023-03-11'),(24,3,7,'2024-02-29'),(24,6,10,'2016-01-31'),(24,9,1,'2019-01-01'),(24,13,6,'2020-11-04'),(24,15,2,'2024-06-28'),(24,16,1,'2019-05-29'),(25,2,9,'2016-02-05'),(25,3,10,'2025-02-01'),(25,8,7,'2020-07-03'),(25,9,5,'2022-07-12'),(25,10,8,'2023-01-10'),(25,13,1,'2018-03-19'),(25,15,4,'2016-05-23'),(25,18,2,'2016-03-28'),(25,21,10,'2017-07-18'),(25,24,6,'2016-07-10'),(26,6,4,'2024-10-26'),(26,9,1,'2023-04-24'),(27,6,8,'2022-09-30'),(27,9,10,'2016-01-31'),(27,16,1,'2020-10-31'),(27,20,10,'2024-01-11'),(27,23,2,'2021-10-09'),(28,1,6,'2021-06-19'),(28,2,6,'2017-08-10'),(28,5,5,'2022-07-06'),(28,6,6,'2025-05-28'),(28,9,4,'2023-07-18'),(28,17,8,'2018-08-20'),(28,23,3,'2020-05-19'),(28,24,5,'2020-12-15'),(29,4,7,'2024-05-19'),(29,5,10,'2026-01-09'),(29,6,6,'2018-05-03'),(29,7,6,'2024-02-08'),(30,1,3,'2020-09-21'),(30,3,7,'2017-08-18'),(30,7,9,'2025-08-19'),(30,11,7,'2022-07-23'),(30,12,3,'2015-11-10'),(30,21,4,'2025-07-09'),(30,22,10,'2023-04-27'),(31,7,10,'2015-08-18'),(31,13,3,'2016-03-01'),(31,25,5,'2017-07-15'),(32,2,10,'2023-03-12'),(32,12,2,'2024-09-15'),(32,14,7,'2026-03-30'),(32,20,4,'2018-03-22'),(32,21,5,'2025-05-09'),(32,24,3,'2019-01-11'),(33,16,8,'2016-04-03'),(33,17,10,'2025-08-28'),(33,23,9,'2016-06-04'),(34,9,1,'2017-06-12'),(34,10,8,'2025-04-09'),(34,12,8,'2018-02-02'),(34,20,4,'2017-04-08'),(34,21,9,'2024-05-31'),(35,2,4,'2025-08-21'),(35,11,7,'2025-12-16'),(35,13,9,'2021-09-01'),(35,14,1,'2023-07-05'),(35,15,7,'2017-04-03'),(35,22,4,'2025-02-09'),(36,1,8,'2020-07-18'),(36,6,7,'2024-06-03'),(36,13,9,'2024-01-10'),(36,25,3,'2020-06-09'),(37,6,1,'2025-12-06'),(37,10,1,'2024-09-04'),(38,2,1,'2017-08-08'),(38,7,8,'2022-11-22'),(38,8,1,'2018-10-05'),(38,9,2,'2022-10-28'),(38,15,10,'2021-07-06'),(38,20,4,'2025-11-04'),(38,21,10,'2020-07-25'),(38,24,5,'2018-02-28'),(38,25,2,'2021-07-12'),(39,3,2,'2018-08-02'),(39,4,1,'2021-01-01'),(39,7,10,'2015-04-10'),(39,15,1,'2020-07-30'),(39,17,2,'2023-12-20'),(39,18,3,'2022-06-03'),(41,6,7,'2021-10-18'),(41,8,9,'2024-08-19'),(41,10,8,'2023-06-21'),(41,13,6,'2015-11-17'),(41,14,1,'2015-02-21'),(41,19,3,'2017-02-25'),(41,20,3,'2022-12-02'),(41,21,7,'2015-02-14'),(41,22,8,'2024-11-05'),(43,7,4,'2026-03-25'),(43,10,1,'2015-07-21'),(43,11,3,'2016-05-17'),(43,12,4,'2015-11-12'),(43,18,2,'2021-10-19'),(44,3,1,'2017-06-17'),(44,6,8,'2017-05-15'),(44,9,2,'2020-10-16'),(44,16,1,'2019-10-12'),(44,17,1,'2017-06-22'),(44,18,2,'2020-12-12'),(44,21,6,'2026-01-24'),(44,23,6,'2018-04-08'),(44,24,1,'2019-12-25'),(45,6,2,'2022-03-14'),(45,13,4,'2025-08-20'),(45,15,5,'2019-03-22'),(45,19,5,'2025-08-16'),(45,23,3,'2021-02-24'),(45,24,7,'2023-03-18'),(46,1,9,'2018-06-19'),(46,4,3,'2017-08-27'),(46,5,3,'2018-02-01'),(46,6,8,'2024-11-02'),(46,7,7,'2017-03-16'),(46,9,9,'2019-01-31'),(46,14,5,'2018-09-10'),(46,16,2,'2024-12-13'),(46,19,8,'2025-02-08'),(46,20,6,'2026-01-09'),(47,6,3,'2017-09-20'),(47,13,6,'2016-08-01'),(48,5,7,'2015-12-28'),(48,9,5,'2017-01-20'),(48,11,1,'2019-02-20'),(48,13,7,'2023-07-13'),(48,25,5,'2016-07-01'),(49,5,3,'2015-06-12'),(49,6,2,'2020-02-04'),(49,9,3,'2022-08-01'),(49,13,6,'2018-06-05'),(49,14,5,'2022-03-30'),(49,19,1,'2016-10-23'),(49,21,2,'2020-07-31'),(50,4,6,'2023-11-06'),(50,6,2,'2019-11-04'),(50,11,8,'2022-11-02'),(50,12,1,'2023-02-13'),(50,13,5,'2026-03-04'),(50,14,5,'2016-06-11'),(50,16,6,'2020-09-28'),(50,17,9,'2024-08-17'),(50,21,7,'2020-09-17'),(50,22,3,'2015-12-30'),(51,19,2,'2019-08-03'),(51,22,5,'2018-08-14'),(52,3,8,'2017-03-14'),(52,7,4,'2023-03-17'),(52,8,9,'2021-11-02'),(52,12,10,'2020-12-26'),(52,14,4,'2020-12-13'),(52,21,6,'2024-01-02'),(52,25,7,'2021-07-18'),(53,8,8,'2019-01-08'),(53,10,6,'2016-10-22'),(53,13,1,'2015-04-12'),(53,17,4,'2025-08-20'),(54,3,3,'2018-08-08'),(54,5,8,'2017-04-05'),(54,12,8,'2025-06-12'),(55,5,4,'2015-01-17'),(55,13,6,'2023-04-14'),(55,14,10,'2015-05-31'),(55,17,9,'2017-01-19'),(56,4,7,'2022-03-26'),(56,9,5,'2023-01-14'),(56,13,8,'2016-12-12'),(56,16,10,'2025-07-04'),(56,20,1,'2018-01-15'),(56,22,6,'2020-04-29'),(56,23,10,'2024-10-25'),(56,25,10,'2020-03-27'),(57,14,8,'2021-01-17'),(57,17,8,'2018-01-08'),(57,21,8,'2021-11-25'),(59,5,9,'2018-12-27'),(60,18,9,'2020-12-06'),(61,12,10,'2021-07-05'),(61,19,2,'2021-08-01'),(61,23,4,'2023-11-06'),(62,1,7,'2021-09-21'),(62,2,3,'2019-08-07'),(62,3,9,'2025-05-16'),(62,5,5,'2016-01-06'),(62,10,8,'2017-01-29'),(62,14,6,'2020-07-31'),(62,15,5,'2018-08-12'),(62,20,9,'2019-02-21'),(63,21,3,'2015-07-20'),(64,8,10,'2026-01-12'),(64,9,1,'2017-07-03'),(64,10,5,'2025-08-10'),(64,12,9,'2015-03-17'),(64,16,1,'2021-01-05'),(64,22,7,'2025-01-01'),(64,23,1,'2022-06-12'),(65,3,4,'2018-04-18'),(65,15,10,'2024-03-28'),(65,20,2,'2019-04-11'),(66,1,3,'2023-10-18'),(66,8,1,'2017-03-18'),(66,9,10,'2023-12-06'),(66,14,7,'2017-01-01'),(66,19,8,'2023-02-20'),(66,21,10,'2019-11-15'),(66,24,8,'2024-04-03'),(67,4,9,'2023-12-06'),(67,9,5,'2023-05-16'),(67,11,3,'2021-02-01'),(67,15,3,'2019-01-28'),(67,23,5,'2023-06-06'),(68,11,4,'2026-01-29'),(68,13,7,'2018-01-04'),(68,14,1,'2019-02-02'),(68,20,4,'2025-09-20'),(68,22,4,'2016-12-09'),(70,12,10,'2019-07-21'),(70,13,2,'2019-10-01'),(71,11,1,'2023-03-31'),(71,17,7,'2025-02-20'),(72,15,1,'2022-03-23'),(72,18,5,'2024-09-20'),(72,21,5,'2016-01-23'),(72,24,1,'2015-05-20'),(73,5,1,'2025-12-01'),(73,17,2,'2018-05-17'),(73,18,7,'2025-02-13'),(74,15,8,'2021-10-16'),(74,16,10,'2025-10-17'),(74,19,8,'2023-04-02'),(74,23,5,'2015-09-02'),(75,3,2,'2021-11-14'),(75,6,2,'2024-07-07'),(75,16,4,'2020-01-04'),(75,17,5,'2025-09-17'),(75,21,3,'2023-11-05'),(75,23,4,'2015-10-26'),(76,1,5,'2024-05-01'),(77,1,4,'2024-10-02'),(77,8,3,'2024-01-27'),(77,9,6,'2024-04-09'),(77,20,2,'2019-03-29'),(77,22,5,'2022-05-24'),(78,2,5,'2021-05-03'),(78,3,9,'2021-10-20'),(78,4,10,'2024-03-31'),(78,7,10,'2016-06-14'),(78,19,3,'2024-07-18'),(79,2,6,'2016-05-30'),(79,4,5,'2022-11-21'),(79,7,7,'2023-01-20'),(79,11,5,'2016-07-05'),(79,13,2,'2025-03-30'),(79,17,3,'2022-07-03'),(79,20,2,'2020-05-18'),(79,24,1,'2018-03-19'),(79,25,4,'2025-10-30'),(80,1,6,'2020-02-08'),(80,3,2,'2017-01-09'),(80,12,2,'2024-11-23'),(80,14,2,'2017-02-12'),(80,15,6,'2024-06-29'),(80,18,8,'2025-05-17'),(80,24,1,'2018-11-18'),(81,3,7,'2022-12-25'),(81,8,6,'2019-04-15'),(81,9,8,'2024-09-11'),(81,15,2,'2024-07-19'),(81,22,4,'2018-11-19'),(82,7,5,'2022-07-17'),(82,21,1,'2022-09-13'),(82,23,6,'2020-06-13'),(82,24,1,'2019-04-27'),(83,5,6,'2016-04-05'),(84,6,8,'2016-10-25'),(84,13,9,'2020-08-15'),(84,15,8,'2016-10-08'),(84,17,1,'2020-06-17'),(84,24,10,'2017-06-20'),(85,5,5,'2015-01-14'),(85,6,5,'2020-11-27'),(85,8,8,'2015-07-21'),(86,1,8,'2018-11-29'),(86,2,3,'2020-01-08'),(86,7,6,'2018-12-23'),(86,18,1,'2026-04-20'),(86,25,10,'2020-01-08'),(87,4,9,'2023-06-27'),(87,21,2,'2023-05-31'),(88,12,2,'2024-02-09'),(89,10,8,'2025-04-04'),(89,24,2,'2019-10-30'),(90,16,5,'2023-07-21'),(90,25,7,'2016-03-18'),(91,2,2,'2025-02-06'),(91,8,10,'2021-08-12'),(91,13,6,'2017-06-03'),(91,17,7,'2016-03-21'),(92,14,3,'2015-05-25'),(92,19,1,'2025-05-26'),(93,1,2,'2016-05-25'),(93,10,10,'2017-04-30'),(93,13,3,'2022-07-09'),(93,14,5,'2015-03-20'),(93,19,8,'2018-12-17'),(93,20,3,'2018-02-10'),(93,22,4,'2016-04-04'),(94,2,6,'2020-06-01'),(94,5,8,'2020-02-06'),(94,10,9,'2019-09-29'),(94,13,1,'2015-03-25'),(94,15,6,'2020-05-22'),(94,16,9,'2016-04-30'),(94,18,6,'2015-08-18'),(94,20,8,'2019-10-04'),(94,21,5,'2019-11-02'),(95,1,4,'2015-09-12'),(95,7,10,'2017-08-14'),(95,8,6,'2019-04-14'),(95,10,4,'2020-04-11'),(95,15,5,'2015-01-13'),(95,20,1,'2018-11-18'),(95,23,2,'2022-09-25'),(96,3,3,'2015-06-10'),(96,6,4,'2023-03-05'),(96,7,10,'2017-07-01'),(96,11,2,'2022-07-13'),(96,12,5,'2020-01-16'),(96,13,8,'2025-03-13'),(96,14,1,'2025-02-09'),(97,3,3,'2025-05-29'),(97,4,8,'2015-01-30'),(97,25,8,'2019-05-15'),(98,1,9,'2015-04-16'),(98,2,7,'2021-08-08'),(98,6,8,'2017-01-15'),(98,8,6,'2026-03-26'),(98,9,10,'2023-10-04'),(98,11,10,'2015-04-01'),(98,15,6,'2026-02-02'),(98,17,3,'2021-05-19'),(98,18,6,'2016-04-16'),(98,20,9,'2023-06-17'),(99,10,9,'2023-05-06'),(99,17,3,'2021-03-06'),(99,18,7,'2019-06-15'),(99,19,9,'2025-09-22'),(99,24,2,'2024-05-19'),(100,3,3,'2026-05-04'),(100,6,1,'2024-01-30'),(100,13,3,'2022-07-14'),(100,18,5,'2021-03-31'),(100,21,6,'2018-09-15'),(100,23,5,'2016-12-13');
/*!40000 ALTER TABLE `HasPlayed` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AverageScoreTrigger` AFTER INSERT ON `HasPlayed` FOR EACH ROW BEGIN
UPDATE Games
SET Games.AverageScore = (SELECT AVG(HasPlayed.Score) FROM HasPlayed WHERE HasPlayed.GameID = NEW.GameID) WHERE Games.GameID = NEW.GameID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Players` (
  `PlayerID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,'SlowFox9265',37),(2,'BraveFrog8673',31),(3,'FierceDuck8322',34),(4,'SillyOwl9468',51),(5,'SneakyWolf1978',61),(6,'SneakyEagle7755',47),(7,'BraveTiger3291',58),(8,'FastBear4289',22),(9,'FierceFox3099',17),(10,'ClumsyDog4591',23),(11,'SillyLion1606',21),(12,'SleepyFox9001',54),(13,'SneakyDog9294',20),(14,'BraveDog2049',53),(15,'SillyShark8004',54),(16,'BraveTiger2217',27),(17,'AngryLion3655',35),(18,'SillyDog2758',14),(19,'CleverTiger9670',48),(20,'ClumsyTiger4878',62),(21,'SadLion1231',62),(22,'HappyOwl2628',17),(23,'SneakyBear7067',56),(24,'SneakyShark2444',18),(25,'SleepyWolf8401',32),(26,'FastWolf7679',33),(27,'FierceTiger6211',59),(28,'SneakyTiger8993',14),(29,'HappyWolf5858',13),(30,'SillyFrog3115',35),(31,'ClumsyDuck4801',15),(32,'CleverBear8140',14),(33,'ClumsyWolf1309',26),(34,'SillyFox2448',45),(35,'FierceDuck3003',42),(36,'SneakyLion1981',54),(37,'BraveDog8215',16),(38,'ClumsyEagle8860',53),(39,'CleverEagle1659',37),(40,'HappyShark5476',65),(41,'AngryCat9208',41),(42,'FierceFrog8799',44),(43,'CleverFrog3936',33),(44,'SillyDuck4443',30),(45,'SlowFrog2444',52),(46,'FastEagle9192',61),(47,'SlowFox9188',13),(48,'SneakyTiger1454',23),(49,'SlowDuck5376',19),(50,'SadOwl7495',38),(51,'SneakyFrog1191',54),(52,'SillyShark6935',30),(53,'BraveShark8432',37),(54,'HappyEagle4947',47),(55,'ClumsyWolf9872',30),(56,'SillyDuck6816',59),(57,'FastLion8219',51),(58,'SlowShark2396',61),(59,'HappyCat7799',28),(60,'FastEagle1672',48),(61,'SneakyFrog4091',42),(62,'FastEagle4424',54),(63,'AngryBear9837',33),(64,'BraveCat1934',17),(65,'FierceEagle4747',51),(66,'SillyOwl9438',42),(67,'ClumsyShark4546',16),(68,'SlowFrog4528',63),(69,'CleverEagle8002',15),(70,'FastTiger7507',63),(71,'HappyBear4549',44),(72,'FierceDuck2076',18),(73,'AngryDuck1549',47),(74,'SadEagle8850',37),(75,'ClumsyDuck2549',35),(76,'SadWolf1692',25),(77,'BraveShark3241',31),(78,'AngryFrog8284',45),(79,'ClumsyDuck3637',20),(80,'BraveLion2451',36),(81,'SleepyEagle9308',42),(82,'BraveBear6296',25),(83,'FastTiger4365',37),(84,'ClumsyDog9882',24),(85,'CleverBear6472',53),(86,'AngryOwl5207',43),(87,'SleepyLion4919',26),(88,'SneakyEagle3105',34),(89,'SadCat4505',64),(90,'AngryShark1884',62),(91,'SleepyCat8715',21),(92,'SlowFrog8344',55),(93,'AngryLion2379',15),(94,'HappyDuck8449',65),(95,'SneakyShark9822',65),(96,'SadShark7779',40),(97,'HappyEagle1877',46),(98,'ClumsyTiger8779',15),(99,'SillyOwl8869',51),(100,'BraveEagle5557',27);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'GameTracker'
--

--
-- Dumping routines for database 'GameTracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGameToCollection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddGameToCollection`(IN game_name VARCHAR(255), IN player_ID INT UNSIGNED, IN score INT, OUT return_val INT, OUT return_message VARCHAR(255))
BEGIN 

DECLARE v_game_ID INT UNSIGNED;
DECLARE game_amount INT;
DECLARE already_played INT;

SELECT COUNT(*) INTO game_amount FROM Games WHERE Name = game_name;

IF game_amount = 0 THEN
	SET return_message = concat('Game ', game_name, ' does not exist');
    SET return_val = 1;
    
ELSEIF game_amount > 1 THEN
	SET return_message = concat('there are more than one game with name ', game_name, ' use ID instead');
    SET return_val = 2;
    
ELSE
	SELECT GameID INTO v_game_ID FROM Games WHERE Name = game_name;
    
    SELECT COUNT(*) INTO already_played FROM HasPlayed WHERE PlayerID = player_ID AND GameID = v_game_ID;
    
    IF already_played > 0 THEN
		SET return_message = concat('you have already added ', game_name, ' to your colection.');
		SET return_val = 3;
    ELSE
		INSERT INTO HasPlayed (GameID, PlayerID, Score) VALUES (v_game_ID, player_ID, score);
		SET return_message = concat('Game ', game_name, ' added to collection with score ', score);
		SET return_val = 0;
    END IF;
    
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-09 12:57:00
