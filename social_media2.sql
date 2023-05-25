-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 25 May 2023, 17:42:04
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `social_media2`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_post_id_fk` (`post_id`),
  KEY `comment_user_id_fk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friend`
--

DROP TABLE IF EXISTS `friend`;
CREATE TABLE IF NOT EXISTS `friend` (
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  PRIMARY KEY (`sender_id`,`receiver_id`) USING BTREE,
  KEY `friend_receiver_id_fk` (`receiver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
CREATE TABLE IF NOT EXISTS `friend_request` (
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  PRIMARY KEY (`receiver_id`,`sender_id`) USING BTREE,
  KEY `sender_id_fk` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `receiver_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notification_receiver_fk` (`receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `plike`
--

DROP TABLE IF EXISTS `plike`;
CREATE TABLE IF NOT EXISTS `plike` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `like_user_id_fk` (`user_id`),
  KEY `like_post_id_fk` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `photo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `surname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `bdate` date NOT NULL,
  `profile_photo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL DEFAULT 'images/default.jpg',
  `pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name_index` (`name`),
  KEY `user_surname_index` (`surname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_receiver_id_fk` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_sender_id_fk` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `friend_request`
--
ALTER TABLE `friend_request`
  ADD CONSTRAINT `receiver_id_fk` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sender_id_fk` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_receiver_fk` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `plike`
--
ALTER TABLE `plike`
  ADD CONSTRAINT `like_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
