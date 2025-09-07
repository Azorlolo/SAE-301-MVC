-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 07 sep. 2025 à 11:08
-- Version du serveur : 8.2.0
-- Version de PHP : 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `epise`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `mdp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `login`, `mdp`) VALUES
(1, 'admin', '$2y$10$ba3zx5rYMhbwOS0151hwxuHfRLYPR.e3vxNlbJIX7JQ1KAj9HIfKG');

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `idArticles` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Texte` mediumtext CHARACTER SET utf8mb3,
  `Categorie` int NOT NULL,
  `Filtre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Stock` int NOT NULL,
  `Image` varchar(250) CHARACTER SET utf8mb3 NOT NULL,
  `Alt` varchar(250) CHARACTER SET utf8mb3 NOT NULL,
  PRIMARY KEY (`idArticles`),
  KEY `fk_Articles_Passions_idx` (`Categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`idArticles`, `Titre`, `Texte`, `Categorie`, `Filtre`, `Stock`, `Image`, `Alt`) VALUES
(1, 'Produit frais 1', 'Produit frais 1', 1, 'Produit frais', 0, 'Produit frais 1', 'Produit frais 1'),
(2, 'Conserves 1', 'Conserves 1', 1, 'Conserves', 582, 'Conserves 1', 'Conserves 1'),
(5, 'Article 1', 'Article 1', 4, 'Aucun', 0, 'Article 1', 'Article 1'),
(6, 'Article 2', 'Article 2', 4, 'Aucun', 0, 'Article 2', 'Article 2'),
(7, 'Annonce 3', 'Annonce 3', 4, 'Aucun', 0, 'Annonce 3', 'Annonce 3'),
(9, 'T-shirt', 'T-shirt noir', 2, 'T-shirt', 3, 'T-shirt 1', 'T-shirt noir'),
(10, 'Savon', 'Savon', 3, 'Savon', 3, 'Savon', 'Savon'),
(11, 'Surgelés', 'Surgelés', 1, 'Surgelés', 10, 'Surgelés', 'Surgelés'),
(12, 'Plat cuisiné', 'Plat cuisiné', 1, 'Plat cuisiné', 2, 'Plat cuisiné', 'Plat cuisiné'),
(13, 'Pâtes', 'Pâtes', 1, 'Pâtes', 15, 'Pâtes', 'Mon amour de toujour (des Pâtes)'),
(14, 'Riz', 'Riz', 1, 'Riz', 28, 'Riz', 'Riz'),
(15, 'Jean', 'Jean', 2, 'Pantalon', 2, 'Jean', 'Jean'),
(16, 'Shampoing', 'Shampoing', 3, 'Shampoing', 3, 'Shampoing', 'Shampoing'),
(17, 'Gel douche', 'Gel douche', 3, 'Gel douche', 14, 'Gel douche', 'Gel douche'),
(18, 'Dentifrice', 'Dentifrice', 3, 'Dentifrice', 26, 'Dentifrice', 'Dentifrice'),
(19, 'Crème hydratante', 'Crème hydratante', 3, 'Crème hydratante', 11, 'Crème hydratante', 'Crème hydratante'),
(20, 'Crème solaire', 'Crème solaire', 3, 'Crème solaire', 2, 'Crème solaire', 'Crème solaire'),
(21, 'Maquillage', 'Maquillage', 3, 'Maquillage', 8, 'Maquillage', 'Maquillage');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategories` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Informations` mediumtext CHARACTER SET utf8mb3,
  PRIMARY KEY (`idCategories`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategories`, `Titre`, `Informations`) VALUES
(1, 'Nourriture', 'De la nourriture en conserve, en surgelé, plat cuisinée et produit frais.'),
(2, 'Vêtement', 'Plusieurs vêtement de taille et de style diverse et varié.'),
(3, 'Produits d’hygiène', 'Plusieurs produit d\'hygiène comme du savon, du dentifrice, des linguettes mais aussi des produit de beauté.'),
(4, 'Annonces', 'Les dernières information à propos de Épise.');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `adherent` tinyint(1) NOT NULL,
  `mail` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mdp` text NOT NULL,
  `token` text NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `adherent`, `mail`, `mdp`, `token`) VALUES
(30, 'truc', 'muche', 0, 'test1@gmail.com', '$2y$10$lt5otVMlLx72W/XLTSidGOwjhMFIETOU0gVRN5fY8Js3dN1CWVwEG', '26aeb5bfa45316e65954ad010d60d4366a6235244c51800f6e1c25b894a89437'),
(31, 'Cavaillé', 'Michel', 0, 'truc@gmail.com', '$2y$10$oiEeZupTjLe9fiukE340OuqbBPSl05KmgJrvN9ZJaaMDGpClWEnFa', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
