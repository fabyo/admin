-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: financas
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.14-MariaDB

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

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abilities_name_entity_id_entity_type_unique` (`name`,`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_08_07_023345_create_bouncer_tables',2),('2015_08_01_104512_create_log_table',3),('2016_05_22_190217_add_fields_to_log_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_abilities`
--

DROP TABLE IF EXISTS `role_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_abilities` (
  `ability_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ability_id`,`role_id`),
  KEY `role_abilities_ability_id_index` (`ability_id`),
  KEY `role_abilities_role_id_index` (`role_id`),
  CONSTRAINT `role_abilities_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_abilities_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_abilities`
--

LOCK TABLES `role_abilities` WRITE;
/*!40000 ALTER TABLE `role_abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_abilities`
--

DROP TABLE IF EXISTS `user_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_abilities` (
  `ability_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ability_id`,`user_id`),
  KEY `user_abilities_ability_id_index` (`ability_id`),
  KEY `user_abilities_user_id_index` (`user_id`),
  CONSTRAINT `user_abilities_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_abilities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_abilities`
--

LOCK TABLES `user_abilities` WRITE;
/*!40000 ALTER TABLE `user_abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Keon Runolfsdottir PhD','jose.cartwright@example.net','$2y$10$KeUAQZ6GeXHzXqmAHDROWuPQLo4CWzKH7nvltnhgHfVqhi5jD9wtq','FQ8bzZpCgI','2016-08-07 20:13:05','2016-08-07 20:13:05'),(2,'Norval Barrows','bogan.consuelo@example.com','$2y$10$S.FpZ766ctXc1he96qSju.Wr1.NVXuY5WbX9i3qwqBbAu2dAOpKym','XUNxWv2zNx','2016-08-07 20:13:05','2016-08-07 20:13:05'),(3,'Myah Hayes','murphy.benedict@example.net','$2y$10$U8o8dfcqft7JMzPBK4KfeetXMA3d6AyYawZCqLIdE1b3S9IUoK8mO','zVtONKQgLi','2016-08-07 20:13:05','2016-08-07 20:13:05'),(4,'Joyce Christiansen','ralph59@example.org','$2y$10$39KOOQL5zQy5d7/wDvdNlefIEM3iDBrB5cD0si6qA/yBk74NgYi5i','svQGl578ZC','2016-08-07 20:13:05','2016-08-07 20:13:05'),(5,'Karlee Mayert','audreanne.hettinger@example.net','$2y$10$U7eZPiKCs0WXOpe54NZZfuQonBLXJkj5mtxi4U4HpKxxH06ncYVs.','qsxQCoWkzR','2016-08-07 20:13:05','2016-08-07 20:13:05'),(6,'Malinda McClure','leonel.boyer@example.net','$2y$10$W7VXlcfHwqIPmwlwBhZYJOkSZqopSLdB4koSD7WA9WQuspACYpNom','D2hh1czp5T','2016-08-07 20:13:05','2016-08-07 20:13:05'),(7,'Patsy Farrell','metz.jackeline@example.net','$2y$10$YwNZ7TeUxtkfGAfjkyC/PefM.4vSdidDDC/chYW.Xzy.Fz9erEBIC','Ml5gpmyPfM','2016-08-07 20:13:05','2016-08-07 20:13:05'),(8,'Novella Emmerich I','tristian55@example.com','$2y$10$/D8mGX/cr7Z13TZS1DUVF.lO4diBCcg7R2CRp7OEERZHYr48.7LJK','eLdjJXVkQq','2016-08-07 20:13:05','2016-08-07 20:13:05'),(9,'Oswald Sanford','gsmith@example.org','$2y$10$5egsXh1zSjzFcQoJzaYm3.Kqyy2uMgEHlayUHGm6otQiOlNK3FXoS','yG9QO7MJ6w','2016-08-07 20:13:05','2016-08-07 20:13:05'),(10,'Lewis Champlin','shayne.reynolds@example.com','$2y$10$RnRqCsUV2T9otNypd2wGBOHXyFyAxaMYNWGgJjVobAM3Evdlnyjhu','8etJ35dFJy','2016-08-07 20:13:05','2016-08-07 20:13:05'),(11,'Miss Maryse Johns MD','turner.jamil@example.com','$2y$10$2LG2aoknDXkHe/IUixh6j.dvh9OT8x/jCchvBEfcQb7xwOJE3a23e','0mb0EXwM42','2016-08-07 20:13:05','2016-08-07 20:13:05'),(12,'Madisen Wiza','trisha33@example.net','$2y$10$HtaLOEHViBjNzh4FGW0N/..x/YXqZyAF3bbXf6wkyPVwJCaOlXdeK','m8xZAnMR1c','2016-08-07 20:13:05','2016-08-07 20:13:05'),(13,'Lois Collins','mozelle.emard@example.net','$2y$10$SHp0/sh0scIu4xXsoVO65u3YJ2nheH2ChYIZFaWaZX8MPHq4OW2uC','XEeCfvjCno','2016-08-07 20:13:05','2016-08-07 20:13:05'),(14,'Trent Koepp','martine80@example.com','$2y$10$jivWwY84gUUKOlebmC41ve.00xTNZ1PMzzg7qQfKi9od0owx9NOQ6','ueSyjnZeNa','2016-08-07 20:13:05','2016-08-07 20:13:05'),(15,'Xavier McClure','kharvey@example.net','$2y$10$nAZw0v0px6xRzrMRfNMU..RxQtdapjh54uFNM30w19vBHvq6j70E.','ovJGcCTVBT','2016-08-07 20:13:05','2016-08-07 20:13:05'),(16,'Darrel Kuhic','daugherty.felicia@example.com','$2y$10$CSSnzwEVD35iyEPT.2c0LO01fiMfCuaXMeLGQM.8entfNhpQkjX6e','p6nZDirIqV','2016-08-07 20:13:05','2016-08-07 20:13:05'),(17,'Prof. Pedro Cremin V','gordon.crona@example.org','$2y$10$WoaxEkmK3qoOTDWZAC3n/.5rj9E63A0KdgRTP5YVwmHbEQD/3MS9u','6MxiWjMALx','2016-08-07 20:13:05','2016-08-07 20:13:05'),(18,'Vern Stracke Sr.','roy.quigley@example.net','$2y$10$o8HOEHpub6BoQwP/tdcpqelV0FqGE4.hkSk4VBmNDhppxRY3bt/nm','hAInE16Z7S','2016-08-07 20:13:05','2016-08-07 20:13:05'),(19,'Ashly Feil','kristopher64@example.org','$2y$10$1/locIxaqWfiLuKy9EOD3uR7CcTyRacCIIU6Ymr5so3gScGfRewWC','B8GZ7ZYycm','2016-08-07 20:13:05','2016-08-07 20:13:05'),(20,'Palma Bahringer','laury.rogahn@example.com','$2y$10$oCRu6fmxE.u.MhW2YKkKd.zavUP1Ig/zhanLW1ZRrNSx7zUAEXojq','5000UOGMHJ','2016-08-07 20:13:05','2016-08-07 20:13:05'),(21,'Cassandra Williamson','karson.heidenreich@example.net','$2y$10$k72iG7TA0P/K1VPyofaELOPQDVkb0xz/c6aik9EecjZUqt2CMFc5K','jyUNuTUYnj','2016-08-07 20:13:05','2016-08-07 20:13:05'),(22,'Columbus Feil','nbecker@example.org','$2y$10$RpqFHo.UcZrJ5T5yoxQmHO7.02bCCQev6FYqaJg9CIHpuj5cRL4yy','ybXtm8xfru','2016-08-07 20:13:05','2016-08-07 20:13:05'),(23,'Oma Lubowitz','raynor.hailey@example.com','$2y$10$rsO3umyzIB2TmAr7L75XAeWLDS5k9wIJvfo6fGfHYHT9Uy4BDnHQi','El945wp1mq','2016-08-07 20:13:05','2016-08-07 20:13:05'),(24,'Adaline Lesch','godfrey68@example.org','$2y$10$TVBIskxgotBJhaXeMCiwp.yZHvXKu/sE659uEoFHrFbmJw4Ltx3c.','V7c6eAu69Z','2016-08-07 20:13:05','2016-08-07 20:13:05'),(25,'Prof. Chanel Schiller','mertz.otha@example.org','$2y$10$.Po/ftKv9gjuaH7oeZ0h/eG78NrhkXYSOFC6R.Vchw9blYrrJGlIu','cmFDssnw45','2016-08-07 20:13:05','2016-08-07 20:13:05'),(26,'Jessy Lind','skonopelski@example.org','$2y$10$mn7U1GzllTjkr8L2Rsv8he4IRmRfOc7UlsT7TLEQ3MTevQco6Df6.','CBLuyY4pYo','2016-08-07 20:13:05','2016-08-07 20:13:05'),(27,'Furman Swaniawski DDS','tdenesik@example.net','$2y$10$T9rgceDJaoaHw/wt8mEfheQ4RWb41nadIIBjknkzOhYHSMdRA4f8u','X40Nbywmqm','2016-08-07 20:13:05','2016-08-07 20:13:05'),(28,'Tom Lueilwitz V','velda.schmeler@example.com','$2y$10$YcY.Vqfxu97Yr2KFcDK9a.2tA2Jd1gf/GMLlA7zcbl1p9eYDAiKq.','KEDmBD6QU6','2016-08-07 20:13:05','2016-08-07 20:13:05'),(29,'Torey Jacobi','welch.lisette@example.net','$2y$10$p.UhpDqnNzX3qtX//y18uOaI5nNNPKTijj3FN2Mp1vUjaZj.tZboa','nJforLCaYd','2016-08-07 20:13:05','2016-08-07 20:13:05'),(30,'Johnathan Mosciski','sidney.dicki@example.com','$2y$10$tRYWYzftIq12mhz.hN8.QOM0pEGlwfpcpDWbqQzWBPavhbGOCb2gG','0dfAQ78dCg','2016-08-07 20:13:05','2016-08-07 20:13:05'),(31,'Melyna Bayer','jnienow@example.net','$2y$10$zyDy1U9Az/hKvtvxZv/2eODsKDNfvgy5YVl5wfzok.T7V.VPZLVd.','VQmBXisPBR','2016-08-07 20:13:05','2016-08-07 20:13:05'),(32,'Mrs. Christy Stroman','cernser@example.net','$2y$10$2UyFuSYyKUxSjsBVtfuEkObeFn7iJv4JT9LJtr5QGQIpgcVyPPu56','1cp8bDB79g','2016-08-07 20:13:05','2016-08-07 20:13:05'),(33,'Prof. Percival Mills IV','igerlach@example.com','$2y$10$AP6V/kigTZlun.1aavBXC.YJyVhDsnQvdH1A83rOXMAnFVA/SGVYC','rROtdtSzUM','2016-08-07 20:13:05','2016-08-07 20:13:05'),(34,'Alejandra Bahringer','rosanna.rath@example.net','$2y$10$Xlv/rnlxgoZWUlrq4IQE2.H9BcnWOvLztUpsIlDa17f5zMOV6UiM2','O2WieMtq9t','2016-08-07 20:13:05','2016-08-07 20:13:05'),(35,'Mrs. Melissa Carroll','alek.koch@example.org','$2y$10$1Gczxo3WUcoCgh6f1hmpHezXfLkYYqeFP4fAFbmsfjmM3l0ugVwYG','6V7zp3V6cq','2016-08-07 20:13:05','2016-08-07 20:13:05'),(36,'Prof. Kamren Russel II','zola77@example.net','$2y$10$/okPEwo42QYrRXdSILPhJesg/TnlORz3a0Z3zAYYbt.HrGwNHc1o.','R0hkULu3dI','2016-08-07 20:13:05','2016-08-07 20:13:05'),(37,'Ms. Marielle Bahringer','kohler.georgianna@example.org','$2y$10$/7KdiWGS575HxhjOf3q5kOm92HKcr4EBrgLBj59FL/eIWvLloAxiK','56A9zgKtDT','2016-08-07 20:13:05','2016-08-07 20:13:05'),(38,'Noble Langosh Sr.','roberto.hudson@example.com','$2y$10$tqiOnYfLaIrXEGf6vmklNutmyQEfngWZuCljA8Deu1Rl1A92F.yJa','f5n2S8PSea','2016-08-07 20:13:05','2016-08-07 20:13:05'),(39,'Miss Fanny Steuber V','jhuels@example.org','$2y$10$pcHeX6Lu4leXa039DySZWODvb/1t27VZLQGLtLq/VyXKDN8YyRXXe','XQtQBUIfM4','2016-08-07 20:13:05','2016-08-07 20:13:05'),(40,'Lonny Rippin','leffler.declan@example.net','$2y$10$Czuh1bkfPElgeOMhQG6F8.4U5iNFT/2DPl/ITaUbYmLwpNCLitME2','CuYBM5eNIb','2016-08-07 20:13:05','2016-08-07 20:13:05'),(41,'Rosalia Mills','newton76@example.com','$2y$10$FHkSmufbTGyw2l/BFTgwiOmXSQymeXtyf7WIJpYQwxEeYWzREENJS','5Cof0B5DNL','2016-08-07 20:13:05','2016-08-07 20:13:05'),(42,'David DuBuque','aidan90@example.com','$2y$10$mD8ZKjGRktQVbCLxXT1lfOv8zMJSm3WzEhKwmQiHIK.XAlo7/96Wq','w6eqeYoBr6','2016-08-07 20:13:05','2016-08-07 20:13:05'),(43,'Hayden Mertz','bkessler@example.net','$2y$10$a9/U1wDSvIHmc3iUCV52DO9RP6LmapwUnb/1FVEnBiP2YOKBwMX5O','5r7gd61MAr','2016-08-07 20:13:05','2016-08-07 20:13:05'),(44,'Miss Margaret Reinger DVM','aprohaska@example.com','$2y$10$uelI7xpRmvg1kLHc5MmV6.DWddds5RiHPOkq34PWQy/cvVm9iKhLG','nqFJ0ih4YC','2016-08-07 20:13:05','2016-08-07 20:13:05'),(45,'Etha Mills','orrin.swift@example.com','$2y$10$e1.nyYAl3HGvVmUgCn9kLukuXL.gELwzfhXffDv9bB3y29dn.1TgW','ZxDwiuftYO','2016-08-07 20:13:05','2016-08-07 20:13:05'),(46,'Alysha Wisoky','ckunze@example.com','$2y$10$LqbFzLdR/UVb6ec6bBe7veh/TJ51xhLka8YQWd4khEhXmP5MLJGEC','UEM1To0heI','2016-08-07 20:13:05','2016-08-07 20:13:05'),(47,'Tressa Schuster','pietro98@example.com','$2y$10$KSC6fO3wV8b4niSgL8JL9eh1kiCtRrj0bSDyLnaIHkMLAWud.Ncsm','jrGNEwYqrP','2016-08-07 20:13:05','2016-08-07 20:13:05'),(48,'Quinton Fay','kole83@example.net','$2y$10$cR8Q52vVRV6zaKrvOwUhMOD6XkFiLmdI/dmS7bqxuGNsGMbflNNAO','TSJFnUeJGj','2016-08-07 20:13:05','2016-08-07 20:13:05'),(49,'Dr. Pearl Friesen II','veda31@example.org','$2y$10$0ClgFULDevf/ViH/cb9fmeBa6NAyqtsrYNvGxfpEz740QUzI.8ZOy','GdttdUYQRM','2016-08-07 20:13:05','2016-08-07 20:13:05'),(50,'Mr. Forrest Ortiz IV','audrey70@example.org','$2y$10$Usm1CLyk7zsd6d65cFfzZ.kWm2x6PvCBLcRPvI.sW.LaUn6qWlHdO','LQzllAonlg','2016-08-07 20:13:05','2016-08-07 20:13:05'),(51,'Ronaldo Brakus','lkuphal@example.org','$2y$10$x348dRG9jU96g.0FWGVfY.KMiD6nRXS46ZdNNEfuMdX35U0oKMHKS','8G2Kitp2nr','2016-08-07 20:24:35','2016-08-07 20:24:35'),(52,'Miss Bonita Bogan PhD','qlangworth@example.com','$2y$10$Ik8xjczjl1ILhPEtFmIZcubgJ7Vv6mgfRFgouX85SnuF93Pqp2Ina','dlt8sFushS','2016-08-07 20:24:35','2016-08-07 20:24:35'),(53,'Mr. Glennie Kub','princess.mante@example.net','$2y$10$TRiKU8p/2hjWkOag6he5S.hjHCKL8jfb7drxxMGf6TWKg/eFZII0u','zWPG1BtQoY','2016-08-07 20:24:35','2016-08-07 20:24:35'),(54,'Ms. Margarett Senger','ila.stroman@example.net','$2y$10$msPfzswiSSX16p7h4N6odeDQb2kxwRvh8j6F2AdCrp.ndkxsMpZN6','54rK8bigOY','2016-08-07 20:24:35','2016-08-07 20:24:35'),(55,'Irwin Rau','abergnaum@example.org','$2y$10$NT738AF.H/8DpJsvs/S0YeUuYEJQWxXxI73TmNDd.dAF4iiy2KcP6','4lGTiSfZgl','2016-08-07 20:24:35','2016-08-07 20:24:35'),(56,'Freda Ferry','oreilly.edna@example.org','$2y$10$qEOWtanT2MErkECm9R0kWOrFtz3xHbhRWXlAYpzLd028Lj8xdRS/m','bXN1nyiaaX','2016-08-07 20:24:35','2016-08-07 20:24:35'),(57,'Mrs. Dulce Padberg','saige43@example.com','$2y$10$ectMMH7advrB1hi8dhY6E.MzEOy/j6BB690EvNzs.YbER6n1rQNd2','NBdnNWLx1Y','2016-08-07 20:24:35','2016-08-07 20:24:35'),(58,'Aimee Gulgowski','gina.schowalter@example.net','$2y$10$B0XHM43ENFN6No3q6KKNvu5VmoH4xKd41Nk.tlOx25naQmMQAuKxC','dC4xq5v3sb','2016-08-07 20:24:35','2016-08-07 20:24:35'),(59,'Isabel Bednar','rau.thelma@example.net','$2y$10$wRqIiWwxh6opoGAQIG2NGuKS4XA8/72JHi5kpIgiU8qUQaGiZXoee','U6lC1qrLfc','2016-08-07 20:24:35','2016-08-07 20:24:35'),(60,'Carli Kilback','pfannerstill.dante@example.com','$2y$10$aAVXeV1NnBKeJx4FX3yIFuIzMopko/o2hr.Ruz51oROZMDnPvqSsm','gv5qThfkxl','2016-08-07 20:24:35','2016-08-07 20:24:35'),(61,'Vida Walter','wilburn24@example.com','$2y$10$29waKnqDdEe7eBrAEegJfuRhVX1DtxaA9peoKL1JQBtEjK0JCPbCu','aSunQZVUUX','2016-08-07 20:24:35','2016-08-07 20:24:35'),(62,'Johan Kub','norbert94@example.org','$2y$10$Rfs9yB/urq.wOf9O0zOR0eprVRAeJ8Ii1ne8ZfFDnVDW6lGKomrJO','B1ck0qMO8Z','2016-08-07 20:24:35','2016-08-07 20:24:35'),(63,'Evie Hegmann','warren.mertz@example.net','$2y$10$nTtQmV5s6nxlbLlLa/BCCeZ5rQxeiRmBOcQzugN8SQoKMFymPwNOm','rQz1gCIThF','2016-08-07 20:24:35','2016-08-07 20:24:35'),(64,'Dr. Selina Crona II','ylindgren@example.org','$2y$10$awibAfmgS8e5drNRJRYSl.cyKJRqcpGhoS8OKHvX2/Rt5HPtd/6zy','NcQ40jtqXJ','2016-08-07 20:24:35','2016-08-07 20:24:35'),(65,'Austin Waelchi','jyost@example.com','$2y$10$mVKeYLU6eRjXmV1zvLTwm.ePne2XIBRGwjed0lJcja9S1q.vxR3Hq','J4k7araw3P','2016-08-07 20:24:35','2016-08-07 20:24:35'),(66,'Sonny Considine','dickens.lucas@example.com','$2y$10$UY7nQgDRVgjyVjfhEUZyFuLVjfA72QEPyeEkDXzDPwiIv/OHFOkRK','8PbzIkkANM','2016-08-07 20:24:35','2016-08-07 20:24:35'),(67,'Prof. Michael Ullrich','nkertzmann@example.org','$2y$10$lQu.t9.5REok5bBNuIZGVOFPiX2vSs6f3dIZThTtIlaVR/gs5JT5K','LXfqMpJZVJ','2016-08-07 20:24:35','2016-08-07 20:24:35'),(68,'Jessika Connelly PhD','gkessler@example.net','$2y$10$YxwZLPX83eJItoHpdAgqW.bGK6MoRDbMsiDYKPQpzLJT1usyO5Qea','QFOxLR0WK9','2016-08-07 20:24:35','2016-08-07 20:24:35'),(69,'Albert Gottlieb','lucious71@example.com','$2y$10$EEo1YQ9m1GBuUiRRbyfqZ.G6x7k913otRwBdv9BhGcj.MSxFcnQ.y','L20NLkD3Xw','2016-08-07 20:24:35','2016-08-07 20:24:35'),(70,'Nannie Padberg','bayer.letitia@example.net','$2y$10$N5spnBPwuLAYR8pZQm7xJuDht1w/sO7Wb7.EuZQflBlwcasqh4VPW','PGkyzzZX12','2016-08-07 20:24:35','2016-08-07 20:24:35'),(71,'Jonathon Block','dillan.gottlieb@example.net','$2y$10$0wkrYdhQtK7Dv1cavT2BHOp2dTB1L6CGdiOOf4I6CHQz6PGhLbiRC','1th8kWsODm','2016-08-07 20:24:35','2016-08-07 20:24:35'),(72,'Marcel Terry','matt.kulas@example.org','$2y$10$ejWCHukezMWxtqC0row3Huyl6Xz52qjSJZX3gnNJjVW268JZVyI0m','XNnHzko43n','2016-08-07 20:24:35','2016-08-07 20:24:35'),(73,'Isobel Kautzer','rasheed.gorczany@example.org','$2y$10$C8lRyrVOjczvA5LrMhLt2eTRYqUr/netm4hWbmDDNu4gERgW98vPu','bUkpI2Qqws','2016-08-07 20:24:35','2016-08-07 20:24:35'),(74,'Jeffry Wehner','oleta.armstrong@example.com','$2y$10$FYurpp1OO8.QqrfE3y8rKerqG55XVifQ8xRqi61gGkdRq4HkWSu26','KeJgV9f3QR','2016-08-07 20:24:35','2016-08-07 20:24:35'),(75,'Alexandre Kreiger IV','kassulke.devonte@example.org','$2y$10$DMPMCHF1Rmmm3EtKfN3fW.5xn7EVgaL.LWfoxfkepyNGkJq7PI.ce','bNu0UORe2w','2016-08-07 20:24:35','2016-08-07 20:24:35'),(76,'Hellen Altenwerth','sigurd.little@example.com','$2y$10$jLrVq/IXDz1yWx8eW.Jh.ewjvtt9prXA5KVuFbX3l9sIeg1TYmySy','Y46sBqN2pE','2016-08-07 20:24:35','2016-08-07 20:24:35'),(77,'Mr. Hazle O\'Hara II','uosinski@example.org','$2y$10$9NOIYuzbibs3cKml8rMaF.Dq4R6N3y03HlWjGVahk5oZL1LlXwRba','jk9wihFbTF','2016-08-07 20:24:35','2016-08-07 20:24:35'),(78,'Prof. Garett Walker','muhammad.reichert@example.net','$2y$10$67bEvd1RF0siIomVAtmN5eEw9U7Lm5Ablq7pdv8J1IV8vo8ZDAKae','GcpsIUck3t','2016-08-07 20:24:35','2016-08-07 20:24:35'),(79,'Ms. Lois Hickle','phaag@example.net','$2y$10$OFPUxCDh6A2wMjo8zya5Guvg4H5ywQqVsr8ArqfhEx3p476hweQ8i','r3eZlKiqVn','2016-08-07 20:24:35','2016-08-07 20:24:35'),(80,'Marquise Walker','hilda.herzog@example.org','$2y$10$jbW9nJqmkMP9YLSj4QkGy.Y6XN9tO3/8K9d/DPM1UxuTlKhp6eHQi','nSizRB6EWP','2016-08-07 20:24:35','2016-08-07 20:24:35'),(81,'Anthony Hodkiewicz','stroman.dovie@example.com','$2y$10$geDKzlSPd9K80xrNZdHPyeKQjTZtqBcWuN4B0SixQNvS1J00ZTmlm','XdatGq07My','2016-08-07 20:24:35','2016-08-07 20:24:35'),(82,'Stanley Wintheiser','ohara.chance@example.net','$2y$10$FpE62ce7UK366O1BBEe/qOF6SShTLgVQv8Tvf7EZErmN1.ncDweAO','hAn4lZcbuC','2016-08-07 20:24:35','2016-08-07 20:24:35'),(83,'Kevon Howe','ara.baumbach@example.org','$2y$10$rI5qWAwJzMNnvrMm3XQqn.ga5KFwH1E3Nc9wEfwdREzxMNlS4lZB.','CoOhdqhNIC','2016-08-07 20:24:35','2016-08-07 20:24:35'),(84,'Sonny Purdy','jschaefer@example.net','$2y$10$iV/2PzO/Zw7CxMToxbE1e.lEz7JdfscNpTnKW/097bnzOhQ38kmaa','tcEJkFzH5d','2016-08-07 20:24:35','2016-08-07 20:24:35'),(85,'Mr. Loy Rau DDS','fcruickshank@example.net','$2y$10$jIFRtc/y9DM.SMn2ThYFy.gf9sGjUQjIEmClZHIuHONOIfZw2rEw.','3fFRGCGWWe','2016-08-07 20:24:35','2016-08-07 20:24:35'),(86,'Ardella Hane','christa94@example.com','$2y$10$KWMwhqQVXYqGT5RCF0E5nePqtWAv7mXbJXT8JvlCP5HYo8P0TxfE.','il8C9ehxcw','2016-08-07 20:24:35','2016-08-07 20:24:35'),(87,'Prof. Jamey Maggio II','giles.gutmann@example.net','$2y$10$1VhDbyly8NKB6qNssEpdbOHlOO9kLUYkU6pkHTGq9N425Mj/4enFC','eryEuJwSSd','2016-08-07 20:24:35','2016-08-07 20:24:35'),(88,'Prof. Raegan Pagac III','kara80@example.net','$2y$10$0JHkNYtVfIPTANgjH/3i4uQPyRaYsrQ7RAzTgiEGoFWq/55cxOM1y','56f1XIdrXq','2016-08-07 20:24:35','2016-08-07 20:24:35'),(89,'Arch Boyer','herman.hellen@example.com','$2y$10$aHC8xQB3Q9qfrAegJ16du.9zrV/mCcGP.oxGL.eIxlErZ5AhHvUhO','GUva5LSvF0','2016-08-07 20:24:35','2016-08-07 20:24:35'),(90,'Murphy Reinger','tfisher@example.net','$2y$10$8V0wpsqvooaE/PozdXkFpOw7LhFdwkEKW1nGGWntSr/mSmWDd6VXG','YfRDaIstvQ','2016-08-07 20:24:35','2016-08-07 20:24:35'),(91,'Prof. Vince Krajcik II','michaela72@example.com','$2y$10$Mr3wsgrSouSx/Qr2RA4pAOLwLgmtPRdLr8vgnRRkY5euBHq/7fpFq','OAS7wjmv8j','2016-08-07 20:24:35','2016-08-07 20:24:35'),(92,'Jessyca Cole','jarrell46@example.org','$2y$10$mFnAnSq32TDrR/fDc4K1O.tYo4OpWrDQIsnJG0JvCmzpfXHXRqCra','r81cfzdrtJ','2016-08-07 20:24:35','2016-08-07 20:24:35'),(93,'Timothy Weber','lockman.arturo@example.org','$2y$10$fzp/zGy0rd68jXcz6d5tkO8.Mx1ySf06b2aYBawyivQ1/jXRD3dLm','PUBeujRjVV','2016-08-07 20:24:35','2016-08-07 20:24:35'),(94,'Lillian Quigley','harris.rey@example.org','$2y$10$2m62VLH7b/E8N9LBXh3yTOGl3h9dTlcdxKUCvzWDr3B7RybYDzSEK','DSo0ollxIj','2016-08-07 20:24:35','2016-08-07 20:24:35'),(95,'Prof. Gisselle Roberts','vjohns@example.com','$2y$10$9HYpTk9daMKTtiaHifV4hOM8rPHhzV3ftRl9zJikTCNxPTEdIDoUm','MDU0iEAYsX','2016-08-07 20:24:35','2016-08-07 20:24:35'),(96,'Agustina Jones','hbosco@example.org','$2y$10$IbkydOKr5QoZSy391clnEun7e.hvhWuNunO6DnxWlDSg/l4pneEti','ry0SFM3s91','2016-08-07 20:24:35','2016-08-07 20:24:35'),(97,'Dr. Bobbie Batz I','camylle47@example.com','$2y$10$HSmSrzeGfS9ZlQh57lShJ.sJYTMWIm52iNdfzUlID9N76rZVtJUlq','RpXxRfdxJK','2016-08-07 20:24:35','2016-08-07 20:24:35'),(98,'Andy Green','hand.lexi@example.com','$2y$10$Bg4xNYrW29w9vm2JTi00N.kjfRApCFebR1bn2makaMkpHuVDhWeKC','ReoiX7rm56','2016-08-07 20:24:35','2016-08-07 20:24:35'),(99,'Darron Olson','darrick84@example.com','$2y$10$PHaf7jPTLaPT/WyetoL8D./0cEp3MDHtxsbKaFl0lvDnG7Js5RiBe','ghZXOfI0gJ','2016-08-07 20:24:35','2016-08-07 20:24:35'),(100,'Braden Nicolas Sr.','jett.oconner@example.com','$2y$10$lERTCe4ampJyxXyraVmxtOLO8AqgeMoGuDdnpxQFfQLmAMSOQF.Yq','B8Pcn9PDKa','2016-08-07 20:24:35','2016-08-07 20:24:35');
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

-- Dump completed on 2016-08-07 16:40:23
