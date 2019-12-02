-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 02 déc. 2019 à 18:22
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

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

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `marques` (
  `id` int(11) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `img_marque` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_produit` varchar(255) NOT NULL,
  `prix` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `produit_categorie` (
  `produit` int(11) NOT NULL,
  `categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_categorie`
--

INSERT INTO `produit_categorie` (`produit`, `categorie`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_genre`
--

CREATE TABLE `produit_genre` (
  `produit` int(11) NOT NULL,
  `genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_genre`
--

INSERT INTO `produit_genre` (`produit`, `genre`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_marque`
--

CREATE TABLE `produit_marque` (
  `produit` int(11) NOT NULL,
  `marque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_marque`
--

INSERT INTO `produit_marque` (`produit`, `marque`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 3),
(6, 2),
(7, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `marques`
--
ALTER TABLE `marques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
