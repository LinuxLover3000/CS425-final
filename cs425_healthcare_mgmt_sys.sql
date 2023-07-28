-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: cs425_healthcare_mgmt_sys
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `amount` float NOT NULL,
  `issue_date` date NOT NULL,
  `MRN` int NOT NULL,
  `due_date` date GENERATED ALWAYS AS ((`issue_date` + interval 6 month)) VIRTUAL,
  PRIMARY KEY (`MRN`,`amount`,`issue_date`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`MRN`) REFERENCES `patient` (`MRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` (`amount`, `issue_date`, `MRN`) VALUES (4246.04,'2021-02-12',1483081),(1022.64,'2021-03-30',1483098),(4796.51,'2020-10-14',1483196),(6739.96,'2020-08-13',1483348),(2699.14,'2021-11-14',1483354),(9302.01,'2020-12-16',1484420),(1095.73,'2020-09-28',1484551),(6247.51,'2021-03-04',1484716),(6215.06,'2021-04-29',1484821),(8462.27,'2022-01-13',1485031),(2842.86,'2021-07-15',1485560),(6746.25,'2021-09-24',1486056),(5433.85,'2022-06-07',1486308),(3725.94,'2021-03-13',1486440),(2701.33,'2022-05-28',1486630),(1027.79,'2022-04-29',1487226),(9352.78,'2021-03-29',1487261),(9072.58,'2021-06-23',1487334),(9047.17,'2021-09-12',1487362),(9724.84,'2021-04-23',1487384),(8556.21,'2022-02-19',1487426),(8865.46,'2022-06-06',1487560),(7265.93,'2021-02-16',1488088),(6652.74,'2021-12-12',1488270),(3018.1,'2021-08-31',1488785);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `EID` int NOT NULL,
  `name_first` varchar(255) DEFAULT NULL,
  `name_last` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (113,'Xavier','Zamora','GP',104891),(114,'Nyssa','Irwin','Radiologist',73792.6),(115,'Aquila','Roberts','Neurologist',105624),(116,'Duncan','Silva','Neurologist',87390.3),(117,'Alma','Cole','GP',92696.2),(118,'Linda','Mercer','GP',67845.1),(119,'Claudia','Barry','Psychologist',119660),(120,'Melyssa','Pierce','GP',65017.8),(121,'Harriet','Reynolds','Radiologist',60044),(122,'Iona','Hull','Radiologist',77678.7),(123,'Hyatt','Burnett','Surgeon',64561.4),(124,'Nola','Carson','Psychologist',71114.1),(125,'Ursula','Mendoza','Surgeon',41066.6),(126,'Jameson','Cortez','Surgeon',41067.6),(127,'Uta','Nolan','Surgeon',41068.6),(128,'Raymond','Fitzgerald','Surgeon',41069.6),(129,'Iola','Arnold','Urologist ',41070.6),(130,'Sawyer','Edwards','Urologist ',41071.6),(131,'Edward','Castillo','Urologist ',41072.6),(132,'Illana','Graham','Urologist ',41073.6),(133,'Preston','Kline','Urologist ',41074.6),(134,'Ignatius','Owens','Urologist ',41075.6),(135,'Charles','Gallagher','Urologist ',41076.6),(136,'Brenden','Schultz','Neurologist',41077.6),(137,'Phoebe','Gibbs','Neurologist',41078.6),(138,'Rigel','Madden','Neurologist',41079.6),(139,'Germane','Spears','Neurologist',41080.6),(140,'Fritz','Jackson','Neurologist',41081.6),(141,'Kermit','Dawson','Nephrologist',41082.6),(142,'Kenyon','Key','Nephrologist',41083.6),(143,'Carter','Cash','Nephrologist',41084.6),(144,'Alfonso','Wolfe','Nephrologist',41085.6);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EID` int NOT NULL,
  `name_first` varchar(255) DEFAULT NULL,
  `name_last` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Sean','Knowles',84629.9),(101,'Fredericka','Molina',117837),(102,'Wayne','Dennis',103298),(103,'Bianca','Ewing',78289.4),(104,'Tamekah','Langley',77941.5),(105,'Vielka','Pitts',106624),(106,'Mari','Rodriquez',71943.4),(107,'Duncan','Velez',70806.8),(108,'Alice','Ford',61396.6),(109,'Garrett','Davidson',71994.6),(110,'Dominic','Shaffer',63234.6),(111,'Clark','Snider',80621.4),(112,'Galvin','Collins',64701.1),(113,'Xavier','Zamora',104891),(114,'Nyssa','Irwin',73792.6),(115,'Aquila','Roberts',105624),(116,'Duncan','Silva',87390.3),(117,'Alma','Cole',92696.2),(118,'Linda','Mercer',67845.1),(119,'Claudia','Barry',119660),(120,'Melyssa','Pierce',65017.8),(121,'Harriet','Reynolds',60044),(122,'Iona','Hull',77678.7),(123,'Hyatt','Burnett',64561.4),(124,'Nola','Carson',71114.1),(125,'Ursula','Mendoza',41066.6),(126,'Jameson','Cortez',41067.6),(127,'Uta','Nolan',41068.6),(128,'Raymond','Fitzgerald',41069.6),(129,'Iola','Arnold',41070.6),(130,'Sawyer','Edwards',41071.6),(131,'Edward','Castillo',41072.6),(132,'Illana','Graham',41073.6),(133,'Preston','Kline',41074.6),(134,'Ignatius','Owens',41075.6),(135,'Charles','Gallagher',41076.6),(136,'Brenden','Schultz',41077.6),(137,'Phoebe','Gibbs',41078.6),(138,'Rigel','Madden',41079.6),(139,'Germane','Spears',41080.6),(140,'Fritz','Jackson',41081.6),(141,'Kermit','Dawson',41082.6),(142,'Kenyon','Key',41083.6),(143,'Carter','Cash',41084.6),(144,'Alfonso','Wolfe',41085.6),(145,'John','Doe',50000),(146,'Jane','Smith',48000),(147,'Michael','Johnson',52000),(148,'Emily','Williams',46000),(149,'William','Brown',51000),(150,'Olivia','Jones',48000),(151,'James','Davis',49000),(152,'Sophia','Miller',50000),(153,'Benjamin','Wilson',47000),(154,'Ava','Taylor',48000),(155,'Laura','Wilson',52000),(156,'Jessica','Anderson',49000),(157,'David','Martinez',51000),(158,'Andrew','Taylor',48000),(159,'Samantha','Hernandez',47000),(160,'Aiden','Moore',48000),(161,'Grace','Gonzalez',50000),(162,'Lucas','Parker',48000),(163,'Chloe','Edwards',47000),(164,'Ethan','Collins',48000),(165,'Sophie','Rodriguez',49000),(166,'Michael','Lee',50000),(167,'Emma','Morales',52000),(168,'Daniel','Lopez',49000),(169,'Olivia','Hill',48000),(170,'Elijah','Scott',47000),(171,'Mia','Green',48000),(172,'Alexander','Adams',50000),(173,'Avery','Baker',48000),(174,'Logan','Gonzalez',47000),(175,'Isabella','Hall',48000),(176,'Lucas','Evans',49000),(177,'Aria','Rivera',48000),(178,'Jack','Richardson',47000),(179,'Amelia','Gray',48000),(180,'Benjamin','Reed',50000),(181,'Luna','Turner',48000),(182,'William','Cook',47000),(183,'Layla','Murphy',48000),(184,'Ethan','Rossi',49000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_phone`
--

DROP TABLE IF EXISTS `employee_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_phone` (
  `EID` int NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`EID`,`phone`),
  CONSTRAINT `employee_phone_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_phone`
--

LOCK TABLES `employee_phone` WRITE;
/*!40000 ALTER TABLE `employee_phone` DISABLE KEYS */;
INSERT INTO `employee_phone` VALUES (100,4577485543),(101,6736627217),(102,3756600363),(103,2246879052),(104,4216488981),(105,3633450952),(106,3684503638),(107,1759272582),(108,6654162716),(109,4414215934),(110,8416144954),(111,2424829352),(112,9878772188),(113,2187311871),(113,2187311882),(114,2584614842),(115,4396453648),(116,3556518358),(117,6256682269),(118,5613781566),(119,4211185820),(120,8638546931),(121,5001649332),(122,6326588710),(123,8798728333),(124,4215343732),(125,5551111001),(126,5552222002),(127,5553333003),(128,5554444004),(129,5555555005),(130,5556666006),(131,5557777007),(132,5558888008),(133,5559999009),(134,5551234567),(135,5559876543),(136,5554567890),(137,5556789012),(138,5553456789),(139,5557890123),(140,5555678901),(141,5558901234),(142,5552345678),(143,5550123456),(144,5553456789),(145,5551111000),(146,5552222001),(147,5553333002),(148,5554444003),(149,5555555004),(150,5556666005),(151,5557777006),(152,5558888007),(153,5559999008),(154,5551234560),(155,5551111555),(156,5552222666),(157,5553333777),(158,5554444888),(159,5555555999),(160,5556666101),(161,5557777212),(162,5558888323),(163,5559999434),(164,5551234545),(165,5559876656),(166,5554567767),(167,5556788878),(168,5553459989),(169,5557890099),(170,5555670100),(171,5558901211),(172,5552342322),(173,5550123433),(174,5553454544),(175,5551115655),(176,5552226766),(177,5553337877),(178,5554448988),(179,5555559999),(180,5556660101),(181,5557771212),(182,5558882323),(183,5559993434),(184,5551234545);
/*!40000 ALTER TABLE `employee_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `EID` int NOT NULL,
  `name_first` varchar(255) DEFAULT NULL,
  `name_last` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `NCSBN` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (100,'Sean','Knowles',84629.9,21634515,'Surgical'),(101,'Fredericka','Molina',117837,21635651,'RN'),(102,'Wayne','Dennis',103298,21633802,'Oncology'),(103,'Bianca','Ewing',78289.4,21634154,'NP'),(104,'Tamekah','Langley',77941.5,21634701,'NICU'),(105,'Vielka','Pitts',106624,21635652,'NP'),(106,'Mari','Rodriquez',71943.4,21635080,'NICU'),(107,'Duncan','Velez',70806.8,21634267,'Anesthetist'),(108,'Alice','Ford',61396.6,21633955,'NP'),(109,'Garrett','Davidson',71994.6,21633469,'Oncology'),(110,'Dominic','Shaffer',63234.6,21635780,'Surgical'),(111,'Clark','Snider',80621.4,21633980,'Anesthetist'),(112,'Galvin','Collins',64701.1,21634946,'NICU'),(145,'John','Doe',50000,12345,'Surgical'),(146,'Jane','Smith',48000,23456,'RN'),(147,'Michael','Johnson',52000,34567,'Oncology'),(148,'Emily','Williams',46000,45678,'NP'),(149,'William','Brown',51000,56789,'NICU'),(150,'Olivia','Jones',48000,67890,'NP'),(151,'James','Davis',49000,78901,'NICU'),(152,'Sophia','Miller',50000,89012,'Anesthetist'),(153,'Benjamin','Wilson',47000,90123,'NP'),(154,'Ava','Taylor',48000,91234,'Oncology'),(155,'Laura','Wilson',52000,78901,'Surgical'),(156,'Jessica','Anderson',49000,89012,'RN'),(157,'David','Martinez',51000,90123,'Oncology'),(158,'Andrew','Taylor',48000,91234,'NP'),(159,'Samantha','Hernandez',47000,92345,'NICU'),(160,'Aiden','Moore',48000,93456,'NP'),(161,'Grace','Gonzalez',50000,94567,'NICU'),(162,'Lucas','Parker',48000,95678,'Anesthetist'),(163,'Chloe','Edwards',47000,96789,'NP'),(164,'Ethan','Collins',48000,97890,'Oncology'),(165,'Sophie','Rodriguez',49000,98901,'RN'),(166,'Michael','Lee',50000,99012,'Surgical'),(167,'Emma','Morales',52000,99123,'NP'),(168,'Daniel','Lopez',49000,99234,'NICU'),(169,'Olivia','Hill',48000,99345,'NP'),(170,'Elijah','Scott',47000,99456,'NICU'),(171,'Mia','Green',48000,99567,'Oncology'),(172,'Alexander','Adams',50000,99678,'Anesthetist'),(173,'Avery','Baker',48000,99789,'NP'),(174,'Logan','Gonzalez',47000,99890,'Surgical'),(175,'Isabella','Hall',48000,99901,'NP'),(176,'Lucas','Evans',49000,91234,'Oncology'),(177,'Aria','Rivera',48000,92345,'NP'),(178,'Jack','Richardson',47000,93456,'NICU'),(179,'Amelia','Gray',48000,94567,'NP'),(180,'Benjamin','Reed',50000,95678,'Surgical'),(181,'Luna','Turner',48000,96789,'NP'),(182,'William','Cook',47000,97890,'Surgical'),(183,'Layla','Murphy',48000,98901,'NICU'),(184,'Ethan','Rossi',49000,99012,'NP');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `MRN` int NOT NULL,
  `name_first` varchar(255) DEFAULT NULL,
  `name_last` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `EID` int DEFAULT NULL,
  PRIMARY KEY (`MRN`),
  KEY `EID` (`EID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `doctor` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1483081,'Jesse','Burns','1985-08-01',115),(1483098,'Victoria','Grant','1989-07-13',113),(1483196,'Aurelia','Lancaster','1989-09-14',114),(1483348,'Miriam','Gibson','1978-10-13',116),(1483354,'Hilel','Adams','1978-02-17',113),(1484420,'Belle','Maxwell','1977-06-18',123),(1484551,'Brennan','Keith','1979-09-28',113),(1484716,'Honorato','Cantrell','1993-04-22',117),(1484821,'Quail','Murray','2000-07-17',118),(1485031,'Lavinia','Pitts','1993-06-24',120),(1485560,'Odessa','Valencia','1999-09-28',122),(1486056,'Ruth','Parrish','2000-02-11',122),(1486308,'Kato','Reilly','1991-11-21',116),(1486440,'Nina','Gaines','1998-07-25',124),(1486630,'Venus','Dennis','1984-06-13',119),(1487226,'Sara','Hooper','1993-10-22',115),(1487261,'Hasad','Hardy','1991-05-13',124),(1487334,'Laith','Guy','1997-10-13',123),(1487362,'Ann','Craig','2001-12-02',120),(1487384,'Carlos','Vaughn','1992-06-17',114),(1487426,'Julie','Bean','1977-01-16',119),(1487560,'Kane','Mccullough','1988-05-23',121),(1488088,'Harrison','Wilkins','2000-01-07',118),(1488270,'Nigel','Marshall','1996-08-18',117),(1488785,'Benedict','Gillespie','1992-06-03',121);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_info`
--

DROP TABLE IF EXISTS `patient_info`;
/*!50001 DROP VIEW IF EXISTS `patient_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_info` AS SELECT 
 1 AS `MRN`,
 1 AS `name_first`,
 1 AS `name_last`,
 1 AS `DOB`,
 1 AS `EID`,
 1 AS `age`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_phone`
--

DROP TABLE IF EXISTS `patient_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_phone` (
  `MRN` int NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`MRN`,`phone`),
  CONSTRAINT `patient_phone_ibfk_1` FOREIGN KEY (`MRN`) REFERENCES `patient` (`MRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_phone`
--

LOCK TABLES `patient_phone` WRITE;
/*!40000 ALTER TABLE `patient_phone` DISABLE KEYS */;
INSERT INTO `patient_phone` VALUES (1483081,8215081783),(1483098,7385585882),(1483196,4316781812),(1483348,3732675751),(1483354,9846861117),(1484420,2242520519),(1484551,2522896089),(1484716,9865687828),(1484821,3314738808),(1485031,7685931328),(1485560,4464351441),(1486056,7545277562),(1486308,5145335764),(1486440,1831436662),(1486630,6631921827),(1487226,8944431778),(1487261,7808475436),(1487334,5443733836),(1487362,1435848838),(1487384,2376410814),(1487426,7735068524),(1487560,8446170485),(1488088,3275495725),(1488270,1574259552),(1488785,2262176415);
/*!40000 ALTER TABLE `patient_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int NOT NULL,
  `report_text` mediumtext,
  `date` date DEFAULT NULL,
  `EID` int DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `EID` (`EID`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `doctor` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-02-12',113),(2,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-03-30',114),(3,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2020-10-14',115),(4,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2020-08-13',116),(5,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-11-14',117),(6,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2020-12-16',118),(7,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2020-09-28',119),(8,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-03-04',120),(9,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-04-29',121),(10,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-01-13',122),(11,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-07-15',123),(12,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-09-24',124),(13,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-06-07',113),(14,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-03-13',114),(15,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-05-28',115),(16,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-04-29',116),(17,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-03-29',117),(18,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-06-23',118),(19,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-09-12',119),(20,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-04-23',120),(21,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-02-19',121),(22,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2022-06-06',122),(23,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-02-16',123),(24,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-12-12',124),(25,'quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in','2021-08-31',113);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `number` int NOT NULL,
  `surgery_capable` tinyint(1) DEFAULT NULL,
  `intensive_care_capable` tinyint(1) DEFAULT NULL,
  `MRN` int DEFAULT NULL,
  `EID` int DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `EID` (`EID`),
  KEY `MRN` (`MRN`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `nurse` (`EID`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`MRN`) REFERENCES `patient` (`MRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (200,0,0,1483098,100),(201,0,1,1483196,101),(202,0,0,1483081,102),(203,1,1,1483348,103),(204,0,0,1488270,104),(205,0,1,1484821,105),(206,0,0,1486630,106),(207,1,1,1487362,107),(208,1,1,1487560,108),(209,1,1,1486056,109),(210,1,1,1484420,110),(211,0,0,1487261,111),(212,0,0,1483354,112),(213,0,1,1487384,100),(214,0,1,1487226,101),(215,0,1,1486308,102),(216,1,0,1484716,103),(217,1,0,1488088,104),(218,0,0,1487426,105),(219,1,0,1485031,106),(220,0,0,1488785,107),(221,0,0,1485560,108),(222,0,1,1487334,109),(223,0,0,1486440,110),(224,1,1,1484551,111);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patient_info`
--

/*!50001 DROP VIEW IF EXISTS `patient_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`linuxlover3000`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_info` AS select `patient`.`MRN` AS `MRN`,`patient`.`name_first` AS `name_first`,`patient`.`name_last` AS `name_last`,`patient`.`DOB` AS `DOB`,`patient`.`EID` AS `EID`,timestampdiff(YEAR,`patient`.`DOB`,curdate()) AS `age` from `patient` */;
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

-- Dump completed on 2023-07-28  3:26:39
