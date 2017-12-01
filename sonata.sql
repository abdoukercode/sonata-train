-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: sonata
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bateau`
--

DROP TABLE IF EXISTS `bateau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bateau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bateau`
--

LOCK TABLES `bateau` WRITE;
/*!40000 ALTER TABLE `bateau` DISABLE KEYS */;
INSERT INTO `bateau` VALUES (1,'Rara Avis'),(2,'Belespoir');
/*!40000 ALTER TABLE `bateau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `picture` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `positionImage` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA5AE01D12469DE2` (`category_id`),
  KEY `IDX_BA5AE01D16DB4F89` (`picture`),
  CONSTRAINT `FK_BA5AE01D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_BA5AE01D16DB4F89` FOREIGN KEY (`picture`) REFERENCES `media__media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,1,2,'Le père Jaouen','<h3>Le p&egrave;re Jaouen</h3>\r\n\r\n<p>Michel Jaouen<br />\r\nPresque tout le monde l&rsquo;appelait Michel, mais quelques-uns usaient de &laquo; mon P&egrave;re &raquo;. Ca surprenait, mais personne ne se moquait. Ben oui, il &eacute;tait cur&eacute;.&nbsp;<br />\r\n<br />\r\nEntre le 6 octobre 1920 et le 7 mars 2016, il a fait plus de milles que n&rsquo;importe qui, et jamais en solitaire. Il en a emmen&eacute;, du monde, avec lui !</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\nN&eacute; &agrave; Ouessant, il grandit &agrave; Kerlouan, Finist&egrave;re Nord, avec &eacute;norm&eacute;ment de fr&egrave;res et s&oelig;urs.&nbsp;<br />\r\nOrdonn&eacute; J&eacute;suite en 1951,il devient aum&ocirc;nier &agrave; la prison de Fresnes. Il construit le Foyer des Epinettes &agrave; Paris, pour accueillir ceux qui sortent de prison. Et il cr&eacute;e l&rsquo;AJD, Aum&ocirc;nerie de la Jeunesse D&eacute;linquante, pour les emmener en balade.&nbsp;<br />\r\nComme la mer &eacute;largit bien l&rsquo;horizon, il installe une base &agrave; Pen-Enez, Land&eacute;da, Finist&egrave;re, sur la dune face &agrave; l&rsquo;entr&eacute;e de l&rsquo;Aber-Wrach, avec des baraques r&eacute;cup&eacute;r&eacute;es de la reconstruction de Brest.<br />\r\nIl emm&egrave;ne son monde naviguer sur un premier Bel-Espoir, puis un second, plus grand. Comme il faut un &eacute;quipage, il enr&ocirc;le des appel&eacute;s du Service Militaire.&nbsp;<br />\r\n<br />\r\nLe Rara-Avis, un vrai yacht de riche, vient agrandir la flotte. Le propri&eacute;taire le lui donne.&nbsp;<br />\r\nMichel ouvre son bord &agrave; qui veut, &agrave; commencer par les toxicomanes. Son truc, c&rsquo;est de m&eacute;langer les gens. Il d&eacute;teste les ghettos et les vases clos.&nbsp;<br />\r\n<br />\r\nLe m&eacute;lange, le m&eacute;lange, j&rsquo;te dirais qu&rsquo;il n&rsquo;y a que &ccedil;a qui marche &hellip;&nbsp;<br />\r\n<br />\r\nIl a &eacute;t&eacute;&nbsp;Bien d&eacute;crit par un confr&egrave;re, le P&egrave;re Maucorps&nbsp;<br />\r\n<br />\r\nIl avait l&rsquo; allure d&rsquo;un prince habill&eacute; en clochard.&nbsp;<br />\r\nIl a affal&eacute; toutes les voiles &agrave; 95 ans. L&rsquo;immense &eacute;glise des J&eacute;suites d&eacute;bordait, pour venir le saluer.&nbsp;<br />\r\n<br />\r\nIl y a un livre, &eacute;crit par l&rsquo;une de ses ni&egrave;ces, qui raconte bien son art de vivre. &quot;D&eacute;merdez-vous pour &ecirc;tre heureux&quot;.</p>\r\n\r\n<p>&nbsp;</p>',0,1,0),(2,1,3,'L\'équipe','<h3>L&#39;&eacute;quipe</h3>\r\n\r\n<p>L&rsquo;AJD emploie treize permanents :<br />\r\nAucune des 4 secr&eacute;taires n&rsquo;a de formation psy-quelque-chose, mais elles sont terribles. Elles obligent les stagiaires &agrave; faire leurs papiers.&nbsp;<br />\r\nElles arrivent &agrave; coincer Zykton pour qu&rsquo;il signe des trucs. Elles dorlotent les commandants. Elles font les programmes de navigation, r&eacute;pondent &agrave; cent questions par jour, avitaillent les bateaux, s&rsquo;occupent du repas de midi pour quarante, et peuvent m&ecirc;me se montrer d&eacute;licieuses avec le Commissaire aux Comptes.&nbsp;</p>\r\n\r\n<p>Au chantier, il y a 9 formateurs dont, actuellement :&nbsp;<br />\r\n- Un ing&eacute;nieux, qui trouve toujours la solution parfaite.<br />\r\n- Un qui n&rsquo;est jamais de mauvais poil.&nbsp;<br />\r\n- Un marin r&acirc;leur &agrave; toute &eacute;preuve<br />\r\n- Un tr&egrave;s grand, qui sert de jauge pour les hauteurs de b&acirc;ti.<br />\r\n- Un optimiste imperturbable.&nbsp;<br />\r\n- Un artiste plasticien contrari&eacute;.<br />\r\n- Un Saint-Laurent de la voilerie<br />\r\n- Une multit&acirc;che<br />\r\n- Un qui envoie du p&acirc;t&eacute;.&nbsp;<br />\r\nEt puis, il y a les commandants. Ils connaissent nos bateaux comme leur poche, du moteur au haut des m&acirc;ts. Ils viennent commander pendant leurs cong&eacute;s, quand l&rsquo;envie leur en prend .<br />\r\nEnfin, nous serions bien emb&ecirc;t&eacute;s si nous devions nous passer des b&eacute;n&eacute;voles qui font passer le permis bateau aux stagiaires, qui nous aident &agrave; faire les courses, planter des fleurs aux baraques pour faire joli, &eacute;crire et mettre en page nos publications&hellip;&nbsp;<br />\r\n&nbsp;</p>',0,1,1),(3,1,4,'Notre action','<h3>Notre action</h3>\r\n\r\n<p>Comment &ccedil;a marche ?<br />\r\nNous sommes une association Loi 1901 reconnue d&rsquo;int&eacute;r&ecirc;t g&eacute;n&eacute;ral, qui compte une dizaine de permanents.<br />\r\nNous mettons en &oelig;uvre la religion de Michel Jaouen, J&eacute;suite : le m&eacute;lange des gens, en difficult&eacute; ou pas, pour le b&eacute;n&eacute;fice de tous.<br />\r\nNous usons de deux go&eacute;lettes &agrave; trois-m&acirc;ts : le Bel Espoir et le Rara Avis, ainsi qu&rsquo;une flotte de petits bateaux &agrave; voile, &agrave; rame, &agrave; moteur, l&rsquo;&icirc;le de Stagadon en mer d&rsquo;Iroise, un chantier de formation aux m&eacute;tiers de la mer, une base &agrave; l&rsquo;Aber Wrach ( Finist&egrave;re) et une autre &agrave; Paris aussi.<br />\r\n&nbsp;</p>\r\n\r\n<p>NOUVEAU : le bateau Rana II acquis en juin 2014 est bas&eacute; &agrave; Marseille et g&eacute;r&eacute; par une &eacute;quipe dynamique qui d&eacute;bute un programme sur zone : http://www.belespoir.com/la-flotte/la-flottille/<br />\r\nNous proposons la navigation, et notre savoir-faire en m&eacute;lange de gens.<br />\r\nA vous de nous proposer ce que vous voulez de votre richesse personnelle .<br />\r\nl&rsquo;objet de l&rsquo;AJD est double :<br />\r\n- Le programme de navigation du Bel Espoir et du Rara-Avis est ouvert &agrave; tous, dans la limite des places disponibles, moyennant une participation aux frais de fonctionnement.<br />\r\n- Le chantier accueille des jeunes majeurs pour un cycle d&rsquo;initiation aux m&eacute;tiers de la mer. Ils sont r&eacute;mun&eacute;r&eacute;s par des organismes publics, aupr&egrave;s desquels l&rsquo;AJD est conventionn&eacute;e.<br />\r\nL&rsquo;association est financ&eacute;e d&rsquo;une part par des dons priv&eacute;s, d&rsquo;autre part par les participations que nous demandons pour embarquer.<br />\r\nLes seize membres de son Conseil d&rsquo;Administration sont d&rsquo;&acirc;ges et d&rsquo;exp&eacute;riences tr&egrave;s divers, et nous tenons &agrave; leur renouvellement r&eacute;gulier pour souffler du vent dans les voiles. Philippe Rossigneux, patron d&rsquo;un chantier naval, en est l&rsquo;actuel Pr&eacute;sident.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>',0,1,0),(4,1,5,'L\'île de Stagadon','<h3>L&#39;&icirc;le de Stagadon</h3>\r\n\r\n<p>Stagadon, ce sont quatre hectares &eacute;merg&eacute;s au milieu des rochers, &agrave; c&ocirc;t&eacute; du phare de l&rsquo;Ile Vierge, &agrave; l&rsquo;entr&eacute;e de l&rsquo;Aber-Wrach, l&rsquo;un des rares refuges de la c&ocirc;te dangereuse du Nord Finist&egrave;re.<br />\r\nDepuis la plage en arc de cercle, la mer y prend souvent des transparences tropicales.<br />\r\nA deux milles de la c&ocirc;te, il ne faut pas croire pour autant que cette petite &icirc;le est d&rsquo;un acc&egrave;s facile. S&rsquo;y rendre est une aventure. Il y a sur la route des rochers coupants comme des scalpels et des courants compliqu&eacute;s. C&rsquo;est pourquoi elle est un peu magique.<br />\r\nElle est habitable, et ouverte &agrave; tous, comme nos bateaux</p>',0,1,1),(20,1,21,'test Mauricio','<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>',0,1,0);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Association');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_group`
--

DROP TABLE IF EXISTS `fos_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_group`
--

LOCK TABLES `fos_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user`
--

DROP TABLE IF EXISTS `fos_user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_C560D761C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user`
--

LOCK TABLES `fos_user_user` WRITE;
/*!40000 ALTER TABLE `fos_user_user` DISABLE KEYS */;
INSERT INTO `fos_user_user` VALUES (1,'admintest','admintest','admin@test.com','admin@test.com',1,'wPYnFZmUsiU11OXg39OQHU5ACCY2RWkJ9fZJzGC.Erc','NUEzghbWoPDTrkiTXHfAnZwqmnM1tj9+tL+Y79gcRyd0nN/Ly1cnqsEFrtIYGZlY3T6xCP0LerUM1rIkV9CBWg==','2017-12-01 12:08:49',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-12-01 11:54:12','2017-12-01 12:08:49',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(2,'abdou','abdou','abdou@test.com','abdou@test.com',1,'5Pz5kc51SmXYtEAMKKcsEN45P7FW8aHT.Kkpl5i4Rgs','w4p14ABzeRVFry8BhRsA8+yRKjllTV5kie+RBzOx6ja/lISKp23kP3YKmZSwiYC7R4ofcInL49SmOUisH5o7jQ==','2017-12-01 12:02:49',NULL,NULL,'a:0:{}','2017-12-01 12:02:49','2017-12-01 12:02:49',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(5,'adminAbdou','adminabdou','adminAbdou@test.com','adminabdou@test.com',1,'mD0u1xNTBfXkIYGvMQgXD//8IK1XDZS2MtT/ir8lrjg','jfd807ZIK+lTEAwdP8y5pAvrDRS4YVgm1KtVBdNea/1i7VoCvtp7LsPYEke3YYn58oxnG7QNBFoIoHto0Su2bw==','2017-12-01 12:43:56',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-12-01 12:43:34','2017-12-01 12:43:56',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL);
/*!40000 ALTER TABLE `fos_user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user_group`
--

DROP TABLE IF EXISTS `fos_user_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`),
  CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user_group`
--

LOCK TABLES `fos_user_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__gallery`
--

DROP TABLE IF EXISTS `media__gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__gallery`
--

LOCK TABLES `media__gallery` WRITE;
/*!40000 ALTER TABLE `media__gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__gallery_media`
--

DROP TABLE IF EXISTS `media__gallery_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__gallery_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  KEY `IDX_80D4C541EA9FDD75` (`media_id`),
  CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__gallery_media`
--

LOCK TABLES `media__gallery_media` WRITE;
/*!40000 ALTER TABLE `media__gallery_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__gallery_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__media`
--

DROP TABLE IF EXISTS `media__media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__media`
--

LOCK TABLES `media__media` WRITE;
/*!40000 ALTER TABLE `media__media` DISABLE KEYS */;
INSERT INTO `media__media` VALUES (2,'assoc_img_1.jpg',NULL,0,'sonata.media.provider.image',1,'00cf6f7687437091301c55d1cbecf4a91b41f6a3.jpeg','{\"filename\":\"assoc_img_1.jpg\"}',560,843,NULL,'image/jpeg',353450,NULL,NULL,'default',NULL,NULL,NULL,NULL,'2017-11-27 12:34:38','2017-11-27 12:34:38'),(3,'assoc_img_2.jpg',NULL,0,'sonata.media.provider.image',1,'2fc816525121eefd96341b610a941434f310eaee.jpeg','{\"filename\":\"assoc_img_2.jpg\"}',718,479,NULL,'image/jpeg',116864,NULL,NULL,'default',NULL,NULL,NULL,NULL,'2017-11-27 12:35:38','2017-11-27 12:35:38'),(4,'assoc_img_3.jpg',NULL,0,'sonata.media.provider.image',1,'a9cb0094f7abd5696aca91fbfd96c46b30028cd1.jpeg','{\"filename\":\"assoc_img_3.jpg\"}',718,478,NULL,'image/jpeg',105025,NULL,NULL,'default',NULL,NULL,NULL,NULL,'2017-11-27 12:36:08','2017-11-27 12:36:08'),(5,'assoc_img_4.jpg',NULL,0,'sonata.media.provider.image',1,'4cb1c1554dc7989bcfcb7feec948eb89f3396f5c.jpeg','{\"filename\":\"assoc_img_4.jpg\"}',718,536,NULL,'image/jpeg',141222,NULL,NULL,'default',NULL,NULL,NULL,NULL,'2017-11-27 12:36:46','2017-11-27 12:36:46'),(21,'images.jpg',NULL,0,'sonata.media.provider.image',1,'6b774422ad3029b01cf358d13e9ae646b98cc3fe.jpeg','{\"filename\":\"images.jpg\"}',225,225,NULL,'image/jpeg',5403,NULL,NULL,'default',NULL,NULL,NULL,NULL,'2017-11-29 09:24:51','2017-11-29 09:24:51');
/*!40000 ALTER TABLE `media__media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_custom_user_group_association_table_name`
--

DROP TABLE IF EXISTS `my_custom_user_group_association_table_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_custom_user_group_association_table_name` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_D1C9A4DCA76ED395` (`user_id`),
  KEY `IDX_D1C9A4DCFE54D947` (`group_id`),
  CONSTRAINT `FK_D1C9A4DCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D1C9A4DCFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_custom_user_group_association_table_name`
--

LOCK TABLES `my_custom_user_group_association_table_name` WRITE;
/*!40000 ALTER TABLE `my_custom_user_group_association_table_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_custom_user_group_association_table_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyage`
--

DROP TABLE IF EXISTS `voyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voyage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_depart` datetime NOT NULL,
  `date_arrivee` datetime NOT NULL,
  `prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `bateau_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F9D8955A9706509` (`bateau_id`),
  CONSTRAINT `FK_3F9D8955A9706509` FOREIGN KEY (`bateau_id`) REFERENCES `bateau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (2,'Brest > Martinique (Lisbonne, Madère, Canaries, Cap Vert)','2018-01-24 00:00:00','2018-03-10 00:00:00','1900 €',1,1),(3,'Martinique > Grenadines > Martinique (Bequia, Mayreau, Tobago Cays, St Vincent, Ste Lucie)','2018-03-29 00:00:00','2018-04-07 00:00:00','600 €',1,1),(4,'Martinique > Grenadines > Martinique (Bequia, Mayreau, Tobago Cays, St Vincent, Ste Lucie)','2018-04-14 00:00:00','2018-04-24 00:00:00','550€',1,1),(5,'Martinique > Guadeloupe (Grande Anse d’Arlet > Rivière Sens)','2018-04-24 00:00:00','2017-11-25 00:00:00','90€',1,1),(6,'Guadeloupe (Rivière Sens) > Les Saintes, Dominique > Guadeloupe (Rivière Sens)','2018-04-26 00:00:00','2018-04-29 00:00:00','210 €',1,1),(7,'Guadeloupe (Deshaies) > Aber Wrac’h (Possibilité d’embarquer à St Martin, le 13/05/2018)','2018-05-09 00:00:00','2018-06-26 00:00:00','1900 €',1,1),(8,'test','2017-11-16 00:00:00','2018-03-16 00:00:00','1822 €',1,1),(9,'yvon','2017-11-07 00:00:00','2017-12-08 00:00:00','1200 €',1,1);
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 13:46:28
