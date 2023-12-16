-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Gru 2023, 17:52
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rain_measurement_system`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add logs', 7, 'add_logs'),
(26, 'Can change logs', 7, 'change_logs'),
(27, 'Can delete logs', 7, 'delete_logs'),
(28, 'Can view logs', 7, 'view_logs'),
(29, 'Can add rain gaugae', 8, 'add_raingaugae'),
(30, 'Can change rain gaugae', 8, 'change_raingaugae'),
(31, 'Can delete rain gaugae', 8, 'delete_raingaugae'),
(32, 'Can view rain gaugae', 8, 'view_raingaugae'),
(33, 'Can add rain sensor', 9, 'add_rainsensor'),
(34, 'Can change rain sensor', 9, 'change_rainsensor'),
(35, 'Can delete rain sensor', 9, 'delete_rainsensor'),
(36, 'Can view rain sensor', 9, 'view_rainsensor'),
(37, 'Can add water sensor', 10, 'add_watersensor'),
(38, 'Can change water sensor', 10, 'change_watersensor'),
(39, 'Can delete water sensor', 10, 'delete_watersensor'),
(40, 'Can view water sensor', 10, 'view_watersensor');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$rIHMCg01dVhPQJl2lVNRtV$kzYPXGAjOonkWcwLgaAmk8osCr1hfNo9F3TXt9HljxM=', '2023-10-29 23:58:53.085838', 1, 'Majkel14xd_admin', '', '', 'mlidwa@wp.pl', 1, 1, '2023-10-20 13:40:19.668733'),
(2, 'pbkdf2_sha256$600000$i9S31yB7RFIY85Ujw3RSyp$Dj02lp3FF+Qp77glKj263Tww8D9r87P5UKafSf2isI0=', '2023-12-10 15:13:18.829123', 0, 'Majkel14xd', 'Michał', 'Lidwa', 'mlidwa@wp.pl', 0, 1, '2023-10-20 13:42:59.000000'),
(3, 'pbkdf2_sha256$600000$R5KebikH5gP8AnuymvzCwJ$JgI8A06oiXzwjEkWlaqQJjQOy2FaZYXfwIScAMgUL0s=', '2023-10-29 23:59:59.060047', 0, 'Bobo14PL', 'Kacper', 'Nowak', 'kacpernowak@wp.pl', 0, 1, '2023-10-29 23:59:22.000000');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `device_info`
--

CREATE TABLE `device_info` (
  `ID` int(11) NOT NULL,
  `Device_mac_address` varchar(17) NOT NULL,
  `Network_ssid` varchar(30) NOT NULL,
  `Network_ip` varchar(30) NOT NULL,
  `Database_name` varchar(50) NOT NULL,
  `Database_ip` varchar(30) NOT NULL,
  `Database_port` int(10) NOT NULL,
  `Database_user_name` varchar(50) NOT NULL,
  `Data_aktualizacji` date NOT NULL,
  `Czas_aktualizacji` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `device_info`
--

INSERT INTO `device_info` (`ID`, `Device_mac_address`, `Network_ssid`, `Network_ip`, `Database_name`, `Database_ip`, `Database_port`, `Database_user_name`, `Data_aktualizacji`, `Czas_aktualizacji`) VALUES
(10, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-30', '02:28:13'),
(11, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-30', '04:00:00'),
(12, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-30', '04:06:48'),
(13, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-30', '03:07:35'),
(14, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '02:43:49'),
(15, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '02:47:26'),
(16, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '02:47:54'),
(17, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:21:28'),
(18, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:23:25'),
(19, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:25:49'),
(20, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:35:45'),
(21, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:38:20'),
(22, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '1970-01-01', '01:00:19'),
(23, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:43:45'),
(24, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:45:34'),
(25, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:53:03'),
(26, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:54:18'),
(27, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:54:51'),
(28, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '03:58:20'),
(29, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '04:00:44'),
(30, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '04:05:22'),
(31, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '04:11:39'),
(32, '7C:87:CE:2E:04:5C', 'TP-Link_9274', '192.168.0.164', 'rain_measurement_system', '192.168.0.170', 3306, 'Majkel14xd', '2023-10-31', '04:13:26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-10-20 13:42:59.639153', '2', 'Majkel14xd', 1, '[{\"added\": {}}]', 4, 1),
(2, '2023-10-20 13:43:10.203076', '2', 'Majkel14xd', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(3, '2023-10-29 23:59:23.246397', '3', 'Bobo14PL', 1, '[{\"added\": {}}]', 4, 1),
(4, '2023-10-29 23:59:45.082560', '3', 'Bobo14PL', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'rain_measurement_system_app', 'logs'),
(8, 'rain_measurement_system_app', 'raingaugae'),
(9, 'rain_measurement_system_app', 'rainsensor'),
(10, 'rain_measurement_system_app', 'watersensor'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-20 13:37:42.045406'),
(2, 'auth', '0001_initial', '2023-10-20 13:37:42.221977'),
(3, 'admin', '0001_initial', '2023-10-20 13:37:42.269096'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-20 13:37:42.276136'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-20 13:37:42.282166'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-20 13:37:42.308718'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-20 13:37:42.329593'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-20 13:37:42.341881'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-20 13:37:42.348935'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-20 13:37:42.366809'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-20 13:37:42.368803'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-20 13:37:42.376328'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-20 13:37:42.385821'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-20 13:37:42.400290'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-20 13:37:42.415302'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-20 13:37:42.423184'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-20 13:37:42.432227'),
(18, 'rain_measurement_system_app', '0001_initial', '2023-10-20 13:37:42.435505'),
(19, 'rain_measurement_system_app', '0002_auto_20230915_1419', '2023-10-20 13:37:42.438498'),
(20, 'rain_measurement_system_app', '0003_initial', '2023-10-20 13:37:42.442058'),
(21, 'rain_measurement_system_app', '0004_auto_20230922_2136', '2023-10-20 13:37:42.445116'),
(22, 'rain_measurement_system_app', '0005_auto_20230922_2138', '2023-10-20 13:37:42.447110'),
(23, 'sessions', '0001_initial', '2023-10-20 13:37:42.461943'),
(24, 'rain_measurement_system_app', '0006_auto_20231023_0048', '2023-10-22 22:48:42.546852'),
(25, 'rain_measurement_system_app', '0007_auto_20231023_0051', '2023-10-22 22:51:24.393820'),
(26, 'rain_measurement_system_app', '0008_auto_20231023_0054', '2023-10-22 22:54:24.379142'),
(27, 'rain_measurement_system_app', '0006_auto_20231023_0058', '2023-10-22 22:58:11.946812'),
(28, 'rain_measurement_system_app', '0007_auto_20231023_0121', '2023-10-22 23:21:56.833090'),
(29, 'rain_measurement_system_app', '0008_auto_20231023_0123', '2023-10-22 23:23:04.172356'),
(30, 'rain_measurement_system_app', '0009_auto_20231023_0146', '2023-10-22 23:47:01.841333');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('84j61ab853hgq1ggqv6t8xtmxmwzg0yi', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qzmmk:Uwf_PLvApiDlMAXS7KLh4XH70OYZE1NLJt6kh2HJUAc', '2023-11-19 23:44:06.530953'),
('awz0zs15jjplt3ll7viy02vcda6xqleo', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qzmuH:tXYFwzN7As5wrZ9wtra0P9owNxEQRiCa2mx1hpa7g5s', '2023-11-19 23:51:53.876445'),
('lq940qd821qvykgvyrdo4445f0shr22s', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qxDQ8:YKVBRjqJDfsZ7Axt_2x4uT7wQLURFsvb3FDhZhbow2E', '2023-11-12 21:34:08.790722'),
('o5y73vj7xlwceddus8scz8w4y0q8rjts', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qzlqC:SA5HvwAY_awiTmOcN275TeOjdcZFNq-64PhlSwTCZPs', '2023-11-19 22:43:36.612275'),
('q9h2yd4zcz8guh5wov11yax9mju9agcd', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qzmFv:43LNCh5YsySDzWuKXGOCt4suSaPkkl0muT7dulYyHrQ', '2023-11-19 23:10:11.047596'),
('rf2fps75y47eibdhultx4ioaipynxoab', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qxCNe:iuaTqV_5kot4k-Gi9kUAfy-v8fCXRvwH7BtL2RdwQmw', '2023-11-12 20:27:30.157980'),
('udnn55tkrug4u9judq2w9h1erenqyef1', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1quiAA:6iamtOIBOU0aszB0899fJXO9ktQEe6X0D_C8REQhZKY', '2023-11-05 23:47:18.159875'),
('wp3wjcxd9u992ckpxgpitd414gfomu0d', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1qxHH4:JxARJJKloua2E2PHsVLlTafYl1gRJXBVtj4zxkiuERQ', '2023-11-13 01:41:02.740935'),
('z0rlajwherwcrlh9g4e3ibiwqqkswiff', '.eJxVjDsOwjAQBe_iGln-YWcp6XMGa9cfHEC2FCcV4u5gKQW0b2bei3nct-L3nla_RHZhip1-N8LwSHWAeMd6azy0uq0L8aHwg3Y-t5ie18P9OyjYy6jBIDjQErRGCtJlmoLCKVqjBJAgZb8wC-fAQtRnlJSUUCKnnMFYy94fz2I3Tw:1rCLUc:PD6x8yrgZtLbsRuvJ3MVt_Rrzt_HthtgM2Il4NzkqgQ', '2023-12-24 15:13:18.842945');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
--

CREATE TABLE `logs` (
  `ID` int(11) NOT NULL,
  `Data_zdarzenia` date NOT NULL,
  `Godzina_zdarzenia` time NOT NULL,
  `Opis_zdarzenia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `logs`
--

INSERT INTO `logs` (`ID`, `Data_zdarzenia`, `Godzina_zdarzenia`, `Opis_zdarzenia`) VALUES
(53, '2023-10-30', '03:59:59', 'Wlaczenie urzadzenia'),
(54, '2023-10-30', '04:06:47', 'Wlaczenie urzadzenia'),
(55, '2023-10-30', '03:07:34', 'Wlaczenie urzadzenia'),
(56, '2023-10-31', '02:43:48', 'Wlaczenie urzadzenia'),
(57, '2023-10-31', '02:47:25', 'Wlaczenie urzadzenia'),
(58, '2023-10-31', '02:47:53', 'Wlaczenie urzadzenia'),
(59, '2023-10-31', '03:21:27', 'Wlaczenie urzadzenia'),
(60, '2023-10-31', '03:23:24', 'Wlaczenie urzadzenia'),
(61, '2023-10-31', '03:25:48', 'Wlaczenie urzadzenia'),
(62, '1970-01-01', '03:35:44', 'Wlaczenie urzadzenia'),
(63, '2023-10-31', '03:38:19', 'Wlaczenie urzadzenia'),
(64, '1970-01-01', '01:00:15', 'Wlaczenie urzadzenia'),
(65, '2023-10-31', '03:43:44', 'Wlaczenie urzadzenia'),
(66, '2023-10-31', '03:45:33', 'Wlaczenie urzadzenia'),
(67, '2023-10-31', '03:53:02', 'Wlaczenie urzadzenia'),
(68, '2023-10-31', '03:53:48', 'Wlaczenie urzadzenia'),
(69, '2023-10-31', '03:54:17', 'Wlaczenie urzadzenia'),
(70, '2023-10-31', '03:54:50', 'Wlaczenie urzadzenia'),
(71, '2023-10-31', '03:58:19', 'Wlaczenie urzadzenia'),
(72, '2023-10-31', '04:00:43', 'Wlaczenie urzadzenia'),
(73, '2023-10-31', '04:05:21', 'Wlaczenie urzadzenia'),
(74, '2023-10-31', '04:11:38', 'Wlaczenie urzadzenia'),
(75, '2023-10-31', '04:13:25', 'Wlaczenie urzadzenia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rain_gaugae`
--

CREATE TABLE `rain_gaugae` (
  `ID` int(11) NOT NULL,
  `Data_odczytu` date NOT NULL,
  `Godzina_odczytu` time NOT NULL,
  `Wartosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rain_gaugae`
--

INSERT INTO `rain_gaugae` (`ID`, `Data_odczytu`, `Godzina_odczytu`, `Wartosc`) VALUES
(580, '2023-10-30', '04:00:36', 0),
(581, '2023-10-30', '04:01:07', 0),
(582, '2023-10-30', '04:01:37', 0),
(583, '2023-10-30', '04:02:07', 0),
(584, '2023-10-30', '04:02:37', 0),
(585, '2023-10-30', '04:03:07', 0),
(586, '2023-10-30', '04:03:36', 0),
(587, '2023-10-30', '04:04:07', 0),
(588, '2023-10-30', '04:04:37', 0),
(589, '2023-10-30', '04:05:07', 0),
(590, '2023-10-30', '04:05:36', 0),
(591, '2023-10-30', '04:06:07', 0),
(592, '2023-10-30', '03:08:12', 0),
(593, '2023-10-31', '02:44:26', 0),
(594, '2023-10-31', '02:44:56', 0),
(595, '2023-10-31', '02:45:25', 0),
(596, '2023-10-31', '02:45:56', 0),
(597, '2023-10-31', '02:46:26', 0),
(598, '2023-10-31', '02:46:56', 0),
(599, '2023-10-31', '02:48:30', 0),
(600, '2023-10-31', '02:49:01', 0),
(601, '2023-10-31', '02:49:30', 0),
(602, '2023-10-31', '02:50:01', 0),
(603, '2023-10-31', '02:50:31', 0),
(604, '2023-10-31', '02:51:01', 0),
(605, '2023-10-31', '02:51:30', 0),
(606, '2023-10-31', '02:52:01', 0),
(607, '2023-10-31', '02:52:31', 0),
(608, '2023-10-31', '02:53:01', 0),
(609, '2023-10-31', '02:53:31', 0),
(610, '2023-10-31', '02:54:01', 0),
(611, '2023-10-31', '02:54:30', 0),
(612, '2023-10-31', '02:55:00', 0),
(613, '2023-10-31', '02:55:31', 0),
(614, '2023-10-31', '02:56:01', 0),
(615, '2023-10-31', '02:56:30', 0),
(616, '2023-10-31', '02:57:00', 0),
(617, '2023-10-31', '02:57:30', 0),
(618, '2023-10-31', '02:58:01', 0),
(619, '2023-10-31', '02:58:30', 0),
(620, '2023-10-31', '02:59:00', 0),
(621, '2023-10-31', '02:59:31', 0),
(622, '2023-10-31', '03:00:01', 0),
(623, '2023-10-31', '03:00:30', 0),
(624, '2023-10-31', '03:01:00', 0),
(625, '2023-10-31', '03:01:31', 0),
(626, '2023-10-31', '03:02:01', 0),
(627, '2023-10-31', '03:02:30', 0),
(628, '2023-10-31', '03:03:00', 0),
(629, '2023-10-31', '03:03:31', 0),
(630, '2023-10-31', '03:04:01', 0),
(631, '2023-10-31', '03:04:31', 0),
(632, '2023-10-31', '03:05:01', 0),
(633, '2023-10-31', '03:05:31', 0),
(634, '2023-10-31', '03:06:00', 0),
(635, '2023-10-31', '03:06:31', 0),
(636, '2023-10-31', '03:07:01', 0),
(637, '2023-10-31', '03:07:31', 0),
(638, '2023-10-31', '03:08:00', 0),
(639, '2023-10-31', '03:08:31', 0),
(640, '2023-10-31', '03:09:01', 0),
(641, '2023-10-31', '03:09:31', 0),
(642, '2023-10-31', '03:10:00', 0),
(643, '2023-10-31', '03:10:30', 0),
(644, '2023-10-31', '03:11:01', 0),
(645, '2023-10-31', '03:11:31', 0),
(646, '2023-10-31', '03:12:00', 0),
(647, '2023-10-31', '03:12:30', 0),
(648, '2023-10-31', '03:13:01', 0),
(649, '2023-10-31', '03:13:31', 0),
(650, '2023-10-31', '03:14:00', 0),
(651, '2023-10-31', '03:14:30', 0),
(652, '2023-10-31', '03:15:01', 0),
(653, '2023-10-31', '03:15:31', 0),
(654, '2023-10-31', '03:16:01', 0),
(655, '2023-10-31', '03:16:31', 0),
(656, '2023-10-31', '03:17:00', 0),
(657, '2023-10-31', '03:17:30', 0),
(658, '2023-10-31', '03:18:01', 0),
(659, '2023-10-31', '03:18:31', 0),
(660, '2023-10-31', '03:22:05', 0),
(661, '2023-10-31', '03:22:35', 0),
(662, '2023-10-31', '03:24:01', 0),
(663, '2023-10-31', '03:24:31', 0),
(664, '2023-10-31', '03:25:01', 0),
(665, '2023-10-31', '03:26:26', 0),
(666, '2023-10-31', '03:26:56', 0),
(667, '2023-10-31', '03:27:26', 0),
(668, '2023-10-31', '03:27:56', 0),
(669, '2023-10-31', '03:28:25', 0),
(670, '2023-10-31', '03:28:56', 0),
(671, '2023-10-31', '03:29:25', 0),
(672, '2023-10-31', '03:29:56', 0),
(673, '2023-10-31', '03:30:25', 0),
(674, '2023-10-31', '03:30:56', 0),
(675, '2023-10-31', '03:31:26', 0),
(676, '2023-10-31', '03:31:56', 0),
(677, '2023-10-31', '03:32:25', 0),
(678, '2023-10-31', '03:32:55', 0),
(679, '2023-10-31', '03:33:26', 0),
(680, '2023-10-31', '03:33:56', 0),
(681, '2023-10-31', '03:34:26', 0),
(682, '2023-10-31', '03:34:56', 0),
(683, '2023-10-31', '03:36:21', 0),
(684, '2023-10-31', '03:36:52', 0),
(685, '2023-10-31', '03:37:21', 0),
(686, '2023-10-31', '03:38:56', 0),
(687, '2023-10-31', '03:39:27', 0),
(688, '2023-10-31', '03:39:56', 0),
(689, '2023-10-31', '03:41:04', 6),
(690, '2023-10-31', '03:41:29', 6),
(691, '2023-10-31', '03:41:59', 6),
(692, '2023-10-31', '03:42:29', 9),
(693, '2023-10-31', '03:44:21', 6),
(694, '2023-10-31', '03:44:52', 6),
(695, '2023-10-31', '03:46:10', 0),
(696, '2023-10-31', '03:46:42', 0),
(697, '2023-10-31', '03:47:10', 0),
(698, '2023-10-31', '03:47:41', 0),
(699, '2023-10-31', '03:48:10', 0),
(700, '2023-10-31', '03:48:41', 0),
(701, '2023-10-31', '03:49:10', 0),
(702, '2023-10-31', '03:49:40', 0),
(703, '2023-10-31', '03:55:27', 0),
(704, '2023-10-31', '03:55:58', 0),
(705, '2023-10-31', '03:56:28', 0),
(706, '2023-10-31', '03:56:58', 0),
(707, '2023-10-31', '03:57:27', 0),
(708, '2023-10-31', '03:58:56', 0),
(709, '2023-10-31', '03:59:27', 0),
(710, '2023-10-31', '03:59:56', 0),
(711, '2023-10-31', '04:01:20', 0),
(712, '2023-10-31', '04:01:51', 0),
(713, '2023-10-31', '04:02:21', 0),
(714, '2023-10-31', '04:02:51', 0),
(715, '2023-10-31', '04:03:21', 0),
(716, '2023-10-31', '04:03:51', 0),
(717, '2023-10-31', '04:04:20', 0),
(718, '2023-10-31', '04:04:51', 0),
(719, '2023-10-31', '04:05:59', 0),
(720, '2023-10-31', '04:06:29', 0),
(721, '2023-10-31', '04:06:58', 0),
(722, '2023-10-31', '04:07:29', 0),
(723, '2023-10-31', '04:07:59', 0),
(724, '2023-10-31', '04:08:29', 0),
(725, '2023-10-31', '04:08:58', 0),
(726, '2023-10-31', '04:09:29', 0),
(727, '2023-10-31', '04:09:58', 0),
(728, '2023-10-31', '04:10:28', 0),
(729, '2023-10-31', '04:10:58', 0),
(730, '2023-10-31', '04:12:23', 0),
(731, '2023-10-31', '04:12:48', 0),
(732, '2023-10-31', '04:15:34', 0),
(733, '2023-10-31', '04:16:03', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rain_sensor`
--

CREATE TABLE `rain_sensor` (
  `ID` int(11) NOT NULL,
  `Data_odczytu` date NOT NULL,
  `Godzina_odczytu` time NOT NULL,
  `Wartosc` int(11) NOT NULL,
  `Wartosc_tekstowa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rain_sensor`
--

INSERT INTO `rain_sensor` (`ID`, `Data_odczytu`, `Godzina_odczytu`, `Wartosc`, `Wartosc_tekstowa`) VALUES
(1765, '2023-10-30', '04:00:15', 4095, 'Brak opadow'),
(1766, '2023-10-30', '04:00:25', 4095, 'Brak opadow'),
(1767, '2023-10-30', '04:00:35', 4095, 'Brak opadow'),
(1768, '2023-10-30', '04:00:45', 4095, 'Brak opadow'),
(1769, '2023-10-30', '04:00:55', 4095, 'Brak opadow'),
(1770, '2023-10-30', '04:01:06', 4095, 'Brak opadow'),
(1771, '2023-10-30', '04:01:16', 4095, 'Brak opadow'),
(1772, '2023-10-30', '04:01:26', 4095, 'Brak opadow'),
(1773, '2023-10-30', '04:01:36', 4095, 'Brak opadow'),
(1774, '2023-10-30', '04:01:46', 4095, 'Brak opadow'),
(1775, '2023-10-30', '04:01:56', 4095, 'Brak opadow'),
(1776, '2023-10-30', '04:02:06', 4095, 'Brak opadow'),
(1777, '2023-10-30', '04:02:16', 4095, 'Brak opadow'),
(1778, '2023-10-30', '04:02:26', 4095, 'Brak opadow'),
(1779, '2023-10-30', '04:02:36', 4095, 'Brak opadow'),
(1780, '2023-10-30', '04:02:46', 4095, 'Brak opadow'),
(1781, '2023-10-30', '04:02:56', 4095, 'Brak opadow'),
(1782, '2023-10-30', '04:03:06', 4095, 'Brak opadow'),
(1783, '2023-10-30', '04:03:15', 4095, 'Brak opadow'),
(1784, '2023-10-30', '04:03:25', 4095, 'Brak opadow'),
(1785, '2023-10-30', '04:03:35', 4095, 'Brak opadow'),
(1786, '2023-10-30', '04:03:45', 4095, 'Brak opadow'),
(1787, '2023-10-30', '04:03:55', 4095, 'Brak opadow'),
(1788, '2023-10-30', '04:04:06', 4095, 'Brak opadow'),
(1789, '2023-10-30', '04:04:16', 4095, 'Brak opadow'),
(1790, '2023-10-30', '04:04:26', 4095, 'Brak opadow'),
(1791, '2023-10-30', '04:04:36', 4095, 'Brak opadow'),
(1792, '2023-10-30', '04:04:46', 4095, 'Brak opadow'),
(1793, '2023-10-30', '04:04:56', 4095, 'Brak opadow'),
(1794, '2023-10-30', '04:05:06', 4095, 'Brak opadow'),
(1795, '2023-10-30', '04:05:15', 4095, 'Brak opadow'),
(1796, '2023-10-30', '04:05:25', 4095, 'Brak opadow'),
(1797, '2023-10-30', '04:05:35', 4095, 'Brak opadow'),
(1798, '2023-10-30', '04:05:45', 4095, 'Brak opadow'),
(1799, '2023-10-30', '04:05:55', 4095, 'Brak opadow'),
(1800, '2023-10-30', '04:06:05', 4095, 'Brak opadow'),
(1801, '2023-10-30', '04:06:16', 4095, 'Brak opadow'),
(1802, '2023-10-30', '04:07:04', 4095, 'Brak opadow'),
(1803, '2023-10-30', '03:07:51', 4095, 'Brak opadow'),
(1804, '2023-10-30', '03:08:01', 4095, 'Brak opadow'),
(1805, '2023-10-30', '03:08:11', 4095, 'Brak opadow'),
(1806, '2023-10-30', '03:08:21', 4095, 'Brak opadow'),
(1807, '2023-10-30', '03:08:31', 4095, 'Brak opadow'),
(1808, '2023-10-31', '02:44:05', 4095, 'Brak opadow'),
(1809, '2023-10-31', '02:44:15', 4095, 'Brak opadow'),
(1810, '2023-10-31', '02:44:25', 4095, 'Brak opadow'),
(1811, '2023-10-31', '02:44:35', 4095, 'Brak opadow'),
(1812, '2023-10-31', '02:44:45', 4095, 'Brak opadow'),
(1813, '2023-10-31', '02:44:55', 4095, 'Brak opadow'),
(1814, '2023-10-31', '02:45:04', 4095, 'Brak opadow'),
(1815, '2023-10-31', '02:45:14', 4095, 'Brak opadow'),
(1816, '2023-10-31', '02:45:24', 4095, 'Brak opadow'),
(1817, '2023-10-31', '02:45:34', 4095, 'Brak opadow'),
(1818, '2023-10-31', '02:45:44', 4095, 'Brak opadow'),
(1819, '2023-10-31', '02:45:55', 4095, 'Brak opadow'),
(1820, '2023-10-31', '02:46:05', 4095, 'Brak opadow'),
(1821, '2023-10-31', '02:46:15', 4095, 'Brak opadow'),
(1822, '2023-10-31', '02:46:25', 4095, 'Brak opadow'),
(1823, '2023-10-31', '02:46:35', 4095, 'Brak opadow'),
(1824, '2023-10-31', '02:46:45', 4095, 'Brak opadow'),
(1825, '2023-10-31', '02:46:55', 4095, 'Brak opadow'),
(1826, '2023-10-31', '02:47:04', 4095, 'Brak opadow'),
(1827, '2023-10-31', '02:48:09', 4095, 'Brak opadow'),
(1828, '2023-10-31', '02:48:19', 4095, 'Brak opadow'),
(1829, '2023-10-31', '02:48:29', 4095, 'Brak opadow'),
(1830, '2023-10-31', '02:48:39', 4095, 'Brak opadow'),
(1831, '2023-10-31', '02:48:49', 4095, 'Brak opadow'),
(1832, '2023-10-31', '02:49:00', 4095, 'Brak opadow'),
(1833, '2023-10-31', '02:49:09', 4095, 'Brak opadow'),
(1834, '2023-10-31', '02:49:19', 4095, 'Brak opadow'),
(1835, '2023-10-31', '02:49:29', 4095, 'Brak opadow'),
(1836, '2023-10-31', '02:49:39', 4095, 'Brak opadow'),
(1837, '2023-10-31', '02:49:49', 4095, 'Brak opadow'),
(1838, '2023-10-31', '02:50:00', 4095, 'Brak opadow'),
(1839, '2023-10-31', '02:50:10', 4095, 'Brak opadow'),
(1840, '2023-10-31', '02:50:20', 4095, 'Brak opadow'),
(1841, '2023-10-31', '02:50:30', 4095, 'Brak opadow'),
(1842, '2023-10-31', '02:50:40', 4095, 'Brak opadow'),
(1843, '2023-10-31', '02:50:50', 4095, 'Brak opadow'),
(1844, '2023-10-31', '02:51:00', 4095, 'Brak opadow'),
(1845, '2023-10-31', '02:51:09', 4095, 'Brak opadow'),
(1846, '2023-10-31', '02:51:19', 4095, 'Brak opadow'),
(1847, '2023-10-31', '02:51:29', 4095, 'Brak opadow'),
(1848, '2023-10-31', '02:51:39', 4095, 'Brak opadow'),
(1849, '2023-10-31', '02:51:49', 4095, 'Brak opadow'),
(1850, '2023-10-31', '02:51:59', 4095, 'Brak opadow'),
(1851, '2023-10-31', '02:52:10', 4095, 'Brak opadow'),
(1852, '2023-10-31', '02:52:20', 4095, 'Brak opadow'),
(1853, '2023-10-31', '02:52:30', 4095, 'Brak opadow'),
(1854, '2023-10-31', '02:52:40', 4095, 'Brak opadow'),
(1855, '2023-10-31', '02:52:50', 4095, 'Brak opadow'),
(1856, '2023-10-31', '02:53:00', 4095, 'Brak opadow'),
(1857, '2023-10-31', '02:53:10', 4095, 'Brak opadow'),
(1858, '2023-10-31', '02:53:20', 4095, 'Brak opadow'),
(1859, '2023-10-31', '02:53:30', 4095, 'Brak opadow'),
(1860, '2023-10-31', '02:53:40', 4095, 'Brak opadow'),
(1861, '2023-10-31', '02:53:50', 4095, 'Brak opadow'),
(1862, '2023-10-31', '02:54:00', 4095, 'Brak opadow'),
(1863, '2023-10-31', '02:54:09', 4095, 'Brak opadow'),
(1864, '2023-10-31', '02:54:19', 4095, 'Brak opadow'),
(1865, '2023-10-31', '02:54:29', 4095, 'Brak opadow'),
(1866, '2023-10-31', '02:54:39', 4095, 'Brak opadow'),
(1867, '2023-10-31', '02:54:49', 4095, 'Brak opadow'),
(1868, '2023-10-31', '02:54:59', 4095, 'Brak opadow'),
(1869, '2023-10-31', '02:55:10', 4095, 'Brak opadow'),
(1870, '2023-10-31', '02:55:20', 4095, 'Brak opadow'),
(1871, '2023-10-31', '02:55:30', 4095, 'Brak opadow'),
(1872, '2023-10-31', '02:55:40', 4095, 'Brak opadow'),
(1873, '2023-10-31', '02:55:50', 4095, 'Brak opadow'),
(1874, '2023-10-31', '02:56:00', 4095, 'Brak opadow'),
(1875, '2023-10-31', '02:56:10', 4095, 'Brak opadow'),
(1876, '2023-10-31', '02:56:19', 4095, 'Brak opadow'),
(1877, '2023-10-31', '02:56:29', 4095, 'Brak opadow'),
(1878, '2023-10-31', '02:56:39', 4095, 'Brak opadow'),
(1879, '2023-10-31', '02:56:49', 4095, 'Brak opadow'),
(1880, '2023-10-31', '02:56:59', 4095, 'Brak opadow'),
(1881, '2023-10-31', '02:57:10', 4095, 'Brak opadow'),
(1882, '2023-10-31', '02:57:19', 4095, 'Brak opadow'),
(1883, '2023-10-31', '02:57:30', 4095, 'Brak opadow'),
(1884, '2023-10-31', '02:57:40', 4095, 'Brak opadow'),
(1885, '2023-10-31', '02:57:50', 4095, 'Brak opadow'),
(1886, '2023-10-31', '02:58:00', 4095, 'Brak opadow'),
(1887, '2023-10-31', '02:58:10', 4095, 'Brak opadow'),
(1888, '2023-10-31', '02:58:19', 4095, 'Brak opadow'),
(1889, '2023-10-31', '02:58:29', 4095, 'Brak opadow'),
(1890, '2023-10-31', '02:58:39', 4095, 'Brak opadow'),
(1891, '2023-10-31', '02:58:49', 4095, 'Brak opadow'),
(1892, '2023-10-31', '02:58:59', 4095, 'Brak opadow'),
(1893, '2023-10-31', '02:59:09', 4095, 'Brak opadow'),
(1894, '2023-10-31', '02:59:20', 4095, 'Brak opadow'),
(1895, '2023-10-31', '02:59:30', 4095, 'Brak opadow'),
(1896, '2023-10-31', '02:59:40', 4095, 'Brak opadow'),
(1897, '2023-10-31', '02:59:50', 4095, 'Brak opadow'),
(1898, '2023-10-31', '03:00:00', 4095, 'Brak opadow'),
(1899, '2023-10-31', '03:00:10', 4095, 'Brak opadow'),
(1900, '2023-10-31', '03:00:20', 4095, 'Brak opadow'),
(1901, '2023-10-31', '03:00:29', 4095, 'Brak opadow'),
(1902, '2023-10-31', '03:00:39', 4095, 'Brak opadow'),
(1903, '2023-10-31', '03:00:49', 4095, 'Brak opadow'),
(1904, '2023-10-31', '03:00:59', 4095, 'Brak opadow'),
(1905, '2023-10-31', '03:01:09', 4095, 'Brak opadow'),
(1906, '2023-10-31', '03:01:20', 4095, 'Brak opadow'),
(1907, '2023-10-31', '03:01:30', 4095, 'Brak opadow'),
(1908, '2023-10-31', '03:01:40', 4095, 'Brak opadow'),
(1909, '2023-10-31', '03:01:50', 4095, 'Brak opadow'),
(1910, '2023-10-31', '03:02:00', 4095, 'Brak opadow'),
(1911, '2023-10-31', '03:02:10', 4095, 'Brak opadow'),
(1912, '2023-10-31', '03:02:20', 4095, 'Brak opadow'),
(1913, '2023-10-31', '03:02:29', 4095, 'Brak opadow'),
(1914, '2023-10-31', '03:02:39', 4095, 'Brak opadow'),
(1915, '2023-10-31', '03:02:49', 4095, 'Brak opadow'),
(1916, '2023-10-31', '03:02:59', 4095, 'Brak opadow'),
(1917, '2023-10-31', '03:03:09', 4095, 'Brak opadow'),
(1918, '2023-10-31', '03:03:19', 4095, 'Brak opadow'),
(1919, '2023-10-31', '03:03:30', 4095, 'Brak opadow'),
(1920, '2023-10-31', '03:03:40', 4095, 'Brak opadow'),
(1921, '2023-10-31', '03:03:50', 4095, 'Brak opadow'),
(1922, '2023-10-31', '03:04:00', 4095, 'Brak opadow'),
(1923, '2023-10-31', '03:04:10', 4095, 'Brak opadow'),
(1924, '2023-10-31', '03:04:20', 4095, 'Brak opadow'),
(1925, '2023-10-31', '03:04:30', 4095, 'Brak opadow'),
(1926, '2023-10-31', '03:04:40', 4095, 'Brak opadow'),
(1927, '2023-10-31', '03:04:50', 4095, 'Brak opadow'),
(1928, '2023-10-31', '03:05:00', 4095, 'Brak opadow'),
(1929, '2023-10-31', '03:05:10', 4095, 'Brak opadow'),
(1930, '2023-10-31', '03:05:20', 4095, 'Brak opadow'),
(1931, '2023-10-31', '03:05:30', 4095, 'Brak opadow'),
(1932, '2023-10-31', '03:05:39', 4095, 'Brak opadow'),
(1933, '2023-10-31', '03:05:49', 4095, 'Brak opadow'),
(1934, '2023-10-31', '03:05:59', 4095, 'Brak opadow'),
(1935, '2023-10-31', '03:06:09', 4095, 'Brak opadow'),
(1936, '2023-10-31', '03:06:19', 4095, 'Brak opadow'),
(1937, '2023-10-31', '03:06:30', 4095, 'Brak opadow'),
(1938, '2023-10-31', '03:06:40', 4095, 'Brak opadow'),
(1939, '2023-10-31', '03:06:50', 4095, 'Brak opadow'),
(1940, '2023-10-31', '03:07:00', 4095, 'Brak opadow'),
(1941, '2023-10-31', '03:07:10', 4095, 'Brak opadow'),
(1942, '2023-10-31', '03:07:20', 4095, 'Brak opadow'),
(1943, '2023-10-31', '03:07:30', 4095, 'Brak opadow'),
(1944, '2023-10-31', '03:07:39', 4095, 'Brak opadow'),
(1945, '2023-10-31', '03:07:49', 4095, 'Brak opadow'),
(1946, '2023-10-31', '03:07:59', 4095, 'Brak opadow'),
(1947, '2023-10-31', '03:08:09', 4095, 'Brak opadow'),
(1948, '2023-10-31', '03:08:19', 4095, 'Brak opadow'),
(1949, '2023-10-31', '03:08:29', 4095, 'Brak opadow'),
(1950, '2023-10-31', '03:08:40', 4095, 'Brak opadow'),
(1951, '2023-10-31', '03:08:50', 4095, 'Brak opadow'),
(1952, '2023-10-31', '03:09:00', 4095, 'Brak opadow'),
(1953, '2023-10-31', '03:09:10', 4095, 'Brak opadow'),
(1954, '2023-10-31', '03:09:20', 4095, 'Brak opadow'),
(1955, '2023-10-31', '03:09:30', 4095, 'Brak opadow'),
(1956, '2023-10-31', '03:09:39', 4095, 'Brak opadow'),
(1957, '2023-10-31', '03:09:49', 4095, 'Brak opadow'),
(1958, '2023-10-31', '03:09:59', 4095, 'Brak opadow'),
(1959, '2023-10-31', '03:10:09', 4095, 'Brak opadow'),
(1960, '2023-10-31', '03:10:19', 4095, 'Brak opadow'),
(1961, '2023-10-31', '03:10:29', 4095, 'Brak opadow'),
(1962, '2023-10-31', '03:10:40', 4095, 'Brak opadow'),
(1963, '2023-10-31', '03:10:50', 4095, 'Brak opadow'),
(1964, '2023-10-31', '03:11:00', 4095, 'Brak opadow'),
(1965, '2023-10-31', '03:11:10', 4095, 'Brak opadow'),
(1966, '2023-10-31', '03:11:20', 4095, 'Brak opadow'),
(1967, '2023-10-31', '03:11:30', 4095, 'Brak opadow'),
(1968, '2023-10-31', '03:11:40', 4095, 'Brak opadow'),
(1969, '2023-10-31', '03:11:49', 4095, 'Brak opadow'),
(1970, '2023-10-31', '03:11:59', 4095, 'Brak opadow'),
(1971, '2023-10-31', '03:12:10', 4095, 'Brak opadow'),
(1972, '2023-10-31', '03:12:19', 4095, 'Brak opadow'),
(1973, '2023-10-31', '03:12:29', 4095, 'Brak opadow'),
(1974, '2023-10-31', '03:12:40', 4095, 'Brak opadow'),
(1975, '2023-10-31', '03:12:50', 4095, 'Brak opadow'),
(1976, '2023-10-31', '03:13:00', 4095, 'Brak opadow'),
(1977, '2023-10-31', '03:13:10', 4095, 'Brak opadow'),
(1978, '2023-10-31', '03:13:20', 4095, 'Brak opadow'),
(1979, '2023-10-31', '03:13:30', 4095, 'Brak opadow'),
(1980, '2023-10-31', '03:13:40', 4095, 'Brak opadow'),
(1981, '2023-10-31', '03:13:49', 4095, 'Brak opadow'),
(1982, '2023-10-31', '03:13:59', 4095, 'Brak opadow'),
(1983, '2023-10-31', '03:14:09', 4095, 'Brak opadow'),
(1984, '2023-10-31', '03:14:19', 4095, 'Brak opadow'),
(1985, '2023-10-31', '03:14:29', 4095, 'Brak opadow'),
(1986, '2023-10-31', '03:14:39', 4095, 'Brak opadow'),
(1987, '2023-10-31', '03:14:50', 4095, 'Brak opadow'),
(1988, '2023-10-31', '03:15:00', 4095, 'Brak opadow'),
(1989, '2023-10-31', '03:15:10', 4095, 'Brak opadow'),
(1990, '2023-10-31', '03:15:20', 4095, 'Brak opadow'),
(1991, '2023-10-31', '03:15:30', 4095, 'Brak opadow'),
(1992, '2023-10-31', '03:15:40', 4095, 'Brak opadow'),
(1993, '2023-10-31', '03:15:50', 4095, 'Brak opadow'),
(1994, '2023-10-31', '03:16:00', 4095, 'Brak opadow'),
(1995, '2023-10-31', '03:16:10', 4095, 'Brak opadow'),
(1996, '2023-10-31', '03:16:20', 4095, 'Brak opadow'),
(1997, '2023-10-31', '03:16:30', 4095, 'Brak opadow'),
(1998, '2023-10-31', '03:16:40', 4095, 'Brak opadow'),
(1999, '2023-10-31', '03:16:50', 4095, 'Brak opadow'),
(2000, '2023-10-31', '03:16:59', 4095, 'Brak opadow'),
(2001, '2023-10-31', '03:17:09', 4095, 'Brak opadow'),
(2002, '2023-10-31', '03:17:20', 4095, 'Brak opadow'),
(2003, '2023-10-31', '03:17:29', 4095, 'Brak opadow'),
(2004, '2023-10-31', '03:17:39', 4095, 'Brak opadow'),
(2005, '2023-10-31', '03:17:50', 4095, 'Brak opadow'),
(2006, '2023-10-31', '03:18:00', 4095, 'Brak opadow'),
(2007, '2023-10-31', '03:18:10', 4095, 'Brak opadow'),
(2008, '2023-10-31', '03:18:20', 4095, 'Brak opadow'),
(2009, '2023-10-31', '03:18:30', 4095, 'Brak opadow'),
(2010, '2023-10-31', '03:18:40', 4095, 'Brak opadow'),
(2011, '2023-10-31', '03:18:50', 4095, 'Brak opadow'),
(2012, '2023-10-31', '03:21:44', 4095, 'Brak opadow'),
(2013, '2023-10-31', '03:21:54', 4095, 'Brak opadow'),
(2014, '2023-10-31', '03:22:04', 4095, 'Brak opadow'),
(2015, '2023-10-31', '03:22:14', 4095, 'Brak opadow'),
(2016, '2023-10-31', '03:22:24', 4095, 'Brak opadow'),
(2017, '2023-10-31', '03:22:34', 4095, 'Brak opadow'),
(2018, '2023-10-31', '03:23:40', 4095, 'Brak opadow'),
(2019, '2023-10-31', '03:23:50', 4095, 'Brak opadow'),
(2020, '2023-10-31', '03:24:00', 4095, 'Brak opadow'),
(2021, '2023-10-31', '03:24:10', 4095, 'Brak opadow'),
(2022, '2023-10-31', '03:24:20', 4095, 'Brak opadow'),
(2023, '2023-10-31', '03:24:30', 4095, 'Brak opadow'),
(2024, '2023-10-31', '03:24:40', 4095, 'Brak opadow'),
(2025, '2023-10-31', '03:24:50', 4095, 'Brak opadow'),
(2026, '2023-10-31', '03:25:00', 4095, 'Brak opadow'),
(2027, '2023-10-31', '03:25:10', 4095, 'Brak opadow'),
(2028, '2023-10-31', '03:26:04', 4095, 'Brak opadow'),
(2029, '2023-10-31', '03:26:15', 4095, 'Brak opadow'),
(2030, '2023-10-31', '03:26:25', 4095, 'Brak opadow'),
(2031, '2023-10-31', '03:26:34', 4095, 'Brak opadow'),
(2032, '2023-10-31', '03:26:44', 4095, 'Brak opadow'),
(2033, '2023-10-31', '03:26:55', 4095, 'Brak opadow'),
(2034, '2023-10-31', '03:27:05', 4095, 'Brak opadow'),
(2035, '2023-10-31', '03:27:15', 4095, 'Brak opadow'),
(2036, '2023-10-31', '03:27:25', 4095, 'Brak opadow'),
(2037, '2023-10-31', '03:27:35', 4095, 'Brak opadow'),
(2038, '2023-10-31', '03:27:45', 4095, 'Brak opadow'),
(2039, '2023-10-31', '03:27:55', 4095, 'Brak opadow'),
(2040, '2023-10-31', '03:28:05', 4095, 'Brak opadow'),
(2041, '2023-10-31', '03:28:14', 4095, 'Brak opadow'),
(2042, '2023-10-31', '03:28:24', 4095, 'Brak opadow'),
(2043, '2023-10-31', '03:28:35', 4095, 'Brak opadow'),
(2044, '2023-10-31', '03:28:44', 4095, 'Brak opadow'),
(2045, '2023-10-31', '03:28:55', 4095, 'Brak opadow'),
(2046, '2023-10-31', '03:29:04', 4095, 'Brak opadow'),
(2047, '2023-10-31', '03:29:14', 4095, 'Brak opadow'),
(2048, '2023-10-31', '03:29:24', 4095, 'Brak opadow'),
(2049, '2023-10-31', '03:29:34', 4095, 'Brak opadow'),
(2050, '2023-10-31', '03:29:44', 4095, 'Brak opadow'),
(2051, '2023-10-31', '03:29:55', 4095, 'Brak opadow'),
(2052, '2023-10-31', '03:30:04', 4095, 'Brak opadow'),
(2053, '2023-10-31', '03:30:14', 4095, 'Brak opadow'),
(2054, '2023-10-31', '03:30:24', 4095, 'Brak opadow'),
(2055, '2023-10-31', '03:30:34', 4095, 'Brak opadow'),
(2056, '2023-10-31', '03:30:44', 4095, 'Brak opadow'),
(2057, '2023-10-31', '03:30:54', 4095, 'Brak opadow'),
(2058, '2023-10-31', '03:31:05', 4095, 'Brak opadow'),
(2059, '2023-10-31', '03:31:15', 4095, 'Brak opadow'),
(2060, '2023-10-31', '03:31:25', 4095, 'Brak opadow'),
(2061, '2023-10-31', '03:31:35', 4095, 'Brak opadow'),
(2062, '2023-10-31', '03:31:45', 4095, 'Brak opadow'),
(2063, '2023-10-31', '03:31:55', 4095, 'Brak opadow'),
(2064, '2023-10-31', '03:32:04', 4095, 'Brak opadow'),
(2065, '2023-10-31', '03:32:14', 4095, 'Brak opadow'),
(2066, '2023-10-31', '03:32:24', 4095, 'Brak opadow'),
(2067, '2023-10-31', '03:32:34', 4095, 'Brak opadow'),
(2068, '2023-10-31', '03:32:44', 4095, 'Brak opadow'),
(2069, '2023-10-31', '03:32:54', 4095, 'Brak opadow'),
(2070, '2023-10-31', '03:33:05', 4095, 'Brak opadow'),
(2071, '2023-10-31', '03:33:15', 4095, 'Brak opadow'),
(2072, '2023-10-31', '03:33:25', 4095, 'Brak opadow'),
(2073, '2023-10-31', '03:33:35', 4095, 'Brak opadow'),
(2074, '2023-10-31', '03:33:45', 4095, 'Brak opadow'),
(2075, '2023-10-31', '03:33:55', 4095, 'Brak opadow'),
(2076, '2023-10-31', '03:34:05', 4095, 'Brak opadow'),
(2077, '2023-10-31', '03:34:14', 4095, 'Brak opadow'),
(2078, '2023-10-31', '03:34:24', 4095, 'Brak opadow'),
(2079, '2023-10-31', '03:34:35', 4095, 'Brak opadow'),
(2080, '2023-10-31', '03:34:44', 4095, 'Brak opadow'),
(2081, '2023-10-31', '03:34:55', 4095, 'Brak opadow'),
(2082, '2023-10-31', '03:35:05', 4095, 'Brak opadow'),
(2083, '2023-10-31', '03:35:14', 4095, 'Brak opadow'),
(2084, '2023-10-31', '03:36:00', 4095, 'Brak opadow'),
(2085, '2023-10-31', '03:36:10', 4095, 'Brak opadow'),
(2086, '2023-10-31', '03:36:20', 4095, 'Brak opadow'),
(2087, '2023-10-31', '03:36:30', 4095, 'Brak opadow'),
(2088, '2023-10-31', '03:36:40', 4095, 'Brak opadow'),
(2089, '2023-10-31', '03:36:51', 4095, 'Brak opadow'),
(2090, '2023-10-31', '03:37:00', 4095, 'Brak opadow'),
(2091, '2023-10-31', '03:37:10', 4095, 'Brak opadow'),
(2092, '2023-10-31', '03:37:20', 4095, 'Brak opadow'),
(2093, '2023-10-31', '03:37:30', 4095, 'Brak opadow'),
(2094, '2023-10-31', '03:37:40', 4095, 'Brak opadow'),
(2095, '2023-10-31', '03:37:51', 4095, 'Brak opadow'),
(2096, '2023-10-31', '03:38:35', 4095, 'Brak opadow'),
(2097, '2023-10-31', '03:38:45', 4095, 'Brak opadow'),
(2098, '2023-10-31', '03:38:55', 4095, 'Brak opadow'),
(2099, '2023-10-31', '03:39:05', 4095, 'Brak opadow'),
(2100, '2023-10-31', '03:39:15', 4095, 'Brak opadow'),
(2101, '2023-10-31', '03:39:26', 4095, 'Brak opadow'),
(2102, '2023-10-31', '03:39:35', 4095, 'Brak opadow'),
(2103, '2023-10-31', '03:39:45', 4095, 'Brak opadow'),
(2104, '2023-10-31', '03:39:55', 4095, 'Brak opadow'),
(2105, '1970-01-01', '01:00:38', 4095, 'Brak opadow'),
(2106, '1970-01-01', '01:00:55', 4095, 'Brak opadow'),
(2107, '2023-10-31', '03:41:04', 4095, 'Brak opadow'),
(2108, '2023-10-31', '03:41:08', 4095, 'Brak opadow'),
(2109, '2023-10-31', '03:41:18', 4095, 'Brak opadow'),
(2110, '2023-10-31', '03:41:28', 4095, 'Brak opadow'),
(2111, '2023-10-31', '03:41:38', 4095, 'Brak opadow'),
(2112, '2023-10-31', '03:41:48', 4095, 'Brak opadow'),
(2113, '2023-10-31', '03:41:58', 4095, 'Brak opadow'),
(2114, '2023-10-31', '03:42:09', 4095, 'Brak opadow'),
(2115, '2023-10-31', '03:42:19', 4095, 'Brak opadow'),
(2116, '2023-10-31', '03:42:29', 4095, 'Brak opadow'),
(2117, '2023-10-31', '03:44:01', 4095, 'Brak opadow'),
(2118, '2023-10-31', '03:44:11', 4095, 'Brak opadow'),
(2119, '2023-10-31', '03:44:21', 4095, 'Brak opadow'),
(2120, '2023-10-31', '03:44:31', 4095, 'Brak opadow'),
(2121, '2023-10-31', '03:44:41', 4095, 'Brak opadow'),
(2122, '2023-10-31', '03:44:52', 4095, 'Brak opadow'),
(2123, '2023-10-31', '03:45:02', 4095, 'Brak opadow'),
(2124, '2023-10-31', '03:45:49', 4095, 'Brak opadow'),
(2125, '2023-10-31', '03:45:59', 4095, 'Brak opadow'),
(2126, '2023-10-31', '03:46:09', 4095, 'Brak opadow'),
(2127, '2023-10-31', '03:46:19', 4095, 'Brak opadow'),
(2128, '2023-10-31', '03:46:29', 4095, 'Brak opadow'),
(2129, '2023-10-31', '03:46:41', 4095, 'Brak opadow'),
(2130, '2023-10-31', '03:46:49', 4095, 'Brak opadow'),
(2131, '2023-10-31', '03:46:59', 4095, 'Brak opadow'),
(2132, '2023-10-31', '03:47:09', 4095, 'Brak opadow'),
(2133, '2023-10-31', '03:47:19', 4095, 'Brak opadow'),
(2134, '2023-10-31', '03:47:29', 4095, 'Brak opadow'),
(2135, '2023-10-31', '03:47:39', 4095, 'Brak opadow'),
(2136, '2023-10-31', '03:47:49', 4095, 'Brak opadow'),
(2137, '2023-10-31', '03:47:59', 4095, 'Brak opadow'),
(2138, '2023-10-31', '03:48:09', 4095, 'Brak opadow'),
(2139, '2023-10-31', '03:48:19', 4095, 'Brak opadow'),
(2140, '2023-10-31', '03:48:29', 4095, 'Brak opadow'),
(2141, '2023-10-31', '03:48:40', 4095, 'Brak opadow'),
(2142, '2023-10-31', '03:48:49', 4095, 'Brak opadow'),
(2143, '2023-10-31', '03:48:59', 4095, 'Brak opadow'),
(2144, '2023-10-31', '03:49:09', 4095, 'Brak opadow'),
(2145, '2023-10-31', '03:49:19', 4095, 'Brak opadow'),
(2146, '2023-10-31', '03:49:29', 4095, 'Brak opadow'),
(2147, '2023-10-31', '03:49:39', 4095, 'Brak opadow'),
(2148, '2023-10-31', '03:49:50', 4095, 'Brak opadow'),
(2149, '2023-10-31', '03:53:19', 4095, 'Brak opadow'),
(2150, '2023-10-31', '03:53:29', 4095, 'Brak opadow'),
(2151, '2023-10-31', '03:55:06', 4095, 'Brak opadow'),
(2152, '2023-10-31', '03:55:16', 4095, 'Brak opadow'),
(2153, '2023-10-31', '03:55:26', 4095, 'Brak opadow'),
(2154, '2023-10-31', '03:55:36', 4095, 'Brak opadow'),
(2155, '2023-10-31', '03:55:46', 4095, 'Brak opadow'),
(2156, '2023-10-31', '03:55:57', 4095, 'Brak opadow'),
(2157, '2023-10-31', '03:56:07', 4095, 'Brak opadow'),
(2158, '2023-10-31', '03:56:17', 4095, 'Brak opadow'),
(2159, '2023-10-31', '03:56:27', 4095, 'Brak opadow'),
(2160, '2023-10-31', '03:56:37', 4095, 'Brak opadow'),
(2161, '2023-10-31', '03:56:47', 4095, 'Brak opadow'),
(2162, '2023-10-31', '03:56:57', 4095, 'Brak opadow'),
(2163, '2023-10-31', '03:57:07', 4095, 'Brak opadow'),
(2164, '2023-10-31', '03:57:17', 4095, 'Brak opadow'),
(2165, '2023-10-31', '03:57:26', 4095, 'Brak opadow'),
(2166, '2023-10-31', '03:57:36', 4095, 'Brak opadow'),
(2167, '2023-10-31', '03:57:46', 4095, 'Brak opadow'),
(2168, '2023-10-31', '03:58:35', 4095, 'Brak opadow'),
(2169, '2023-10-31', '03:58:45', 4095, 'Brak opadow'),
(2170, '2023-10-31', '03:58:55', 4095, 'Brak opadow'),
(2171, '2023-10-31', '03:59:05', 4095, 'Brak opadow'),
(2172, '2023-10-31', '03:59:15', 4095, 'Brak opadow'),
(2173, '2023-10-31', '03:59:26', 4095, 'Brak opadow'),
(2174, '2023-10-31', '03:59:35', 4095, 'Brak opadow'),
(2175, '2023-10-31', '03:59:45', 4095, 'Brak opadow'),
(2176, '2023-10-31', '03:59:55', 4095, 'Brak opadow'),
(2177, '2023-10-31', '04:00:06', 4095, 'Brak opadow'),
(2178, '2023-10-31', '04:00:59', 4095, 'Brak opadow'),
(2179, '2023-10-31', '04:01:13', 4095, 'Brak opadow'),
(2180, '2023-10-31', '04:01:19', 4095, 'Brak opadow'),
(2181, '2023-10-31', '04:01:29', 4095, 'Brak opadow'),
(2182, '2023-10-31', '04:01:39', 4095, 'Brak opadow'),
(2183, '2023-10-31', '04:01:50', 4095, 'Brak opadow'),
(2184, '2023-10-31', '04:01:59', 4095, 'Brak opadow'),
(2185, '2023-10-31', '04:02:09', 4095, 'Brak opadow'),
(2186, '2023-10-31', '04:02:19', 4095, 'Brak opadow'),
(2187, '2023-10-31', '04:02:29', 4095, 'Brak opadow'),
(2188, '2023-10-31', '04:02:39', 4095, 'Brak opadow'),
(2189, '2023-10-31', '04:02:50', 4095, 'Brak opadow'),
(2190, '2023-10-31', '04:03:00', 4095, 'Brak opadow'),
(2191, '2023-10-31', '04:03:10', 4095, 'Brak opadow'),
(2192, '2023-10-31', '04:03:20', 4095, 'Brak opadow'),
(2193, '2023-10-31', '04:03:30', 4095, 'Brak opadow'),
(2194, '2023-10-31', '04:03:40', 4095, 'Brak opadow'),
(2195, '2023-10-31', '04:03:50', 4095, 'Brak opadow'),
(2196, '2023-10-31', '04:03:59', 4095, 'Brak opadow'),
(2197, '2023-10-31', '04:04:09', 4095, 'Brak opadow'),
(2198, '2023-10-31', '04:04:19', 4095, 'Brak opadow'),
(2199, '2023-10-31', '04:04:29', 4095, 'Brak opadow'),
(2200, '2023-10-31', '04:04:39', 4095, 'Brak opadow'),
(2201, '2023-10-31', '04:04:49', 4095, 'Brak opadow'),
(2202, '2023-10-31', '04:05:37', 4095, 'Brak opadow'),
(2203, '2023-10-31', '04:05:50', 4095, 'Brak opadow'),
(2204, '2023-10-31', '04:05:58', 4095, 'Brak opadow'),
(2205, '2023-10-31', '04:06:07', 4095, 'Brak opadow'),
(2206, '2023-10-31', '04:06:17', 4095, 'Brak opadow'),
(2207, '2023-10-31', '04:06:28', 4095, 'Brak opadow'),
(2208, '2023-10-31', '04:06:37', 4095, 'Brak opadow'),
(2209, '2023-10-31', '04:06:47', 4095, 'Brak opadow'),
(2210, '2023-10-31', '04:06:57', 4095, 'Brak opadow'),
(2211, '2023-10-31', '04:07:07', 4095, 'Brak opadow'),
(2212, '2023-10-31', '04:07:17', 4095, 'Brak opadow'),
(2213, '2023-10-31', '04:07:28', 4095, 'Brak opadow'),
(2214, '2023-10-31', '04:07:38', 4095, 'Brak opadow'),
(2215, '2023-10-31', '04:07:48', 4095, 'Brak opadow'),
(2216, '2023-10-31', '04:07:58', 4095, 'Brak opadow'),
(2217, '2023-10-31', '04:08:08', 4095, 'Brak opadow'),
(2218, '2023-10-31', '04:08:18', 4095, 'Brak opadow'),
(2219, '2023-10-31', '04:08:28', 4095, 'Brak opadow'),
(2220, '2023-10-31', '04:08:37', 4095, 'Brak opadow'),
(2221, '2023-10-31', '04:08:47', 4095, 'Brak opadow'),
(2222, '2023-10-31', '04:08:57', 4095, 'Brak opadow'),
(2223, '2023-10-31', '04:09:07', 4095, 'Brak opadow'),
(2224, '2023-10-31', '04:09:17', 4095, 'Brak opadow'),
(2225, '2023-10-31', '04:09:27', 4095, 'Brak opadow'),
(2226, '2023-10-31', '04:09:37', 4095, 'Brak opadow'),
(2227, '2023-10-31', '04:09:47', 4095, 'Brak opadow'),
(2228, '2023-10-31', '04:09:57', 4095, 'Brak opadow'),
(2229, '2023-10-31', '04:10:07', 4095, 'Brak opadow'),
(2230, '2023-10-31', '04:10:17', 4095, 'Brak opadow'),
(2231, '2023-10-31', '04:10:27', 4095, 'Brak opadow'),
(2232, '2023-10-31', '04:10:38', 4095, 'Brak opadow'),
(2233, '2023-10-31', '04:10:47', 4095, 'Brak opadow'),
(2234, '2023-10-31', '04:10:57', 4095, 'Brak opadow'),
(2235, '2023-10-31', '04:11:07', 4095, 'Brak opadow'),
(2236, '2023-10-31', '04:11:55', 4095, 'Brak opadow'),
(2237, '2023-10-31', '04:12:22', 4095, 'Brak opadow'),
(2238, '2023-10-31', '04:12:47', 4095, 'Brak opadow'),
(2239, '2023-10-31', '04:13:41', 4095, 'Brak opadow'),
(2240, '2023-10-31', '04:15:33', 4095, 'Brak opadow'),
(2241, '2023-10-31', '04:15:42', 4095, 'Brak opadow'),
(2242, '2023-10-31', '04:15:52', 4095, 'Brak opadow'),
(2243, '2023-10-31', '04:16:02', 4095, 'Brak opadow');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `water_sensor`
--

CREATE TABLE `water_sensor` (
  `ID` int(11) NOT NULL,
  `Data_odczytu` date NOT NULL,
  `Godzina_odczytu` time NOT NULL,
  `Wartosc` int(11) NOT NULL,
  `Wartosc_tekstowa` varchar(255) NOT NULL,
  `Alert` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `water_sensor`
--

INSERT INTO `water_sensor` (`ID`, `Data_odczytu`, `Godzina_odczytu`, `Wartosc`, `Wartosc_tekstowa`, `Alert`) VALUES
(1767, '2023-10-30', '04:00:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1768, '2023-10-30', '04:00:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1769, '2023-10-30', '04:00:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1770, '2023-10-30', '04:00:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1771, '2023-10-30', '04:00:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1772, '2023-10-30', '04:01:05', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1773, '2023-10-30', '04:01:15', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1774, '2023-10-30', '04:01:25', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1775, '2023-10-30', '04:01:35', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1776, '2023-10-30', '04:01:45', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1777, '2023-10-30', '04:01:55', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1778, '2023-10-30', '04:02:05', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1779, '2023-10-30', '04:02:15', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1780, '2023-10-30', '04:02:25', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1781, '2023-10-30', '04:02:35', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1782, '2023-10-30', '04:02:45', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1783, '2023-10-30', '04:02:55', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1784, '2023-10-30', '04:03:05', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1785, '2023-10-30', '04:03:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1786, '2023-10-30', '04:03:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1787, '2023-10-30', '04:03:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1788, '2023-10-30', '04:03:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1789, '2023-10-30', '04:03:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1790, '2023-10-30', '04:04:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1791, '2023-10-30', '04:04:15', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1792, '2023-10-30', '04:04:25', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1793, '2023-10-30', '04:04:35', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1794, '2023-10-30', '04:04:45', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1795, '2023-10-30', '04:04:55', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1796, '2023-10-30', '04:05:05', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1797, '2023-10-30', '04:05:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1798, '2023-10-30', '04:05:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1799, '2023-10-30', '04:05:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1800, '2023-10-30', '04:05:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1801, '2023-10-30', '04:05:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1802, '2023-10-30', '04:06:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1803, '2023-10-30', '04:06:15', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1804, '2023-10-30', '04:07:03', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1805, '2023-10-30', '03:07:50', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1806, '2023-10-30', '03:08:00', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1807, '2023-10-30', '03:08:10', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1808, '2023-10-30', '03:08:20', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1809, '2023-10-30', '03:08:30', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1810, '2023-10-31', '02:44:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1811, '2023-10-31', '02:44:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1812, '2023-10-31', '02:44:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1813, '2023-10-31', '02:44:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1814, '2023-10-31', '02:44:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1815, '2023-10-31', '02:44:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1816, '2023-10-31', '02:45:03', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1817, '2023-10-31', '02:45:13', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1818, '2023-10-31', '02:45:23', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1819, '2023-10-31', '02:45:33', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1820, '2023-10-31', '02:45:43', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1821, '2023-10-31', '02:45:53', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1822, '2023-10-31', '02:46:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1823, '2023-10-31', '02:46:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1824, '2023-10-31', '02:46:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1825, '2023-10-31', '02:46:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1826, '2023-10-31', '02:46:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1827, '2023-10-31', '02:46:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1828, '2023-10-31', '02:47:03', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1829, '2023-10-31', '02:48:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1830, '2023-10-31', '02:48:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1831, '2023-10-31', '02:48:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1832, '2023-10-31', '02:48:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1833, '2023-10-31', '02:48:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1834, '2023-10-31', '02:48:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1835, '2023-10-31', '02:49:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1836, '2023-10-31', '02:49:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1837, '2023-10-31', '02:49:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1838, '2023-10-31', '02:49:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1839, '2023-10-31', '02:49:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1840, '2023-10-31', '02:49:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1841, '2023-10-31', '02:50:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1842, '2023-10-31', '02:50:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1843, '2023-10-31', '02:50:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1844, '2023-10-31', '02:50:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1845, '2023-10-31', '02:50:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1846, '2023-10-31', '02:50:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1847, '2023-10-31', '02:51:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1848, '2023-10-31', '02:51:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1849, '2023-10-31', '02:51:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1850, '2023-10-31', '02:51:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1851, '2023-10-31', '02:51:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1852, '2023-10-31', '02:51:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1853, '2023-10-31', '02:52:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1854, '2023-10-31', '02:52:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1855, '2023-10-31', '02:52:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1856, '2023-10-31', '02:52:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1857, '2023-10-31', '02:52:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1858, '2023-10-31', '02:52:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1859, '2023-10-31', '02:53:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1860, '2023-10-31', '02:53:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1861, '2023-10-31', '02:53:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1862, '2023-10-31', '02:53:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1863, '2023-10-31', '02:53:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1864, '2023-10-31', '02:53:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1865, '2023-10-31', '02:54:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1866, '2023-10-31', '02:54:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1867, '2023-10-31', '02:54:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1868, '2023-10-31', '02:54:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1869, '2023-10-31', '02:54:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1870, '2023-10-31', '02:54:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1871, '2023-10-31', '02:55:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1872, '2023-10-31', '02:55:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1873, '2023-10-31', '02:55:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1874, '2023-10-31', '02:55:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1875, '2023-10-31', '02:55:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1876, '2023-10-31', '02:55:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1877, '2023-10-31', '02:56:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1878, '2023-10-31', '02:56:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1879, '2023-10-31', '02:56:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1880, '2023-10-31', '02:56:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1881, '2023-10-31', '02:56:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1882, '2023-10-31', '02:56:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1883, '2023-10-31', '02:57:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1884, '2023-10-31', '02:57:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1885, '2023-10-31', '02:57:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1886, '2023-10-31', '02:57:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1887, '2023-10-31', '02:57:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1888, '2023-10-31', '02:57:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1889, '2023-10-31', '02:58:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1890, '2023-10-31', '02:58:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1891, '2023-10-31', '02:58:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1892, '2023-10-31', '02:58:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1893, '2023-10-31', '02:58:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1894, '2023-10-31', '02:58:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1895, '2023-10-31', '02:59:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1896, '2023-10-31', '02:59:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1897, '2023-10-31', '02:59:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1898, '2023-10-31', '02:59:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1899, '2023-10-31', '02:59:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1900, '2023-10-31', '02:59:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1901, '2023-10-31', '03:00:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1902, '2023-10-31', '03:00:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1903, '2023-10-31', '03:00:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1904, '2023-10-31', '03:00:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1905, '2023-10-31', '03:00:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1906, '2023-10-31', '03:00:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1907, '2023-10-31', '03:01:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1908, '2023-10-31', '03:01:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1909, '2023-10-31', '03:01:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1910, '2023-10-31', '03:01:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1911, '2023-10-31', '03:01:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1912, '2023-10-31', '03:01:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1913, '2023-10-31', '03:02:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1914, '2023-10-31', '03:02:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1915, '2023-10-31', '03:02:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1916, '2023-10-31', '03:02:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1917, '2023-10-31', '03:02:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1918, '2023-10-31', '03:02:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1919, '2023-10-31', '03:03:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1920, '2023-10-31', '03:03:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1921, '2023-10-31', '03:03:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1922, '2023-10-31', '03:03:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1923, '2023-10-31', '03:03:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1924, '2023-10-31', '03:03:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1925, '2023-10-31', '03:04:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1926, '2023-10-31', '03:04:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1927, '2023-10-31', '03:04:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1928, '2023-10-31', '03:04:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1929, '2023-10-31', '03:04:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1930, '2023-10-31', '03:04:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1931, '2023-10-31', '03:05:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1932, '2023-10-31', '03:05:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1933, '2023-10-31', '03:05:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1934, '2023-10-31', '03:05:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1935, '2023-10-31', '03:05:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1936, '2023-10-31', '03:05:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1937, '2023-10-31', '03:06:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1938, '2023-10-31', '03:06:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1939, '2023-10-31', '03:06:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1940, '2023-10-31', '03:06:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1941, '2023-10-31', '03:06:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1942, '2023-10-31', '03:06:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1943, '2023-10-31', '03:07:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1944, '2023-10-31', '03:07:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1945, '2023-10-31', '03:07:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1946, '2023-10-31', '03:07:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1947, '2023-10-31', '03:07:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1948, '2023-10-31', '03:07:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1949, '2023-10-31', '03:08:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1950, '2023-10-31', '03:08:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1951, '2023-10-31', '03:08:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1952, '2023-10-31', '03:08:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1953, '2023-10-31', '03:08:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1954, '2023-10-31', '03:08:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1955, '2023-10-31', '03:09:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1956, '2023-10-31', '03:09:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1957, '2023-10-31', '03:09:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1958, '2023-10-31', '03:09:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1959, '2023-10-31', '03:09:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1960, '2023-10-31', '03:09:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1961, '2023-10-31', '03:10:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1962, '2023-10-31', '03:10:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1963, '2023-10-31', '03:10:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1964, '2023-10-31', '03:10:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1965, '2023-10-31', '03:10:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1966, '2023-10-31', '03:10:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1967, '2023-10-31', '03:11:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1968, '2023-10-31', '03:11:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1969, '2023-10-31', '03:11:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1970, '2023-10-31', '03:11:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1971, '2023-10-31', '03:11:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1972, '2023-10-31', '03:11:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1973, '2023-10-31', '03:12:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1974, '2023-10-31', '03:12:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1975, '2023-10-31', '03:12:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1976, '2023-10-31', '03:12:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1977, '2023-10-31', '03:12:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1978, '2023-10-31', '03:12:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1979, '2023-10-31', '03:13:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1980, '2023-10-31', '03:13:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1981, '2023-10-31', '03:13:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1982, '2023-10-31', '03:13:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1983, '2023-10-31', '03:13:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1984, '2023-10-31', '03:13:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1985, '2023-10-31', '03:14:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1986, '2023-10-31', '03:14:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1987, '2023-10-31', '03:14:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1988, '2023-10-31', '03:14:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1989, '2023-10-31', '03:14:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1990, '2023-10-31', '03:14:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1991, '2023-10-31', '03:15:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1992, '2023-10-31', '03:15:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1993, '2023-10-31', '03:15:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1994, '2023-10-31', '03:15:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1995, '2023-10-31', '03:15:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1996, '2023-10-31', '03:15:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1997, '2023-10-31', '03:16:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1998, '2023-10-31', '03:16:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(1999, '2023-10-31', '03:16:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2000, '2023-10-31', '03:16:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2001, '2023-10-31', '03:16:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2002, '2023-10-31', '03:16:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2003, '2023-10-31', '03:17:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2004, '2023-10-31', '03:17:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2005, '2023-10-31', '03:17:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2006, '2023-10-31', '03:17:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2007, '2023-10-31', '03:17:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2008, '2023-10-31', '03:17:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2009, '2023-10-31', '03:18:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2010, '2023-10-31', '03:18:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2011, '2023-10-31', '03:18:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2012, '2023-10-31', '03:18:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2013, '2023-10-31', '03:18:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2014, '2023-10-31', '03:18:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2015, '2023-10-31', '03:21:43', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2016, '2023-10-31', '03:21:53', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2017, '2023-10-31', '03:22:03', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2018, '2023-10-31', '03:22:13', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2019, '2023-10-31', '03:22:23', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2020, '2023-10-31', '03:22:33', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2021, '2023-10-31', '03:23:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2022, '2023-10-31', '03:23:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2023, '2023-10-31', '03:23:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2024, '2023-10-31', '03:24:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2025, '2023-10-31', '03:24:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2026, '2023-10-31', '03:24:29', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2027, '2023-10-31', '03:24:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2028, '2023-10-31', '03:24:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2029, '2023-10-31', '03:24:59', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2030, '2023-10-31', '03:25:09', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2031, '2023-10-31', '03:25:19', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2032, '2023-10-31', '03:26:04', 2039, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2033, '2023-10-31', '03:26:14', 1979, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2034, '2023-10-31', '03:26:24', 1998, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2035, '2023-10-31', '03:26:34', 1745, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2036, '2023-10-31', '03:26:44', 1943, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2037, '2023-10-31', '03:26:54', 1424, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2038, '2023-10-31', '03:27:04', 2047, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2039, '2023-10-31', '03:27:14', 2041, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2040, '2023-10-31', '03:27:24', 2123, 'Stan krytyczny zbiornika', 'Zbiornik do oproznienia'),
(2041, '2023-10-31', '03:27:34', 2077, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2042, '2023-10-31', '03:27:44', 2064, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2043, '2023-10-31', '03:27:54', 2043, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2044, '2023-10-31', '03:28:03', 2030, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2045, '2023-10-31', '03:28:13', 2013, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2046, '2023-10-31', '03:28:23', 1986, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2047, '2023-10-31', '03:28:33', 1993, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2048, '2023-10-31', '03:28:43', 1984, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2049, '2023-10-31', '03:28:54', 1964, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2050, '2023-10-31', '03:29:03', 1953, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2051, '2023-10-31', '03:29:13', 1965, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2052, '2023-10-31', '03:29:23', 1962, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2053, '2023-10-31', '03:29:33', 1936, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2054, '2023-10-31', '03:29:43', 1955, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2055, '2023-10-31', '03:29:53', 1939, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2056, '2023-10-31', '03:30:03', 1920, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2057, '2023-10-31', '03:30:13', 1925, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2058, '2023-10-31', '03:30:23', 1923, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2059, '2023-10-31', '03:30:33', 1918, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2060, '2023-10-31', '03:30:43', 1909, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2061, '2023-10-31', '03:30:53', 1881, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2062, '2023-10-31', '03:31:04', 1855, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2063, '2023-10-31', '03:31:14', 1851, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2064, '2023-10-31', '03:31:24', 1847, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2065, '2023-10-31', '03:31:34', 1827, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2066, '2023-10-31', '03:31:44', 1803, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2067, '2023-10-31', '03:31:54', 1779, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2068, '2023-10-31', '03:32:03', 2112, 'Stan krytyczny zbiornika', 'Zbiornik do oproznienia'),
(2069, '2023-10-31', '03:32:13', 1745, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2070, '2023-10-31', '03:32:23', 1395, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2071, '2023-10-31', '03:32:33', 1063, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2072, '2023-10-31', '03:32:43', 615, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2073, '2023-10-31', '03:32:53', 245, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2074, '2023-10-31', '03:33:04', 87, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2075, '2023-10-31', '03:33:14', 11, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2076, '2023-10-31', '03:33:24', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2077, '2023-10-31', '03:33:34', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2078, '2023-10-31', '03:33:44', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2079, '2023-10-31', '03:33:54', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2080, '2023-10-31', '03:34:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2081, '2023-10-31', '03:34:13', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2082, '2023-10-31', '03:34:23', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2083, '2023-10-31', '03:34:33', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2084, '2023-10-31', '03:34:43', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2085, '2023-10-31', '03:34:53', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2086, '2023-10-31', '03:35:03', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2087, '2023-10-31', '03:35:13', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2088, '2023-10-31', '03:35:59', 2003, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2089, '2023-10-31', '03:36:09', 2025, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2090, '2023-10-31', '03:36:19', 1995, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2091, '2023-10-31', '03:36:29', 1883, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2092, '2023-10-31', '03:36:39', 1827, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2093, '2023-10-31', '03:36:50', 1762, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2094, '2023-10-31', '03:36:59', 1713, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2095, '2023-10-31', '03:37:09', 1665, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2096, '2023-10-31', '03:37:19', 1607, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2097, '2023-10-31', '03:37:29', 1565, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2098, '2023-10-31', '03:37:39', 1498, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2099, '2023-10-31', '03:37:49', 1431, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2100, '2023-10-31', '03:38:34', 1936, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2101, '2023-10-31', '03:38:44', 1975, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2102, '2023-10-31', '03:38:54', 1892, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2103, '2023-10-31', '03:39:04', 1845, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2104, '2023-10-31', '03:39:14', 1776, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2105, '2023-10-31', '03:39:25', 1733, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2106, '2023-10-31', '03:39:34', 1664, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2107, '2023-10-31', '03:39:44', 1591, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2108, '2023-10-31', '03:39:54', 1477, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2109, '1970-01-01', '01:00:35', 117, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2110, '1970-01-01', '01:00:45', 53, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2111, '1970-01-01', '03:41:03', 20, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2112, '2023-10-31', '03:41:07', 16, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2113, '2023-10-31', '03:41:17', 5, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2114, '2023-10-31', '03:41:27', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2115, '2023-10-31', '03:41:37', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2116, '2023-10-31', '03:41:47', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2117, '2023-10-31', '03:41:57', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2118, '2023-10-31', '03:42:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2119, '2023-10-31', '03:42:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2120, '2023-10-31', '03:42:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2121, '2023-10-31', '03:42:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2122, '2023-10-31', '03:44:00', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2123, '2023-10-31', '03:44:10', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2124, '2023-10-31', '03:44:20', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2125, '2023-10-31', '03:44:30', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2126, '2023-10-31', '03:44:40', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2127, '2023-10-31', '03:44:51', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2128, '2023-10-31', '03:45:01', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2129, '2023-10-31', '03:45:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2130, '2023-10-31', '03:45:58', 1990, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2131, '2023-10-31', '03:46:08', 1887, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2132, '2023-10-31', '03:46:18', 1798, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2133, '2023-10-31', '03:46:28', 1729, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2134, '2023-10-31', '03:46:40', 1650, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2135, '2023-10-31', '03:46:48', 1477, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2136, '2023-10-31', '03:46:58', 1136, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2137, '2023-10-31', '03:47:08', 444, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2138, '2023-10-31', '03:47:18', 121, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2139, '2023-10-31', '03:47:28', 41, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2140, '2023-10-31', '03:47:38', 16, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2141, '2023-10-31', '03:47:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2142, '2023-10-31', '03:47:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2143, '2023-10-31', '03:48:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2144, '2023-10-31', '03:48:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2145, '2023-10-31', '03:48:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2146, '2023-10-31', '03:48:39', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2147, '2023-10-31', '03:48:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2148, '2023-10-31', '03:48:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2149, '2023-10-31', '03:49:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2150, '2023-10-31', '03:49:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2151, '2023-10-31', '03:49:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2152, '2023-10-31', '03:49:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2153, '2023-10-31', '03:49:49', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2154, '2023-10-31', '03:53:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2155, '2023-10-31', '03:53:28', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2156, '2023-10-31', '03:55:05', 1999, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2157, '2023-10-31', '03:55:15', 1957, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2158, '2023-10-31', '03:55:25', 1863, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2159, '2023-10-31', '03:55:35', 1730, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2160, '2023-10-31', '03:55:45', 1606, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2161, '2023-10-31', '03:55:56', 1449, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2162, '2023-10-31', '03:56:06', 1269, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2163, '2023-10-31', '03:56:16', 1116, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2164, '2023-10-31', '03:56:26', 779, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2165, '2023-10-31', '03:56:36', 377, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2166, '2023-10-31', '03:56:46', 65, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2167, '2023-10-31', '03:56:56', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2168, '2023-10-31', '03:57:05', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2169, '2023-10-31', '03:57:15', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2170, '2023-10-31', '03:57:25', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2171, '2023-10-31', '03:57:35', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2172, '2023-10-31', '03:57:45', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2173, '2023-10-31', '03:58:34', 1942, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2174, '2023-10-31', '03:58:44', 1899, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2175, '2023-10-31', '03:58:54', 1751, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2176, '2023-10-31', '03:59:04', 1519, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2177, '2023-10-31', '03:59:14', 859, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2178, '2023-10-31', '03:59:25', 272, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2179, '2023-10-31', '03:59:34', 128, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2180, '2023-10-31', '03:59:44', 48, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2181, '2023-10-31', '03:59:54', 1, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2182, '2023-10-31', '04:00:04', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2183, '2023-10-31', '04:00:14', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2184, '2023-10-31', '04:00:58', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2185, '2023-10-31', '04:01:08', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2186, '2023-10-31', '04:01:18', 1950, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2187, '2023-10-31', '04:01:28', 1807, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2188, '2023-10-31', '04:01:38', 1693, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2189, '2023-10-31', '04:01:49', 1502, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2190, '2023-10-31', '04:01:58', 1129, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2191, '2023-10-31', '04:02:08', 541, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2192, '2023-10-31', '04:02:18', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2193, '2023-10-31', '04:02:28', 1990, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2194, '2023-10-31', '04:02:38', 1824, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2195, '2023-10-31', '04:02:48', 1776, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2196, '2023-10-31', '04:02:59', 1724, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2197, '2023-10-31', '04:03:09', 1638, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2198, '2023-10-31', '04:03:19', 1523, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2199, '2023-10-31', '04:03:29', 1334, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2200, '2023-10-31', '04:03:39', 1088, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2201, '2023-10-31', '04:03:49', 754, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2202, '2023-10-31', '04:03:58', 563, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2203, '2023-10-31', '04:04:08', 445, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2204, '2023-10-31', '04:04:18', 304, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2205, '2023-10-31', '04:04:28', 108, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2206, '2023-10-31', '04:04:38', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2207, '2023-10-31', '04:04:48', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2208, '2023-10-31', '04:05:36', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2209, '2023-10-31', '04:05:46', 1936, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2210, '2023-10-31', '04:05:56', 1553, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2211, '2023-10-31', '04:06:06', 753, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2212, '2023-10-31', '04:06:16', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2213, '2023-10-31', '04:06:27', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2214, '2023-10-31', '04:06:36', 1936, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2215, '2023-10-31', '04:06:46', 1809, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2216, '2023-10-31', '04:06:56', 1715, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2217, '2023-10-31', '04:07:06', 1612, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2218, '2023-10-31', '04:07:16', 1424, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2219, '2023-10-31', '04:07:26', 1070, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2220, '2023-10-31', '04:07:37', 576, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2221, '2023-10-31', '04:07:47', 30, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2222, '2023-10-31', '04:07:57', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2223, '2023-10-31', '04:08:07', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2224, '2023-10-31', '04:08:17', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2225, '2023-10-31', '04:08:27', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2226, '2023-10-31', '04:08:36', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2227, '2023-10-31', '04:08:46', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2228, '2023-10-31', '04:08:56', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2229, '2023-10-31', '04:09:06', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2230, '2023-10-31', '04:09:16', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2231, '2023-10-31', '04:09:26', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2232, '2023-10-31', '04:09:36', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2233, '2023-10-31', '04:09:46', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2234, '2023-10-31', '04:09:56', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2235, '2023-10-31', '04:10:06', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2236, '2023-10-31', '04:10:16', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2237, '2023-10-31', '04:10:26', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2238, '2023-10-31', '04:10:37', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2239, '2023-10-31', '04:10:46', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2240, '2023-10-31', '04:10:56', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2241, '2023-10-31', '04:11:06', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2242, '2023-10-31', '04:11:54', 1894, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2243, '2023-10-31', '04:12:21', 1650, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2244, '2023-10-31', '04:12:46', 193, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2245, '2023-10-31', '04:13:40', 1756, 'Poziom wysoki zbiornika', 'Zbiornik do oproznienia'),
(2246, '2023-10-31', '04:15:33', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2247, '2023-10-31', '04:15:41', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2248, '2023-10-31', '04:15:51', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2249, '2023-10-31', '04:16:01', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia'),
(2250, '2023-10-31', '04:16:11', 0, 'Poziom niski zbiornika', 'Zbiornik jeszcze nie do oproznienia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeksy dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeksy dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `device_info`
--
ALTER TABLE `device_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeksy dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeksy dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeksy dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rain_gaugae`
--
ALTER TABLE `rain_gaugae`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rain_sensor`
--
ALTER TABLE `rain_sensor`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `water_sensor`
--
ALTER TABLE `water_sensor`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `device_info`
--
ALTER TABLE `device_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT dla tabeli `rain_gaugae`
--
ALTER TABLE `rain_gaugae`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=734;

--
-- AUTO_INCREMENT dla tabeli `rain_sensor`
--
ALTER TABLE `rain_sensor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2244;

--
-- AUTO_INCREMENT dla tabeli `water_sensor`
--
ALTER TABLE `water_sensor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2251;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
