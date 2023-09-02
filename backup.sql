-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `cinedumas_programme`
--

DROP TABLE IF EXISTS `cinedumas_programme`;
/*!50001 DROP VIEW IF EXISTS `cinedumas_programme`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cinedumas_programme` AS SELECT 
 1 AS `salle_name`,
 1 AS `projection_date`,
 1 AS `projection_time`,
 1 AS `movie_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(180) NOT NULL,
  `manager` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager` (`manager`),
  CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'CinéDumas','2 rue Magellan, 13000 AIX EN PROVENCE',2),(2,'Lumières !','40 avenue Hubert, 33000 BORDEAUX',3),(3,'Mozart Cinema','15 rue Claude Nicolas Ledoux, 94000 CRETEIL',4);
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `commandes_details`
--

DROP TABLE IF EXISTS `commandes_details`;
/*!50001 DROP VIEW IF EXISTS `commandes_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `commandes_details` AS SELECT 
 1 AS `nom_client`,
 1 AS `prenom_client`,
 1 AS `email_client`,
 1 AS `tarifs`,
 1 AS `price`,
 1 AS `paiement_en_ligne`,
 1 AS `projection_date`,
 1 AS `projection_time`,
 1 AS `movie_title`,
 1 AS `cinema`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lumieres_programme`
--

DROP TABLE IF EXISTS `lumieres_programme`;
/*!50001 DROP VIEW IF EXISTS `lumieres_programme`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lumieres_programme` AS SELECT 
 1 AS `salle_name`,
 1 AS `projection_date`,
 1 AS `projection_time`,
 1 AS `movie_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext DEFAULT NULL,
  `blockbuster` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Barbie','Barbie, qui vit à Barbie Land, est expulsée du pays pour être loin dêtre une poupée à lapparence parfaite; n\'ayant nulle part où aller, elle part pour le monde humain et cherche le vrai bonheur.',1),(2,'Incendie','Lorsque le notaire Lebel fait à Jeanne et Simon Marwan la lecture du testament de leur mère Nawal, les jumeaux sont sidérés de se voir remettre deux enveloppes, l\'une destinée à un père qu\'ils croyaient mort et l\'autre à un frère dont ils ignoraient l\'existence. Jeanne voit dans cet énigmatique legs la clé du silence de Nawal, enfermée ces dernières années dans un mutisme obstiné depuis son lit d\'hôpital. Elle part au Moyen-Orient exhumer le passé de cette famille dont elle ne sait presque rien.',0),(3,'Oppenheimer','Pendant la Seconde Guerre mondiale, le lieutenant-général Leslie Groves Jr. nomme le physicien J. Robert Oppenheimer pour travailler sur le projet ultra-secret Manhattan. Oppenheimer et une équipe de scientifiques passent des années à développer et à concevoir la bombe atomique. Leur travail se concrétise le 16 juillet 1945, alors qu\'ils assistent à la première explosion nucléaire au monde, changeant à jamais le cours de l\'histoire.',1),(4,'Dragons','Hiccup est un adolescent viking de l\'île de Berk, où se battre avec des dragons est un mode de vie. Ses idées progressistes et son sens de l\'humour étrange le tiennent à part des autres, malgré le fait que son père est le chef du clan. Entraîné dans une école de combat de dragon, il essaie de prouvr qu\'il est un vrai viking. Mais quand il se lie d\'amitier avec un dragon blessé qu\'il nomme Kromou, il a la chance de tracer une nouvelle voie pour l\'avenir de son peuple.',0),(5,'WANTED','Ayant appris que son père, tué la veille, était un assassin d\'élite faisant partie d\'une organisation millénaire appelée la Fraternité, un modeste employé de bureau accepte de se joindre à ce groupe et de se soumettre à un entraînement exigeant au terme duquel il se découvre une habileté insoupçonnée. Se sentant fin prêt, il part pour l\'Europe, berceau de la Fraternité, afin d\'affronter l\'assassin de son père, qui fait lui aussi partie de l\'organisation.',0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mozart_programme`
--

DROP TABLE IF EXISTS `mozart_programme`;
/*!50001 DROP VIEW IF EXISTS `mozart_programme`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mozart_programme` AS SELECT 
 1 AS `salle_name`,
 1 AS `projection_date`,
 1 AS `projection_time`,
 1 AS `movie_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `projection_by_cinema`
--

DROP TABLE IF EXISTS `projection_by_cinema`;
/*!50001 DROP VIEW IF EXISTS `projection_by_cinema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projection_by_cinema` AS SELECT 
 1 AS `cinema_name`,
 1 AS `projection_date`,
 1 AS `projection_time`,
 1 AS `movie_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projections`
--

DROP TABLE IF EXISTS `projections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `movie` int(11) NOT NULL,
  `salle` int(11) NOT NULL,
  `reservedSeats` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `movie` (`movie`),
  KEY `salle` (`salle`),
  CONSTRAINT `projections_ibfk_1` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`),
  CONSTRAINT `projections_ibfk_2` FOREIGN KEY (`salle`) REFERENCES `salles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projections`
--

LOCK TABLES `projections` WRITE;
/*!40000 ALTER TABLE `projections` DISABLE KEYS */;
INSERT INTO `projections` VALUES (1,'2023-08-05','18:30:00',1,5,1180),(2,'2023-08-05','18:30:00',1,9,3495),(3,'2023-08-05','18:30:00',1,12,1500),(4,'2023-08-05','21:00:00',1,5,100),(5,'2023-08-05','21:00:00',1,9,3000),(6,'2023-08-05','21:00:00',1,12,2000),(7,'2023-08-05','19:30:00',2,1,80),(8,'2023-08-05','21:30:00',4,2,470),(9,'2023-08-05','17:30:00',5,3,40),(10,'2023-08-05','18:30:00',4,4,1180),(11,'2023-08-05','16:00:00',5,6,800),(12,'2023-08-05','18:30:00',2,7,300),(13,'2023-08-05','15:00:00',5,8,60),(14,'2023-08-05','18:17:00',4,10,1551),(15,'2023-08-05','18:00:00',2,11,390),(16,'2023-08-05','18:30:00',5,13,385),(17,'2023-08-05','20:30:00',4,14,452),(18,'2023-08-05','15:30:00',3,5,1180),(19,'2023-08-05','15:30:00',3,9,3500),(20,'2023-08-05','15:30:00',3,12,1604),(21,'2023-08-05','23:15:00',3,5,100),(22,'2023-08-05','23:15:00',3,9,3000),(23,'2023-08-05','23:15:00',3,12,1890);
/*!40000 ALTER TABLE `projections` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_reserved_seats
AFTER UPDATE ON projections
FOR EACH ROW
BEGIN
    DECLARE salle_seats INT;
    DECLARE reserved_seats INT;
    
    -- Get the number of seats in the associated salle
    SELECT seats INTO salle_seats FROM salles WHERE id = NEW.salle;
    
    -- Get the total number of reserved seats for the salle 
    SELECT reservedSeats INTO reserved_seats FROM projections WHERE id = NEW.id;
    
    -- Check if the new total reserved seats exceed the salle seats
    IF reserved_seats > salle_seats THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible : Le nombre de places réservées excède le nombre de sièges existants dans la salle choisie';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Manager'),(3,'Employee'),(4,'Customer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `seats` int(11) NOT NULL,
  `cinema` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema` (`cinema`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`cinema`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,'1',100,1),(2,'2',500,1),(3,'3',60,1),(4,'4',1200,1),(5,'5',1200,1),(6,'6',800,1),(7,'Babar',400,2),(8,'Pikachu',100,2),(9,'SOS Fantome',3500,2),(10,'Avatar',1600,2),(11,'ComedyClub',400,2),(12,'10',2000,3),(13,'11',500,3),(14,'12',500,3),(15,'20',800,3),(16,'21',400,3),(17,'22',200,3),(18,'30',230,3),(19,'31',230,3);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(4,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,'Plein',9.2),(2,'Etudiant',7.6),(3,'-14',5.9);
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) NOT NULL,
  `projection` int(11) NOT NULL,
  `tarifs` int(11) NOT NULL,
  `onlinePaiement` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  KEY `projection` (`projection`),
  KEY `tarifs` (`tarifs`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`projection`) REFERENCES `projections` (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`tarifs`) REFERENCES `tarifs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,5,1,1,0),(2,5,1,1,0),(3,5,1,3,0),(4,6,8,2,1),(5,7,15,1,1),(6,7,2,1,1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_reserved_seats AFTER INSERT ON tickets
FOR EACH ROW
BEGIN
    UPDATE projections
    SET reservedSeats = reservedSeats + 1
    WHERE id = NEW.projection;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_by_roles`
--

DROP TABLE IF EXISTS `user_by_roles`;
/*!50001 DROP VIEW IF EXISTS `user_by_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_by_roles` AS SELECT 
 1 AS `user_id`,
 1 AS `surname`,
 1 AS `name`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (1,1),(1,2),(1,3),(1,4),(2,2),(3,2),(4,2),(5,3),(5,4),(6,4),(7,4);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cinema_DB','Admin','cinema_db@test.fr'),(2,'CineDumas','Manager','cinedumas@test.fr'),(3,'Lumieres','Manager','lumieres@test.fr'),(4,'Mozart','Manager','mozart@test.fr'),(5,'CEZAIRE','Virginie','c.virginie@test.fr'),(6,'Carambar','Haribo','haribo@test.fr'),(7,'Dragibus','Gus','gus@test.fr'),(8,'Cinema_DB','Admin','cinema_db@test.fr'),(9,'CineDumas','Manager','cinedumas@test.fr'),(10,'Lumieres','Manager','lumieres@test.fr'),(11,'Mozart','Manager','mozart@test.fr');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cinedumas_programme`
--

/*!50001 DROP VIEW IF EXISTS `cinedumas_programme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cinedumas_programme` AS select `s`.`name` AS `salle_name`,`p`.`date` AS `projection_date`,`p`.`time` AS `projection_time`,`m`.`title` AS `movie_title` from (((`cinemas` `c` join `salles` `s` on(`c`.`id` = `s`.`cinema`)) join `projections` `p` on(`s`.`id` = `p`.`salle`)) join `movies` `m` on(`p`.`movie` = `m`.`id`)) where `c`.`id` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `commandes_details`
--

/*!50001 DROP VIEW IF EXISTS `commandes_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `commandes_details` AS select `u`.`surname` AS `nom_client`,`u`.`name` AS `prenom_client`,`u`.`email` AS `email_client`,`t`.`name` AS `tarifs`,`t`.`price` AS `price`,`b`.`onlinePaiement` AS `paiement_en_ligne`,`p`.`date` AS `projection_date`,`p`.`time` AS `projection_time`,`m`.`title` AS `movie_title`,`c`.`name` AS `cinema` from ((((((`tickets` `b` join `users` `u` on(`b`.`customer` = `u`.`id`)) join `tarifs` `t` on(`b`.`tarifs` = `t`.`id`)) join `projections` `p` on(`b`.`projection` = `p`.`id`)) join `movies` `m` on(`p`.`movie` = `m`.`id`)) join `salles` `s` on(`p`.`salle` = `s`.`id`)) join `cinemas` `c` on(`s`.`cinema` = `c`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lumieres_programme`
--

/*!50001 DROP VIEW IF EXISTS `lumieres_programme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lumieres_programme` AS select `s`.`name` AS `salle_name`,`p`.`date` AS `projection_date`,`p`.`time` AS `projection_time`,`m`.`title` AS `movie_title` from (((`cinemas` `c` join `salles` `s` on(`c`.`id` = `s`.`cinema`)) join `projections` `p` on(`s`.`id` = `p`.`salle`)) join `movies` `m` on(`p`.`movie` = `m`.`id`)) where `c`.`id` = 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mozart_programme`
--

/*!50001 DROP VIEW IF EXISTS `mozart_programme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mozart_programme` AS select `s`.`name` AS `salle_name`,`p`.`date` AS `projection_date`,`p`.`time` AS `projection_time`,`m`.`title` AS `movie_title` from (((`cinemas` `c` join `salles` `s` on(`c`.`id` = `s`.`cinema`)) join `projections` `p` on(`s`.`id` = `p`.`salle`)) join `movies` `m` on(`p`.`movie` = `m`.`id`)) where `c`.`id` = 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projection_by_cinema`
--

/*!50001 DROP VIEW IF EXISTS `projection_by_cinema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projection_by_cinema` AS select `c`.`name` AS `cinema_name`,`p`.`date` AS `projection_date`,`p`.`time` AS `projection_time`,`m`.`title` AS `movie_title` from (((`cinemas` `c` join `salles` `s` on(`c`.`id` = `s`.`cinema`)) join `projections` `p` on(`s`.`id` = `p`.`salle`)) join `movies` `m` on(`p`.`movie` = `m`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_by_roles`
--

/*!50001 DROP VIEW IF EXISTS `user_by_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_by_roles` AS select `u`.`id` AS `user_id`,`u`.`surname` AS `surname`,`u`.`name` AS `name`,`r`.`name` AS `role` from ((`users` `u` join `userroles` `ur` on(`u`.`id` = `ur`.`user_id`)) join `roles` `r` on(`ur`.`role_id` = `r`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-02 15:11:53
