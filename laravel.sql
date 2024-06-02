-- Adminer 4.8.1 MySQL 8.3.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'Шутеры',	'Описание',	NULL,	'2024-06-02 08:39:22'),
(2,	'Приключения',	'Приключения',	'2024-06-02 07:57:27',	'2024-06-02 07:57:27'),
(3,	'RPG',	'RPG',	'2024-06-02 08:01:42',	'2024-06-02 08:01:42'),
(4,	'Файтинг',	'Файтинг',	'2024-06-02 08:01:54',	'2024-06-02 08:01:54'),
(5,	'Хоррор',	'Хоррор',	NULL,	NULL);

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'0001_01_01_000000_create_users_table',	1),
(2,	'0001_01_01_000001_create_cache_table',	1),
(3,	'0001_01_01_000002_create_jobs_table',	1),
(4,	'2024_05_30_113431_create_products_table',	1),
(5,	'2024_05_30_113505_create_categories_table',	1),
(6,	'2024_06_01_071219_add_product_category_index',	1),
(7,	'2024_06_01_091024_create_orders_table',	1),
(8,	'2024_06_01_091043_create_order_products_table',	1);

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(33,	2,	17,	'2024-06-01 09:13:16',	'2024-06-01 09:13:16'),
(34,	2,	18,	'2024-06-01 09:14:15',	'2024-06-01 09:14:15'),
(35,	2,	7,	'2024-06-01 09:14:28',	'2024-06-01 09:14:28'),
(36,	2,	3,	'2024-06-01 09:19:19',	'2024-06-01 09:19:19'),
(37,	2,	19,	'2024-06-01 09:27:31',	'2024-06-01 09:27:31'),
(38,	3,	19,	'2024-06-01 09:42:21',	'2024-06-01 09:42:21'),
(39,	4,	15,	'2024-06-01 09:43:53',	'2024-06-01 09:43:53'),
(40,	5,	1,	'2024-06-01 09:46:50',	'2024-06-01 09:46:50'),
(41,	6,	9,	'2024-06-01 09:50:53',	'2024-06-01 09:50:53'),
(42,	6,	18,	'2024-06-01 09:56:26',	'2024-06-01 09:56:26'),
(43,	6,	1,	'2024-06-02 05:45:12',	'2024-06-02 05:45:12'),
(44,	7,	12,	'2024-06-02 09:15:40',	'2024-06-02 09:15:40');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `state` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `user_id`, `state`, `created_at`, `updated_at`) VALUES
(2,	1,	2,	'2024-06-01 09:05:46',	'2024-06-01 09:41:18'),
(3,	2,	2,	'2024-06-01 09:42:21',	'2024-06-01 09:42:24'),
(4,	2,	2,	'2024-06-01 09:43:53',	'2024-06-01 09:43:57'),
(5,	2,	2,	'2024-06-01 09:46:50',	'2024-06-01 09:46:53'),
(6,	2,	2,	'2024-06-01 09:50:53',	'2024-06-02 05:45:24'),
(7,	2,	1,	'2024-06-02 09:15:40',	'2024-06-02 09:15:40');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `category_id`, `price`, `image`, `description`, `created_at`, `updated_at`) VALUES
(6,	'Alice, a.',	3,	5010,	'',	'Ab distinctio voluptates et odit. Iste quos exercitationem et omnis architecto quos. Vel non facilis est maxime. Nihil porro ut iure quas.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(7,	'I\'ve got.',	5,	1850,	'',	'Excepturi porro minima ipsam dolorem laudantium cum. Molestiae alias sint explicabo vel. Eius sint et et dolor corporis. Sit non dolorem rerum aliquid.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(8,	'She said.',	3,	8470,	'',	'Quis beatae non qui deleniti facere qui dolores. Exercitationem labore eligendi quas aliquid ducimus dolores magni. Eum numquam labore consequatur et. Qui harum eius et nulla.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(9,	'I wish I.',	1,	3480,	'',	'Corporis fuga consequuntur ipsa aut est omnis quasi. Non eaque unde quas autem aut.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(10,	'They are.',	3,	8680,	'',	'Ut officiis nihil quo quo. Voluptatem architecto ut voluptatem molestias laudantium sapiente. Consectetur repellendus eum tenetur ipsa.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(11,	'DOTH THE.',	1,	1930,	'',	'Facere illum facilis aut exercitationem sed quasi eius. Asperiores illo eos cum sed nobis aut. Et laboriosam exercitationem unde quia est ut est est. Vel aut nulla quaerat esse.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(12,	'Bill had.',	5,	950,	'',	'Repellendus eos officiis animi hic vel. Aliquam perferendis autem similique alias et. Molestias nam vero cumque velit magni.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(13,	'I can go.',	4,	2210,	'',	'Velit magnam rerum distinctio saepe. Repellat et debitis libero ipsum. Numquam et voluptatibus praesentium ut officiis veniam autem.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(14,	'WHAT are.',	4,	4080,	'',	'Quas sit officia quos necessitatibus nobis. Reprehenderit animi a iure ipsum asperiores corporis. Aut iusto autem voluptatum eum corrupti nisi placeat. Id ex laboriosam libero vel.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(15,	'Pray how.',	2,	6310,	'',	'Unde vitae qui ex dolor. Laboriosam quisquam sit soluta voluptatem labore perspiciatis iusto. Porro dolore in dolorem ut.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(16,	'Alice to.',	5,	6930,	'',	'Ea rerum dolores voluptas excepturi cumque et. Dolorem voluptatem molestiae corporis ducimus. Labore dolorum dolor nihil et. Nobis dolorum assumenda similique sunt eum voluptatum similique.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(17,	'Queen to.',	5,	140,	'',	'Soluta vitae et pariatur tenetur sapiente et. Reiciendis ut voluptatem qui voluptatem soluta molestias et. Quasi excepturi hic aspernatur quia mollitia consequuntur.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(18,	'Dormouse.',	3,	9100,	'',	'Quia amet et reiciendis minima. Deserunt rerum molestiae itaque distinctio. Reiciendis commodi quod commodi qui. Libero omnis occaecati quae totam corporis nemo id tempora.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(19,	'Latitude.',	2,	5730,	'',	'Quasi voluptatem cupiditate fugit iusto officia. Ab enim vel quaerat. Eos temporibus maxime velit ad.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27'),
(20,	'And here.',	1,	9110,	'',	'Pariatur neque sequi voluptas quo quasi et iusto. Molestiae eius vel ut consequatur quo ratione perspiciatis.',	'2024-06-01 06:17:27',	'2024-06-01 06:17:27');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KE0Eu7Zwj86Xx1tUk1cTr5yrNGNmD2PF32qXNBfY',	2,	'::1',	'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiblJ5TUJmSVVFeVdTZGFYRUJOTzRGNFZXd0lsV0xpODVjQWtWeHNmWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3QvY2F0ZWdvcnkvNSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==',	1717331040);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'katya',	'katya@mail.ru',	NULL,	'$2y$12$PuHWkDt33Db8Akx4CTrg.OnckgzXlK2DFuqqbBv/uMeI2tZS26Ecq',	NULL,	'2024-06-01 06:17:17',	'2024-06-01 06:17:17'),
(2,	'katya',	'lol.nanny@mail.ru',	NULL,	'$2y$12$XDnujG9dXLU1YCwBNY3ZPeawWGC5Ee2TS5N3O4BVzlXYpJtBSsTGe',	NULL,	'2024-06-01 09:42:17',	'2024-06-01 09:42:17');

-- 2024-06-02 12:24:54
