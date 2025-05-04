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
  PRIMARY KEY (`product_id`,`color_name`,`spec_name`),
  CONSTRAINT `FKEY_product_color_specs_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color_specs`
--

LOCK TABLES `product_color_specs` WRITE;
/*!40000 ALTER TABLE `product_color_specs` DISABLE KEYS */;
INSERT INTO `product_color_specs` VALUES (1,'Black','28',2,6616,'1'),(1,'Black','30',1,6616,'2'),(1,'Black','32',5,6616,'3'),(1,'Black','34',5,6616,'4'),(1,'Black','36',6,6616,'5'),(1,'Light Wash','30',10,6616,'1'),(1,'Light Wash','32',7,6616,'2'),(1,'Medium Blue','28',3,6616,'1'),(1,'Medium Blue','30',8,6616,'2'),(1,'Rinsed Indigo','28',2,6616,'0'),(1,'Rinsed Indigo','30',10,6616,'1'),(1,'Rinsed Indigo','32',6,6616,'2'),(1,'Rinsed Indigo','34',1,6616,'3'),(4,'','L',1,5491,'3'),(4,'','M',1,5491,'2'),(4,'','S',2,5491,'1'),(4,'','XL',3,5491,'4'),(5,'SUN FADED BLACK','L',5,1938,'2'),(5,'SUN FADED BLACK','M',3,1938,'1'),(5,'SUN FADED BLACK','XL',3,1938,'3'),(5,'SUN FADED NAVY','L',2,1938,'3'),(5,'SUN FADED NAVY','M',1,1938,'2'),(5,'SUN FADED NAVY','S',3,1938,'1'),(5,'WHITE','L',3,1938,'2'),(5,'WHITE','S',5,1938,'1'),(5,'WHITE','XL',6,1938,'3'),(5,'WHITE','XXL',2,1938,'4'),(11,'','L',1,3016,'3'),(11,'','M',3,3016,'2'),(11,'','S',4,3016,'1'),(14,'','42',3,24500,'1'),(14,'','44',2,24500,'2'),(14,'','46',6,24500,'3'),(14,'','48',9,24500,'4'),(15,'','40',5,23000,'1'),(15,'','43',11,23000,'2'),(15,'','46',13,23000,'3'),(16,'FADED BLACK','L',7,5491,'3'),(16,'FADED BLACK','M',1,5491,'2'),(16,'FADED BLACK','S',4,5491,'1'),(16,'FADED NAVY','L',5,5491,'1'),(16,'FADED NAVY','XL',10,5491,'2'),(17,'Black/ Milk','41',23,23795,'3'),(17,'Black/ Milk','42',10,23795,'2'),(17,'Black/ Milk','43',13,23795,'1'),(17,'Fawn/ Milk','41',4,23795,'1'),(17,'Fawn/ Milk','42',8,23795,'2'),(17,'Fawn/ Milk','43',12,23795,'3'),(17,'Fawn/ Milk','44',14,23795,'4');
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

-- Dump completed on 2024-10-21 14:16:45
