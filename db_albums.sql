SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_albums`
--

-- --------------------------------------------------------

--
-- Table structure for table `Albums`
--

CREATE TABLE `Albums` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `review` text NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `album_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Albums`
--
ALTER TABLE `Albums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Songs`
--
ALTER TABLE `Songs`
  ADD CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);

INSERT INTO `Users`(`name`, `password`, `role`) VALUES ('webadmin','$2y$10$480tQnUpv7QrZgkJLwS2MO73HPcSDrdMPIRBD/dC1Bk4jiI4rc9Uy','admin');

INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('milo j x bzrp','2023/10/9','asasdsd','milo j and bzrp','rap','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('oktubre','1985/10/9','asassddsd','patricio rey y sus redonditos de ricota','rock','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('In the court of the crimson king','1969/10/9','asasdsddsd','king crimson','progressive rock','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('ruido de lluvia en el bosque','2006/10/9','asaxdxdxdsdsd','henry macdonald','ambient','4');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('delicate steve','2022/10/9','asasdsdsfsd','steve delicate','r&b','3');

INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('FRUTO','2023/10/9','1');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('OTURF','2023/10/9','1');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('SIN MIC','2023/10/9','1');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Bzrp music session','2023/10/9','1');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('21st century schizoid man','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('THE COURT OF THE CRIMSON KING','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('epitaph','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('moonchild','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('POWER','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Jijiji','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('fuegos de oktubre','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('noticias de ayer','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('vamos los redo','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Ruido de lluvia en el bosque','2023/10/9','4');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Delicate steve','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('scooby galletas','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('outro','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('THE END','2023/10/9','5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
