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
-- Table structure for table `session_booths`
--

DROP TABLE IF EXISTS `session_booths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_booths` (
  `session_id` bigint NOT NULL,
  `booth_name` varchar(255) DEFAULT NULL,
  KEY `FK9iispktgmj4a9c46pg3vs8xb7` (`session_id`),
  CONSTRAINT `FK9iispktgmj4a9c46pg3vs8xb7` FOREIGN KEY (`session_id`) REFERENCES `content_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_booths`
--

LOCK TABLES `session_booths` WRITE;
/*!40000 ALTER TABLE `session_booths` DISABLE KEYS */;
INSERT INTO `session_booths` VALUES (1,'체육교육과'),(1,'수학과'),(1,'경제학과'),(2,'물리학과'),(2,'영어영문학과'),(2,'행정학과'),(3,'심리학과'),(3,'화학과'),(3,'기계공학과'),(4,'컴퓨터공학과'),(4,'사회복지학과'),(4,'전자공학과'),(5,'철학과'),(5,'건축학과'),(5,'미술교육과'),(6,'산업디자인학과'),(6,'정치외교학과'),(6,'무용학과'),(7,'외식경영학과'),(7,'호텔관광학과'),(7,'항공서비스학과'),(8,'아동가족학과'),(8,'교육학과'),(8,'유아교육과'),(9,'바이오의공학과'),(9,'해양학과'),(9,'지질학과'),(10,'기독교교육과'),(10,'종교학과'),(10,'동양철학과'),(11,'체육교육과'),(11,'수학과'),(11,'경제학과'),(12,'응용화학과'),(12,'응용통계학과'),(12,'정보통신공학과'),(13,'체육교육과'),(13,'수학과'),(13,'경제학과'),(14,'철학과'),(14,'건축학과'),(14,'미술교육과'),(15,'노인복지학과'),(15,'청소년학과'),(15,'상담심리학과'),(16,'철학과'),(16,'건축학과'),(16,'미술교육과'),(17,'체육교육과'),(17,'수학과'),(17,'경제학과'),(18,'외식경영학과'),(18,'호텔관광학과'),(18,'항공서비스학과'),(19,'노인복지학과'),(19,'청소년학과'),(19,'상담심리학과'),(20,'체육교육과'),(20,'수학과'),(20,'경제학과'),(21,'물리학과'),(21,'영어영문학과'),(21,'행정학과'),(22,'심리학과'),(22,'화학과'),(22,'기계공학과'),(23,'컴퓨터공학과'),(23,'사회복지학과'),(23,'전자공학과'),(24,'철학과'),(24,'건축학과'),(24,'미술교육과'),(25,'물리학과'),(25,'영어영문학과'),(25,'행정학과'),(26,'심리학과'),(26,'화학과'),(26,'기계공학과'),(27,'컴퓨터공학과'),(27,'사회복지학과'),(27,'전자공학과'),(28,'물리학과'),(28,'영어영문학과'),(28,'행정학과'),(29,'심리학과'),(29,'화학과'),(29,'기계공학과'),(30,'컴퓨터공학과'),(30,'사회복지학과'),(30,'전자공학과'),(31,'노인복지학과'),(31,'청소년학과'),(31,'상담심리학과'),(32,'체육교육과'),(32,'수학과'),(32,'경제학과'),(33,'철학과'),(33,'건축학과'),(33,'미술교육과'),(34,'체육교육과'),(34,'수학과'),(34,'경제학과'),(35,'외식경영학과'),(35,'호텔관광학과'),(35,'항공서비스학과'),(36,'건축디자인학과'),(36,'도예과'),(36,'금속공예과');
/*!40000 ALTER TABLE `session_booths` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 22:11:24
