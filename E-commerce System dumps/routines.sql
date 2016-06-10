CREATE DATABASE  IF NOT EXISTS `smeet_kothari` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `krushant_bhansali`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: smeet_kothari
-- ------------------------------------------------------
-- Server version	5.5.41

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
-- Temporary table structure for view `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!50001 DROP VIEW IF EXISTS `order_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_details` (
  `order_number` tinyint NOT NULL,
  `cutomer_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `product_id` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_product_details`
--

DROP TABLE IF EXISTS `v_product_details`;
/*!50001 DROP VIEW IF EXISTS `v_product_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_product_details` (
  `product_id` tinyint NOT NULL,
  `product_name` tinyint NOT NULL,
  `product_description` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `category_description` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `weight` tinyint NOT NULL,
  `size` tinyint NOT NULL,
  `available_quantity` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `order_details`
--

/*!50001 DROP TABLE IF EXISTS `order_details`*/;
/*!50001 DROP VIEW IF EXISTS `order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_details` AS select `o`.`order_number` AS `order_number`,`o`.`customer_id` AS `cutomer_id`,`c`.`c_fname` AS `first_name`,`c`.`c_lname` AS `last_name`,`oi`.`product_id` AS `product_id`,`oi`.`quantity` AS `quantity`,`b`.`total_amount` AS `amount` from (((`order_t` `o` join `customer_t` `c` on((`c`.`customer_id` = `o`.`customer_id`))) join `order_table_t` `oi` on((`o`.`order_id` = `oi`.`order_id`))) join `billing` `b` on((`oi`.`order_id` = `b`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product_details`
--

/*!50001 DROP TABLE IF EXISTS `v_product_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_product_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product_details` AS select `p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`p`.`product_desp` AS `product_description`,`c`.`category_name` AS `category`,`c`.`category_descp` AS `category_description`,`p`.`unit_price` AS `price`,`p`.`unitweight` AS `weight`,`p`.`product_size` AS `size`,`pi`.`product_quantity` AS `available_quantity` from ((`product_t` `p` left join `category_t` `c` on((`p`.`category_id` = `c`.`category_id`))) left join `product_inventory` `pi` on((`p`.`product_id` = `pi`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'krushant_bhansali'
--

--
-- Dumping routines for database 'krushant_bhansali'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_insert_personInTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_personInTable`(ssn int(11), gender varchar(45), dob date, person_type varchar(45), c_fname varchar(45),c_lname varchar(45),
employee_doj date, company_name varchar(45),shipment_date date)
begin


SET @perosn_id = (Select max(person_id) from person_t) + 1;
insert into person_t 
values (@person_id, ssn, gender,dob,person_type);

SET @perosn_id = (Select max(person_id) from person_t);

if (person_type = "Customer")
then

insert into customer_t 
values (null,c_fname, c_lname, @person_id);

else if (person_type = "Employee")
then
insert into employee_t
values (null,@person_id,employee_doj, c_fname );

else if (person_type = "Supplier")
then
insert into supplier_t
values (null,company_name,@person_id);
end if;
end if;
end if;
end ;;
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

-- Dump completed on 2014-12-09 23:59:54
