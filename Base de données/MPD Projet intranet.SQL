-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 22 mars 2022 à 13:43
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aly_pronote`
--

-- --------------------------------------------------------

--
-- Structure de la table `bloc_heure`
--

DROP TABLE IF EXISTS `bloc_heure`;
CREATE TABLE IF NOT EXISTS `bloc_heure` (
                                            `id_heure` int(80) NOT NULL AUTO_INCREMENT,
                                            `jour` varchar(20) NOT NULL,
                                            `heure_debut` time(6) NOT NULL,
                                            `heure_fin` time(6) NOT NULL,
                                            `ref_salle` int(80) NOT NULL,
                                            `ref_prof` int(80) NOT NULL,
                                            `ref_matiere` int(80) NOT NULL,
                                            `ref_classe` int(80) NOT NULL,
                                            PRIMARY KEY (`id_heure`),
                                            KEY `fk_bloc_heure_salle` (`ref_salle`),
                                            KEY `fk_bloc_heure_matiere` (`ref_matiere`),
                                            KEY `fk_bloc_heure_classe` (`ref_classe`),
                                            KEY `fk_bloc_heure_prof` (`ref_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
                                        `id_classe` int(80) NOT NULL AUTO_INCREMENT,
                                        `specialite` varchar(20) NOT NULL,
                                        `option` varchar(10) NOT NULL,
                                        `nb_eleves` int(70) NOT NULL,
                                        PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `devoir`
--

DROP TABLE IF EXISTS `devoir`;
CREATE TABLE IF NOT EXISTS `devoir` (
                                        `id_devoir` int(80) NOT NULL AUTO_INCREMENT,
                                        `type` varchar(20) NOT NULL,
                                        `date_donnee` date NOT NULL,
                                        `date_rendu` date NOT NULL,
                                        `ref_prof` int(80) NOT NULL,
                                        `ref_eleves` int(80) NOT NULL,
                                        PRIMARY KEY (`id_devoir`),
                                        KEY `fk_devoir_prof` (`ref_prof`),
                                        KEY `fk_devoir_eleves` (`ref_eleves`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `direction`
--

DROP TABLE IF EXISTS `direction`;
CREATE TABLE IF NOT EXISTS `direction` (
                                           `id_direction` int(80) NOT NULL AUTO_INCREMENT,
                                           `nom` varchar(80) NOT NULL,
                                           `prenom` varchar(80) NOT NULL,
                                           `ville` varchar(20) NOT NULL,
                                           `cp` int(20) NOT NULL,
                                           `mail` varchar(20) NOT NULL,
                                           `mot_de_passe` varchar(20) NOT NULL,
                                           PRIMARY KEY (`id_direction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE IF NOT EXISTS `eleves` (
                                        `id_eleves` int(80) NOT NULL AUTO_INCREMENT,
                                        `nom` varchar(20) NOT NULL,
                                        `prenom` varchar(20) NOT NULL,
                                        `ville` varchar(20) NOT NULL,
                                        `cp` int(20) DEFAULT NULL,
                                        `mail` varchar(20) DEFAULT NULL,
                                        `mot_de_passe` varchar(20) DEFAULT NULL,
                                        `ref_classe` int(80) NOT NULL,
                                        PRIMARY KEY (`id_eleves`),
                                        KEY `fk_eleves_classe` (`ref_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
                                         `id_matiere` int(80) NOT NULL AUTO_INCREMENT,
                                         `nom_matière` varchar(80) NOT NULL,
                                         PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
                                      `id_prof` int(80) NOT NULL AUTO_INCREMENT,
                                      `nom` varchar(80) NOT NULL,
                                      `prenom` varchar(80) NOT NULL,
                                      `ville` varchar(20) NOT NULL,
                                      `cp` int(20) NOT NULL,
                                      `mail` varchar(20) NOT NULL,
                                      `mot_de_passe` varchar(20) NOT NULL,
                                      PRIMARY KEY (`id_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
                                       `id_salle` int(80) NOT NULL AUTO_INCREMENT,
                                       `num_salle` int(80) NOT NULL,
                                       PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bloc_heure`
--
ALTER TABLE `bloc_heure`
    ADD CONSTRAINT `fk_bloc_heure_classe` FOREIGN KEY (`ref_classe`) REFERENCES `classe` (`id_classe`),
    ADD CONSTRAINT `fk_bloc_heure_matiere` FOREIGN KEY (`ref_matiere`) REFERENCES `matiere` (`id_matiere`),
    ADD CONSTRAINT `fk_bloc_heure_prof` FOREIGN KEY (`ref_prof`) REFERENCES `prof` (`id_prof`),
    ADD CONSTRAINT `fk_bloc_heure_salle` FOREIGN KEY (`ref_salle`) REFERENCES `salle` (`id_salle`);

--
-- Contraintes pour la table `devoir`
--
ALTER TABLE `devoir`
    ADD CONSTRAINT `fk_devoir_eleves` FOREIGN KEY (`ref_eleves`) REFERENCES `eleves` (`id_eleves`),
    ADD CONSTRAINT `fk_devoir_prof` FOREIGN KEY (`ref_prof`) REFERENCES `prof` (`id_prof`);

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
    ADD CONSTRAINT `fk_eleves_classe` FOREIGN KEY (`ref_classe`) REFERENCES `classe` (`id_classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
