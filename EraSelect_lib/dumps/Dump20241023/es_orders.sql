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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` char(10) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `shipping_type` varchar(10) NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_note` varchar(100) DEFAULT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) DEFAULT NULL,
  `recipient_name` varchar(20) NOT NULL,
  `recipient_email` varchar(60) NOT NULL,
  `recipient_phone` varchar(20) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEY_orders_TO_customers_idx` (`customer_id`),
  CONSTRAINT `FKEY_orders_TO_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'A123123123','2024-10-08','13:02:13',1,'HOME',120,NULL,'ATM',0,'本網站的第一筆訂單','趙裕正f','test123@gmail.com','0987000123','民生社區'),(2,'A123123123','2024-07-08','13:06:39',0,'HOME',120,NULL,'ATM',0,NULL,'趙裕正f','test123@gmail.com','0987000123','民生社區'),(3,'A123123123','2024-10-08','18:47:53',0,'HOME',120,NULL,'ATM',0,NULL,'趙裕正f','test123@gmail.com','0987000123','民生社區'),(4,'A123123123','2024-10-08','19:09:34',0,'SHOP',0,NULL,'SHOP',0,NULL,'趙裕正f','test123@gmail.com','0987000123','民生社區'),(5,'A123123123','2024-10-14','13:05:20',0,'SHOP',0,NULL,'SHOP',0,NULL,'趙裕正f','test123@gmail.com','0987000123','民生社區'),(6,'A123123123','2024-10-14','13:07:34',0,'SHOP',0,NULL,'SHOP',0,NULL,'趙裕正f','test123@gmail.com','0987000123','民生社區'),(7,'A123456789','2024-10-16','12:19:39',0,'STORE',65,NULL,'ATM',0,NULL,'夏宜跳','test781@gmail.com','0987000789','金門縣'),(8,'A123456789','2024-10-16','13:23:24',0,'STORE',65,NULL,'ATM',0,NULL,'夏宜跳','test781@gmail.com','0987000789','金門縣'),(9,'A123123123','2024-10-16','18:16:27',1,'STORE',65,NULL,'ATM',0,'HPBD, 55284,轉帳金額:3872.0,轉帳時間約:2024-10-16 18:22','趙裕正f','test123@gmail.com','0987000123','民生社區'),(10,'A123123123','2024-10-17','14:22:01',0,'STORE',65,NULL,'ATM',0,NULL,'趙裕正f','test123@gmail.com','0987000123','全家魚池伊達邵店,南投縣魚池鄉義勇街55號,店號:11089'),(11,'A123456789','2024-10-17','17:40:27',0,'SHOP',0,NULL,'SHOP',0,NULL,'夏宜跳','andy860924@gmail.com','0987000789','101旗艦店 台北市信義區信義路五段7號'),(12,'A123456789','2024-10-17','18:15:59',0,'HOME',120,NULL,'HOME',80,NULL,'夏宜跳','andt860924@gmail.com','0987000789','市民大道'),(13,'A123456789','2024-10-17','18:17:06',0,'STORE',65,NULL,'STORE',0,NULL,'夏宜跳','andy860925@gmail.com','0987000789','全家新竹旺宏店,新竹市東區科學園區力行路16號,店號:1136'),(14,'A123456789','2024-10-17','18:18:18',0,'HOME',120,NULL,'ATM',0,NULL,'夏宜跳','andy860924@gmail.com','0987000789','民生社區'),(15,'A123123123','2024-10-17','19:10:37',0,'HOME',120,NULL,'HOME',80,NULL,'趙裕正f','test123@gmail.com','0987000123','全家新竹旺宏店,新竹市東區科學園區力行路16號,店號:1136'),(16,'A123123123','2024-10-17','19:10:41',0,'HOME',120,NULL,'HOME',80,NULL,'趙裕正f','test123@gmail.com','0987000123','全家新竹旺宏店,新竹市東區科學園區力行路16號,店號:1136'),(17,'A123123123','2024-10-18','20:54:18',2,'STORE',65,NULL,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2024-10-18T20:54:40.193129','趙裕正f','andy860924@gmail.com','0987000123','全家新店健民店,新北市新店區明德路69巷28號,店號:12504'),(18,'A123123123','2024-10-21','16:51:46',1,'HOME',120,NULL,'ATM',0,'HPBD, 66884,轉帳金額:49786.0,轉帳時間約:2024-10-21 20:58','趙裕正f','test123@gmail.com','0987000123','民生社區'),(19,'A123456789','2024-10-21','19:09:41',0,'NO',0,NULL,'CARD',0,NULL,'夏宜跳','test781@gmail.com','0987000789','全家魚池伊達邵店,南投縣魚池鄉義勇街55號,店號:11089'),(20,'A123456789','2024-10-21','19:10:30',2,'NO',0,NULL,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2024-10-21T19:11:05.235008500','夏宜跳','test781@gmail.com','0987000789','全家新店健民店,新北市新店區明德路69巷28號,店號:12504'),(21,'A123123123','2024-10-23','10:50:33',0,'NO',0,NULL,'ATM',0,NULL,'趙裕正f','yierc391@gmail.com','0987000123','民生社區'),(22,'A123123123','2024-10-23','12:27:58',2,'STORE',65,NULL,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2024-10-23T12:28:25.305740700','趙裕正f','yierc391@gmail.com','0987000123','萊爾富林口捷韻店,新北市林口區文化北路一段123號一樓,店號:4715');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_orders_status` AFTER UPDATE ON `orders` FOR EACH ROW INSERT INTO order_logs(order_id, old_status, new_status, payment_note, shipping_note) 
		VALUES (new.id, old.status, new.status, new.payment_note, new.shipping_note) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23 19:59:06
