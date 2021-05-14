-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 27 Janvier 2021 à 14:35
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `geaid71`
--

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

CREATE TABLE `alerte` (
  `IdAlerte` int(11) NOT NULL,
  `IdUti` int(11) NOT NULL,
  `Date` date NOT NULL,
  `DebutPlage` time NOT NULL,
  `FinPlage` time NOT NULL,
  `HeurePointage` time NOT NULL,
  `Message` varchar(300) DEFAULT NULL,
  `LibStatut` varchar(20) NOT NULL DEFAULT 'En cours'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `conges`
--

CREATE TABLE `conges` (
  `IdConges` int(11) NOT NULL,
  `IdUti` int(11) NOT NULL,
  `DateDeb` date NOT NULL,
  `DateFin` date NOT NULL,
  `IdPeriode` int(11) NOT NULL,
  `Motif` varchar(300) NOT NULL,
  `LibStatut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `oubli`
--

CREATE TABLE `oubli` (
  `IdOubli` int(16) NOT NULL,
  `IdUti` int(16) NOT NULL,
  `Commentaire` varchar(300) NOT NULL,
  `Date` date NOT NULL,
  `HeureArrivee` time NOT NULL,
  `HeureDepart` time NOT NULL,
  `Duree` time NOT NULL,
  `LibStatut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE `periode` (
  `IdPeriode` int(11) NOT NULL,
  `LibPeriode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `periode`
--

INSERT INTO `periode` (`IdPeriode`, `LibPeriode`) VALUES
(1, 'Matin'),
(2, 'Apr&egraves-Midi'),
(3, 'Toute la journ&eacutee'),
(4, 'De tel &agrave tel jour');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE `planning` (
  `IdPlanning` int(11) NOT NULL,
  `IdUti` int(11) NOT NULL,
  `Pointage1` varchar(20) DEFAULT NULL,
  `Pointage2` varchar(20) DEFAULT NULL,
  `Pointage3` varchar(20) DEFAULT NULL,
  `TempsMarge` time NOT NULL DEFAULT '01:00:00',
  `Date` date NOT NULL,
  `DebutPlage1` time DEFAULT NULL,
  `FinPlage1` time DEFAULT NULL,
  `DebutPlage2` time DEFAULT NULL,
  `FinPlage2` time DEFAULT NULL,
  `DebutPlage3` time DEFAULT NULL,
  `FinPlage3` time DEFAULT NULL,
  `Statut` varchar(20) NOT NULL,
  `StatutAbs` varchar(20) NOT NULL DEFAULT 'En cours',
  `Total` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

CREATE TABLE `pointage` (
  `Id` int(11) NOT NULL,
  `IdUti` int(11) NOT NULL,
  `NumPointage` int(11) NOT NULL,
  `DateDeb` datetime DEFAULT NULL,
  `DateFin` datetime DEFAULT NULL,
  `TpsTravail` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `NumRole` int(16) NOT NULL,
  `LibRole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`NumRole`, `LibRole`) VALUES
(1, 'Employ&eacutes'),
(2, 'Sup&eacuterieurs'),
(3, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `IdStatut` int(11) NOT NULL,
  `LibStatut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `statut`
--

INSERT INTO `statut` (`IdStatut`, `LibStatut`) VALUES
(1, 'En cours'),
(2, 'Accept&eacute'),
(3, 'Refus&eacute');

-- --------------------------------------------------------

--
-- Structure de la table `tempsdetravail`
--

CREATE TABLE `tempsdetravail` (
  `IdTra` int(11) NOT NULL,
  `IdUti` int(11) NOT NULL,
  `Semaine` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `TpsTravailJ` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IdUti` int(16) NOT NULL,
  `NumRole` int(16) NOT NULL DEFAULT '1',
  `Superieur` varchar(100) DEFAULT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Mdp` varchar(200) NOT NULL,
  `Mail` varchar(150) NOT NULL,
  `Tel` varchar(15) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `CP` char(5) NOT NULL,
  `Ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`IdUti`, `NumRole`, `Superieur`, `Nom`, `Prenom`, `Mdp`, `Mail`, `Tel`, `Adresse`, `CP`, `Ville`) VALUES
(1, 1, 'hgfd hfgd', 'Durand', 'Benoit', 'emp', 'b.durand@gmail.com', '0612345678', '5 rue des oiseaux', '71230', 'Le Creusot'),
(2, 2, 'Dubois Jean', 'Prieux', 'Pascal', 'sup', 'p.prieux@gmail.com', '0698765432', '6 rue des oiseaux', '71230', 'Le Creusot'),
(3, 3, '', 'Dubois', 'Jean', 'admin', 'admin@gmail.com', '0611223344', '7 rue des oiseaux', '71230', 'Le Creusot'),
(4, 1, 'Prieux Pascal', 'Teron', 'Jeanne', '$2y$12$ILbSenl0js3EbEWKgFanpujXRzQV9sIeS0WDqMPuS1w/1ZTIOrhLG', 'j.teron@gmail.com', '0626262626', '61 rue Anatole France', '71230', 'Le Creusot');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD PRIMARY KEY (`IdAlerte`),
  ADD KEY `IdUti` (`IdUti`);

--
-- Index pour la table `conges`
--
ALTER TABLE `conges`
  ADD PRIMARY KEY (`IdConges`),
  ADD KEY `IdUti` (`IdUti`),
  ADD KEY `IdStatut` (`LibStatut`),
  ADD KEY `IdPeriode` (`IdPeriode`);

--
-- Index pour la table `oubli`
--
ALTER TABLE `oubli`
  ADD PRIMARY KEY (`IdOubli`),
  ADD KEY `IdUti` (`IdUti`);

--
-- Index pour la table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`IdPeriode`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`IdPlanning`),
  ADD KEY `IdUti` (`IdUti`);

--
-- Index pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdUti` (`IdUti`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`NumRole`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`IdStatut`);

--
-- Index pour la table `tempsdetravail`
--
ALTER TABLE `tempsdetravail`
  ADD PRIMARY KEY (`IdTra`),
  ADD KEY `IdUti` (`IdUti`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IdUti`),
  ADD KEY `NumRole` (`NumRole`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `alerte`
--
ALTER TABLE `alerte`
  MODIFY `IdAlerte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `conges`
--
ALTER TABLE `conges`
  MODIFY `IdConges` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `oubli`
--
ALTER TABLE `oubli`
  MODIFY `IdOubli` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `planning`
--
ALTER TABLE `planning`
  MODIFY `IdPlanning` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT pour la table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `tempsdetravail`
--
ALTER TABLE `tempsdetravail`
  MODIFY `IdTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `IdUti` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD CONSTRAINT `alerte_ibfk_1` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`);

--
-- Contraintes pour la table `conges`
--
ALTER TABLE `conges`
  ADD CONSTRAINT `conges_ibfk_2` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`),
  ADD CONSTRAINT `conges_ibfk_3` FOREIGN KEY (`IdPeriode`) REFERENCES `periode` (`IdPeriode`);

--
-- Contraintes pour la table `oubli`
--
ALTER TABLE `oubli`
  ADD CONSTRAINT `oubli_ibfk_1` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`);

--
-- Contraintes pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD CONSTRAINT `pointage_ibfk_1` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`);

--
-- Contraintes pour la table `tempsdetravail`
--
ALTER TABLE `tempsdetravail`
  ADD CONSTRAINT `tempsdetravail_ibfk_1` FOREIGN KEY (`IdUti`) REFERENCES `utilisateur` (`IdUti`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`NumRole`) REFERENCES `role` (`NumRole`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
