-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eshop_development
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `eshop_development`;
CREATE DATABASE IF NOT EXISTS `eshop_development` /*!40100 DEFAULT CHARACTER SET utf8 */;
GRANT ALL ON `eshop_development`.* TO 'eshop'@'localhost' identified by 'eshop';
USE `eshop_development`;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (2,'Navidul','902556677','Conil de la Frontera','Cádiz','Calle Solomillo','2014-04-28 15:39:05','2014-06-02 14:55:41'),(3,'El Pozo','902443301','Chiclana de la Frontera','Cádiz','Calle Cinta de Lomo 5','2014-04-28 15:39:13','2014-06-02 14:56:09'),(4,'Campofrío','977453019','Rota','Cádiz','Calle Chuletitas de Cordero 10','2014-04-28 15:39:27','2014-06-02 14:56:30');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,1,2,10,4,'2014-04-25 08:41:01','2014-04-25 08:41:08'),(5,6,4,2,22,'2014-04-28 15:49:05','2014-04-28 17:01:51'),(6,5,4,7,8,'2014-04-28 15:49:11','2014-04-28 16:51:53'),(7,3,4,80,1,'2014-04-28 15:49:20','2014-04-28 15:49:20'),(8,2,4,13,11,'2014-04-28 15:49:25','2014-04-28 15:51:02'),(9,4,4,11,10,'2014-04-28 16:45:34','2014-04-28 16:54:29'),(24,5,5,7,12,'2014-04-28 17:41:30','2014-04-28 18:03:14'),(45,6,7,2,2,'2014-05-05 17:44:39','2014-05-05 17:44:39'),(46,4,7,11,2,'2014-05-05 17:44:40','2014-05-05 17:44:41'),(47,3,7,80,2,'2014-05-05 17:44:42','2014-05-05 17:44:42');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2014-04-24 09:43:00','2014-04-24 09:43:00'),(2,'2014-04-25 08:15:14','2014-04-25 08:15:14'),(3,'2014-04-28 14:27:31','2014-04-28 14:27:31'),(4,'2014-04-28 15:34:43','2014-04-28 15:34:43'),(5,'2014-04-28 17:10:01','2014-04-28 17:10:01'),(6,'2014-05-05 14:11:47','2014-05-05 14:11:47'),(7,'2014-05-05 17:29:41','2014-05-05 17:29:41'),(8,'2014-05-05 18:10:39','2014-05-05 18:10:39'),(9,'2014-05-05 18:18:55','2014-05-05 18:18:55'),(10,'2014-05-05 18:18:55','2014-05-05 18:18:55'),(11,'2014-05-06 11:47:22','2014-05-06 11:47:22'),(12,'2014-05-12 16:13:19','2014-05-12 16:13:19'),(13,'2014-05-12 18:45:25','2014-05-12 18:45:25'),(14,'2014-05-12 18:45:52','2014-05-12 18:45:52'),(15,'2014-05-19 15:32:25','2014-05-19 15:32:25'),(16,'2014-05-19 17:05:31','2014-05-19 17:05:31'),(17,'2014-05-26 16:10:57','2014-05-26 16:10:57'),(18,'2014-06-02 14:54:58','2014-06-02 14:54:58');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,6,1,2,17,'2014-05-05 17:28:11','2014-05-05 17:28:11'),(2,6,2,2,2,'2014-05-05 17:45:56','2014-05-05 17:45:56'),(3,4,2,11,2,'2014-05-05 17:45:56','2014-05-05 17:45:56'),(4,3,2,80,2,'2014-05-05 17:45:56','2014-05-05 17:45:56'),(5,5,3,7,1,'2014-05-05 18:17:20','2014-05-05 18:17:20'),(6,6,3,2,3,'2014-05-05 18:17:20','2014-05-05 18:17:20'),(7,3,3,80,3,'2014-05-05 18:17:20','2014-05-05 18:17:20'),(8,2,3,13,1,'2014-05-05 18:17:20','2014-05-05 18:17:20'),(9,5,4,7,1,'2014-05-05 18:17:36','2014-05-05 18:17:36'),(10,6,4,2,3,'2014-05-05 18:17:36','2014-05-05 18:17:36'),(11,3,4,80,3,'2014-05-05 18:17:36','2014-05-05 18:17:36'),(12,2,4,13,1,'2014-05-05 18:17:36','2014-05-05 18:17:36');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `ship_to_first_name` varchar(255) DEFAULT NULL,
  `ship_to_last_name` varchar(255) DEFAULT NULL,
  `ship_to_address` varchar(255) DEFAULT NULL,
  `ship_to_city` varchar(255) DEFAULT NULL,
  `ship_to_postal_code` varchar(255) DEFAULT NULL,
  `ship_to_country_code` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'pepe@mail.com','956667849','pepe','pelos','Calle Boquerón 5 4ºA','Conil','119483','ES','127.0.0.1','closed',NULL,'2014-05-05 17:28:11','2014-05-05 17:44:15'),(2,'manuela@gmail.com','955718293','Manuela','Pérez','Calle Mancuerna 66','Paterna','12213','ES','127.0.0.1','failed','Tarjeta de crédito inválida','2014-05-05 17:45:56','2014-05-05 17:45:56'),(3,'email@mail.com','123456789','pepe','Pérez','Buyer street','Buyer city','12345','AQ','127.0.0.1','failed','Tarjeta de crédito inválida','2014-05-05 18:17:20','2014-05-05 18:17:20'),(4,'email@mail.com','123456789','pepe','Pérez','Buyer street','Buyer city','12345','AQ','127.0.0.1','closed',NULL,'2014-05-05 18:17:36','2014-05-05 18:18:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `origin` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cover_image_file_name` varchar(255) DEFAULT NULL,
  `cover_image_content_type` varchar(255) DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_brands` (`brand_id`),
  CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Caña Suprema',2,'caña de lomo','','Cáceres',13,0.2,'2014-04-28 15:40:17','2014-06-02 14:58:03',NULL,NULL,NULL,NULL),(3,'Jamón ibérico',2,'','Sabe a gloria','Extremadura',210,5,'2014-04-28 15:40:41','2014-06-02 14:59:52','images.jpeg','image/jpeg',7099,'2014-06-02 14:59:52'),(4,'Chicharrones de Cádiz',3,'Chicharrones especiales','Chicharrones auténticos de Cádiz. Chicharrones especiales.','Cádiz',11,0.5,'2014-04-28 15:41:05','2014-06-02 15:00:46','índice.jpeg','image/jpeg',8978,'2014-06-02 15:00:46'),(5,'Salchichón supremo',3,'','El mejor salchichón sevillano','Sevilla',7,0.2,'2014-04-28 15:41:27','2014-06-02 14:59:11','índice.jpeg','image/jpeg',6272,'2014-06-02 14:59:10'),(6,'Mortadela',4,'','','',2,0.4,'2014-04-28 15:42:03','2014-04-28 15:42:03',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_suppliers`
--

DROP TABLE IF EXISTS `products_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_suppliers_suppliers` (`supplier_id`),
  KEY `fk_products_suppliers_products` (`product_id`),
  CONSTRAINT `fk_products_suppliers_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_products_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_suppliers`
--

LOCK TABLES `products_suppliers` WRITE;
/*!40000 ALTER TABLE `products_suppliers` DISABLE KEYS */;
INSERT INTO `products_suppliers` VALUES (2,3,2),(3,4,2),(4,2,3),(5,2,4),(6,3,4),(7,4,4),(8,3,5);
/*!40000 ALTER TABLE `products_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140331181214'),('20140407170846'),('20140407204502'),('20140407222602'),('20140423164702'),('20140423164712'),('20140501115347'),('20140501115627'),('20140504131258'),('20140504154657');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (2,'Repartidores de chacinas','Calle Salchichón 7','Córdoba','Córdoba','','2014-04-28 15:39:32','2014-06-02 14:56:48'),(3,'Carniceros Chiclana','Calle Chorizo Picante','Chiclana de la Frontera','Cádiz','956801134','2014-04-28 15:39:41','2014-06-02 14:57:09'),(4,'Unión de carnes','Calle Carnes Frescas 70','Dos Hermanas','Sevilla','','2014-04-28 15:39:48','2014-06-02 14:57:33');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pw_reset_code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','pabloantonio.garciachacon@alum.uca.es','a6c47e89d6993453eaf232f3094756e3c7e00d7fcb1d6575a753fe048ddcca17c99b85b610e8a9e154b5f6e4fb7d4b79aa31f20cb21f6b62b5fd6a5af3bd4104','9OLkmyg7YjyLiW6iHzIV','95e2dcc0e0fcd5e5689ddef8843b4941ac3571431246da87149156f7acdff6e3b96c80ac42ded12a440369d5a1366180a12a88f54e7e467c7e6945fb61ee791b','OX6vynNuXVVLInw1gEOV',26,0,'2014-05-26 17:44:17','2014-05-26 17:44:01','2014-05-19 17:06:15','127.0.0.1','127.0.0.1','2014-05-05 14:17:06','2014-05-26 17:44:17',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 17:03:36
