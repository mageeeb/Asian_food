-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 05, 2024 at 08:30 AM
-- Server version: 10.5.23-MariaDB
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magib_recettes`
--
CREATE DATABASE IF NOT EXISTS `magib_recettes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `magib_recettes`;

-- --------------------------------------------------------

--
-- Table structure for table `mr_categories`
--

CREATE TABLE `mr_categories` (
  `categ_id` tinyint(3) UNSIGNED NOT NULL,
  `categ_name` varchar(128) NOT NULL,
  `categ_desc` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mr_comments`
--

CREATE TABLE `mr_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` smallint(6) NOT NULL,
  `comment_user` varchar(128) NOT NULL DEFAULT 'guest',
  `comment_desc` text NOT NULL,
  `comment_stat` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mr_ingredients`
--

CREATE TABLE `mr_ingredients` (
  `ing_id` smallint(5) UNSIGNED NOT NULL,
  `ing_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mr_ingredients`
--

INSERT INTO `mr_ingredients` (`ing_id`, `ing_name`) VALUES
(5, 'Carotte'),
(1, 'Farine'),
(2, 'Oeuf'),
(3, 'Oignon'),
(4, 'Poivron Rouge');

-- --------------------------------------------------------

--
-- Table structure for table `mr_recipes`
--

CREATE TABLE `mr_recipes` (
  `recipe_id` tinyint(3) UNSIGNED NOT NULL,
  `recipe_name` varchar(128) NOT NULL,
  `recipe_slug` varchar(128) NOT NULL,
  `recipe_desc` text NOT NULL,
  `recipe_recipe` text NOT NULL,
  `recipe_img` varchar(255) NOT NULL,
  `recipe_img_sm` varchar(255) DEFAULT NULL,
  `recipe_img_side` varchar(255) DEFAULT NULL,
  `recipe_vis` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mr_recipes`
--

INSERT INTO `mr_recipes` (`recipe_id`, `recipe_name`, `recipe_slug`, `recipe_desc`, `recipe_recipe`, `recipe_img`, `recipe_img_sm`, `recipe_img_side`, `recipe_vis`) VALUES
(1, 'First New Recipe', 'first-new-recipe', 'Isn\'t this fun? <p onlick>', '\" placeholder=\"Just wonderful <p onlick=\"kjhk>\" rows=\"2\" cols=\"50\">Just wonderful <p onlick=\"kjhk>', 'bing', 'bam', 'basta', 1),
(2, 'yyyy', 'yyyy', 'yyy', 'yyy', 'y', 'y', 'y', 1),
(4, 'tesdtydféç (((?', 'tesdtydfec-____qm_', 'dfgg', '<h1>Hi Greg</h1>', 'sqdsq', 'sqd', 'sqd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mr_rec_has_cat`
--

CREATE TABLE `mr_rec_has_cat` (
  `rec_has_id` tinyint(3) UNSIGNED NOT NULL,
  `cat_has_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mr_rec_has_ing`
--

CREATE TABLE `mr_rec_has_ing` (
  `rec_uses_id` tinyint(3) UNSIGNED NOT NULL,
  `ing_uses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mr_rec_has_ing`
--

INSERT INTO `mr_rec_has_ing` (`rec_uses_id`, `ing_uses_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mr_users`
--

CREATE TABLE `mr_users` (
  `user_id` tinyint(3) UNSIGNED NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_permission` tinyint(3) UNSIGNED NOT NULL DEFAULT 10 COMMENT '10 -> Read Only\r\n20 -> Read and Write\r\n30 -> Read, Write, Update\r\n100 -> Admin\r\n255 -> SuperAdmin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mr_users`
--

INSERT INTO `mr_users` (`user_id`, `user_name`, `user_email`, `user_pwd`, `user_permission`) VALUES
(1, 'Lee', 'leerlandais@gmail.com', '$2y$10$tCQelwpJylVA.2qVR.rzReWgRcmNob5U4xZ65K5WAtMpOUiu.TsUu', 255),
(2, 'Anthony', 'anthony.arnone@cf2000.onmicrosoft.com', '$2y$10$zHFG13UlmONFf2N3jivKFuKJRUhmQFSKn.f5nhFoFXIjxgvtH2xiu', 30),
(5, 'Guillaume Baillieux', 'guillaumebaillieux88@gmail.com', '$2y$10$0EO9eu4eiDG8guah/UBB7uj3wmenjQC7YbdrbZfYfcq/hhuUjSS42', 50),
(6, 'magib', 'magib.sall@cf2m.be', '$2y$10$pbcrrWJ2r3s.ERxwm3meH.037wvphxtsc5LBcz4pGPsQoSmmYRNQ.', 100),
(7, 'arpaci', 'arpacie300@gmail.com', '$2y$10$JU3JQs5xo/QxOAIFI97u6.Gdz4Ct9CgbR12aYYkwzqNB6q3Hrpi0C', 10),
(8, 'Baris', 'snake4367@gmail.com', '$2y$10$j0L0hzfDK0Fb5XM9S3XAt.ZHCStsCOD4jIOxaTd3loxk7Q09Bagca', 10),
(9, 'Tevin', 'eliyabofonatevin@gmail.com', '$2y$10$jh1pJ1w6csj0uOg3TTR9k.N8ApAwyhhoUKIIKdNZ0PPR/CSZhgGky', 10),
(10, 'erhan', 'erhan@hotmail.com', '$2y$10$rScYk30JyQ//KMaXSNQ1o.oE24bTVTZTJkb8abQ1bVS17RMjKyjgu', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mr_categories`
--
ALTER TABLE `mr_categories`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indexes for table `mr_comments`
--
ALTER TABLE `mr_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `mr_ingredients`
--
ALTER TABLE `mr_ingredients`
  ADD PRIMARY KEY (`ing_id`),
  ADD UNIQUE KEY `ing_name` (`ing_name`);

--
-- Indexes for table `mr_recipes`
--
ALTER TABLE `mr_recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD UNIQUE KEY `recipe_name` (`recipe_name`);

--
-- Indexes for table `mr_rec_has_cat`
--
ALTER TABLE `mr_rec_has_cat`
  ADD PRIMARY KEY (`rec_has_id`,`cat_has_id`);

--
-- Indexes for table `mr_rec_has_ing`
--
ALTER TABLE `mr_rec_has_ing`
  ADD PRIMARY KEY (`rec_uses_id`,`ing_uses_id`);

--
-- Indexes for table `mr_users`
--
ALTER TABLE `mr_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mr_categories`
--
ALTER TABLE `mr_categories`
  MODIFY `categ_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mr_comments`
--
ALTER TABLE `mr_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mr_ingredients`
--
ALTER TABLE `mr_ingredients`
  MODIFY `ing_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mr_recipes`
--
ALTER TABLE `mr_recipes`
  MODIFY `recipe_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mr_users`
--
ALTER TABLE `mr_users`
  MODIFY `user_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mr_rec_has_cat`
--
ALTER TABLE `mr_rec_has_cat`
  ADD CONSTRAINT `fkrecid` FOREIGN KEY (`rec_has_id`) REFERENCES `mr_recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mr_rec_has_ing`
--
ALTER TABLE `mr_rec_has_ing`
  ADD CONSTRAINT `fkingid` FOREIGN KEY (`rec_uses_id`) REFERENCES `mr_recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
