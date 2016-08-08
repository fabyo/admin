-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: financas
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB-1~xenial

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
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2015_08_01_104512_create_log_table',1),('2016_05_22_190217_add_fields_to_log_table',1),('2016_08_07_023345_create_bouncer_tables',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Linnea Fay II','rcorkery@example.net','$2y$10$Fa29594ZpMflXW2jUgHV6.lVVGlwiBb14PDDHyiOeHwos4X0Pz4Fu','MYgmCwx9Bc','2016-08-08 18:44:36','2016-08-08 18:44:36'),(2,'Prof. Ansel Kub II','vernon95@example.com','$2y$10$907bVFwDN4IDgMNRY26TIe.DWGXqwp.m.jqXKDgjpoYUBReYi1Zbe','rrjJ7Qz9Nu','2016-08-08 18:44:36','2016-08-08 18:44:36'),(3,'Dr. Jamie Howell','hudson.erwin@example.org','$2y$10$uA0PRi3CIRp7PRfd63hk7u70A.IEvZgR8ZuBgMgdM1Wtc7IlwHpDu','6nMeLkqU5N','2016-08-08 18:44:36','2016-08-08 18:44:36'),(4,'Ellsworth Rosenbaum','schoen.coleman@example.org','$2y$10$5VGQnSf2DJwvKUzo92vksO7rO.3HyQs3xzKoAcpcp0j4KLMrzhu3u','rNazJACuWw','2016-08-08 18:44:36','2016-08-08 18:44:36'),(5,'Alexys Dicki','edickens@example.org','$2y$10$AC5J6i/x8x2d86TGgm19h.UG22dJimXMCOEB4a.npO2XRj3lfKTIK','K44ZWAd06E','2016-08-08 18:44:36','2016-08-08 18:44:36'),(6,'Hannah Morissette','kaden78@example.org','$2y$10$XAfWrY8jDbrHP68QCYxz1uLEQFHKvgCiLMMttY7ZLNOvTQLnCIMFu','aYOeC6kAAE','2016-08-08 18:44:36','2016-08-08 18:44:36'),(7,'Lila Leannon','koepp.jarret@example.net','$2y$10$ifDpzxr5S9e/v/x3FxRZMOa349VK6y7wH8NyfHHXEZUfMxBkbYG2C','Ptvxnm77z8','2016-08-08 18:44:36','2016-08-08 18:44:36'),(8,'Darron Lesch','ferry.athena@example.com','$2y$10$MHiQuYiUEFNfBjP09LnDyerOYYBtabDZZpfz6kN8uEupgRW0vkJSy','CDwRnFupaU','2016-08-08 18:44:36','2016-08-08 18:44:36'),(9,'Mr. Roberto Spencer','justus.lebsack@example.net','$2y$10$lHFtZQrOyi6Yp7S6lHX1ROcx/9iLovt1ymhCjc42BTNoIjjVAcau.','Sz7xQdfqij','2016-08-08 18:44:36','2016-08-08 18:44:36'),(10,'Prof. Mossie O\'Keefe','prohaska.summer@example.net','$2y$10$wymHq7bPfwLjbFoRLVfl8umVN6BBKVn1iUcu9DTXVDPQsWomeOcgi','903utKj2tg','2016-08-08 18:44:36','2016-08-08 18:44:36'),(11,'Odessa Gibson','nickolas39@example.com','$2y$10$UT0dACSGl8oYE8iPSspQS.02ycptFW8zOrTQfUgW02aBLulDgSqoa','ia5hKEbYsI','2016-08-08 18:44:36','2016-08-08 18:44:36'),(12,'Prof. Jesse Lowe','ghudson@example.org','$2y$10$fbt3JOiOVFj2/3KW0IJR6ust8Yqg3zZbu.EyIhsZ26i1PMbFDym2m','L13xPSRg5D','2016-08-08 18:44:36','2016-08-08 18:44:36'),(13,'Unique O\'Keefe','marcelo13@example.org','$2y$10$Sm/gOJg7R4ovFlI4bRjHCejAOjun9z4tXJdO4MjFOV.fT1fh4WUrW','WkXqT4Wbbq','2016-08-08 18:44:36','2016-08-08 18:44:36'),(14,'Mona Oberbrunner','reyes.prosacco@example.com','$2y$10$t.fncZLoO4uON/G.kCCKP.L7NiEadoCnjEnDh71gwXJCnWoO91jwm','0EvkXX5VP7','2016-08-08 18:44:36','2016-08-08 18:44:36'),(15,'Dr. Khalid Dickinson','gus18@example.net','$2y$10$S6xmKulBLYoVDacqYiaEkuicad80nOAqHWtMJOYumHbeD61ZVvveu','XQoa6Qr0nq','2016-08-08 18:44:36','2016-08-08 18:44:36'),(16,'Delmer Murphy DVM','chilpert@example.com','$2y$10$LAhaY8CmHhcZ.utaPgRMf.7OHd1kH0VuzwL.Nkqp00LINQmFxzDyK','9h2mV5jgbb','2016-08-08 18:44:36','2016-08-08 18:44:36'),(17,'Daphne Bednar','hrowe@example.net','$2y$10$FqCN7CHue306cy..k1cNbOR7xUmxica5WKUYAKtbdtsoFtzMOuy2W','oQRUW00z5P','2016-08-08 18:44:36','2016-08-08 18:44:36'),(18,'Ms. Jade Murphy','frederick.prohaska@example.org','$2y$10$pO4Vxiu6qusCetYszhjfsu5juqeiaBI/tKWpjHrNM6tp7wctS6BC6','0rvazpgY4d','2016-08-08 18:44:36','2016-08-08 18:44:36'),(19,'Sanford Nitzsche','imiller@example.com','$2y$10$Lp.FkTAH1j0uAzmRpqStg.ZM9etsBnbfVnkpXNQ0Md4SdhluCZ1va','b9IsAQsVSh','2016-08-08 18:44:36','2016-08-08 18:44:36'),(20,'Lempi Feest','wilfredo28@example.com','$2y$10$S7alv5ifZTxLZlOla.MJveAp0kCwjtiyDEWBgBjnA.5Gps7IXgvQi','b6PDdGzFpd','2016-08-08 18:44:36','2016-08-08 18:44:36'),(21,'Prof. Mohammed Orn I','nschneider@example.net','$2y$10$fdkhCrB9h7lxX2d.nUGFqeS0zDQomLa89mV96tt3qq3fedaG9nsNm','erX7ea0RTX','2016-08-08 18:44:36','2016-08-08 18:44:36'),(22,'Ricky Volkman','hazel.frami@example.com','$2y$10$kOxs.wZpc9p94IzJWxizzOTIY.tZh.ECP5SZwPcot8p2ksnAZa0ka','LT6zEHQCHx','2016-08-08 18:44:36','2016-08-08 18:44:36'),(23,'Geovanny Lockman','lebsack.linda@example.net','$2y$10$Ybu/7aShQD.PDcAL6IlhSOh0YJIar59.SaHCYfsNNK1Uf5O5MWZsy','jSQVVBIGfO','2016-08-08 18:44:36','2016-08-08 18:44:36'),(24,'Joannie Spinka PhD','clarabelle.dare@example.org','$2y$10$UU7lm9BfQyo5Xk0oFYgGUuum/ZRQhlHkHZ3RqOk0cUpSPLLvo6DNS','Qqr0ZCirv5','2016-08-08 18:44:36','2016-08-08 18:44:36'),(25,'Moshe Osinski II','vhodkiewicz@example.org','$2y$10$2M3J0FqTqvsku/9mAnImCen2lNzcHBNBDnoybtAzJ3kxnuDV6LnRG','jFtD54yAIF','2016-08-08 18:44:36','2016-08-08 18:44:36'),(26,'Camron Schoen','darius.trantow@example.org','$2y$10$hwSm/qGoaLATR4kYAA7rHObUE4YmUI4gMunU4ri2xufYnKE0Gzl4a','oYokqu4UHB','2016-08-08 18:44:36','2016-08-08 18:44:36'),(27,'Dr. Layne Erdman III','noemi.senger@example.com','$2y$10$yRYe44fckUhHwJrxXx23ouP4k1o5WpP8lo/YqGY.BMVKGYxLPi1mi','soXtlbKfXc','2016-08-08 18:44:36','2016-08-08 18:44:36'),(28,'Sanford Crist','cara.schumm@example.net','$2y$10$.psfagiASv5N9ILytGzyguFQ0vD8nE6pVlNY5O0nN/2OnRZ4.zWru','nCSnZCc7HI','2016-08-08 18:44:36','2016-08-08 18:44:36'),(29,'Aliya Moen','vgleichner@example.com','$2y$10$5YlEg9OJwIVo9Gx3zYcEweun0G6yxOivKIN5eUH80Ry/7EeJIxUNa','kp8gE0fotN','2016-08-08 18:44:36','2016-08-08 18:44:36'),(30,'Ryann Mosciski','zora96@example.com','$2y$10$NsPgA3te8j.cAQja7eKXpO2/FrSLT57z4VXSGyk0DybrRpG5sYVOy','PxAYTqk80K','2016-08-08 18:44:36','2016-08-08 18:44:36'),(31,'Abigayle Koepp','yturcotte@example.com','$2y$10$TjBWLtPSyNnIbam/D3U.jOqH5XHw6jhR8jfDRcBFOT3DaJHLBx6yG','isOtD9TufN','2016-08-08 18:44:36','2016-08-08 18:44:36'),(32,'Rodger Stehr Sr.','vena.casper@example.net','$2y$10$V/qZPZRbfUNA1fl1nHPohOR2k0LZP.RZ93/5j68ibILGe40vEGmFG','TrQmC5S68H','2016-08-08 18:44:36','2016-08-08 18:44:36'),(33,'Miss Meghan Rau V','grayce30@example.org','$2y$10$w4xn2yNrXSM6ygf/HwdVIu3AZTuwPGHzQUPRfaKLK0kgqcRt6Tbfy','hv9wtkzXgZ','2016-08-08 18:44:36','2016-08-08 18:44:36'),(34,'Brett Hickle','dconroy@example.com','$2y$10$jKxbsxvi.OdLK2DoRCCeueHomjfu32POQhT0Dpo3uYR3C9c/5TJsq','MJtHZYGKF6','2016-08-08 18:44:36','2016-08-08 18:44:36'),(35,'Jenifer Heller','ellsworth93@example.com','$2y$10$KF0tZ0Z0vmJrq9hgsZKS0.HpdW24Wnzj1PacCpvHcsH8SqiGwXIkS','ZsyyeYr9Za','2016-08-08 18:44:36','2016-08-08 18:44:36'),(36,'Annabel Frami','murray.kim@example.org','$2y$10$uQWXDQc9ZcORG9bhUOcOUOa5.2rqhVo6UfZtGAxllkaQE9YuvlfDa','zMKlg1CBCh','2016-08-08 18:44:36','2016-08-08 18:44:36'),(37,'Khalid Zulauf','hilll.keenan@example.net','$2y$10$AN2RoasUJsMoQAjJIW0DluTtzU0xCAU64sVmvEeMRbTrC/HkwltL6','WUgpQgaG6n','2016-08-08 18:44:36','2016-08-08 18:44:36'),(38,'Herbert Haag','goberbrunner@example.com','$2y$10$hn8Ma86vDmdyMMG78Nsz6OFzLYvjy5ub/YsoAZRiZWGLn.vcQZs2S','iogK06Rxcx','2016-08-08 18:44:36','2016-08-08 18:44:36'),(39,'Shyann Stracke','buster.thompson@example.org','$2y$10$TVBmrZTym/SYA1SeRl5cMOk4J5XBl3XK9w.fccZ/FPTuCNaKg/5cq','s5B72mcGck','2016-08-08 18:44:36','2016-08-08 18:44:36'),(40,'Doyle Murazik','princess.macejkovic@example.com','$2y$10$VVj045XfGZRun4uWQUjxoOIFhSprFHKilWvKPzbqWxyFSha0nPmNy','IebiHVWJBy','2016-08-08 18:44:36','2016-08-08 18:44:36'),(41,'Eloise Braun','elsie.dicki@example.net','$2y$10$w5COAzhxodVHJTZJCMO4K.xYLtX1fJ2376EZy45TwAUiVeUXnQSui','wBBMIvVpqE','2016-08-08 18:44:36','2016-08-08 18:44:36'),(42,'Felicity Schmitt V','trey.quitzon@example.org','$2y$10$m1LqP2n7Tg3vLxqUONY1aebXr78iUNQtaR01hso0Xj72dukmYYidG','YU3j7h5pvY','2016-08-08 18:44:36','2016-08-08 18:44:36'),(43,'Richie Borer','rogahn.juston@example.com','$2y$10$MrnYzHMcWPi7vXPukSBaWOQ4mynV/TTr51PZn6a2r4fi2k/ZgjDqK','ArFLtySNSE','2016-08-08 18:44:36','2016-08-08 18:44:36'),(44,'Zola Jaskolski','ledner.myles@example.org','$2y$10$q3rcwJFUY.7g3NXImlHjou7isKwRRf6lFvTbyAkoaPm8/mlClUmeC','HxJuS5ATPF','2016-08-08 18:44:36','2016-08-08 18:44:36'),(45,'Ebony Fahey III','roselyn.bashirian@example.com','$2y$10$PmMaaSv1LcD1VgVtkwR78eo8LGjDYUL8b5vU4F0h5/FtBdLTGCWJa','Kog7HSBmBa','2016-08-08 18:44:36','2016-08-08 18:44:36'),(46,'Verlie Schulist','lkuvalis@example.com','$2y$10$g82fu2VaYXsZsr.FOgYqaewst9kjIzG.sL.4OpnB8K4TPvBS000oC','DhzSM4stfU','2016-08-08 18:44:36','2016-08-08 18:44:36'),(47,'Kyra Stracke Jr.','barton25@example.com','$2y$10$05SQeGxUxfAxyLHdHT72CeylxOb6yWFJCaDHZeHyifH099FVvb7Yi','MwY2otCXVo','2016-08-08 18:44:36','2016-08-08 18:44:36'),(48,'Miss Sandrine Torphy DDS','dejah27@example.net','$2y$10$lzMCzHRy6E5tuUtG1WoIHOsdpehM/aEN8WYerMq3/m.VoSHsMtyum','iNsOQvX9sY','2016-08-08 18:44:36','2016-08-08 18:44:36'),(49,'Prof. Emelie Becker I','ned95@example.org','$2y$10$o3wBQFB2aYo3s08pWCMJxOzESwnwVi6Hj9lD4scAHQd7SrEWvmdeC','3fMHMaaJpF','2016-08-08 18:44:36','2016-08-08 18:44:36'),(50,'Miss Kiara Feil','tmertz@example.net','$2y$10$KnchrHFQETCoBpjcu9wFJOB/OEB3OAlVwQq3vDk3vWFdoQre4GEkW','561T1SwLtu','2016-08-08 18:44:36','2016-08-08 18:44:36');
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

-- Dump completed on 2016-08-08 10:44:55
