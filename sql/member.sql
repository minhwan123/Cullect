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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `gender` enum('FEMALE','MALE') DEFAULT NULL,
  `keyword1` enum('야외','실내') DEFAULT NULL,
  `keyword2` enum('감성적','활동적','정적') DEFAULT NULL,
  `keyword3` enum('자연','음악','예술','조용함','열정적','운동','쇼핑','북적임','독서') DEFAULT NULL,
  `age` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKhh9kg6jti4n1eoiertn2k6qsc` (`nickname`),
  UNIQUE KEY `UKgc3jmn7c2abyo3wf6syln5t2i` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin1@example.com','서울시 강남구','관리자','관리자','$2a$10$examplehashexamplehashexampleha.shexamplehashexampleha','admin','MALE','야외','활동적','자연',19),(2,'user1@example.com','서울시 송파구','사용자1','닉1','password1','user1','FEMALE','실내','감성적','열정적',29),(3,'user2@example.com','서울시 종로구','사용자2','닉2','password2','user2','FEMALE','실내','감성적','북적임',34),(4,'user3@example.com','서울시 송파구','사용자3','닉3','password3','user3','MALE','실내','활동적','예술',29),(5,'user4@example.com','서울시 마포구','사용자4','닉4','password4','user4','FEMALE','야외','정적','북적임',28),(6,'user5@example.com','서울시 종로구','사용자5','닉5','password5','user5','MALE','야외','활동적','열정적',20),(7,'user6@example.com','서울시 마포구','사용자6','닉6','password6','user6','FEMALE','실내','정적','운동',28),(8,'user7@example.com','서울시 노원구','사용자7','닉7','password7','user7','MALE','야외','정적','열정적',26),(9,'user8@example.com','서울시 강남구','사용자8','닉8','password8','user8','FEMALE','야외','활동적','쇼핑',32),(10,'user9@example.com','서울시 종로구','사용자9','닉9','password9','user9','MALE','야외','정적','독서',26),(11,'user10@example.com','서울시 강남구','사용자10','닉10','password10','user10','FEMALE','야외','정적','독서',32),(12,'user11@example.com','서울시 마포구','사용자11','닉11','password11','user11','MALE','실내','정적','열정적',23),(13,'user12@example.com','서울시 강남구','사용자12','닉12','password12','user12','MALE','야외','정적','조용함',32),(14,'user13@example.com','서울시 노원구','사용자13','닉13','password13','user13','MALE','야외','정적','음악',24),(15,'user14@example.com','서울시 종로구','사용자14','닉14','password14','user14','MALE','실내','정적','쇼핑',20),(16,'user15@example.com','서울시 노원구','사용자15','닉15','password15','user15','MALE','야외','활동적','조용함',29),(17,'user16@example.com','서울시 마포구','사용자16','닉16','password16','user16','MALE','실내','감성적','운동',28),(18,'user17@example.com','서울시 강남구','사용자17','닉17','password17','user17','MALE','실내','활동적','쇼핑',33),(19,'user18@example.com','서울시 마포구','사용자18','닉18','password18','user18','MALE','야외','활동적','독서',28),(20,'user19@example.com','서울시 강남구','사용자19','닉19','password19','user19','FEMALE','실내','활동적','쇼핑',19),(21,'user20@example.com','서울시 강남구','사용자20','닉20','password20','user20','FEMALE','야외','활동적','운동',24),(22,'user21@example.com','서울시 마포구','사용자21','닉21','password21','user21','FEMALE','실내','정적','예술',30),(23,'user22@example.com','서울시 노원구','사용자22','닉22','password22','user22','MALE','야외','정적','자연',31),(24,'user23@example.com','서울시 노원구','사용자23','닉23','password23','user23','FEMALE','실내','정적','예술',29),(25,'user24@example.com','서울시 종로구','사용자24','닉24','password24','user24','FEMALE','야외','활동적','독서',29),(26,'user25@example.com','서울시 노원구','사용자25','닉25','password25','user25','FEMALE','실내','활동적','쇼핑',26),(27,'user26@example.com','서울시 강남구','사용자26','닉26','password26','user26','FEMALE','야외','활동적','예술',23),(28,'user27@example.com','서울시 종로구','사용자27','닉27','password27','user27','FEMALE','야외','정적','쇼핑',22),(29,'user28@example.com','서울시 마포구','사용자28','닉28','password28','user28','MALE','야외','활동적','음악',22),(30,'user29@example.com','서울시 강남구','사용자29','닉29','password29','user29','MALE','실내','활동적','예술',28),(31,'user30@example.com','서울시 마포구','사용자30','닉30','password30','user30','FEMALE','실내','활동적','자연',22),(32,'user31@example.com','서울시 강남구','사용자31','닉31','password31','user31','MALE','실내','활동적','자연',22),(33,'user32@example.com','서울시 송파구','사용자32','닉32','password32','user32','MALE','야외','정적','조용함',33),(34,'user33@example.com','서울시 마포구','사용자33','닉33','password33','user33','MALE','실내','정적','쇼핑',23),(35,'user34@example.com','서울시 종로구','사용자34','닉34','password34','user34','MALE','실내','활동적','조용함',22),(36,'user35@example.com','서울시 노원구','사용자35','닉35','password35','user35','MALE','실내','활동적','조용함',22),(37,'user36@example.com','서울시 강남구','사용자36','닉36','password36','user36','FEMALE','야외','정적','열정적',31),(38,'user37@example.com','서울시 종로구','사용자37','닉37','password37','user37','FEMALE','야외','감성적','쇼핑',27),(39,'user38@example.com','서울시 종로구','사용자38','닉38','password38','user38','FEMALE','야외','정적','예술',27),(40,'user39@example.com','서울시 송파구','사용자39','닉39','password39','user39','FEMALE','실내','정적','예술',34),(41,'user40@example.com','서울시 강남구','사용자40','닉40','password40','user40','MALE','야외','감성적','음악',33),(42,'user41@example.com','서울시 종로구','사용자41','닉41','password41','user41','MALE','야외','감성적','열정적',31),(43,'user42@example.com','서울시 강남구','사용자42','닉42','password42','user42','MALE','야외','정적','자연',28),(44,'user43@example.com','서울시 송파구','사용자43','닉43','password43','user43','FEMALE','야외','활동적','조용함',30),(45,'user44@example.com','서울시 송파구','사용자44','닉44','password44','user44','FEMALE','야외','활동적','쇼핑',24),(46,'user45@example.com','서울시 종로구','사용자45','닉45','password45','user45','MALE','야외','활동적','예술',21),(47,'user46@example.com','서울시 종로구','사용자46','닉46','password46','user46','FEMALE','야외','감성적','자연',26),(48,'user47@example.com','서울시 종로구','사용자47','닉47','password47','user47','MALE','야외','감성적','조용함',29),(49,'user48@example.com','서울시 노원구','사용자48','닉48','password48','user48','MALE','야외','감성적','독서',24),(50,'user49@example.com','서울시 노원구','사용자49','닉49','password49','user49','FEMALE','야외','정적','예술',32),(51,'user50@example.com','서울시 마포구','사용자50','닉50','password50','user50','FEMALE','야외','정적','예술',23),(52,'user51@example.com','서울시 송파구','유저','유저51','$2a$10$examplehashexamplehashexampleha.shexamplehashexampleha','user51','MALE','야외','활동적','자연',34);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
