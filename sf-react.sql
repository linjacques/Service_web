-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 13 déc. 2023 à 11:01
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sf-react`
--

-- --------------------------------------------------------

--
-- Structure de la table `dicline`
--

CREATE TABLE `dicline` (
  `id` int NOT NULL,
  `Key` varchar(40) DEFAULT NULL,
  `valeur` varchar(40) DEFAULT NULL,
  `dictid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dicline`
--

INSERT INTO `dicline` (`id`, `Key`, `valeur`, `dictid`) VALUES
(2, 'bonjour', 'hola', 5),
(3, 'bonjour', 'lol', 6),
(4, 'A', '.-', 7),
(5, 'B', '-...', 7),
(6, 'C', '-.-.', 7),
(7, 'D', '-..', 7),
(8, 'E', '.', 7),
(9, 'F', '..-.', 7),
(10, 'G', '--.', 7),
(11, 'H', '....', 7),
(12, 'I', '..', 7),
(13, 'J', '.---', 7),
(14, 'K', '-.-', 7),
(15, 'L', '.-..', 7),
(16, 'M', '--', 7),
(17, 'N', '-.', 7),
(18, 'O', '---', 7),
(19, 'P', '.--.', 7),
(20, 'Q', '--.-', 7),
(21, 'R', '.-.', 7),
(22, 'S', '...', 7),
(23, 'T', '-', 7),
(24, 'U', '..-', 7),
(25, 'V', '...-', 7),
(26, 'W', '.--', 7),
(27, 'X', '-..-', 7),
(28, 'Y', '-.--', 7),
(29, 'Z', '--..', 7);

-- --------------------------------------------------------

--
-- Structure de la table `dict`
--

CREATE TABLE `dict` (
  `dictid` int NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dict`
--

INSERT INTO `dict` (`dictid`, `name`) VALUES
(2, 'franglais'),
(3, 'franglais'),
(4, 'franglais'),
(5, 'spanish'),
(6, 'lol'),
(7, 'morse');

-- --------------------------------------------------------

--
-- Structure de la table `trads`
--

CREATE TABLE `trads` (
  `id` int NOT NULL,
  `word` varchar(40) DEFAULT NULL,
  `dictionnary` varchar(40) DEFAULT NULL,
  `trad` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `trads`
--

INSERT INTO `trads` (`id`, `word`, `dictionnary`, `trad`) VALUES
(1, 'bonjour', 'morse', '-...----..------..-.-.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `dicline`
--
ALTER TABLE `dicline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dictid` (`dictid`),
  ADD KEY `ix_dicline_id` (`id`);

--
-- Index pour la table `dict`
--
ALTER TABLE `dict`
  ADD PRIMARY KEY (`dictid`);

--
-- Index pour la table `trads`
--
ALTER TABLE `trads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_trads_id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dicline`
--
ALTER TABLE `dicline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `dict`
--
ALTER TABLE `dict`
  MODIFY `dictid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `trads`
--
ALTER TABLE `trads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dicline`
--
ALTER TABLE `dicline`
  ADD CONSTRAINT `dicline_ibfk_1` FOREIGN KEY (`dictid`) REFERENCES `dict` (`dictid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
