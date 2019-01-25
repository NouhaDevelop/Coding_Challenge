-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 25 Janvier 2019 à 01:11
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pharmacy`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` int(255) NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20190114221405'),
('20190115004210'),
('20190116154745');

-- --------------------------------------------------------

--
-- Structure de la table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` int(255) NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `horaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanence` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `email`, `password`, `nom`, `adresse`, `tel`, `ville`, `code_postal`, `horaire`, `permanence`) VALUES
(10, 'Alkhattabi@gmail.com', '$2y$13$TEwzFUK3CTivYDuDBC1vIeOUl4y.B/Md7dUSZHYwqKfmthlnBarxa', 'Abdelkarim Al Khattabi', '272 Avenue Abdelkrim Al Khattabi, Rabat', 521477888, 'Rabat', NULL, NULL, 0),
(12, 'alhikma@gmail.com', '$2y$13$uNgolAsZJdswObzBbJpuCuvHmQim.dmgsuOkYDYFP0AYcsJS5wl0O', 'Al Hikma', '311 lotissement maghrib arabi d quartier maghrib arabi n 1 Kenitra', 537365924, 'Kenitra', NULL, NULL, 0),
(13, 'pharmacy@aswak.com', '$2y$13$IYzb1Ktzcbx.Er5jFUPqfeqnkE5WlC7mUSuK4svIt/pp3N1pe3yEu', 'Aswak Essalam', '2, C. Com. Aswak Assalam, Bir Rami, 14090, Kénitra 14000', 537376478, 'Kenitra', NULL, NULL, 0),
(14, 'jerada.ph@gmail.com', '$2y$13$cq3RV9mTiIw682NBvUFWUOWCeOacE37DF2R6.pBmLT.fxNAjHDTRO', 'Jerada', 'INEZGANE AIT MELLOUILE', 2147483647, 'AGADIR', NULL, NULL, 0),
(15, 'ph.libya@gmail.com', '$2y$13$8qq5rza9SHEDeOw97a6jjefwuVlIj0Qcpw.P7x/9yWDKFKhEaBMmm', 'Libya', 'N:12, Tripoli', 2147483647, 'Tripoli', NULL, NULL, 0),
(16, 'mimosas@gmail.com', '$2y$13$takm5lBvlmXNC18WYJIW.exY1Wi4k.XB7HDimHUy2DFeSTv3E6E3i', 'Mimosas', 'Avenue Mohamed V, Kenitra 14 000', 2147483647, 'Kenitra', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_pharmacie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` int(255) NOT NULL,
  `quantite` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `title`, `nom_pharmacie`, `categorie`, `image`, `prix`, `quantite`) VALUES
(8, 'Aspirine', 'Al Amana', 'Santé', 'c1ee862fe7fde9d1a9c47368b224084e.jpeg', 50, 1000),
(9, 'Crème hydratante Mixa', 'Abdelkarim Al Khattabi', 'Bébé', '3cdd353bf43ae5e910129c17d1c42c0e.jpeg', 100, 1000),
(10, 'Gel nettoyant Vichy', 'Al Hikma', 'Beauté', 'd1c2920809f810f16d667425739a135e.jpeg', 100, 5000),
(11, 'Doliprane', 'Abdelkarim Al Khattabi', 'Santé', '3109b2b330390c5379511475fa3fba47.jpeg', 20, 1568);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
