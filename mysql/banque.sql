-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: banque
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `id_administration` int(10) NOT NULL AUTO_INCREMENT,
  `nomAdmin` varchar(45) NOT NULL,
  `prenomAdmin` varchar(45) NOT NULL,
  PRIMARY KEY (`id_administration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `id_agence` int(10) NOT NULL AUTO_INCREMENT,
  `numAgence` varchar(45) NOT NULL,
  `nomAgence` varchar(55) NOT NULL,
  `id_administration` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_agence`),
  KEY `fk_Admin` (`id_administration`),
  CONSTRAINT `fk_Admin` FOREIGN KEY (`id_administration`) REFERENCES `administration` (`id_administration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agios`
--

DROP TABLE IF EXISTS `agios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agios` (
  `id_Agios` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(15) NOT NULL,
  `montant` varchar(55) NOT NULL,
  PRIMARY KEY (`id_Agios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agios`
--

LOCK TABLES `agios` WRITE;
/*!40000 ALTER TABLE `agios` DISABLE KEYS */;
/*!40000 ALTER TABLE `agios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caissiere`
--

DROP TABLE IF EXISTS `caissiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caissiere` (
  `id_caissiere` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id_caissiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caissiere`
--

LOCK TABLES `caissiere` WRITE;
/*!40000 ALTER TABLE `caissiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `caissiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_Compte`
--

DROP TABLE IF EXISTS `charge_Compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_Compte` (
  `id_chargeCompte` int(10) NOT NULL AUTO_INCREMENT,
  `nomChargeCompte` varchar(255) NOT NULL,
  PRIMARY KEY (`id_chargeCompte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_Compte`
--

LOCK TABLES `charge_Compte` WRITE;
/*!40000 ALTER TABLE `charge_Compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_Compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) NOT NULL,
  `CNI` varchar(25) DEFAULT NULL,
  `id_clientPhysique` int(10) DEFAULT NULL,
  `id_employeur` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `adress` (`adress`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `CNI` (`CNI`),
  KEY `fk_ClientPh` (`id_clientPhysique`),
  KEY `fk_ClientMoral` (`id_employeur`),
  CONSTRAINT `fk_ClientMoral` FOREIGN KEY (`id_employeur`) REFERENCES `client_moral` (`id_employeur`),
  CONSTRAINT `fk_ClientPh` FOREIGN KEY (`id_clientPhysique`) REFERENCES `client_physique` (`id_clientPhysique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_moral`
--

DROP TABLE IF EXISTS `client_moral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_moral` (
  `id_employeur` int(10) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(255) NOT NULL,
  `nomEmployeur` varchar(255) NOT NULL,
  `rc` varchar(255) DEFAULT NULL,
  `ninea` varchar(255) NOT NULL,
  PRIMARY KEY (`id_employeur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_moral`
--

LOCK TABLES `client_moral` WRITE;
/*!40000 ALTER TABLE `client_moral` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_moral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_physique`
--

DROP TABLE IF EXISTS `client_physique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_physique` (
  `id_clientPhysique` int(10) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `salaire` varchar(255) DEFAULT NULL,
  `id_employeur` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_clientPhysique`),
  KEY `fk_Moral` (`id_employeur`),
  CONSTRAINT `fk_Moral` FOREIGN KEY (`id_employeur`) REFERENCES `client_moral` (`id_employeur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_physique`
--

LOCK TABLES `client_physique` WRITE;
/*!40000 ALTER TABLE `client_physique` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_physique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `id_compte` int(10) NOT NULL AUTO_INCREMENT,
  `numAgence` varchar(255) NOT NULL,
  `numCompte` varchar(255) NOT NULL,
  `cleRib` varchar(255) NOT NULL,
  `id` int(10) DEFAULT NULL,
  `id_etatCompte` int(10) DEFAULT NULL,
  `id_Agios` int(10) DEFAULT NULL,
  `id_chargeCompte` int(10) DEFAULT NULL,
  `id_client` int(10) DEFAULT NULL,
  `id_responsable` int(10) DEFAULT NULL,
  `id_agence` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  UNIQUE KEY `numCompte` (`numCompte`),
  KEY `fk_compte` (`id`),
  KEY `fk_etatcompte` (`id_etatCompte`),
  KEY `fk_Agios` (`id_Agios`),
  KEY `fk_Charge` (`id_chargeCompte`),
  KEY `fk_Client` (`id_client`),
  KEY `fk_Responsable` (`id_responsable`),
  KEY `fk_Agence` (`id_agence`),
  CONSTRAINT `fk_Agence` FOREIGN KEY (`id_agence`) REFERENCES `agence` (`id_agence`),
  CONSTRAINT `fk_Agios` FOREIGN KEY (`id_Agios`) REFERENCES `agios` (`id_Agios`),
  CONSTRAINT `fk_Charge` FOREIGN KEY (`id_chargeCompte`) REFERENCES `charge_Compte` (`id_chargeCompte`),
  CONSTRAINT `fk_Client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_Responsable` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`),
  CONSTRAINT `fk_compte` FOREIGN KEY (`id`) REFERENCES `typeCompte` (`id`),
  CONSTRAINT `fk_etatcompte` FOREIGN KEY (`id_etatCompte`) REFERENCES `etatCompte` (`id_etatCompte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depot`
--

DROP TABLE IF EXISTS `depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depot` (
  `id_depot` int(10) NOT NULL AUTO_INCREMENT,
  `numero` int(45) NOT NULL,
  PRIMARY KEY (`id_depot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
/*!40000 ALTER TABLE `depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `id_employe` int(10) NOT NULL AUTO_INCREMENT,
  `nomEmploye` varchar(45) NOT NULL,
  `prenomEmploye` varchar(55) NOT NULL,
  `id_administration` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `fk_Administrateur` (`id_administration`),
  CONSTRAINT `fk_Administrateur` FOREIGN KEY (`id_administration`) REFERENCES `administration` (`id_administration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etatCompte`
--

DROP TABLE IF EXISTS `etatCompte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etatCompte` (
  `id_etatCompte` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(15) NOT NULL,
  PRIMARY KEY (`id_etatCompte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etatCompte`
--

LOCK TABLES `etatCompte` WRITE;
/*!40000 ALTER TABLE `etatCompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `etatCompte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `id_operation` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `id_caissiere` int(10) DEFAULT NULL,
  `id_depot` int(10) DEFAULT NULL,
  `id_retrait` int(10) DEFAULT NULL,
  `id_virement` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_operation`),
  KEY `fk_Caissiere` (`id_caissiere`),
  KEY `fk_Depot` (`id_depot`),
  KEY `fk_Retrait` (`id_retrait`),
  KEY `fk_Virement` (`id_virement`),
  CONSTRAINT `fk_Caissiere` FOREIGN KEY (`id_caissiere`) REFERENCES `caissiere` (`id_caissiere`),
  CONSTRAINT `fk_Depot` FOREIGN KEY (`id_depot`) REFERENCES `depot` (`id_depot`),
  CONSTRAINT `fk_Retrait` FOREIGN KEY (`id_retrait`) REFERENCES `retrait` (`id_retrait`),
  CONSTRAINT `fk_Virement` FOREIGN KEY (`id_virement`) REFERENCES `virement` (`id_virement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releveCompte`
--

DROP TABLE IF EXISTS `releveCompte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releveCompte` (
  `id_releveCompte` int(10) NOT NULL AUTO_INCREMENT,
  `numCompte` varchar(25) NOT NULL,
  `rib` varchar(25) NOT NULL,
  `operations` varchar(25) NOT NULL,
  `montant` varchar(25) NOT NULL,
  `data` varchar(25) NOT NULL,
  `id_responsable` int(10) DEFAULT NULL,
  `id_client` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_releveCompte`),
  KEY `fk_RespRele` (`id_responsable`),
  KEY `fk_ClientRele` (`id_client`),
  CONSTRAINT `fk_ClientRele` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_RespRele` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releveCompte`
--

LOCK TABLES `releveCompte` WRITE;
/*!40000 ALTER TABLE `releveCompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `releveCompte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsable` (
  `id_responsable` int(10) NOT NULL AUTO_INCREMENT,
  `nomComplet` varchar(45) NOT NULL,
  `id_virement` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable`
--

LOCK TABLES `responsable` WRITE;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retrait`
--

DROP TABLE IF EXISTS `retrait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retrait` (
  `id_retrait` int(10) NOT NULL AUTO_INCREMENT,
  `numeroVirement` int(45) NOT NULL,
  PRIMARY KEY (`id_retrait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retrait`
--

LOCK TABLES `retrait` WRITE;
/*!40000 ALTER TABLE `retrait` DISABLE KEYS */;
/*!40000 ALTER TABLE `retrait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeCompte`
--

DROP TABLE IF EXISTS `typeCompte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeCompte` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeCompte`
--

LOCK TABLES `typeCompte` WRITE;
/*!40000 ALTER TABLE `typeCompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeCompte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virement`
--

DROP TABLE IF EXISTS `virement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virement` (
  `id_virement` int(10) NOT NULL AUTO_INCREMENT,
  `numeroVirement` int(45) NOT NULL,
  `id_responsable` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_virement`),
  KEY `fk_Respon` (`id_responsable`),
  CONSTRAINT `fk_Respon` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virement`
--

LOCK TABLES `virement` WRITE;
/*!40000 ALTER TABLE `virement` DISABLE KEYS */;
/*!40000 ALTER TABLE `virement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18 22:45:42
