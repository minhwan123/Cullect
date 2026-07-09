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
-- Table structure for table `session_artists`
--

DROP TABLE IF EXISTS `session_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_artists` (
  `session_id` bigint NOT NULL,
  `artist_name` varchar(255) DEFAULT NULL,
  KEY `FKhgeigjk5nrr2g7yacjwiep4yr` (`session_id`),
  CONSTRAINT `FKhgeigjk5nrr2g7yacjwiep4yr` FOREIGN KEY (`session_id`) REFERENCES `content_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_artists`
--

LOCK TABLES `session_artists` WRITE;
/*!40000 ALTER TABLE `session_artists` DISABLE KEYS */;
INSERT INTO `session_artists` VALUES (1,'세븐틴'),(1,'지코'),(1,'에픽하이'),(2,'블랙핑크'),(2,'르세라핌'),(2,'백예린'),(3,'에스파'),(3,'에픽하이'),(3,'지코'),(4,'다이나믹듀오'),(4,'빅뱅'),(4,'블랙핑크'),(5,'지코'),(5,'블랙핑크'),(5,'선미'),(6,'르세라핌'),(6,'볼빨간사춘기'),(6,'자이언티'),(7,'청하'),(7,'아이유'),(7,'빅뱅'),(8,'AKMU'),(8,'IVE'),(8,'에픽하이'),(9,'빅뱅'),(9,'청하'),(9,'블랙핑크'),(10,'뉴진스'),(10,'아이유'),(10,'볼빨간사춘기'),(11,'아이유'),(11,'지코'),(11,'다이나믹듀오'),(12,'IVE'),(12,'세븐틴'),(12,'르세라핌'),(13,'지코'),(13,'백예린'),(13,'빅뱅'),(14,'뉴진스'),(14,'자이언티'),(14,'빅뱅'),(15,'볼빨간사춘기'),(15,'백예린'),(15,'AKMU'),(16,'IVE'),(16,'NCT'),(16,'르세라핌'),(17,'청하'),(17,'르세라핌'),(17,'다이나믹듀오'),(18,'청하'),(18,'장기하'),(18,'선미'),(19,'다이나믹듀오'),(19,'백예린'),(19,'자이언티'),(20,'볼빨간사춘기'),(20,'IVE'),(20,'에픽하이'),(21,'세븐틴'),(21,'뉴진스'),(21,'AKMU'),(22,'NCT'),(22,'에픽하이'),(22,'백예린'),(23,'청하'),(23,'백예린'),(23,'장기하'),(24,'볼빨간사춘기'),(24,'빅뱅'),(24,'에픽하이'),(25,'르세라핌'),(25,'지코'),(25,'블랙핑크'),(26,'IVE'),(26,'르세라핌'),(26,'선미'),(27,'자이언티'),(27,'르세라핌'),(27,'볼빨간사춘기'),(28,'선미'),(28,'NCT'),(28,'자이언티'),(29,'세븐틴'),(29,'지코'),(29,'BTS'),(30,'빅뱅'),(30,'선미'),(30,'청하'),(31,'세븐틴'),(31,'백예린'),(31,'블랙핑크'),(32,'에픽하이'),(32,'다이나믹듀오'),(32,'NCT'),(33,'에픽하이'),(33,'아이유'),(33,'AKMU'),(34,'에스파'),(34,'청하'),(34,'볼빨간사춘기'),(35,'AKMU'),(35,'아이유'),(35,'지코'),(36,'청하'),(36,'장기하'),(36,'볼빨간사춘기');
/*!40000 ALTER TABLE `session_artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 22:11:22
