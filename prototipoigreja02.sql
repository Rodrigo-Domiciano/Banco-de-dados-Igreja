CREATE DATABASE  IF NOT EXISTS `prototipoigreja2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prototipoigreja2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: prototipoigreja2
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cesta_doacao`
--

DROP TABLE IF EXISTS `cesta_doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cesta_doacao` (
  `idcesta_doacao` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `quantidade_cesta` int NOT NULL,
  PRIMARY KEY (`idcesta_doacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cesta_doacao`
--

LOCK TABLES `cesta_doacao` WRITE;
/*!40000 ALTER TABLE `cesta_doacao` DISABLE KEYS */;
INSERT INTO `cesta_doacao` VALUES (1,'A',4),(2,'B',4),(3,'C',15);
/*!40000 ALTER TABLE `cesta_doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_cesta`
--

DROP TABLE IF EXISTS `produto_cesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_cesta` (
  `idproduto_cesta` int NOT NULL AUTO_INCREMENT,
  `nome_prod` varchar(45) NOT NULL,
  `quantidade_prod` int NOT NULL,
  PRIMARY KEY (`idproduto_cesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_cesta`
--

LOCK TABLES `produto_cesta` WRITE;
/*!40000 ALTER TABLE `produto_cesta` DISABLE KEYS */;
INSERT INTO `produto_cesta` VALUES (1,'arroz',5),(2,'feijão',2),(3,'leite',2);
/*!40000 ALTER TABLE `produto_cesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_contido_na_cesta`
--

DROP TABLE IF EXISTS `produto_contido_na_cesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_contido_na_cesta` (
  `produto_cesta_idproduto_cesta` int NOT NULL,
  `cesta_doacao_idcesta_doacao` int NOT NULL,
  `quantidade_prod_cesta` int NOT NULL,
  PRIMARY KEY (`produto_cesta_idproduto_cesta`,`cesta_doacao_idcesta_doacao`),
  KEY `fk_produto_cesta_has_cesta_doacao_cesta_doacao1_idx` (`cesta_doacao_idcesta_doacao`),
  KEY `fk_produto_cesta_has_cesta_doacao_produto_cesta1_idx` (`produto_cesta_idproduto_cesta`),
  CONSTRAINT `fk_produto_cesta_has_cesta_doacao_cesta_doacao1` FOREIGN KEY (`cesta_doacao_idcesta_doacao`) REFERENCES `cesta_doacao` (`idcesta_doacao`),
  CONSTRAINT `fk_produto_cesta_has_cesta_doacao_produto_cesta1` FOREIGN KEY (`produto_cesta_idproduto_cesta`) REFERENCES `produto_cesta` (`idproduto_cesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_contido_na_cesta`
--

LOCK TABLES `produto_contido_na_cesta` WRITE;
/*!40000 ALTER TABLE `produto_contido_na_cesta` DISABLE KEYS */;
INSERT INTO `produto_contido_na_cesta` VALUES (1,1,3);
/*!40000 ALTER TABLE `produto_contido_na_cesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_de_doacao_cesta`
--

DROP TABLE IF EXISTS `registro_de_doacao_cesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_de_doacao_cesta` (
  `cesta_doacao_idcesta_doacao` int NOT NULL,
  `usuario_receptor_idusuario_receptor` int NOT NULL,
  `data_doacao` date DEFAULT NULL,
  PRIMARY KEY (`cesta_doacao_idcesta_doacao`,`usuario_receptor_idusuario_receptor`),
  KEY `fk_cesta_doacao_has_usuario_receptor_usuario_receptor1_idx` (`usuario_receptor_idusuario_receptor`),
  KEY `fk_cesta_doacao_has_usuario_receptor_cesta_doacao_idx` (`cesta_doacao_idcesta_doacao`),
  CONSTRAINT `fk_cesta_doacao_has_usuario_receptor_cesta_doacao` FOREIGN KEY (`cesta_doacao_idcesta_doacao`) REFERENCES `cesta_doacao` (`idcesta_doacao`),
  CONSTRAINT `fk_cesta_doacao_has_usuario_receptor_usuario_receptor1` FOREIGN KEY (`usuario_receptor_idusuario_receptor`) REFERENCES `usuario_receptor` (`idusuario_receptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_de_doacao_cesta`
--

LOCK TABLES `registro_de_doacao_cesta` WRITE;
/*!40000 ALTER TABLE `registro_de_doacao_cesta` DISABLE KEYS */;
INSERT INTO `registro_de_doacao_cesta` VALUES (1,1,'2023-05-05'),(2,1,'2023-06-06');
/*!40000 ALTER TABLE `registro_de_doacao_cesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `registro_de_doacao_cesta_BEFORE_INSERT` BEFORE INSERT ON `registro_de_doacao_cesta` FOR EACH ROW BEGIN
update produto_cesta set quantidade_prod = quantidade_prod - quantidade_prod_cesta where new.cesta_doacao_idcesta_doacao = idcesta_doacao;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_ins_doacao_cesta` AFTER INSERT ON `registro_de_doacao_cesta` FOR EACH ROW BEGIN

update cesta_doacao set quantidade_cesta = quantidade_cesta - 1 where new.cesta_doacao_idcesta_doacao = idcesta_doacao;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registro_de_doacao_estoque`
--

DROP TABLE IF EXISTS `registro_de_doacao_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_de_doacao_estoque` (
  `usuario_doador_idusuario_doador` int NOT NULL,
  `produto_cesta_idproduto_cesta` int NOT NULL,
  `data_doacao_estoque` date NOT NULL,
  `quantidade_doada` int NOT NULL,
  PRIMARY KEY (`usuario_doador_idusuario_doador`,`produto_cesta_idproduto_cesta`),
  KEY `fk_usuario_doador_has_produto_cesta_produto_cesta1_idx` (`produto_cesta_idproduto_cesta`),
  KEY `fk_usuario_doador_has_produto_cesta_usuario_doador1_idx` (`usuario_doador_idusuario_doador`),
  CONSTRAINT `fk_usuario_doador_has_produto_cesta_produto_cesta1` FOREIGN KEY (`produto_cesta_idproduto_cesta`) REFERENCES `produto_cesta` (`idproduto_cesta`),
  CONSTRAINT `fk_usuario_doador_has_produto_cesta_usuario_doador1` FOREIGN KEY (`usuario_doador_idusuario_doador`) REFERENCES `usuario_doador` (`idusuario_doador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_de_doacao_estoque`
--

LOCK TABLES `registro_de_doacao_estoque` WRITE;
/*!40000 ALTER TABLE `registro_de_doacao_estoque` DISABLE KEYS */;
INSERT INTO `registro_de_doacao_estoque` VALUES (1,1,'2023-05-05',3);
/*!40000 ALTER TABLE `registro_de_doacao_estoque` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_ins_doacao_estoque` AFTER INSERT ON `registro_de_doacao_estoque` FOR EACH ROW BEGIN

update produto_cesta set quantidade_prod = quantidade_prod + new.quantidade_doada where new.produto_cesta_idproduto_cesta = idproduto_cesta;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario_doador`
--

DROP TABLE IF EXISTS `usuario_doador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_doador` (
  `idusuario_doador` int NOT NULL AUTO_INCREMENT,
  `nome_doador` varchar(45) NOT NULL,
  `telefone_doador` varchar(45) NOT NULL,
  `cpf_doador` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario_doador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_doador`
--

LOCK TABLES `usuario_doador` WRITE;
/*!40000 ALTER TABLE `usuario_doador` DISABLE KEYS */;
INSERT INTO `usuario_doador` VALUES (1,'Rafael','1478523369','951753654');
/*!40000 ALTER TABLE `usuario_doador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_receptor`
--

DROP TABLE IF EXISTS `usuario_receptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_receptor` (
  `idusuario_receptor` int NOT NULL AUTO_INCREMENT,
  `nome_receptor` varchar(45) NOT NULL,
  `telefone_receptor` varchar(45) NOT NULL,
  `cpf_receptor` varchar(45) NOT NULL,
  `endereco_receptor` varchar(45) NOT NULL,
  `quantidade_crianca` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario_receptor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_receptor`
--

LOCK TABLES `usuario_receptor` WRITE;
/*!40000 ALTER TABLE `usuario_receptor` DISABLE KEYS */;
INSERT INTO `usuario_receptor` VALUES (1,'Guilherme','44220986','149528','Aparecida de goiania','4');
/*!40000 ALTER TABLE `usuario_receptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'prototipoigreja2'
--

--
-- Dumping routines for database 'prototipoigreja2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01  8:56:49
