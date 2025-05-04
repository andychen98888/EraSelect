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
  PRIMARY KEY (`product_id`,`color_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (3,'Black / Dark Amber','2024-09-18','https://www.stussy.com/cdn/shop/files/338390_BLDA_4.jpg?v=1723672430&width=1920','https://www.stussy.com/cdn/shop/files/338390_BLDA_4.jpg?v=1723672430&w=45&h=45',7),(3,'Gradient Orange/Dark Peach','2024-09-19','https://www.stussy.com/cdn/shop/files/338390_GODP_4.jpg?v=1723672431&width=1920','https://www.stussy.com/cdn/shop/files/338390_GODP_4.jpg?v=1723672431&w=45&h=45',14),(10,'Gold','2024-01-06','https://enroutejewelry.com/cdn/shop/files/2024.06.07_14219.jpg?v=1721287419','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',30),(10,'Silver','2024-04-06','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',45);
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

-- Dump completed on 2024-09-19 18:54:53
