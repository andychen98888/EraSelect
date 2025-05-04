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
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `product_id` int NOT NULL,
  `color_name` varchar(35) NOT NULL,
  `release_date` date DEFAULT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `icon_url` varchar(250) DEFAULT NULL,
  `stock` int NOT NULL,
  `ordinal` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`color_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,'Black','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_BLAC_1_b038a4a8-1d7c-4726-a0e7-4e0cd53de62c.jpg?v=1722365861&width=1920','https://www.stussy.com/cdn/shop/files/116671_BLAC_1_b038a4a8-1d7c-4726-a0e7-4e0cd53de62c.jpg?v=1722365861&width=90',9,4),(1,'Light Wash','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_LIWA_1_b8476fa4-6509-4d0d-91c5-2df8d62e5266.jpg?v=1722365862&width=1920','https://www.stussy.com/cdn/shop/files/116671_LIWA_1_b8476fa4-6509-4d0d-91c5-2df8d62e5266.jpg?v=1722365862&width=90',12,3),(1,'Medium Blue','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_MEDB_1_61b73b96-5005-4c91-a13a-df1c1c14d110.jpg?v=1722365864&width=1920','https://www.stussy.com/cdn/shop/files/116671_MEDB_1_61b73b96-5005-4c91-a13a-df1c1c14d110.jpg?v=1722365864&width=90',8,2),(1,'Rinsed Indigo','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=1920','https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=90',5,1),(3,'Black / Dark Amber','2024-09-18','https://www.stussy.com/cdn/shop/files/338390_BLDA_4.jpg?v=1723672430&width=1920','https://www.stussy.com/cdn/shop/files/338390_BLDA_1.jpg?v=1723672430&width=90',7,1),(3,'Gradient Orange/Dark Peach','2024-09-19','https://www.stussy.com/cdn/shop/files/338390_GODP_4.jpg?v=1723672431&width=1920','https://www.stussy.com/cdn/shop/files/338390_GODP_1.jpg?v=1723672431&width=90',14,2),(10,'Gold','2024-01-06','https://enroutejewelry.com/cdn/shop/files/2024.06.07_14219.jpg?v=1721287419','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',28,1),(10,'Silver','2024-04-06','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',22,2);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 19:22:26
