-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: es
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `product_color_specs`
--

DROP TABLE IF EXISTS `product_color_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color_specs` (
  `product_id` int NOT NULL,
  `color_name` varchar(35) NOT NULL,
  `spec_name` varchar(25) NOT NULL,
  `stock` int NOT NULL,
  `unit_price` double NOT NULL,
  `ordinal` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`color_name`,`spec_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color_specs`
--

LOCK TABLES `product_color_specs` WRITE;
/*!40000 ALTER TABLE `product_color_specs` DISABLE KEYS */;
INSERT INTO `product_color_specs` VALUES (1,'Black','28',2,6616,'1'),(1,'Black','30',1,6616,'2'),(1,'Black','32',8,6616,'3'),(1,'Black','34',6,6616,'4'),(1,'Black','36',9,6616,'5'),(1,'Light Wash','30',10,6616,'1'),(1,'Light Wash','32',7,6616,'2'),(1,'Medium Blue','28',3,6616,'1'),(1,'Medium Blue','30',8,6616,'2'),(1,'Rinsed Indigo','28',2,6616,'0'),(1,'Rinsed Indigo','30',10,6616,'1'),(1,'Rinsed Indigo','32',7,6616,'2'),(1,'Rinsed Indigo','34',1,6616,'3'),(4,'','L',4,5491,'3'),(4,'','M',1,5491,'2'),(4,'','S',2,5491,'1'),(4,'','XL',3,5491,'4');
/*!40000 ALTER TABLE `product_color_specs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 18:51:43
