-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 15 Ara 2021, 12:00:01
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ls_api`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_code` varchar(55) DEFAULT NULL,
  `customer_code` varchar(55) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `addresses`
--

INSERT INTO `addresses` (`address_id`, `address_code`, `customer_code`, `address`) VALUES
(2, 'xyz mahallesi', 'STP-59823641', 'abc mahallesi cds sokak'),
(3, 'xyz mahallesi', 'STP-59823641', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_code` varchar(55) DEFAULT NULL,
  `customer_code` varchar(55) DEFAULT NULL,
  `product_code` varchar(55) DEFAULT NULL,
  `quantity` int(15) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `carts`
--

INSERT INTO `carts` (`cart_id`, `cart_code`, `customer_code`, `product_code`, `quantity`, `price`) VALUES
(2, '598632', 'STP-59823641', 'PR_456932', 1, 1500),
(3, '598632', 'STP-59823641', 'PR_456932', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(55) DEFAULT NULL,
  `user_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_code`, `user_name`, `email`, `password`) VALUES
(7, 'STP-59823641', 'Tuncay', 'devmachteam@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(55) DEFAULT NULL,
  `cart_code` varchar(55) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `confirm_status` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `shipping_address_code` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`order_id`, `order_code`, `cart_code`, `total_price`, `confirm_status`, `status`, `is_deleted`, `shipping_address_code`) VALUES
(1, 'OR-45632', '598632', 1750, 1, 1, 1, 'SY-59823641'),
(2, 'OR-45632', '598632', 1750, 1, 1, 1, 'SY-59823641'),
(3, 'OR-45632', '598632', 1750, 1, 1, 1, 'SY-59823641');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
