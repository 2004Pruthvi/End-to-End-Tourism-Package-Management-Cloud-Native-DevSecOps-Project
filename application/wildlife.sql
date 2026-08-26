-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: wildlife
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `tourist_name` varchar(100) DEFAULT NULL,
  `item_type` enum('Safari','Stay','Package','Guide') NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `num_persons` int NOT NULL,
  `total_price` double NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Confirmed',
  `booking_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `booked_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `booking_chk_1` CHECK ((`num_persons` > 0)),
  CONSTRAINT `booking_chk_2` CHECK ((`total_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,3,'ambrutha','Safari','Elephant Safari','https://www.sollunaresort.com/images/safari/elephant-ride.jpg',1,1000,'Cash','Booked','2025-04-14',NULL,NULL,'2025-04-12 15:23:12'),(2,3,'ambrutha','Safari','Jeep Safari','https://jagatsinghhotels.com/media/jsHotel/Experiences/jeep-safari-in-kerala-banner.jpg',1,850,'Cash','Booked','2025-04-14',NULL,NULL,'2025-04-12 15:23:52'),(3,3,'ambrutha','Safari','Jeep Safari','https://jagatsinghhotels.com/media/jsHotel/Experiences/jeep-safari-in-kerala-banner.jpg',1,850,'Cash','Booked','2025-04-14',NULL,NULL,'2025-04-12 15:37:26'),(4,3,'ambrutha','Safari','Jeep Safari','https://jagatsinghhotels.com/media/jsHotel/Experiences/jeep-safari-in-kerala-banner.jpg',1,850,'Cash','Booked','2025-04-14',NULL,NULL,'2025-04-12 15:37:35'),(5,3,'ambrutha','Safari','Jeep Safari','https://jagatsinghhotels.com/media/jsHotel/Experiences/jeep-safari-in-kerala-banner.jpg',1,850,'Cash','Booked','2025-04-14',NULL,NULL,'2025-04-12 15:39:36'),(6,3,'ambrutha','Package','Maharaja Package','https://cdn.junglelodges.com/uploads/2023/02/WhatsApp-Image-2023-02-18-at-4.09.49-PM-1_555x306_acf_cropped-1.jpeg',2,31998,'Cash','completed',NULL,'2025-04-15','2025-04-16','2025-04-12 15:41:01'),(7,3,'ambrutha','Package','Maharaja Package','https://cdn.junglelodges.com/uploads/2023/02/WhatsApp-Image-2023-02-18-at-4.09.49-PM-1_555x306_acf_cropped-1.jpeg',2,31998,'Cash','Cancelled',NULL,'2025-04-15','2025-04-16','2025-04-12 15:41:34'),(8,3,'ambrutha','Stay','Evolve Back, Kabini','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/9f/58/38/pool-reserve-private.jpg?w=900',1,10000,'Cash','cancelled',NULL,'2025-04-19','2025-04-21','2025-04-12 15:44:50'),(9,2,'Ram','Safari','Boat Safari','https://www.heritagetoursandsafaris.com/wp-content/uploads/2022/06/IMG_9180-1024x683.jpg',2,1000,'Cash','completed','2025-04-26',NULL,NULL,'2025-04-17 13:36:18'),(10,2,'Ram','Package','Maharaja Package','https://cdn.junglelodges.com/uploads/2023/02/WhatsApp-Image-2023-02-18-at-4.09.49-PM-1_555x306_acf_cropped-1.jpeg',1,15999,'Cash','Booked',NULL,'2025-04-26','2025-04-27','2025-04-17 13:37:48'),(11,2,'Ram','Stay','Kabini River Lodge','https://d22eux7aqicogj.cloudfront.net/assets/blogs/kabini-river-lodge.webp',1,2000,'Cash','Cancelled',NULL,'2025-04-21','2025-04-22','2025-04-17 13:39:56');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guides`
--

DROP TABLE IF EXISTS `guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bio` text,
  `price` double NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guides`
--

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` VALUES (1,'Educational Talks','Listen to zookeepers share fun facts and stories. Watch live feeding sessions too!',1200,'https://travelogyindia.b-cdn.net/blog/wp-content/uploads/2016/07/Wildlife-Travel-Guide.jpg'),(2,'Animal Encounters','Meet your favorite animals up close and take awesome pictures.',1500,'https://drprem.com/travel/wp-content/uploads/sites/53/2013/08/History-of-wildlife-tourism.jpg'),(3,'Multilingual Guides','Enjoy tours in your language. Just ask for available options!',2000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLJapWiZ__SBqYuM6GDQzoeqNLor8ez6brJw&s');
/*!40000 ALTER TABLE `guides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Maharaja Package','https://cdn.junglelodges.com/uploads/2023/02/WhatsApp-Image-2023-02-18-at-4.09.49-PM-1_555x306_acf_cropped-1.jpeg',15999,''),(2,'Viceroy Package','https://cdn.junglelodges.com/uploads/2023/02/WhatsApp-Image-2023-02-18-at-4.45.04-PM_555x306_acf_cropped.jpeg',14042,''),(3,'Kabini Tent Package','https://cdn.junglelodges.com/uploads/2020/03/1-37.jpg',12136,''),(4,'Dormitory Package','https://cdn.junglelodges.com/uploads/2022/06/WhatsApp-Image-2022-06-04-at-12.23.57-PM_555x306_acf_cropped.jpeg',8776,'');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safari`
--

DROP TABLE IF EXISTS `safari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `safari` (
  `safari_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price_per_seat` double DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`safari_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safari`
--

LOCK TABLES `safari` WRITE;
/*!40000 ALTER TABLE `safari` DISABLE KEYS */;
INSERT INTO `safari` VALUES (1,'Jeep Safari','https://jagatsinghhotels.com/media/jsHotel/Experiences/jeep-safari-in-kerala-banner.jpg',800,'Experience thrilling off-road adventures through the wild.'),(3,'Elephant Safari','https://www.sollunaresort.com/images/safari/elephant-ride.jpg',1000,'Ride majestic elephants and observe wildlife from a unique perspective.'),(4,'Boat Safari','https://www.heritagetoursandsafaris.com/wp-content/uploads/2022/06/IMG_9180-1024x683.jpg',500,'Enjoy a peaceful ride on the water while spotting wildlife.');
/*!40000 ALTER TABLE `safari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay`
--

DROP TABLE IF EXISTS `stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stay` (
  `stay_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price_per_night` double DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`stay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay`
--

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;
INSERT INTO `stay` VALUES (1,'Evolve Back, Kabini','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/9f/58/38/pool-reserve-private.jpg?w=900&h=500&s=1',5000,'Luxury stay near Kabini River. Peaceful and scenic environment.\r\n           '),(2,'The Serai Kabini','https://assets.simplotel.com/simplotel/image/upload/x_276,y_45,w_488,h_275,r_0,c_crop,q_90,fl_progressive/w_900,f_auto,c_fit/the-serai-kabini/Waterfront_Villa_at_The_Serai_Kabini,_Stay_At_Kabini,_Riverside_Resort_in_Kabini_1?1743465600076',8500,'Waterfront villa offering calm and cozy vibes amidst nature.'),(3,'Kabini River Lodge','https://d22eux7aqicogj.cloudfront.net/assets/blogs/kabini-river-lodge.webp',2000,'Eco-friendly lodge perfect for nature lovers and explorers.\r\n            '),(4,'Red Earth Kabini','https://media.vrbo.com/lodging/23000000/22680000/22675100/22675014/42b64fd0.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill\" alt=\"Red Earth Kabini',1000,'Earth cottages with a rustic charm and serene backwater views.'),(7,'Waterwoods Kabini','https://cf.bstatic.com/xdata/images/hotel/max1024x768/45495200.jpg?k=b30295b9173b5245ce188dd6636f4e07a7d7652abf2b1c7aa7ce67c5b489c738&o=&hp=1',8000,'Budget-friendly riverside stay close to forest trails.');
/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `password` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'padmini','padmini@gmail.com',9514789632,'1234','bangalore'),(2,'Ram','ram@gmail.com',6985147856,'5678','bangalore'),(3,'ambrutha','ambrutha@gmail.com',8521479632,'3636','bombay'),(4,'bhushan','bhushan@gmail.com',9765342178,'9876','mysore'),(5,'keerthan','keerthan@gmail.com',8765412890,'4321','vijaynagar'),(6,'bunny','b@gmail.in',987654321,'1234','mgroad'),(7,'chethan','chethan@gmail.com',97543467234,'5678','bombay');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 12:25:47
