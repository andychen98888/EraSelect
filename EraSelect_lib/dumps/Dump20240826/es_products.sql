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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int NOT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `category` varchar(15) NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT '',
  `release_date` date NOT NULL DEFAULT (curdate()),
  `discount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'RELAXED JEAN DENIM',6616,20,'https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=1920','下身','Relaxed jean in 14.5oz cotton denim. Regular waist with a relaxed rise and roomy straight cut through to the cuff. Features branded nickel shank hardware and a suede Stüssy logo patch. Fits true to size.','2024-08-26',21),(2,'SMOOTH INTERNATIONAL TEE',1861,11,'https://www.stussy.com/cdn/shop/files/1905039_CAMO_1.jpg?v=1724178017&width=1920','上身','Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.','2024-08-11',0),(3,'TRACY SUNGLASSES',6500,3,'https://www.stussy.com/cdn/shop/files/338390_BLDA_1.jpg?v=1723672430&width=800','配件','Acetate sunglasses with an oval frame and tinted lenses. Stüssy bent crown logo at the exterior temples and eyegear logo at the inside. Made in Japan.','2024-05-23',15),(4,'AKIMBO ZIP-UP HOODIE - REALTREE® CAMO',5491,30,'https://akimboclub.com/cdn/shop/files/BCCE5622-982B-4455-825C-DE33616899C9.jpg?v=1709051774&width=800','上身','A CUSTOM VINTAGE INSPIRED COLOR WAY OF THE REALTREE ® EDGE CAMO DEVELOPED BY AKIMBO IN COLLABORATION WITH REALTREE ®','2019-12-25',0),(5,'“CHAIN-PEEKER” SINGLE STITCHED TEE',1938,10,'https://akimboclub.com/cdn/shop/files/3B5CDF3B-9266-4DB1-9EB7-1BBFDDD0AF99.jpg?v=1722471977&width=800','上身','','2018-11-15',0),(6,'AKIMBO DOUBLE KNEES - REALTREE® CAMO',8075,17,'https://akimboclub.com/cdn/shop/files/68953BE8-7493-4AAC-B3B6-ACB93900D958.jpg?v=1713391238&width=800','上身','MADE IN LOS ANGELES','2024-01-16',10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-26 19:24:54
