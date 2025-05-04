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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `color_name` varchar(35) NOT NULL,
  `spec_name` varchar(25) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`color_name`,`spec_name`),
  KEY `FKEY_order_items_TO_products` (`product_id`),
  CONSTRAINT `FKEY_order_items_TO_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKEY_order_items_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'Black','30',6285.2,1),(1,1,'Rinsed Indigo','32',6285.2,2),(1,3,'Black / Dark Amber','',5525,1),(1,4,'','L',5491,1),(1,7,'','',4962,1),(2,1,'Black','30',6285.2,1),(2,1,'Rinsed Indigo','32',6285.2,2),(2,3,'Black / Dark Amber','',5525,1),(2,4,'','L',5491,1),(2,7,'','',4962,1),(3,1,'Black','30',6285.2,1),(3,1,'Rinsed Indigo','32',6285.2,2),(3,3,'Black / Dark Amber','',5525,1),(3,4,'','L',5491,1),(3,7,'','',4962,1),(4,5,'','',1938,1),(5,1,'Black','36',6285.2,3),(5,2,'','',1861,3),(5,3,'Gradient Orange/Dark Peach','',5525,3),(5,4,'','L',5491,3),(6,2,'','',1861,5),(7,6,'','',7267.5,1),(8,1,'Black','32',6285.2,1),(8,1,'Black','34',6285.2,1),(9,2,'','',1861,1),(9,10,'Gold','',1946,1),(10,3,'Black / Dark Amber','',5525,1),(10,7,'','',4962,1),(11,1,'Rinsed Indigo','32',6285.2,1),(12,6,'','',7267.5,1),(13,6,'','',7267.5,1),(14,3,'Marine / Yellow','',5525,1),(15,1,'Black','32',6285.2,1),(16,1,'Black','32',6285.2,1),(17,13,'','',3603.35,1),(17,17,'Black/ Milk','42',23795,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 14:16:46
