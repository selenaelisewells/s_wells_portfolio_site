-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 06, 2020 at 02:28 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_featured_type`
--

DROP TABLE IF EXISTS `tbl_featured_type`;
CREATE TABLE IF NOT EXISTS `tbl_featured_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_featured_type`
--

INSERT INTO `tbl_featured_type` (`id`, `type`) VALUES
(1, 'video'),
(2, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_linking_project_tools`
--

DROP TABLE IF EXISTS `tbl_linking_project_tools`;
CREATE TABLE IF NOT EXISTS `tbl_linking_project_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_linking_project_tools`
--

INSERT INTO `tbl_linking_project_tools` (`id`, `project_id`, `tool_id`) VALUES
(1, 1, 4),
(2, 1, 3),
(3, 2, 1),
(4, 2, 2),
(5, 2, 3),
(6, 2, 4),
(7, 2, 5),
(8, 2, 6),
(9, 2, 7),
(10, 2, 9),
(11, 3, 2),
(12, 4, 2),
(13, 4, 1),
(14, 4, 3),
(15, 5, 16),
(16, 5, 1),
(17, 5, 3),
(18, 5, 2),
(19, 6, 1),
(20, 6, 2),
(21, 6, 6),
(22, 6, 7),
(23, 6, 16),
(24, 2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_linking_project_type`
--

DROP TABLE IF EXISTS `tbl_linking_project_type`;
CREATE TABLE IF NOT EXISTS `tbl_linking_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_linking_project_type`
--

INSERT INTO `tbl_linking_project_type` (`id`, `project_id`, `type_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 2, 2),
(4, 2, 4),
(5, 3, 5),
(6, 4, 4),
(7, 4, 5),
(8, 4, 3),
(9, 5, 1),
(10, 5, 3),
(11, 5, 4),
(12, 6, 1),
(13, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

DROP TABLE IF EXISTS `tbl_projects`;
CREATE TABLE IF NOT EXISTS `tbl_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `teaser_image` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `feature_image` varchar(100) NOT NULL,
  `feature_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `name`, `description`, `teaser_image`, `content`, `feature_image`, `feature_type`) VALUES
(1, 'Sportsnet Intro', 'A Sportnet intro video created for Monday night football. Everything was created using Cinema4D and After Effects.', 'sportsnet.png', '', 'sportsnet.mp4', 1),
(5, 'A.T. Financial Group Inc. Site Redesign', 'I worked as the designer for a site redesign for an insurance company. They wanted to modernize their site and make it more appealing to a younger demographic. I created the full site design and a promo video for them with the help of two developers who wrote the code.', 'atf.png', '', 'atf.png', 2),
(6, 'Balmer\'s Peak', 'A website created for a mockup brew-pub. Worked with branding, logo design, and front-end development to create the site. All of the banner photos were shot and edited by me as well.', 'balmer.png', '', 'balmer.png', 2),
(2, 'Balla Beer', 'This is a mashup branding exercise between two very different products, beer, and body powder. The two brands that I mashed together were Alexander Keith\'s beer and Balla, body powder for men. A full site was designed as well as advertisements and a promo video.', 'balla.png', '', 'balla.mp4', 1),
(3, 'Flower Head', 'This illustration was created by sketching out my design on paper and then taking the image into illustrator. Gradient mesh and custom strokes were used to get the illustrative style I wanted.', 'flowerhead.png', '', 'flowerhead.png', 2),
(4, 'Ceci Cosmetics', 'This is a complete brand design created for an imaginary cosmetics company. Package design, logo design, and video editing was all a part of this fun project. ', 'ceci.png', '', 'ceci.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider_images`
--

DROP TABLE IF EXISTS `tbl_slider_images`;
CREATE TABLE IF NOT EXISTS `tbl_slider_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `image_path` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_slider_images`
--

INSERT INTO `tbl_slider_images` (`id`, `project_id`, `image_path`) VALUES
(1, 1, 'sportsnet-1.jpg'),
(2, 1, 'sportsnet-2.jpg'),
(9, 5, 'atf-2.png'),
(8, 5, 'atf-1.png'),
(3, 1, 'sportsnet-3.jpg'),
(4, 1, 'sportsnet-4.jpg'),
(5, 1, 'sportsnet-5.png'),
(10, 5, 'atf-3.png'),
(11, 5, 'atf-4.png'),
(12, 5, 'atf-5.png'),
(13, 6, 'ballmer-1.png'),
(14, 6, 'ballmer-2.png'),
(15, 6, 'ballmer-3.png'),
(16, 6, 'ballmer-4.png'),
(17, 6, 'ballmer-5.png'),
(18, 2, 'balla-5.png'),
(19, 2, 'balla-1.png'),
(20, 2, 'balla-2.png'),
(21, 2, 'balla-3.png'),
(22, 2, 'balla-4.png'),
(23, 3, 'flower-1.png'),
(24, 3, 'flower-2.png'),
(25, 3, 'flower-3.png'),
(26, 3, 'flower-4.png'),
(27, 3, 'flower-5.png'),
(28, 4, 'ceci-1.png'),
(29, 4, 'ceci-2.png'),
(30, 4, 'ceci-3.png'),
(31, 4, 'ceci-4.png'),
(32, 4, 'ceci-5.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tools`
--

DROP TABLE IF EXISTS `tbl_tools`;
CREATE TABLE IF NOT EXISTS `tbl_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tools`
--

INSERT INTO `tbl_tools` (`id`, `name`) VALUES
(1, 'Photoshop'),
(2, 'Illustrator'),
(3, 'After Effects'),
(4, 'Cinema4D'),
(5, 'InDesign'),
(6, 'HTML'),
(7, 'CSS'),
(8, 'SASS'),
(9, 'Javascript'),
(10, 'PHP'),
(11, 'JSON'),
(12, 'Vue.js'),
(13, '3dsMax'),
(14, 'Mudbox'),
(15, 'Unity'),
(16, 'Xd');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_types`
--

DROP TABLE IF EXISTS `tbl_types`;
CREATE TABLE IF NOT EXISTS `tbl_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_types`
--

INSERT INTO `tbl_types` (`id`, `name`) VALUES
(1, 'Website'),
(2, 'Advertising '),
(3, 'Video'),
(4, 'Branding'),
(5, 'Illustration');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
