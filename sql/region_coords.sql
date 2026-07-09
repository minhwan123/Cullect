-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: culture_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `region_coords`
--

DROP TABLE IF EXISTS `region_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_coords` (
  `region` text,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_coords`
--

LOCK TABLES `region_coords` WRITE;
/*!40000 ALTER TABLE `region_coords` DISABLE KEYS */;
INSERT INTO `region_coords` VALUES ('강남구',37.5172,127.0473),('강동구',37.5301,127.1238),('강북구',37.6396,127.0257),('강서구',37.5509,126.8495),('관악구',37.4784,126.9516),('광진구',37.5384,127.082),('구로구',37.4954,126.8874),('금천구',37.4604,126.8958),('노원구',37.6544,127.0568),('도봉구',37.6688,127.0471),('동대문구',37.5744,127.0396),('동작구',37.5124,126.9392),('마포구',37.5663,126.9015),('서대문구',37.5794,126.9368),('서초구',37.4836,127.0324),('성동구',37.5633,127.0364),('성북구',37.5894,127.0167),('송파구',37.5145,127.1066),('양천구',37.5169,126.8664),('영등포구',37.5264,126.8963),('용산구',37.5326,126.9904),('은평구',37.6027,126.9291),('종로구',37.5731,126.979),('중구',37.5639,126.9976),('중랑구',37.6063,127.0927);
/*!40000 ALTER TABLE `region_coords` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 22:11:23
