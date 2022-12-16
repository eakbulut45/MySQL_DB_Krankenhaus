CREATE DATABASE  IF NOT EXISTS `krankenhaus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `krankenhaus`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: krankenhaus
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
-- Table structure for table `arzt`
--

DROP TABLE IF EXISTS `arzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arzt` (
  `idarzt` int(11) NOT NULL,
  `vorname` varchar(25) DEFAULT NULL,
  `nachname` varchar(25) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `stadt` varchar(20) DEFAULT NULL,
  `plz` int(11) DEFAULT NULL,
  `E-Mail` varchar(45) DEFAULT NULL,
  `Tel-Nummer` varchar(45) DEFAULT NULL,
  `gehalt` varchar(20) DEFAULT NULL,
  `fachgebiet` varchar(45) DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  PRIMARY KEY (`idarzt`,`Krankenhaus_idKrankenhaus`),
  KEY `fk_arzt_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus`),
  CONSTRAINT `fk_arzt_Krankenhaus1` FOREIGN KEY (`Krankenhaus_idKrankenhaus`) REFERENCES `krankenhaus` (`idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arzt`
--

LOCK TABLES `arzt` WRITE;
/*!40000 ALTER TABLE `arzt` DISABLE KEYS */;
INSERT INTO `arzt` VALUES (1,'Hakki','Gencer','Neumühle Str. 65','Erkelenz',41812,'info@hg-erkelenz.de','02431-891','3800','Augenheilkunde',1),(2,'Steffi','Müller','Fuchstrasse 18','Mönchengladbach',41199,'info@sm-erkelenz.de','02431-892','4200','Hals-Nasen-Ohrenheilkunde',1),(3,'Andreas','Rödger','Sohnstrasse 24','Düsseldorf',40210,'info@ar-erkelenz.de','02431-893','4400','Urologie',1),(4,'Maria','Küsters','Berner Weg 45','Köln',50667,'info@mk-erkelenz.de','02431-894','3900','Allgemeinmedizin',1),(5,'Sebastian','Müller','Grabenstrasse 7','Heinsberg',52525,'info@sm-erkelenz.de','02431-895','4100','Anästhesiologie',1),(6,'Dimitri','Sotkin','Jahnstrasse 67','Wegberg',41844,'info@ds-erkelenz.de','02431-896','4500','Kinder- und Jungendmedizin',1),(7,'Omar','Ahmed','Beecker Str. 71','Erkelenz',41812,'info@oa-erkelenz.de','02431-897','4200','Innere Medizin',1),(8,'Caroline','Martin','Kirchfeldstrasse 12','Mönchengladbach',41199,'info@cm-erkelenz.de','02431-898','5100','Physikalische und Rehabilitative Medizin',1);
/*!40000 ALTER TABLE `arzt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arzt_has_patient`
--

DROP TABLE IF EXISTS `arzt_has_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arzt_has_patient` (
  `arzt_idarzt` int(11) NOT NULL,
  `patient_idpatient` int(11) NOT NULL,
  PRIMARY KEY (`arzt_idarzt`,`patient_idpatient`),
  KEY `fk_arzt_has_patient_patient1_idx` (`patient_idpatient`),
  KEY `fk_arzt_has_patient_arzt1_idx` (`arzt_idarzt`),
  CONSTRAINT `fk_arzt_has_patient_arzt1` FOREIGN KEY (`arzt_idarzt`) REFERENCES `arzt` (`idarzt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_arzt_has_patient_patient1` FOREIGN KEY (`patient_idpatient`) REFERENCES `patient` (`idpatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arzt_has_patient`
--

LOCK TABLES `arzt_has_patient` WRITE;
/*!40000 ALTER TABLE `arzt_has_patient` DISABLE KEYS */;
INSERT INTO `arzt_has_patient` VALUES (1,1),(1,3),(2,4),(2,7),(2,8),(3,2),(4,1),(4,5),(5,3),(6,2),(6,4),(7,9),(7,10),(8,6);
/*!40000 ALTER TABLE `arzt_has_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fachklinik`
--

DROP TABLE IF EXISTS `fachklinik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fachklinik` (
  `idfachklinik` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  PRIMARY KEY (`idfachklinik`,`Krankenhaus_idKrankenhaus`),
  KEY `fk_fachklinik_Krankenhaus_idx` (`Krankenhaus_idKrankenhaus`),
  CONSTRAINT `fk_fachklinik_Krankenhaus` FOREIGN KEY (`Krankenhaus_idKrankenhaus`) REFERENCES `krankenhaus` (`idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fachklinik`
--

LOCK TABLES `fachklinik` WRITE;
/*!40000 ALTER TABLE `fachklinik` DISABLE KEYS */;
INSERT INTO `fachklinik` VALUES (1,'Klinik für Anästhesiologie',1),(2,'Chirurgische Kliniken',1),(3,'Klinik für Dermatologie',1),(4,'Frauenklinik',1),(5,'Klinik für HNO-Heilkunde',1),(6,'Medizinische Klinik',1),(7,'Klinik für Kardiologie',1),(8,'Kinderklinik',1),(9,'Radiologische Klinik',1);
/*!40000 ALTER TABLE `fachklinik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krankenhaus`
--

DROP TABLE IF EXISTS `krankenhaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krankenhaus` (
  `idKrankenhaus` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `stadt` varchar(45) DEFAULT NULL,
  `plz` int(11) DEFAULT NULL,
  `E-Mail` varchar(25) DEFAULT NULL,
  `Tel-Nummer` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idKrankenhaus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krankenhaus`
--

LOCK TABLES `krankenhaus` WRITE;
/*!40000 ALTER TABLE `krankenhaus` DISABLE KEYS */;
INSERT INTO `krankenhaus` VALUES (1,'Hermann-Josef-Krankenhaus','Tenholter Str. 43','Erkelenz',41812,'info@hjk-erkelenz.de','02431 890');
/*!40000 ALTER TABLE `krankenhaus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krankenschwester`
--

DROP TABLE IF EXISTS `krankenschwester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krankenschwester` (
  `idkrankenschwester` int(11) NOT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `stadt` varchar(45) DEFAULT NULL,
  `plz` int(11) DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  PRIMARY KEY (`idkrankenschwester`,`Krankenhaus_idKrankenhaus`),
  KEY `fk_krankenschwester_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus`),
  CONSTRAINT `fk_krankenschwester_Krankenhaus1` FOREIGN KEY (`Krankenhaus_idKrankenhaus`) REFERENCES `krankenhaus` (`idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krankenschwester`
--

LOCK TABLES `krankenschwester` WRITE;
/*!40000 ALTER TABLE `krankenschwester` DISABLE KEYS */;
INSERT INTO `krankenschwester` VALUES (1,'Bea','Becker','Valkenburger Str. 15','Erkelenz',41812,1),(2,'Ebby','Fischer','Hochstasse 20','Hückelhoven',41836,1),(3,'Laura','Schneider','Sittarder Str. 27','Heinsberg',52525,1),(4,'Jakob','Schmidt','Grachtweg 82','Heinsberg',52525,1),(5,'Emilia','Wagner','Talstrasse 15','Erkelenz',81812,1);
/*!40000 ALTER TABLE `krankenschwester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krankheit`
--

DROP TABLE IF EXISTS `krankheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krankheit` (
  `idkrankheit` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `symptome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idkrankheit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krankheit`
--

LOCK TABLES `krankheit` WRITE;
/*!40000 ALTER TABLE `krankheit` DISABLE KEYS */;
INSERT INTO `krankheit` VALUES (1,'Erkältung','Halsschmerzen, Schnupfen und Husten '),(2,'Kopfschmerzen','Spannungskopfschmerz'),(3,'Asthma','Husten, Atemnot, Kurzatmigkeit, Engegefühl in'),(4,'Covid','Kopfschmerzen, Grippe, Hustun'),(5,'Lungenkrebs','Blutigen Auswurf, Atemnot und rapiden Gewicht'),(6,'Migräne','Vorphase (Prodromalstadium), Aura-Phase, Kopf');
/*!40000 ALTER TABLE `krankheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krankheit_has_patient`
--

DROP TABLE IF EXISTS `krankheit_has_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krankheit_has_patient` (
  `krankheit_idkrankheit` int(11) NOT NULL,
  `patient_idpatient` int(11) NOT NULL,
  PRIMARY KEY (`krankheit_idkrankheit`,`patient_idpatient`),
  KEY `fk_krankheit_has_patient_patient1_idx` (`patient_idpatient`),
  KEY `fk_krankheit_has_patient_krankheit1_idx` (`krankheit_idkrankheit`),
  CONSTRAINT `fk_krankheit_has_patient_krankheit1` FOREIGN KEY (`krankheit_idkrankheit`) REFERENCES `krankheit` (`idkrankheit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_krankheit_has_patient_patient1` FOREIGN KEY (`patient_idpatient`) REFERENCES `patient` (`idpatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krankheit_has_patient`
--

LOCK TABLES `krankheit_has_patient` WRITE;
/*!40000 ALTER TABLE `krankheit_has_patient` DISABLE KEYS */;
INSERT INTO `krankheit_has_patient` VALUES (1,4),(1,7),(1,8),(2,1),(2,5),(3,9),(4,2),(4,4),(5,10),(6,3),(6,6);
/*!40000 ALTER TABLE `krankheit_has_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labor`
--

DROP TABLE IF EXISTS `labor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labor` (
  `idlabor` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Tel-Nummer` varchar(15) DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  PRIMARY KEY (`idlabor`,`Krankenhaus_idKrankenhaus`),
  KEY `fk_labor_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus`),
  CONSTRAINT `fk_labor_Krankenhaus1` FOREIGN KEY (`Krankenhaus_idKrankenhaus`) REFERENCES `krankenhaus` (`idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labor`
--

LOCK TABLES `labor` WRITE;
/*!40000 ALTER TABLE `labor` DISABLE KEYS */;
INSERT INTO `labor` VALUES (1,'Hermann-Josef-Krankenhaus Labor','02431/890',1);
/*!40000 ALTER TABLE `labor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medikamente`
--

DROP TABLE IF EXISTS `medikamente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medikamente` (
  `idmedikamente` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `inhalt` varchar(45) DEFAULT NULL,
  `preis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idmedikamente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medikamente`
--

LOCK TABLES `medikamente` WRITE;
/*!40000 ALTER TABLE `medikamente` DISABLE KEYS */;
INSERT INTO `medikamente` VALUES (1,'Nirmatrelvir','10 mg 20 Tabletten','4.19'),(2,'Melnupiravir','100 mg 50 Tabletten','20.56'),(3,'Paracetamol','50 mg 28 Tabletten','12.66'),(4,'Kortison','250 mg 10 Tabletten','20.56'),(5,'Parol','10 mg 40 Tabletten','4.29');
/*!40000 ALTER TABLE `medikamente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medikamente_has_patient`
--

DROP TABLE IF EXISTS `medikamente_has_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medikamente_has_patient` (
  `medikamente_idmedikamente` int(11) NOT NULL,
  `patient_idpatient` int(11) NOT NULL,
  PRIMARY KEY (`medikamente_idmedikamente`,`patient_idpatient`),
  KEY `fk_medikamente_has_patient_patient1_idx` (`patient_idpatient`),
  KEY `fk_medikamente_has_patient_medikamente1_idx` (`medikamente_idmedikamente`),
  CONSTRAINT `fk_medikamente_has_patient_medikamente1` FOREIGN KEY (`medikamente_idmedikamente`) REFERENCES `medikamente` (`idmedikamente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medikamente_has_patient_patient1` FOREIGN KEY (`patient_idpatient`) REFERENCES `patient` (`idpatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medikamente_has_patient`
--

LOCK TABLES `medikamente_has_patient` WRITE;
/*!40000 ALTER TABLE `medikamente_has_patient` DISABLE KEYS */;
INSERT INTO `medikamente_has_patient` VALUES (1,1),(1,5),(2,3),(2,5),(2,10),(3,2),(3,10),(4,6),(4,8),(4,9),(5,2),(5,3),(5,7);
/*!40000 ALTER TABLE `medikamente_has_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op`
--

DROP TABLE IF EXISTS `op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `op` (
  `idop` int(11) NOT NULL,
  `datum` varchar(15) DEFAULT NULL,
  `arzt_idarzt` int(11) NOT NULL,
  `arzt_Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  `patient_idpatient` int(11) NOT NULL,
  PRIMARY KEY (`idop`,`arzt_idarzt`,`arzt_Krankenhaus_idKrankenhaus`,`patient_idpatient`),
  KEY `fk_op_arzt1_idx` (`arzt_idarzt`,`arzt_Krankenhaus_idKrankenhaus`),
  KEY `fk_op_patient1_idx` (`patient_idpatient`),
  CONSTRAINT `fk_op_arzt1` FOREIGN KEY (`arzt_idarzt`, `arzt_Krankenhaus_idKrankenhaus`) REFERENCES `arzt` (`idarzt`, `Krankenhaus_idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_op_patient1` FOREIGN KEY (`patient_idpatient`) REFERENCES `patient` (`idpatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op`
--

LOCK TABLES `op` WRITE;
/*!40000 ALTER TABLE `op` DISABLE KEYS */;
INSERT INTO `op` VALUES (1,'30.12.22',7,1,10),(2,'30.01.23',1,1,3),(3,'28.02.23',2,1,7),(4,'30.03.23',2,1,8),(5,'30.04.23',7,1,10);
/*!40000 ALTER TABLE `op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `idpatient` int(11) NOT NULL,
  `vorname` varchar(20) DEFAULT NULL,
  `nachname` varchar(20) DEFAULT NULL,
  `geschlecht` varchar(1) DEFAULT NULL,
  `geburtsdatum` varchar(10) DEFAULT NULL,
  `blutgruppe` varchar(10) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `stadt` varchar(20) DEFAULT NULL,
  `plz` int(11) DEFAULT NULL,
  `zimmer_idzimmer` int(11) NOT NULL,
  PRIMARY KEY (`idpatient`,`zimmer_idzimmer`),
  KEY `fk_patient_zimmer1_idx` (`zimmer_idzimmer`),
  CONSTRAINT `fk_patient_zimmer1` FOREIGN KEY (`zimmer_idzimmer`) REFERENCES `zimmer` (`idzimmer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Grace','Ritchie','M','27.11.91','A Rh-','Neumühle Str. 67','Erkelenz',41812,2),(2,'John','Smith','M','08.08.98','B Rh+','Fuchstrasse 19','Mönchengladbach',41199,3),(3,'Carla','Müller','W','01.01.64','AB Rh-','Sohnstrasse 25','Düsseldorf',40210,1),(4,'Paul','Flowers','M','16.02.01','0 Rh+','Berner Weg 47','Köln',50667,3),(5,'Laverne','Lessenig','W','30.04.71','A Rh+','Grabenstrasse 72','Heinsberg',52525,2),(6,'Emilia','Schmidt','W','24.11.56','0 Rh-','Jahnstrasse 6','Wegberg',41844,1),(7,'Adelbert','Schneider','M','05.09.22','AB Rh+','Beecker Str. 7','Erkelenz',41812,5),(8,'Adam','Meyer','M','18.04.96','B Rh-','Kirchfeldstrasse 12','Mönchengladbach',41199,3),(9,'Emma','Hoffmann','W','20.02.78','B Rh+','Beecker Str. 67','Wegberg',41844,7),(10,'Lina','Wagner','W','15.12.54','A Rh-','Bahnhof Str. 5','Wegberg',41844,6);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termin`
--

DROP TABLE IF EXISTS `termin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termin` (
  `idtermin` int(11) NOT NULL,
  `datum` varchar(45) DEFAULT NULL,
  `patient_idpatient` int(11) NOT NULL,
  PRIMARY KEY (`idtermin`,`patient_idpatient`),
  KEY `fk_termin_patient1_idx` (`patient_idpatient`),
  CONSTRAINT `fk_termin_patient1` FOREIGN KEY (`patient_idpatient`) REFERENCES `patient` (`idpatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termin`
--

LOCK TABLES `termin` WRITE;
/*!40000 ALTER TABLE `termin` DISABLE KEYS */;
INSERT INTO `termin` VALUES (1,'17.10.22',3),(2,'24.10.22',5),(3,'31.10.22',8),(4,'07.11.22',2),(5,'14.11.22',7);
/*!40000 ALTER TABLE `termin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `idtest` int(11) NOT NULL,
  `typ` varchar(45) DEFAULT NULL,
  `labor_idlabor` int(11) NOT NULL,
  PRIMARY KEY (`idtest`,`labor_idlabor`),
  KEY `fk_test_labor1_idx` (`labor_idlabor`),
  CONSTRAINT `fk_test_labor1` FOREIGN KEY (`labor_idlabor`) REFERENCES `labor` (`idlabor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Bluttest',1),(2,'Urintest',1),(3,'PCR-Test',1),(4,'Hepatitis',1),(5,'Ultraschall',1),(6,'Tomographie ',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zimmer`
--

DROP TABLE IF EXISTS `zimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zimmer` (
  `idzimmer` int(11) NOT NULL,
  `zimmer_nummer` varchar(45) DEFAULT NULL,
  `zimmer_name` varchar(45) DEFAULT NULL,
  `bettenzahl` varchar(10) DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` int(11) NOT NULL,
  PRIMARY KEY (`idzimmer`,`Krankenhaus_idKrankenhaus`),
  KEY `fk_zimmer_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus`),
  CONSTRAINT `fk_zimmer_Krankenhaus1` FOREIGN KEY (`Krankenhaus_idKrankenhaus`) REFERENCES `krankenhaus` (`idKrankenhaus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zimmer`
--

LOCK TABLES `zimmer` WRITE;
/*!40000 ALTER TABLE `zimmer` DISABLE KEYS */;
INSERT INTO `zimmer` VALUES (1,'Z-100','Senior','15',1),(2,'Z-101','Erwachsene','20',1),(3,'Z-102','Junge','25',1),(4,'Z-103','Kinder','20',1),(5,'Z-104','Baby','20',1),(6,'Z-105','Operation1','2',1),(7,'Z-106','Operation2','2',1);
/*!40000 ALTER TABLE `zimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zimmer_has_krankenschwester`
--

DROP TABLE IF EXISTS `zimmer_has_krankenschwester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zimmer_has_krankenschwester` (
  `zimmer_idzimmer` int(11) NOT NULL,
  `krankenschwester_idkrankenschwester` int(11) NOT NULL,
  PRIMARY KEY (`zimmer_idzimmer`,`krankenschwester_idkrankenschwester`),
  KEY `fk_zimmer_has_krankenschwester_krankenschwester1_idx` (`krankenschwester_idkrankenschwester`),
  KEY `fk_zimmer_has_krankenschwester_zimmer1_idx` (`zimmer_idzimmer`),
  CONSTRAINT `fk_zimmer_has_krankenschwester_krankenschwester1` FOREIGN KEY (`krankenschwester_idkrankenschwester`) REFERENCES `krankenschwester` (`idkrankenschwester`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_zimmer_has_krankenschwester_zimmer1` FOREIGN KEY (`zimmer_idzimmer`) REFERENCES `zimmer` (`idzimmer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zimmer_has_krankenschwester`
--

LOCK TABLES `zimmer_has_krankenschwester` WRITE;
/*!40000 ALTER TABLE `zimmer_has_krankenschwester` DISABLE KEYS */;
INSERT INTO `zimmer_has_krankenschwester` VALUES (1,2),(1,4),(2,3),(3,1),(3,5),(4,1),(5,3),(5,4),(6,2),(7,5);
/*!40000 ALTER TABLE `zimmer_has_krankenschwester` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11 15:05:37
