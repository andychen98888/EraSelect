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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'RELAXED JEAN DENIM',6616,20,'https://www.stussy.com/cdn/shop/files/116671_RIIN_1.jpg?v=1723052244&width=1920','褲裝','Relaxed jean in 14.5oz cotton denim. Regular waist with a relaxed rise and roomy straight cut through to the cuff. Features branded nickel shank hardware and a suede Stüssy logo patch. Fits true to size.','2024-08-26',5),(2,'SMOOTH INTERNATIONAL TEE',1861,11,'https://www.stussy.com/cdn/shop/files/1905039_CAMO_1.jpg?v=1724178017&width=1920','上衣','Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.','2024-08-11',0),(3,'TRACY SUNGLASSES',6500,21,'https://www.stussy.com/cdn/shop/files/338390_BLDA_4.jpg?v=1723672430&width=1920','配件','Acetate sunglasses with an oval frame and tinted lenses. Stüssy bent crown logo at the exterior temples and eyegear logo at the inside. Made in Japan.','2024-05-23',15),(4,'AKIMBO ZIP-UP HOODIE - REALTREE® CAMO',5491,30,'https://akimboclub.com/cdn/shop/files/BCCE5622-982B-4455-825C-DE33616899C9.jpg?v=1709051774&width=800','上衣','A CUSTOM VINTAGE INSPIRED COLOR WAY OF THE REALTREE ® EDGE CAMO DEVELOPED BY AKIMBO IN COLLABORATION WITH REALTREE ®','2019-12-25',0),(5,'“CHAIN-PEEKER” SINGLE STITCHED TEE',1938,10,'https://akimboclub.com/cdn/shop/files/3B5CDF3B-9266-4DB1-9EB7-1BBFDDD0AF99.jpg?v=1722471977&width=800','上衣','','2018-11-15',0),(6,'AKIMBO DOUBLE KNEES - REALTREE® CAMO',8075,17,'https://akimboclub.com/cdn/shop/files/68953BE8-7493-4AAC-B3B6-ACB93900D958.jpg?v=1713391238&width=800','上衣','MADE IN LOS ANGELES','2024-01-16',10),(7,'8 BALL RUG',4962,5,'https://www.stussy.com/cdn/shop/products/138776_BLAC_1.jpg?v=1707495084&width=1920','配件','','2021-03-15',0),(8,'Carhartt WIP Duck Camo Helston Denim Jacket /Black Bleached',7015,6,'https://media.endclothing.com/media/f_auto,q_auto:eco,w_1024/prodmedia/media/catalog/product/0/2/02-09-2024-JW_I033766-2I335_1_1.jpg','上衣','Effortlessly combining durability with casual style, this Carhartt WIP Duck Camo Helston Denim Jacket is cut from a hard wearing cotton canvas. With all the classic features including, chest pockets, buttoned cuffs and snap button closures, a \'Maitland Camo Duck\' offers a bold finishing touch.','2024-02-01',0),(9,'LV x Timberland 短靴 /米色',78500,3,'https://tw.louisvuitton.com/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB-lv-x-timberland-%E7%9F%AD%E9%9D%B4-%E9%9E%8B%E5%B1%A5%E7%B3%BB%E5%88%97--BRSQ1PNU31_PM2_Front%20view.png?wid=1440&hei=1440','鞋子','這款LV x Timberland短靴將Timberland的工裝風格及路易威登奢華的手製工藝融為一體。鞋款於Pharrell Williams的2024秋冬男士系列時裝展登場，以略大的比例重新設計經典Timberland短靴，並以Monogram標誌元素融入Timberland的鞋底設計。這款短靴以最高級的粒面納帕小牛皮於意大利製造，配有隔熱襯裡及接縫密封結構，穿著時倍感舒適，經久耐穿。鞋身上還綴有多個主打細節，包括Monogram粒面小牛皮鞋領及品牌聯乘標誌的吊牌。','2024-05-17',0),(10,'Daisy Pearl Necklace',1946,75,'https://enroutejewelry.com/cdn/shop/files/2024.06.07_14219.jpg?v=1721287419','配件','This breathtaking necklace blends pearls, gleaming silver petals, and vibrant red and green gems to imbue any utilitarian look with timeless allure.','2024-01-06',0);
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

-- Dump completed on 2024-10-01 19:22:26
