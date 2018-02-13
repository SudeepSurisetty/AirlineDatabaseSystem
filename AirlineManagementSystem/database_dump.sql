CREATE DATABASE  IF NOT EXISTS `airlinedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `airlinedb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: airlinedb
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` int(10) unsigned NOT NULL,
  `Address1` varchar(45) NOT NULL,
  `Address2` varchar(45) DEFAULT NULL,
  `City` varchar(20) NOT NULL,
  `State` char(2) NOT NULL,
  `ZipCode` char(5) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'92739 Lotheville Lane','4','Washington','DC','20244'),(2,'7786 Duke Circle','35383','Atlanta','GA','31119'),(3,'042 6th Crossing','30843','Independence','MO','64054'),(4,'349 Loomis Way','948','Washington','DC','20016'),(5,'17821 Saint Paul Avenue','17','South Bend','IN','46620'),(6,'14646 Glendale Crossing','88','Pensacola','FL','32526'),(7,'962 Dayton Point','597','Santa Monica','CA','90405'),(8,'107 Victoria Park','7325','Macon','GA','31296'),(9,'35953 Northridge Way','91019','Topeka','KS','66629'),(10,'83 Randy Center','2','Valdosta','GA','31605'),(11,'32 Westend Center','96','Longview','TX','75605'),(12,'66534 Killdeer Lane','86','Charlotte','NC','28210'),(13,'74134 Loomis Trail','8','Paterson','NJ','7544'),(14,'5913 Talisman Pass','397','Pasadena','CA','91117'),(15,'40 7th Terrace','78914','Tucson','AZ','85705'),(16,'4106 Logan Hill','6','Naples','FL','34108'),(17,'58990 Eastlawn Junction','98','Corpus Christi','TX','78475'),(18,'062 3rd Alley','3','Alhambra','CA','91841'),(19,'2028 Forest Street','741','Honolulu','HI','96805'),(20,'503 Atwood Pass','4349','Bakersfield','CA','93399');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `AircraftId` int(10) unsigned NOT NULL,
  `Manufacturer` varchar(15) NOT NULL,
  `Model` varchar(15) NOT NULL,
  PRIMARY KEY (`AircraftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Airbus','A380'),(2,'Boeing','B777'),(3,'Cessna','Titer'),(4,'Embraer','195');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `IataCode` varchar(3) NOT NULL,
  `Country_CountryCode` char(2) NOT NULL,
  `AirportName` varchar(45) NOT NULL,
  PRIMARY KEY (`IataCode`),
  KEY `fk_Airport_Country1_idx` (`Country_CountryCode`),
  CONSTRAINT `fk_Country_CountryCode` FOREIGN KEY (`Country_CountryCode`) REFERENCES `country` (`CountryCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('ATL','US','Logan International Airport'),('BOS','US','Hartsfield-Jackson'),('CDG','UK','Roissy Airport'),('DFW','US','Dallas/Ft. Worth International'),('IAH','US','George Bush Intercontinental'),('JFK','US','John F. Kennedy International'),('LHR','UK','Heathrow Airport'),('ORD','US','Chicago O\'Hare International'),('RSW','US','Southwest Florida International');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classseat`
--

DROP TABLE IF EXISTS `classseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classseat` (
  `SeatClassId` int(10) unsigned NOT NULL,
  `Classname` varchar(15) NOT NULL,
  PRIMARY KEY (`SeatClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classseat`
--

LOCK TABLES `classseat` WRITE;
/*!40000 ALTER TABLE `classseat` DISABLE KEYS */;
INSERT INTO `classseat` VALUES (1,'Travel Class'),(2,'First Class'),(3,'Business Class'),(4,'Economy Class');
/*!40000 ALTER TABLE `classseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryCode` char(2) NOT NULL,
  `CountryName` varchar(45) NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CountryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AU','Australia','Australia is the only continent covered by a single country.'),('FR','France','France is the world\'s most popular tourist destination.'),('IN','India','India prides itself on being the world\'s largest democracy.'),('NZ','New Zealand','The maori word for New Zealand is Aotearoa which means \'Land of the Long White Cloud\'.'),('PH','Philippines','Philippines is the first Republic in Asia.'),('SE','Sweden','Sweden has 6 official languages'),('SG','Singapore','Singapore means Lion City in Sanskrit'),('UK','United Kingdom','Windsor Castle is the longest occupied castle in Europe'),('US','United States','Americans eat about 100 acres of pizza each day, with about 3 billion pizzas sold annually in the USA.');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Person_PersonId` int(10) unsigned NOT NULL,
  `Designation` enum('Engineer','Traffic Monitor','Support Staff') NOT NULL,
  `Salary` float DEFAULT NULL,
  `Hours_Week` int(11) NOT NULL,
  `Pay_Hour` int(11) NOT NULL,
  `WeeklySalary` int(11) DEFAULT NULL,
  PRIMARY KEY (`Person_PersonId`),
  KEY `fk_Employee_Person1_idx` (`Person_PersonId`),
  CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`Person_PersonId`) REFERENCES `person` (`PersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Engineer',131070,32,27,864),(2,'Engineer',87442,33,25,825),(3,'Support Staff',114761,35,20,700),(4,'Support Staff',60041,40,30,1200),(5,'Support Staff',116023,30,24,720),(6,'Support Staff',457834,35,25,875);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
set new.weeklysalary = new.hours_week * new.pay_hour;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW
BEGIN
set new.weeklysalary = new.hours_week * new.pay_hour;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `flight_status_modified`
--

DROP TABLE IF EXISTS `flight_status_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_status_modified` (
  `Modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Flightid` int(11) DEFAULT NULL,
  `RouteId` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `DeptTime` time DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_status_modified`
--

LOCK TABLES `flight_status_modified` WRITE;
/*!40000 ALTER TABLE `flight_status_modified` DISABLE KEYS */;
INSERT INTO `flight_status_modified` VALUES ('2017-12-13 21:27:15',367,7,4,'09:42:00','12:34:00');
/*!40000 ALTER TABLE `flight_status_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightpassenger`
--

DROP TABLE IF EXISTS `flightpassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightpassenger` (
  `Flights_FlightId` int(10) unsigned NOT NULL,
  `Passenger_Person_PersonId` int(10) unsigned NOT NULL,
  `Employee_Person_PersonId` int(10) unsigned NOT NULL,
  `Itinerary_ItineraryId` varchar(10) NOT NULL,
  `SeatNo` varchar(4) NOT NULL,
  PRIMARY KEY (`Flights_FlightId`,`Passenger_Person_PersonId`,`Employee_Person_PersonId`),
  KEY `fk_Flight Passenger_Employee1_idx` (`Employee_Person_PersonId`),
  KEY `fk_Flight Passenger_Itinerary1_idx` (`Itinerary_ItineraryId`),
  KEY `fk_Flight Passenger_Flights1_idx` (`Flights_FlightId`),
  KEY `fk_Flight Passenger_Passenger1` (`Passenger_Person_PersonId`),
  CONSTRAINT `fk_Flight Passenger_Employee1` FOREIGN KEY (`Employee_Person_PersonId`) REFERENCES `employee` (`Person_PersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight Passenger_Flights1` FOREIGN KEY (`Flights_FlightId`) REFERENCES `flights` (`FlightId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight Passenger_Itinerary` FOREIGN KEY (`Itinerary_ItineraryId`) REFERENCES `itinerary` (`ItineraryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight Passenger_Passenger1` FOREIGN KEY (`Passenger_Person_PersonId`) REFERENCES `passenger` (`Person_PersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightpassenger`
--

LOCK TABLES `flightpassenger` WRITE;
/*!40000 ALTER TABLE `flightpassenger` DISABLE KEYS */;
INSERT INTO `flightpassenger` VALUES (300,10,4,'BK24580','3E'),(307,16,3,'CF78099','5G'),(307,19,5,'CV28514','5F'),(308,2,3,'DR45927','5F'),(309,4,4,'DR45927','1B'),(314,3,5,'CF78099','2C'),(314,9,3,'YE23002','4E'),(314,15,4,'YH65424','1A'),(327,6,5,'YU20693','2C'),(327,19,4,'ZY87787','4D'),(330,18,3,'ZY87787','2B'),(337,5,5,'ZY87787','2C'),(337,10,4,'BK24580','4E'),(340,16,3,'CV28514','3D'),(350,14,5,'CF78099','2B'),(350,18,4,'DR45927','4D'),(355,10,3,'YE23002','3E'),(364,12,4,'YH65424','3E'),(367,2,5,'YU20693','2B'),(367,8,3,'ZY87787','1A');
/*!40000 ALTER TABLE `flightpassenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`flightpassenger_BEFORE_INSERT` BEFORE INSERT ON `flightpassenger` FOR EACH ROW
BEGIN

DECLARE IdRoute int;
DECLARE IdAircraft int;
DECLARE SeatNo varchar(4);
DECLARE avail boolean;

SET avail = 1;

SET SeatNo = NEW.SeatNo;

SET IdRoute =(SELECT flights.route_routeId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);


SET IdAircraft =(SELECT flights.aircraft_aircraftId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);

 
SET avail = is_seat_available(NEW.Flights_FlightId,IdRoute,IdAircraft,SeatNo);

if(avail = 0)
THEN
set NEW.SeatNo=SeatNo;
ELSE
set NEW.SeatNo='NULL';
END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`flightpassenger_BEFORE_UPDATE` BEFORE UPDATE ON `flightpassenger` FOR EACH ROW
BEGIN

DECLARE IdRoute int;
DECLARE IdAircraft int;
DECLARE SeatNo varchar(4);
DECLARE avail boolean;

SET avail = 1;

SET SeatNo = NEW.SeatNo;

SET IdRoute =(SELECT flights.route_routeId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);


SET IdAircraft =(SELECT flights.aircraft_aircraftId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);

 
SET avail = is_seat_available(NEW.Flights_FlightId,IdRoute,IdAircraft,SeatNo);

if(avail = 0)
THEN
set NEW.SeatNo=SeatNo;
ELSE
set NEW.SeatNo='NULL';
END IF;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `FlightId` int(10) unsigned NOT NULL,
  `Route_RouteId` int(10) unsigned NOT NULL,
  `Aircraft_AircraftId` int(10) unsigned NOT NULL,
  `FlightStatus_FlightStatusId` int(10) unsigned NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `Duration` time DEFAULT NULL,
  `BasePrice` float NOT NULL,
  PRIMARY KEY (`FlightId`,`Route_RouteId`,`Aircraft_AircraftId`),
  KEY `fk_Flights_FlightStatus1_idx` (`FlightStatus_FlightStatusId`),
  KEY `fk_Flights_Route1_idx` (`Route_RouteId`),
  KEY `fk_Flights_Aircraft1_idx` (`Aircraft_AircraftId`),
  CONSTRAINT `fk_Flights_Aircraft1` FOREIGN KEY (`Aircraft_AircraftId`) REFERENCES `aircraft` (`AircraftId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flights_FlightStatus1` FOREIGN KEY (`FlightStatus_FlightStatusId`) REFERENCES `flightstatus` (`FlightStatusId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flights_Route1` FOREIGN KEY (`Route_RouteId`) REFERENCES `route` (`RouteId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (300,6,4,1,'05:00:00','07:01:00','02:01:00',551),(307,7,4,1,'08:26:10','14:06:00','05:39:50',486),(308,1,4,1,'04:35:00','08:45:00','04:10:00',134),(309,3,2,3,'03:54:00','07:37:00','03:43:00',567),(314,4,4,1,'05:19:00','09:46:00','04:27:00',412),(316,9,2,3,'07:45:00','09:10:00','01:25:00',70),(327,2,3,2,'01:00:00','03:40:00','02:40:00',167),(330,7,4,3,'10:35:00','13:33:00','02:58:00',100),(334,7,1,1,'03:53:00','04:04:00','00:11:00',123),(337,9,1,3,'11:15:00','15:14:00','03:59:00',411),(340,9,1,3,'10:35:00','12:54:00','02:19:00',743),(343,9,4,2,'02:10:00','09:22:00','07:12:00',134),(349,8,1,2,'03:10:00','09:21:00','06:11:00',743),(350,6,3,3,'08:55:00','13:04:00','04:09:00',285),(355,8,4,4,'11:25:00','14:20:00','02:55:00',205),(358,5,3,2,'06:06:00','10:59:00','04:53:00',672),(360,9,2,1,'09:45:00','10:17:00','00:32:00',471),(361,4,3,1,'02:04:00','13:19:00','11:15:00',222),(364,2,1,3,'15:13:00','18:18:00','03:05:00',686),(367,7,4,4,'09:42:00','12:34:00','02:52:00',66);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`flights_BEFORE_UPDATE` BEFORE UPDATE ON `flights` FOR EACH ROW
BEGIN

IF(NEW.ArrivalTime = NEW.DepartureTime) || (NEW.ArrivalTime = OLD.DepartureTime) || (NEW.DepartureTime = OLD.ArrivalTime)
THEN
SET NEW.DepartureTime = OLD.DepartureTime;
SET NEW.ArrivalTime = OLD.ArrivalTime;
END IF;

IF((NEW.ArrivalTime <> OLD.ArrivalTime ) || (NEW.DepartureTime <> OLD.ArrivalTime))
THEN
IF (NEW.ArrivalTime < NEW.DepartureTime)
THEN

SET NEW.DepartureTime = OLD.DepartureTime;
SET NEW.ArrivalTime = OLD.ArrivalTime;

END IF;

SET NEW.Duration = timediff(NEW.arrivaltime,NEW.departuretime);

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`flights_STATUS_AFTER_UPDATE` AFTER UPDATE ON `flights` FOR EACH ROW
BEGIN

IF OLD.FlightStatus_FlightStatusId <> NEW.FlightStatus_FlightStatusId
THEN

INSERT INTO flight_status_modified VALUES(
		NOW(), NEW.FlightId,NEW.Route_RouteId,NEW.FlightStatus_FlightStatusId,NEW.DepartureTime,NEW.ArrivalTime
	);
    
END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `flights_to_or_from`
--

DROP TABLE IF EXISTS `flights_to_or_from`;
/*!50001 DROP VIEW IF EXISTS `flights_to_or_from`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `flights_to_or_from` AS SELECT 
 1 AS `FlightId`,
 1 AS `RouteId`,
 1 AS `OriginAirport`,
 1 AS `DestinationAirport`,
 1 AS `ArrivalTime`,
 1 AS `DepartureTime`,
 1 AS `Status`,
 1 AS `Manufacturer`,
 1 AS `Model`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `flightstatus`
--

DROP TABLE IF EXISTS `flightstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightstatus` (
  `FlightStatusId` int(10) unsigned NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`FlightStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightstatus`
--

LOCK TABLES `flightstatus` WRITE;
/*!40000 ALTER TABLE `flightstatus` DISABLE KEYS */;
INSERT INTO `flightstatus` VALUES (1,'Scheduled'),(2,'Cancelled'),(3,'Delayed'),(4,'Diverted');
/*!40000 ALTER TABLE `flightstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itinerary` (
  `ItineraryId` varchar(10) NOT NULL,
  `Price` float unsigned NOT NULL,
  PRIMARY KEY (`ItineraryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
INSERT INTO `itinerary` VALUES ('AD40277',289),('BK24580',422),('CF78099',779),('CV28514',225),('DR45927',364),('YE23002',957),('YH65424',410),('YU20693',133),('ZY87787',211);
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`itinerary_BEFORE_INSERT` BEFORE INSERT ON `itinerary` FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(50);

IF (NEW.Price < 50)
THEN 
SET NEW.Price = 50;
SET msg = 'Setting price to 50$ as it cant be less than that';
INSERT INTO Warning VALUES(NEW.ItineraryId,msg);

END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `airlinedb`.`itinerary_BEFORE_UPDATE` BEFORE UPDATE ON `itinerary` FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(50);

IF (NEW.Price < 50)
THEN 
SET NEW.Price = OLD.Price;
INSERT INTO Warning VALUES(NEW.ItineraryId,'Setting price to old price as it cant be less than that');

END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `Person_PersonId` int(10) unsigned NOT NULL,
  `NeedsAssistance` enum('Y','N') NOT NULL DEFAULT 'N',
  `PromoCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Person_PersonId`),
  CONSTRAINT `fk_Passenger_Person1` FOREIGN KEY (`Person_PersonId`) REFERENCES `person` (`PersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'N','A711OCl'),(2,'N','P266THa'),(3,'Y','W661IQv'),(4,'N','C203EXt'),(5,'N','I354LHi'),(6,'Y','Z649PSr'),(7,'Y','W076XJi'),(8,'N','S845GYe'),(9,'Y','Q895ACn'),(10,'N','Q089KZj'),(11,'Y','K354EMm'),(12,'Y','H973DEz'),(13,'Y','V778TOd'),(14,'N','S545GYe'),(15,'N','W873QYb'),(16,'N','D372RBl'),(17,'N','J126DSy'),(18,'N','P898SIa'),(19,'Y','U866FLb'),(20,'Y','T843MSs');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PersonId` int(10) unsigned NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` enum('M','F','O') NOT NULL,
  `PassportNum` varchar(10) NOT NULL,
  PRIMARY KEY (`PersonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Leopold','Ebbens','1960-06-06','M','JO319709'),(2,'Mile','Vondra','1970-02-23','M','RP359400'),(3,'Mac','Bartocci','1953-01-12','M','IW787403'),(4,'Byrann','Brougham','1992-08-03','M','SI260677'),(5,'Wilburt','Spillane','1983-11-30','M','FV107684'),(6,'Al','Heustice','1995-11-16','M','XK202148'),(7,'Wake','McCarrison','2004-09-25','M','BW966735'),(8,'Constantin','Bellow','2012-10-22','M','MW876174'),(9,'Corabel','Crinage','2012-09-06','F','XV057782'),(10,'Polly','McGinnis','2005-12-13','F','HK422002'),(11,'Genna','Goney','2013-02-07','F','RE282494'),(12,'Nicolai','Cruikshanks','1982-12-23','M','RY869839'),(13,'Kati','Golden','1984-07-09','F','SQ158637'),(14,'Maisey','McQuorkel','1962-01-22','F','YF644969'),(15,'Claudina','Maxweell','1934-04-19','F','ZV688937'),(16,'Rancell','Vala','2006-07-31','M','IR596692'),(17,'Rollins','Backson','1995-05-11','M','OE928327'),(18,'Konstantine','Binny','2007-06-27','M','BV785910'),(19,'Mahala','Barwise','1998-07-09','F','TN781892'),(20,'Crosby','Browett','2006-06-06','M','HT961355');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_has_address`
--

DROP TABLE IF EXISTS `person_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_has_address` (
  `Person_PersonId` int(10) unsigned NOT NULL,
  `Address_AddressID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Address_AddressID`,`Person_PersonId`),
  KEY `fk_Person_has_Address_Address1_idx` (`Address_AddressID`),
  KEY `fk_Person_has_Address_Person_idx` (`Person_PersonId`),
  CONSTRAINT `fk_Person_has_Address_Address1` FOREIGN KEY (`Address_AddressID`) REFERENCES `address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_has_Address_Person` FOREIGN KEY (`Person_PersonId`) REFERENCES `person` (`PersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_has_address`
--

LOCK TABLES `person_has_address` WRITE;
/*!40000 ALTER TABLE `person_has_address` DISABLE KEYS */;
INSERT INTO `person_has_address` VALUES (2,2),(11,3),(9,6),(8,9),(13,9),(14,10),(18,10),(16,11),(17,11),(6,13),(10,13),(15,13),(20,13),(5,14),(19,17),(4,18),(3,19),(7,19),(1,20),(12,20);
/*!40000 ALTER TABLE `person_has_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirement_table`
--

DROP TABLE IF EXISTS `retirement_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retirement_table` (
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `desingation` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirement_table`
--

LOCK TABLES `retirement_table` WRITE;
/*!40000 ALTER TABLE `retirement_table` DISABLE KEYS */;
INSERT INTO `retirement_table` VALUES ('Mac','Bartocci','1953-01-12',64,'Support Staff');
/*!40000 ALTER TABLE `retirement_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `revenue_thru_itinerary`
--

DROP TABLE IF EXISTS `revenue_thru_itinerary`;
/*!50001 DROP VIEW IF EXISTS `revenue_thru_itinerary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `revenue_thru_itinerary` AS SELECT 
 1 AS `ItineraryId`,
 1 AS `Count`,
 1 AS `Revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `RouteId` int(10) unsigned NOT NULL,
  `OriginAirport` varchar(3) NOT NULL,
  `DestinationAirport` varchar(3) NOT NULL,
  `Distance` int(11) NOT NULL,
  PRIMARY KEY (`RouteId`),
  KEY `fk_Origin_idx` (`OriginAirport`),
  KEY `fk_Destination_idx` (`DestinationAirport`),
  CONSTRAINT `fk_Destination` FOREIGN KEY (`DestinationAirport`) REFERENCES `airport` (`IataCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Origin` FOREIGN KEY (`OriginAirport`) REFERENCES `airport` (`IataCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'BOS','ATL',345),(2,'ATL','ORD',236),(3,'ORD','JFK',185),(4,'DFW','CDG',301),(5,'RSW','ORD',287),(6,'IAH','BOS',195),(7,'ATL','RSW',94),(8,'ORD','DFW',600),(9,'CDG','IAH',700);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatclassaircraft`
--

DROP TABLE IF EXISTS `seatclassaircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seatclassaircraft` (
  `Aircraft_AircraftId` int(10) unsigned NOT NULL,
  `SeatNum` varchar(4) NOT NULL,
  `ClassSeat_SeatClassId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Aircraft_AircraftId`,`SeatNum`),
  KEY `fk_SeatClassAircraft_ClassSeat1_idx` (`ClassSeat_SeatClassId`),
  KEY `fk_SeatClassAircraft_Aircraft1_idx` (`Aircraft_AircraftId`),
  CONSTRAINT `fk_SeatClassAircraft_Aircraft1` FOREIGN KEY (`Aircraft_AircraftId`) REFERENCES `aircraft` (`AircraftId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SeatClassAircraft_ClassSeat1` FOREIGN KEY (`ClassSeat_SeatClassId`) REFERENCES `classseat` (`SeatClassId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatclassaircraft`
--

LOCK TABLES `seatclassaircraft` WRITE;
/*!40000 ALTER TABLE `seatclassaircraft` DISABLE KEYS */;
INSERT INTO `seatclassaircraft` VALUES (1,'3D',1),(1,'3E',1),(2,'3D',1),(2,'3E',1),(3,'3D',1),(3,'3E',1),(4,'3D',1),(4,'3E',1),(1,'5F',2),(1,'5G',2),(2,'5F',2),(2,'5G',2),(3,'5F',2),(3,'5G',2),(4,'5F',2),(4,'5G',2),(1,'4D',3),(1,'4E',3),(2,'4D',3),(2,'4E',3),(3,'4D',3),(3,'4E',3),(4,'4D',3),(4,'4E',3),(1,'1A',4),(1,'1B',4),(1,'1C',4),(1,'2A',4),(1,'2B',4),(1,'2C',4),(2,'1A',4),(2,'1B',4),(2,'1C',4),(2,'2A',4),(2,'2B',4),(2,'2C',4),(3,'1A',4),(3,'1B',4),(3,'1C',4),(3,'2A',4),(3,'2B',4),(3,'2C',4),(4,'1A',4),(4,'1B',4),(4,'1C',4),(4,'2A',4),(4,'2B',4),(4,'2C',4);
/*!40000 ALTER TABLE `seatclassaircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warning`
--

DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning` (
  `Itinerary` varchar(25) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
INSERT INTO `warning` VALUES ('CF78099','Setting price to 50$ as it cant be less than that'),('CF78099','Setting price to 50$ as it cant be less than that'),('CF78099','Setting price to 50$ as it cant be less than that'),('BK24580','Setting price to 50$ as it cant be less than that'),('BK24580','Setting price to old price as it cant be less than that');
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'airlinedb'
--

--
-- Dumping routines for database 'airlinedb'
--
/*!50003 DROP FUNCTION IF EXISTS `flight_duration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `flight_duration`(idFlight int) RETURNS time
BEGIN
	DECLARE duration time;
    
    
    Set duration = (select timediff(arrivaltime,departuretime) as Duration from flights
    where flights.FlightId = idFlight );
    
    
return duration;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_seat_available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_seat_available`(IdFlight int, IdRoute int, IdAircraft int, seat varchar(4)) RETURNS tinyint(1)
BEGIN

DECLARE var varchar(10);
DECLARE valid boolean;

SET var = '';

SET var = (SELECT flightpassenger.Passenger_Person_PersonId FROM flights
INNER JOIN FlightPassenger
ON FlightId = flightpassenger.Flights_FlightId
WHERE (FlightId=IdFlight AND flights.Route_RouteId=IdRoute AND flights.Aircraft_AircraftId = IdAircraft AND flightpassenger.SeatNo = seat)
);

IF (var != '')
THEN
SET valid = 1;

ELSE
SET valid = 0;
END IF;

return valid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `catg_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `catg_revenue`()
BEGIN
Select ItineraryId,Count,Revenue from revenue_thru_itinerary
order by Revenue ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dest_facts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dest_facts`(IN id int)
BEGIN

SELECT FlightId,route.DestinationAirport,airport.AirportName,country.CountryName,country.Description from Flights
INNER JOIN route
ON RouteId=flights.Route_RouteId
INNER JOIN airport
ON route.DestinationAirport = airport.IataCode
LEFT JOIN country
on airport.Country_CountryCode = country.CountryCode
where flights.FlightId = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rating`(IN id int)
BEGIN

DECLARE ratng int;
CASE
WHEN (select bookings_made.BookingsMade from bookings_made where ID=id) >21 THEN SET ratng = 5;
WHEN (select bookings_made.BookingsMade from bookings_made where ID=id) >14 THEN SET ratng = 4;
WHEN (select bookings_made.BookingsMade from bookings_made where ID=id) >7 THEN SET ratng = 3;
ELSE  SET ratng = 1;

END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `flights_to_or_from`
--

/*!50001 DROP VIEW IF EXISTS `flights_to_or_from`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flights_to_or_from` AS select `flights`.`FlightId` AS `FlightId`,`route`.`RouteId` AS `RouteId`,`route`.`OriginAirport` AS `OriginAirport`,`route`.`DestinationAirport` AS `DestinationAirport`,`flights`.`ArrivalTime` AS `ArrivalTime`,`flights`.`DepartureTime` AS `DepartureTime`,`flightstatus`.`Status` AS `Status`,`ar`.`Manufacturer` AS `Manufacturer`,`ar`.`Model` AS `Model` from ((((`flights` join `route` on((`flights`.`Route_RouteId` = `route`.`RouteId`))) join `flightstatus` on((`flights`.`FlightStatus_FlightStatusId` = `flightstatus`.`FlightStatusId`))) join `aircraft` `ar` on((`flights`.`Aircraft_AircraftId` = `ar`.`AircraftId`))) join `airport` `a` on(((`route`.`OriginAirport` = `a`.`IataCode`) and ((`route`.`DestinationAirport` = `a`.`IataCode`) is not null)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenue_thru_itinerary`
--

/*!50001 DROP VIEW IF EXISTS `revenue_thru_itinerary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenue_thru_itinerary` AS select `i`.`ItineraryId` AS `ItineraryId`,count(`i`.`ItineraryId`) AS `Count`,sum(`i`.`Price`) AS `Revenue` from (`flightpassenger` `fp` join `itinerary` `i` on((`fp`.`Itinerary_ItineraryId` = `i`.`ItineraryId`))) group by `i`.`ItineraryId` with rollup */;
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

-- Dump completed on 2017-12-14  1:22:07
