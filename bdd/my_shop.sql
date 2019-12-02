-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 02 déc. 2019 à 19:21
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `my_shop`
--
CREATE DATABASE IF NOT EXISTS `my_shop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_shop`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `categories`
--

TRUNCATE TABLE `categories`;
--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `categorie`) VALUES
(1, 'Chill'),
(2, 'Dress code');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `genre`
--

TRUNCATE TABLE `genre`;
--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `type`) VALUES
(1, 'HOMME'),
(2, 'FEMME');

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

DROP TABLE IF EXISTS `marques`;
CREATE TABLE IF NOT EXISTS `marques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(255) NOT NULL,
  `img_marque` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `marques`
--

TRUNCATE TABLE `marques`;
--
-- Déchargement des données de la table `marques`
--

INSERT INTO `marques` (`id`, `marque`, `img_marque`) VALUES
(1, 'W.Y.A.D', 'img/wyad.png'),
(2, 'Frilivin', 'img/flv.png'),
(3, 'SM', 'img/sm.png');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_produit` varchar(255) NOT NULL,
  `prix` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `produits`
--

TRUNCATE TABLE `produits`;
--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `image_produit`, `prix`) VALUES
(1, 'Sneakers black', '• Basket urbaine minimaliste\r\n• Tige aspect cuir\r\n• Lacets plats\r\n• Renfort au talon\r\n\r\nTAILLE ET COUPE\r\n\r\nCe produit taille normalement\r\nPrenez votre taille habituelle\r\nLa paire photographiée est une taille 40\r\n\r\nCOMPOSITION\r\n\r\n', 'img/sneakers-black.jpg', '49.990'),
(2, 'Jeans chill', '• Jean slim finition délavée et usée\r\n• Fermeture par zip et bouton classique\r\n• Trois poches avant et deux poches arrière\r\n• Trous apparents sur l\'avant et sur les poches arrière\r\n• Bords effilés aspect usé au niveau des chevilles\r\n• Patch aspect cuir sur l\'arrière\r\n• Etiquette Frilivin certifiant l\'authenticité\r\n\r\nTAILLE ET COUPE\r\n\r\nCoupe slim\r\nTaille américaine\r\nCe produit taille normalement\r\nPrenez votre taille habituelle\r\nTaille du mannequin : 1m81\r\nLe modèle présenté est une taille 31\r\n\r\nCOMPOSITION ET ENTRETIEN\r\n\r\n73% Coton, 23% Polyester, 2% Viscose, 2% Elasthanne\r\nLavable en Machine à 30°', 'img/jeans-chill.jpg', '39.990'),
(3, 'T-shirt chill', 'T-shirt tricolore pour un style tendance\r\n• Col rond\r\n• Liserés ton sur ton sur les manches\r\n• Etiquette LBO certifiant l\'authenticité\r\n\r\nTAILLE ET COUPE\r\n\r\nCoupe classique\r\nCe produit taille normalement\r\nPrenez votre taille habituelle\r\nTaille du mannequin : 1m81\r\nLe modèle présenté est une taille M\r\n\r\nCOMPOSITION ET ENTRETIEN\r\n\r\n100% Coton\r\nLavable en Machine à 30°', 'img/tshirt-chill.jpg', '19.990');

-- --------------------------------------------------------

--
-- Structure de la table `produit_categorie`
--

DROP TABLE IF EXISTS `produit_categorie`;
CREATE TABLE IF NOT EXISTS `produit_categorie` (
  `produit` int(11) NOT NULL,
  `categorie` int(11) NOT NULL,
  PRIMARY KEY (`produit`,`categorie`),
  KEY `FK_PRODUIT_CATEGORIE_CATEGORIE` (`categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `produit_categorie`
--

TRUNCATE TABLE `produit_categorie`;
--
-- Déchargement des données de la table `produit_categorie`
--

INSERT INTO `produit_categorie` (`produit`, `categorie`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_genre`
--

DROP TABLE IF EXISTS `produit_genre`;
CREATE TABLE IF NOT EXISTS `produit_genre` (
  `produit` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  PRIMARY KEY (`produit`,`genre`),
  KEY `FK_PRODUIT_GENRE_MARQUES` (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `produit_genre`
--

TRUNCATE TABLE `produit_genre`;
--
-- Déchargement des données de la table `produit_genre`
--

INSERT INTO `produit_genre` (`produit`, `genre`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit_marque`
--

DROP TABLE IF EXISTS `produit_marque`;
CREATE TABLE IF NOT EXISTS `produit_marque` (
  `produit` int(11) NOT NULL,
  `marque` int(11) NOT NULL,
  PRIMARY KEY (`produit`,`marque`),
  KEY `FK_PRODUITS_MARQUES_MARQUES` (`marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tronquer la table avant d'insérer `produit_marque`
--

TRUNCATE TABLE `produit_marque`;
--
-- Déchargement des données de la table `produit_marque`
--

INSERT INTO `produit_marque` (`produit`, `marque`) VALUES
(1, 1),
(3, 2),
(2, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD CONSTRAINT `FK_PRODUIT_CATEGORIE_CATEGORIE` FOREIGN KEY (`categorie`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_PRODUIT_CATEGORIE_PRODUITS` FOREIGN KEY (`produit`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `produit_genre`
--
ALTER TABLE `produit_genre`
  ADD CONSTRAINT `FK_PRODUIT_GENRE_MARQUES` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_PRODUIT_GENRE_PRODUITS` FOREIGN KEY (`produit`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `produit_marque`
--
ALTER TABLE `produit_marque`
  ADD CONSTRAINT `FK_PRODUITS_MARQUES_MARQUES` FOREIGN KEY (`marque`) REFERENCES `marques` (`id`),
  ADD CONSTRAINT `FK_PRODUITS_MARQUES_PRODUITS` FOREIGN KEY (`produit`) REFERENCES `produits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
