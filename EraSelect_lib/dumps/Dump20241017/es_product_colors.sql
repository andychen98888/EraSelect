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
  PRIMARY KEY (`product_id`,`color_name`),
  CONSTRAINT `FKEY_product_colors_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,'Black','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_BLAC_1_b038a4a8-1d7c-4726-a0e7-4e0cd53de62c.jpg?v=1722365861&width=1920','https://www.stussy.com/cdn/shop/files/116671_BLAC_1_b038a4a8-1d7c-4726-a0e7-4e0cd53de62c.jpg?v=1722365861&width=90',9,4),(1,'Light Wash','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_LIWA_1_b8476fa4-6509-4d0d-91c5-2df8d62e5266.jpg?v=1722365862&width=1920','https://www.stussy.com/cdn/shop/files/116671_LIWA_1_b8476fa4-6509-4d0d-91c5-2df8d62e5266.jpg?v=1722365862&width=90',12,3),(1,'Medium Blue','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_MEDB_1_61b73b96-5005-4c91-a13a-df1c1c14d110.jpg?v=1722365864&width=1920','https://www.stussy.com/cdn/shop/files/116671_MEDB_1_61b73b96-5005-4c91-a13a-df1c1c14d110.jpg?v=1722365864&width=90',8,2),(1,'Rinsed Indigo','2024-08-22','https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=1920','https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=90',5,1),(3,'Black / Dark Amber','2024-09-18','https://www.stussy.com/cdn/shop/files/338390_BLDA_4.jpg?v=1723672430&width=1920','https://www.stussy.com/cdn/shop/files/338390_BLDA_1.jpg?v=1723672430&width=90',6,1),(3,'Gradient Orange/Dark Peach','2024-09-19','https://www.stussy.com/cdn/shop/files/338390_GODP_4.jpg?v=1723672431&width=1920','https://www.stussy.com/cdn/shop/files/338390_GODP_1.jpg?v=1723672431&width=90',11,2),(3,'Light Peach / Yellow','2024-09-18','https://www.stussy.com/cdn/shop/files/338390_LPYE_4.jpg?v=1723672432&width=1920','https://www.stussy.com/cdn/shop/files/338390_LPYE_1.jpg?v=1723672432&width=90',8,4),(3,'Marine / Yellow','2024-09-18','https://www.stussy.com/cdn/shop/files/338390_MAYE_4.jpg?v=1723672433&width=1920','https://www.stussy.com/cdn/shop/files/338390_MAYE_1.jpg?v=1723672433&width=90',11,3),(5,'SUN FADED BLACK','2024-10-13','https://akimboclub.com/cdn/shop/files/ED4EF1AE-AE46-4C51-A23C-97346E60768E.heic?v=1725599755&width=800','https://akimboclub.com/cdn/shop/files/ED4EF1AE-AE46-4C51-A23C-97346E60768E.heic?v=1725599755&width=90',11,3),(5,'SUN FADED NAVY','2024-10-13','https://akimboclub.com/cdn/shop/files/BCF04365-7220-4E69-A6FA-35D3F17E80A7.heic?v=1725599780&width=1600','https://akimboclub.com/cdn/shop/files/BCF04365-7220-4E69-A6FA-35D3F17E80A7.heic?v=1725599780&width=90',14,2),(5,'WHITE','2024-10-13','https://akimboclub.com/cdn/shop/files/3B5CDF3B-9266-4DB1-9EB7-1BBFDDD0AF99.jpg?v=1722471977&width=1000','https://akimboclub.com/cdn/shop/files/3B5CDF3B-9266-4DB1-9EB7-1BBFDDD0AF99.jpg?v=1722471977&width=90',17,1),(10,'Gold','2024-01-06','https://enroutejewelry.com/cdn/shop/files/2024.06.07_14219.jpg?v=1721287419','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',27,1),(10,'Silver','2024-04-06','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544','https://enroutejewelry.com/cdn/shop/files/daisy-pearl-necklace-in-silver-en-route-jewelry-1.jpg?v=1720753544&w=45&h=45',22,2),(16,'FADED BLACK','2024-10-12','https://akimboclub.com/cdn/shop/files/36D08EA1-7C6D-4C6A-AE82-5EFD61596CF2.jpg?v=1711064528&width=1600','https://akimboclub.com/cdn/shop/files/36D08EA1-7C6D-4C6A-AE82-5EFD61596CF2.jpg?v=1711064528&width=90',7,2),(16,'FADED NAVY','2024-10-12','https://akimboclub.com/cdn/shop/files/74C70F9A-F15B-4F81-8731-A280EE99DB30.jpg?v=1700616929&width=1200','https://akimboclub.com/cdn/shop/files/74C70F9A-F15B-4F81-8731-A280EE99DB30.jpg?v=1700616929&width=90',13,1),(17,'Black/ Milk','2024-10-11','https://media.endclothing.com/media/f_auto,q_auto:eco,w_1024/prodmedia/media/catalog/product/1/8/18-09-2024-LB_RR02D6897-LWNLVS-911_1_1.jpg','https://media.endclothing.com/media/f_auto,q_auto:eco,w_1024/prodmedia/media/catalog/product/1/8/18-09-2024-LB_RR02D6897-LWNLVS-911_2_1.jpg',8,1),(17,'Fawn/ Milk','2024-10-11','https://media.endclothing.com/media/f_auto,q_auto:eco,w_1024/prodmedia/media/catalog/product/1/8/18-09-24-NS2_RR02D6897-LWNLVS-13411_1_1.jpg','https://media.endclothing.com/media/f_auto,q_auto:eco,w_1024/prodmedia/media/catalog/product/1/8/18-09-24-NS2_RR02D6897-LWNLVS-13411_2_1.jpg',9,2);
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

-- Dump completed on 2024-10-17 19:56:34
