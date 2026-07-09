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
-- Table structure for table `content_session`
--

DROP TABLE IF EXISTS `content_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_date` varchar(255) NOT NULL,
  `content_detail_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKebsoonvgalxrbrk4fgsss9952` (`content_detail_id`),
  CONSTRAINT `FKebsoonvgalxrbrk4fgsss9952` FOREIGN KEY (`content_detail_id`) REFERENCES `content_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_session`
--

LOCK TABLES `content_session` WRITE;
/*!40000 ALTER TABLE `content_session` DISABLE KEYS */;
INSERT INTO `content_session` VALUES (1,'1일차',51),(2,'2일차',51),(3,'3일차',51),(4,'1일차',52),(5,'2일차',52),(6,'3일차',52),(7,'1일차',53),(8,'2일차',53),(9,'3일차',53),(10,'1일차',54),(11,'2일차',54),(12,'3일차',54),(13,'1일차',55),(14,'2일차',55),(15,'3일차',55),(16,'1일차',56),(17,'2일차',56),(18,'3일차',56),(19,'1일차',57),(20,'2일차',57),(21,'3일차',57),(22,'1일차',58),(23,'2일차',58),(24,'3일차',58),(25,'1일차',59),(26,'2일차',59),(27,'3일차',59),(28,'1일차',60),(29,'2일차',60),(30,'3일차',60),(31,'1일차',61),(32,'2일차',61),(33,'3일차',61),(34,'1일차',62),(35,'2일차',62),(36,'3일차',62);
/*!40000 ALTER TABLE `content_session` ENABLE KEYS */;
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
