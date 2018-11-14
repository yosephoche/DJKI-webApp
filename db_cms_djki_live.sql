-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2018 at 10:59 PM
-- Server version: 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_djki_live`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_group` int(10) NOT NULL,
  `published` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `keyword` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `id_posts` int(11) NOT NULL,
  `comment` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `keyword` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries_images`
--

CREATE TABLE `galleries_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_albums` int(11) NOT NULL,
  `file_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries_images`
--

INSERT INTO `galleries_images` (`id`, `id_albums`, `file_name`, `dir`) VALUES
(1, 0, '899222.jpg', 'media'),
(2, 0, '876922.jpg', 'media'),
(3, 0, '827805.jpg', 'media'),
(4, 0, '499480.jpg', 'media'),
(5, 0, '840826.jpg', 'media'),
(6, 0, '689481.jpg', 'media'),
(7, 0, '585460.jpg', 'media'),
(8, 0, '944116.jpg', 'media'),
(9, 0, '644815.jpg', 'media'),
(10, 0, '885200.jpeg', 'media'),
(11, 0, '924210.jpg', 'media'),
(12, 0, '980105.jpeg', 'media'),
(13, 0, '332655.jpg', 'media'),
(14, 0, '736020.jpg', 'media'),
(15, 0, '901742.jpg', 'media'),
(16, 0, '183609.jpg', 'media'),
(17, 0, '681133.jpg', 'media'),
(18, 0, '774182.jpg', 'media'),
(19, 0, '831475.jpg', 'media'),
(20, 0, '346256.jpg', 'media'),
(21, 0, '970805.jpg', 'media'),
(22, 0, '806594.jpg', 'media'),
(23, 0, '120585.jpg', 'media'),
(24, 0, '585261.jpeg', 'media'),
(25, 0, '220506.jpeg', 'media'),
(26, 0, '160036.jpg', 'media'),
(27, 0, '645849.jpg', 'media'),
(28, 0, '965973.jpg', 'media'),
(29, 0, '508514.jpeg', 'media'),
(30, 0, '922767.jpeg', 'media'),
(31, 0, '329255.jpeg', 'media'),
(33, 0, '297591.jpg', 'media'),
(34, 0, '516855.JPG', 'media'),
(35, 0, '377746.JPG', 'media'),
(36, 0, '634370.jpg', 'media'),
(37, 0, '433691.jpg', 'media'),
(39, 0, '416138.jpg', 'media');

-- --------------------------------------------------------

--
-- Table structure for table `group_archive`
--

CREATE TABLE `group_archive` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `desc` text NOT NULL,
  `slug` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `media_album`
--

CREATE TABLE `media_album` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `status` enum('header','footer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '999',
  `description1` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `url`, `parent`, `status`, `image`, `sort`, `description1`, `description`) VALUES
(6, 'Liputan Humas', '/post/category/liputan-humas/1', 0, 'header', 'default.jpg', 85, '', ''),
(7, 'Informasi Kekayaan Intelektual', '#', 0, 'header', 'default.jpg', 0, '', 'Jenis - jenis kekayaan intelektual DJKI Kemenkumham RI'),
(8, 'Layanan Kekayaan Intelektual', '#', 0, 'header', 'default.jpg', 53, '', 'Jenis - jenis kekayaan intelektual DJKI Kemenkumham RI'),
(9, 'Tentang', '/page/tentang-kami', 0, 'header', '877402.png', 92, '', ''),
(10, 'Paten', '#', 7, 'header', '208288.png', 1, '', ''),
(11, 'Pengenalan Paten', 'http://www.dgip.go.id/pengenalan-paten', 10, 'header', '132935.png', 2, '', ''),
(12, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-paten', 10, 'header', 'default.jpg', 3, '', ''),
(13, 'Merk', '#', 7, 'header', '903041.png', 13, '', ''),
(14, 'Hak Cipta', '#', 7, 'header', '860124.png', 22, '', ''),
(15, 'Desain Industri', '#', 7, 'header', '301707.png', 29, '', ''),
(16, 'Indikasi Geografis', '#', 7, 'header', '834555.png', 36, '', ''),
(17, 'DTLST & RD', '#', 7, 'header', '154199.png', 44, '', ''),
(18, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-permohonan-paten', 10, 'header', 'default.jpg', 4, '', ''),
(19, 'Tarif', 'http://www.dgip.go.id/tarif-paten', 10, 'header', 'default.jpg', 5, '', ''),
(20, 'Komisi Banding Paten', 'http://www.dgip.go.id/susunan-komisi-banding-paten', 10, 'header', 'default.jpg', 6, '', ''),
(21, 'Klasifikasi IPC', 'http://www.wipo.int/classifications/ipc/en/', 10, 'header', 'default.jpg', 7, '', ''),
(22, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-paten', 10, 'header', 'default.jpg', 8, '', ''),
(23, 'ASPEC dan PPH', 'http://www.dgip.go.id/asean-patent-examination-co-operation-pph', 10, 'header', 'default.jpg', 9, '', ''),
(24, 'Pembatalan Atas Keputusan Pengadilan', 'http://www.dgip.go.id/pembatalan-atas-keputusan-pengadilan', 10, 'header', 'default.jpg', 10, '', ''),
(25, 'WIPO TISC', 'http://www.wipo.int/tisc/en/', 10, 'header', 'default.jpg', 11, '', ''),
(26, 'Pengenalan Merk', 'http://www.dgip.go.id/pengenalan-merek', 13, 'header', 'default.jpg', 13, '', ''),
(27, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-merek', 13, 'header', 'default.jpg', 14, '', ''),
(28, 'Prosedur Permohonan Madrid Protocol', 'http://www.dgip.go.id/prosedur-pendaftaran-madrid-protocol', 13, 'header', 'default.jpg', 15, '', ''),
(29, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-permohonan-merek', 13, 'header', 'default.jpg', 16, '', ''),
(30, 'Tarif', 'http://www.dgip.go.id/tarif-merek', 13, 'header', 'default.jpg', 17, '', ''),
(31, 'Komisi Banding Merek', 'http://www.dgip.go.id/komisi-banding-merek-2018', 13, 'header', 'default.jpg', 18, '', ''),
(32, 'Klasifikasi Barang / Jasa (Nice)', 'http://skm.dgip.go.id/', 13, 'header', 'default.jpg', 19, '', ''),
(33, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-merek', 13, 'header', 'default.jpg', 20, '', ''),
(34, 'Pengenalan Hak Cipta', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-merek', 14, 'header', 'default.jpg', 22, '', ''),
(35, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-hak-cipta', 14, 'header', 'default.jpg', 23, '', ''),
(36, 'Formulir', 'http://www.dgip.go.id/formulir-hak-cipta', 14, 'header', 'default.jpg', 24, '', ''),
(37, 'Tarif', 'http://www.dgip.go.id/tarif-hak-cipta', 14, 'header', 'default.jpg', 25, '', ''),
(38, 'Lembaga Manajemen Kolektif', 'http://www.dgip.go.id/lembaga-manajemen-kolektif', 14, 'header', 'default.jpg', 26, '', ''),
(39, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-hak-cipta', 14, 'header', 'default.jpg', 27, '', ''),
(40, 'Pengenalan Desain Industri', 'http://www.dgip.go.id/pengenalan-desain-industri', 15, 'header', 'default.jpg', 29, '', ''),
(41, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-desain-industri', 15, 'header', 'default.jpg', 30, '', ''),
(42, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-desain-indutri', 15, 'header', 'default.jpg', 31, '', ''),
(43, 'Tarif', 'http://www.dgip.go.id/tarif-desain-industri', 15, 'header', 'default.jpg', 32, '', ''),
(44, 'Klasifikasi Locarno', 'http://www.wipo.int/classifications/locarno/en/', 15, 'header', 'default.jpg', 33, '', ''),
(45, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-desain-industri', 15, 'header', 'default.jpg', 34, '', ''),
(46, 'Pengenalan Indikasi Geografis', 'http://www.dgip.go.id/pengenalan-indikasi-geografis', 16, 'header', 'default.jpg', 36, '', ''),
(47, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-indikasi-geografis', 16, 'header', 'default.jpg', 37, '', ''),
(48, 'Formulir', 'http://www.dgip.go.id/formulir-indikasi-geografis', 16, 'header', 'default.jpg', 38, '', ''),
(49, 'Tarif', 'http://www.dgip.go.id/tarif-indikasi-geografis', 16, 'header', 'default.jpg', 39, '', ''),
(50, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-indikasi-geografis', 16, 'header', 'default.jpg', 40, '', ''),
(51, 'Indikasi Geografis Terdaftar', 'http://www.dgip.go.id/images/ki-images/pdf-files/indikasi_geografis/IG%20Terdaftar%20dan%20Peta%20Wilayah%20GI%20Terdaftar%20edit%20September%202018.pdf', 16, 'header', 'default.jpg', 41, '', ''),
(52, 'Peta Wilayah Indikasi Geografis', 'http://www.dgip.go.id/images/ki-images/pdf-files/indikasi_geografis/Peta%20Wilayah%20Terdaftar%20edit%20September%202018.pdf', 16, 'header', 'default.jpg', 42, '', ''),
(53, 'Pengenalan DTLST', 'http://www.dgip.go.id/pengenalan-desain-tata-letak-sirkuit-terpadu', 17, 'header', 'default.jpg', 44, '', ''),
(54, 'Prosedur / Diagram Alir DTLST', 'http://www.dgip.go.id/prosedur-diagram-alir-pendaftaran-dtlst', 17, 'header', 'default.jpg', 45, '', ''),
(55, 'Tarif DTLST', 'http://www.dgip.go.id/tarif-desain-tata-letak-sirkuit-terpadu', 17, 'header', 'default.jpg', 46, '', ''),
(56, 'Peraturan Perundang-undangan DTLST', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-dtlst', 17, 'header', 'default.jpg', 47, '', ''),
(57, 'Pengenalan Rahasia Dagang', 'http://www.dgip.go.id/pengenalan-rahasia-dagang', 17, 'header', 'default.jpg', 48, '', ''),
(58, 'Tarif Rahasia Dagang', 'http://www.dgip.go.id/tarif-rahasia-dagang', 17, 'header', 'default.jpg', 49, '', ''),
(59, 'Peraturan Perundang-undangan Rahasia Dagang', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-rahasia-dagang', 17, 'header', 'default.jpg', 50, '', ''),
(60, 'Berita Resmi', '#', 0, 'header', 'default.jpg', 86, '', ''),
(61, 'e-Filling HKI', 'https://efiling.dgip.go.id/efiling/', 8, 'header', '852804.png', 54, '', ''),
(62, 'e-Penelusuran HKI', 'https://pdki-indonesia.dgip.go.id/', 8, 'header', '760697.png', 64, '', ''),
(63, 'e-Informasi HKI', 'http://skm.dgip.go.id/', 8, 'header', '784205.png', 76, '', ''),
(64, 'Tentang Kami', '#', 9, 'header', '245049.png', 93, '', ''),
(65, 'Sekretariat DJKI', 'http://www.dgip.go.id/jumlah-komposisi-pegawai-per-juni-2018', 9, 'header', '439695.png', 98, '', ''),
(66, 'Kerja Sama', 'http://www.dgip.go.id/daftar-kerja-sama-dalam-negeri', 9, 'header', '369562.png', 112, '', ''),
(67, 'Penyidikan', 'http://www.dgip.go.id/prosedur-penyidikan', 9, 'header', '885128.png', 109, '', ''),
(68, 'Teknologi Informasi', 'http://www.dgip.go.id/tapak-jejak-pengembangan-otomasi-ki', 9, 'header', '803258.png', 116, '', ''),
(69, 'Tautan Lainnya', 'https://koperasidjki.com/', 9, 'header', '592829.png', 120, '', ''),
(70, 'Berita Resmi Merek Dagang / Jasax', '/directory/berita-resmi-merek-dagang-jasa/1', 60, 'header', '431725.png', 87, '', ''),
(71, 'Berita Resmi Merek (Madrid Protocol)', 'http://www.dgip.go.id/berita-resmi-merek-protokol-madrid-tahun-2018', 60, 'header', 'default.jpg', 88, '', ''),
(72, 'Berita Resmi Paten / Paten Sederhana', 'http://www.dgip.go.id/berita-resmi-paten-tahun-2018', 60, 'header', 'default.jpg', 89, '', ''),
(73, 'Berita Resmi Desain Industri', 'http://www.dgip.go.id/berita-resmi-desain-industri-tahun-2018', 60, 'header', 'default.jpg', 90, '', ''),
(74, 'Berita Resmi Indikasi Geografis', 'http://www.dgip.go.id/berita-resmi-indikasi-geografis', 60, 'header', 'default.jpg', 91, '', ''),
(75, 'Pengenalan Paten', '/page/pengenalan-paten', 10, 'header', 'default.jpg', 2, '', ''),
(77, 'Pengenalan Merek', '/page/pengenalan-merek', 13, 'header', 'default.jpg', 14, '', ''),
(79, 'Sejarah', '/page/sejarah-perkembangan-perlindungan-kekayaan-intelektual-ki', 64, 'header', 'default.jpg', 94, '', ''),
(80, 'Profil Pimpinan', 'http://www.dgip.go.id/struktural/dirjen-hki/', 64, 'header', 'default.jpg', 95, '', ''),
(81, 'Struktur Organisasi', '/page/struktur-organisasi', 64, 'header', 'default.jpg', 96, '', ''),
(82, 'Penghargaan DJIK', '/page/penghargaan-untuk-djki', 64, 'header', 'default.jpg', 97, '', ''),
(83, 'Prosedur/Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-paten', 10, 'header', 'default.jpg', 3, '', ''),
(84, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-permohonan-paten', 10, 'header', 'default.jpg', 4, '', ''),
(85, 'Tarif', 'http://www.dgip.go.id/tarif-paten', 10, 'header', 'default.jpg', 6, '', ''),
(86, 'Komisi Banding Paten', '/page/susunan-komisi-banding-paten', 10, 'header', 'default.jpg', 5, '', ''),
(87, 'Klarifikasi IPC', 'http://www.wipo.int/classifications/ipc/en/', 10, 'header', 'default.jpg', 8, '', ''),
(88, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-paten', 10, 'header', 'default.jpg', 9, '', ''),
(89, 'ASPEC dan PPH', 'http://www.dgip.go.id/berita-resmi-kekayaan-intelektual-tahun-2018#', 10, 'header', 'default.jpg', 10, '', ''),
(90, 'Pembatalan Atas Keputusan Pengadilan', 'http://www.dgip.go.id/pembatalan-atas-keputusan-pengadilan', 10, 'header', 'default.jpg', 11, '', ''),
(91, 'WIPO TISC', 'http://www.wipo.int/tisc/en/', 10, 'header', 'default.jpg', 12, '', ''),
(92, 'Prosedur/Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-merek', 13, 'header', 'default.jpg', 15, '', ''),
(93, 'Prosedur Pendaftaran Madrid Protokol', '/page/prosedur-permohonan-madrid-protocol', 13, 'header', 'default.jpg', 16, '', ''),
(94, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-permohonan-merek', 13, 'header', 'default.jpg', 17, '', ''),
(95, 'Tarif', 'http://www.dgip.go.id/tarif-merek', 13, 'header', 'default.jpg', 18, '', ''),
(96, 'Komisi Banding Merek', '/page/komisi-banding-merek', 13, 'header', 'default.jpg', 19, '', ''),
(98, 'Klasifikasi Barang/Jasa (Nice)', 'http://skm.dgip.go.id/', 13, 'header', 'default.jpg', 20, '', ''),
(99, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-merek', 13, 'header', 'default.jpg', 21, '', ''),
(100, 'Pengenalan Hak Cipta', '/page/pengenalan-hak-cipta', 14, 'header', 'default.jpg', 23, '', ''),
(101, 'Prosedur / Diagram Alir', 'http://www.dgip.go.id/prosedur-diagram-alir-permohonan-hak-cipta', 14, 'header', 'default.jpg', 24, '', ''),
(102, 'Formulir', 'http://www.dgip.go.id/formulir-hak-cipta', 14, 'header', 'default.jpg', 25, '', ''),
(103, 'Tarif', 'http://www.dgip.go.id/tarif-hak-cipta', 14, 'header', 'default.jpg', 26, '', ''),
(104, 'Lembaga Manajemen Kolektif', 'http://www.dgip.go.id/lembaga-manajemen-kolektif', 14, 'header', 'default.jpg', 27, '', ''),
(105, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-hak-cipta', 14, 'header', 'default.jpg', 28, '', ''),
(106, 'Pengenalan Desain Industri', '/page/pengenalan-desain-industri', 15, 'header', 'default.jpg', 30, '', ''),
(107, 'Prosedur / Diagram Alir', '/page/prosedurdiagram-alir-desain-industri', 15, 'header', 'default.jpg', 31, '', ''),
(108, 'Formulir', 'http://www.dgip.go.id/formulir-terkait-desain-indutri', 15, 'header', 'default.jpg', 32, '', ''),
(109, 'Tarif', 'http://www.dgip.go.id/tarif-desain-industri', 15, 'header', 'default.jpg', 33, '', ''),
(110, 'Klasifikasi Locarno', 'http://www.wipo.int/classifications/locarno/en/', 15, 'header', 'default.jpg', 34, '', ''),
(111, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-desain-industri', 15, 'header', 'default.jpg', 35, '', ''),
(112, 'Pengenalan Indikasi Geografis', '/page/pengenalan-indikasi-geografis', 16, 'header', 'default.jpg', 37, '', ''),
(113, 'Prosedur / Diagram Alir', '/page/prosedurdiagram-alir-indikasi-geografis', 16, 'header', 'default.jpg', 38, '', ''),
(114, 'Formulir', 'http://www.dgip.go.id/formulir-indikasi-geografis', 16, 'header', 'default.jpg', 39, '', ''),
(115, 'Tarif', 'http://www.dgip.go.id/tarif-indikasi-geografis', 16, 'header', 'default.jpg', 40, '', ''),
(116, 'Peraturan Perundang-undangan', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-indikasi-geografis', 16, 'header', 'default.jpg', 41, '', ''),
(117, 'Indikasi Geografis Terdaftar', 'http://www.dgip.go.id/images/ki-images/pdf-files/indikasi_geografis/IG%20Terdaftar%20dan%20Peta%20Wilayah%20GI%20Terdaftar%20edit%20September%202018.pdf', 16, 'header', 'default.jpg', 42, '', ''),
(118, 'Peta Wilayah Indikasi Geografis', 'http://www.dgip.go.id/images/ki-images/pdf-files/indikasi_geografis/Peta%20Wilayah%20Terdaftar%20edit%20September%202018.pdf', 16, 'header', 'default.jpg', 43, '', ''),
(119, 'Pengenalan DTLST', '/page/pengenalan-desain-tata-letak-sirkuit-terpadu', 17, 'header', 'default.jpg', 45, '', ''),
(120, 'Prosedur / Diagram Alir DTLST', '/page/prosedurdiagram-alir-pendaftaran-dtlst', 17, 'header', 'default.jpg', 46, '', ''),
(121, 'Tarif DTLST', 'http://www.dgip.go.id/tarif-desain-tata-letak-sirkuit-terpadu', 17, 'header', 'default.jpg', 47, '', ''),
(122, 'Peraturan Perundang-undangan DTLST', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-dtlst', 17, 'header', 'default.jpg', 48, '', ''),
(123, 'Pengenalan Rahasia Dagang', '/page/pengenalan-rahasia-dagang', 17, 'header', 'default.jpg', 49, '', ''),
(124, 'Tarif Rahasia Dagang', 'http://www.dgip.go.id/tarif-rahasia-dagang', 17, 'header', 'default.jpg', 50, '', ''),
(125, 'Peraturan Perundang-undangan Rahasia Dagang', 'http://www.dgip.go.id/peraturan-perundang-undangan-terkait-rahasia-dagang', 17, 'header', 'default.jpg', 51, '', ''),
(126, 'Paten & Paten Sederhana', 'https://efiling.dgip.go.id/efiling/', 61, 'header', 'default.jpg', 55, '', ''),
(127, 'Merek Dagang / Jasa', 'https://efiling.dgip.go.id/efiling/', 61, 'header', 'default.jpg', 56, '', ''),
(128, 'Desain Industri', 'https://efiling.dgip.go.id/efiling/', 61, 'header', 'default.jpg', 57, '', ''),
(129, 'Hak Cipta', 'https://e-hakcipta.dgip.go.id/', 61, 'header', 'default.jpg', 58, '', ''),
(130, 'Sistem Klasifikasi Merek (Nice)', 'http://skm.dgip.go.id/', 63, 'header', 'default.jpg', 77, '', ''),
(131, 'E-Indikasi Geografis', 'http://ig.dgip.go.id/', 61, 'header', 'default.jpg', 59, '', ''),
(132, 'Informasi Biaya Pemeliharaan Paten', 'http://annuity.dgip.go.id/index.php/user/login?continue=http://annuity.dgip.go.id/index.php', 63, 'header', 'default.jpg', 78, '', ''),
(133, 'Aplikasi SIPPPIT', 'http://sippit.dgip.go.id/', 63, 'header', 'default.jpg', 79, '', ''),
(134, 'Registrasi Akun KI', 'https://registrasi.dgip.go.id/', 61, 'header', 'default.jpg', 60, '', ''),
(135, 'Pengaduan Pelanggaran KI', 'https://pengaduan.dgip.go.id/', 61, 'header', 'default.jpg', 61, '', ''),
(136, 'E-Dashboard Kanwil', 'http://e-kikanwil.dgip.go.id/', 63, 'header', 'default.jpg', 80, '', ''),
(137, 'Registrasi Akun Hak Cipta', 'https://e-hakcipta.dgip.go.id/index.php/register', 61, 'header', 'default.jpg', 62, '', ''),
(138, 'e-Book DJKI', 'http://e-book.dgip.go.id/', 63, 'header', 'default.jpg', 81, '', ''),
(139, 'SIMPAKI', 'http://simpaki.dgip.go.id/', 61, 'header', 'default.jpg', 63, '', ''),
(140, 'e-Kalender Kerja DJKI', 'http://kkdjki.dgip.go.id/', 63, 'header', 'default.jpg', 82, '', ''),
(141, 'Pangkalan Data KI', 'https://pdki-indonesia.dgip.go.id/', 62, 'header', 'default.jpg', 65, '', ''),
(142, 'Paten Public Domain Indonesia', 'http://p3di.dgip.go.id/', 62, 'header', 'default.jpg', 66, '', ''),
(143, 'Pengakalan Data Konsultan KI', 'http://pdkki.dgip.go.id/index.php/pages/index_', 63, 'header', 'default.jpg', 83, '', ''),
(144, 'Pangkalan Data KI Komunal', 'http://kikomunal-indonesia.dgip.go.id/', 62, 'header', 'default.jpg', 67, '', ''),
(145, 'E-Dashboard KI', 'http://e-dashboard.dgip.go.id/', 63, 'header', 'default.jpg', 84, '', ''),
(146, 'WIPO Global Brand', 'http://www.wipo.int/branddb/en/index.jsp', 62, 'header', 'default.jpg', 68, '', ''),
(147, 'WIPO Global Design', 'http://www.wipo.int/designdb/en/index.jsp', 62, 'header', 'default.jpg', 69, '', ''),
(148, 'WIPO PatengScope', 'http://www.wipo.int/patentscope/en/', 62, 'header', 'default.jpg', 70, '', ''),
(149, 'ASEAN Patenscope', 'http://ipsearch.aseanip.org/', 62, 'header', 'default.jpg', 71, '', ''),
(150, 'ASEAN GI Database', 'http://asean-gidatabase.org/', 62, 'header', 'default.jpg', 72, '', ''),
(151, 'ASEAN TMView Database', 'http://www.asean-tmview.org/tmview/welcome.html', 62, 'header', 'default.jpg', 73, '', ''),
(152, 'ASEAN DesignView Database', 'http://www.asean-designview.org/designview/welcome', 62, 'header', 'default.jpg', 74, '', ''),
(153, 'ASEAN TMClass', 'http://www.asean-tmclass.org/ec2/', 62, 'header', 'default.jpg', 75, '', ''),
(154, 'Prosedur Penyidikan', 'http://e-dashboard.dgip.go.id/', 67, 'header', 'default.jpg', 110, '', ''),
(155, 'Pengaduan KI Online', 'https://pengaduan.dgip.go.id/', 67, 'header', 'default.jpg', 111, '', ''),
(156, 'Tapak Jejak Pengembangan Otomasi KI', 'http://www.dgip.go.id/tapak-jejak-pengembangan-otomasi-ki', 68, 'header', 'default.jpg', 117, '', ''),
(157, 'Panduan TI KI', 'http://www.dgip.go.id/prosedur-penyidikan', 68, 'header', 'default.jpg', 118, '', ''),
(158, 'Mobile Portal DJKI', 'https://play.google.com/store/apps/details?id=id.co.dgip', 68, 'header', 'default.jpg', 119, '', ''),
(159, 'Jumlah Pegawai', 'http://www.dgip.go.id/jumlah-komposisi-pegawai-per-juni-2018', 65, 'header', 'default.jpg', 99, '', ''),
(160, 'Penetapan Kinerja', 'http://www.dgip.go.id/penetapan-kinerja-djki', 65, 'header', 'default.jpg', 100, '', ''),
(161, 'Laporan Tahunan', 'http://e-book.dgip.go.id/media-hki/?book-genre=laporan-tahunan', 65, 'header', 'default.jpg', 101, '', ''),
(162, 'LAKIP', 'http://e-book.dgip.go.id/media-hki/?book-genre=laporan-tahunan', 65, 'header', 'default.jpg', 102, '', ''),
(163, 'Statistik', 'https://statistik.dgip.go.id/statistik/production/', 65, 'header', 'default.jpg', 103, '', ''),
(164, 'Laporan Surevey Kepuasan Masyarakat', 'http://www.dgip.go.id/survey-kepuasan-masyarakat', 65, 'header', 'default.jpg', 104, '', ''),
(165, 'PPID', 'http://www.dgip.go.id/ppid', 65, 'header', 'default.jpg', 106, '', ''),
(166, 'Keputusan Dirjen KI', 'http://www.dgip.go.id/keputusan-dirjen-ki', 65, 'header', 'default.jpg', 105, '', ''),
(167, 'Produk Hukum KI', 'http://www.dgip.go.id/produk-hukum-ki', 65, 'header', 'default.jpg', 107, '', ''),
(168, 'WBK dan WBBM', 'http://www.dgip.go.id/wbk-dan-wbbm', 65, 'header', 'default.jpg', 108, '', ''),
(169, 'Daftar Kerja Sama Dalam Negeri', 'http://www.dgip.go.id/daftar-kerja-sama-dalam-negeri', 66, 'header', 'default.jpg', 113, '', ''),
(170, 'Daftar Kerja Sama LuarNegeri', 'http://www.dgip.go.id/daftar-kerja-sama-luar-negeri-4', 66, 'header', 'default.jpg', 114, '', ''),
(171, 'Info Konsultan KI', 'http://www.dgip.go.id/info-konsultan-ki', 66, 'header', 'default.jpg', 115, '', ''),
(172, 'Webmail DJKI', 'https://mail.dgip.go.id/', 69, 'header', 'default.jpg', 121, '', ''),
(173, 'Lapor', 'https://www.lapor.go.id/', 69, 'header', 'default.jpg', 122, '', ''),
(174, 'LPSE', 'http://lpse.kemenkumham.go.id/eproc/', 69, 'header', 'default.jpg', 123, '', ''),
(175, 'JDIH Nasional', 'http://jdihn.id/', 69, 'header', 'default.jpg', 124, '', ''),
(176, 'Koperasi DJKI', 'http://koperasidjki.com/', 69, 'header', 'default.jpg', 125, '', ''),
(177, 'Inpassing Jafung', 'http://inpassingjafung.kemenkumham.go.id/', 69, 'header', 'default.jpg', 126, '', ''),
(178, 'Cloud DJKI', 'http://cloud.dgip.go.id/index.php/login', 69, 'header', 'default.jpg', 127, '', ''),
(179, 'Sayembara Logo', 'http://sayembara-logo.dgip.go.id/', 69, 'header', 'default.jpg', 128, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('inbox','sent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_18_022419_create_setting_table', 1),
(4, '2017_04_18_022437_create_menus_table', 1),
(5, '2017_04_18_023740_create_posts_table', 1),
(6, '2017_04_18_023748_create_pages_table', 1),
(7, '2017_04_18_023808_create_comments_table', 1),
(8, '2017_04_18_023808_create_messages_table', 1),
(9, '2017_05_01_043704_create_pages_slide_table', 1),
(10, '2017_05_01_043720_create_pages_about_table', 1),
(11, '2017_05_01_043733_create_pages_about_team_table', 1),
(12, '2017_05_01_043746_create_pages_work_table', 1),
(13, '2017_05_01_060754_create_visitors_table', 1),
(14, '2017_10_05_073715_create_testimonials_table', 1),
(15, '2017_10_12_085133_create_subscribers_table', 1),
(16, '2018_01_21_150120_create_client_table', 1),
(17, '2018_01_21_194216_create_service_table', 1),
(18, '2018_01_21_214729_create_career_table', 1),
(19, '2018_01_21_214729_create_event_table', 1),
(20, '2018_07_19_065653_create_galleries_images_table', 1),
(21, '2018_08_23_040354_create_archive_table', 1),
(22, '2018_08_27_024559_create_template_table', 1),
(23, '2018_09_19_200056_create_media_album_table', 1),
(24, '2018_09_29_002654_create_category_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `id_user`, `slug`, `title`, `content`, `keyword`, `image`, `category`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'tentang-kami', 'Tentang Kami', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-09 18:43:48', '2018-10-22 11:02:16', NULL),
(2, 1, 'lorem', 'Lorem', '<p>Lorem</p>', NULL, '[\"712660.jpg\"]', 'default', NULL, '2018-10-17 16:08:33', '2018-10-22 11:02:41', '2018-10-22 11:02:41'),
(3, 1, 'sejarah-perkembangan-perlindungan-kekayaan-intelektual-ki', 'Sejarah Perkembangan Perlindungan Kekayaan Intelektual (KI)', '<p>Secara historis, peraturan perundang-undangan di bidang HKI di Indonesia telah ada sejak tahun 1840-an. Pemerintah Kolonial Belanda memperkenalkan undang-undang pertama mengenai perlindungan HKI pada tahun 1844. Selanjutnya, Pemerintah Belanda mengundangkan UU Merek (1885), UU Paten (1910), dan UU Hak Cipta (1912). Indonesia yang pada waktu itu masih bernama Netherlands East-Indies telah menjadi anggota Paris Convention for the Protection of Industrial Property sejak tahun 1888 dan anggota Berne Convention for the Protection of Literary and Aristic Works sejak tahun 1914. Pada jaman pendudukan Jepang yaitu tahun 1942 s.d. 1945, semua peraturan perundang-undangan di bidang HKI tersebut tetap berlaku.</p><p>Pada tanggal 17 Agustus 1945 bangsa Indonesia memproklamirkan kemerdekaannya. Sebagaimana ditetapkan dalam ketentuan peralihan UUD 1945, seluruh peraturan perundang-undangan peninggalan kolonial Belanda tetap berlaku selama tidak bertentangan dengan UUD 1945. UU Hak Cipta dan UU peningggalan Belanda tetap berlaku, namun tidak demikian halnya dengan UU Paten yang dianggap bertentangan dengan pemerintah Indonesia. Sebagaimana ditetapkan dalam UU Paten peninggalan Belanda, permohonan paten dapat diajukan di kantor paten yang berada di Batavia ( sekarang Jakarta ), namun pemeriksaan atas permohonan paten tersebut harus dilakukan di Octrooiraad yang berada di Belanda.</p><p>Pada tahun 1953 Menteri Kehakiman RI mengeluarkan pengumuman yang merupakan perangkat peraturan nasional pertama yang mengatur tentang paten, yaitu Pengumuman Menteri Kehakiman No. J.S. 5/41/4, yang mengatur tentang pengajuan semetara permintaan paten dalam negeri, dan Pengumuman Menteri Kehakiman No. J.G. 1/2/17 yang mengatur tentang pengajuan sementara permintaan paten luar negeri.</p><p>Pada tanggal 11 Oktober 1961 pemerintah RI mengundangkan UU No. 21 tahun 1961 tentang Merek Perusahaan dan Merek Perniagaan (UU Merek 1961) untuk menggantikan UU Merek kolonial Belanda. UU Merek 1961 yang merupakan undang-undang Indonesia pertama di bidang HKI. Berdasarkan pasal 24, UU No. 21 Th. 1961, yang berbunyi &quot;Undang-undang ini dapat disebut Undang-undang Merek 1961 dan mulai berlaku satu bulan setelah undang-undang ini diundangkan&quot;. Undang-undang tersebut mulai berlaku tanggal 11 November 1961. Penetapan UU Merek 1961 dimaksudkan untuk melindungi masyarakat dari barang-barang tiruan/bajakan. Saat ini, setiap tanggal 11 November yang merupakan tanggal berlakunya UU No. 21 tahun 1961 juga telah ditetapkan sebagai Hari KI Nasional.</p><p>Pada tanggal 10 Mei1979 Indonesia meratifikasi Konvensi Paris [Paris Convention for the Protection of Industrial Property (Stockholm Revision 1967)] berdasarkan Keputusan Presiden No. 24 Tahun 1979. Partisipasi Indonesia dalam Konvensi Paris saat itu belum penuh karena Indonesia membuat pengecualian (reservasi) terhadap sejumlah ketentuan,yaitu Pasal 1 s.d. 12, dan Pasal 28 ayat (1).</p><p>Pada tanggal 12 April 1982 Pemerintah mengesahkan UU No.6 tahun 1982 tentang Hak Cipta ( UU Hak Cipta 1982) untuk menggantikan UU Hak Cipta peninggalan Belanda. Pengesahan UU Hak Cipta 1982 dimaksudkan untuk mendorong dan melindungi penciptaan, penyebarluasan hasil kebudayaan di bidang karya ilmu, seni dan sastra serta mempercepat pertumbuhan kecerdasan kehidupan bangsa.</p><p>Tahun 1986 dapat disebut sebagai awal era modern sistem HKI di tanah air. Pada tanggal 23 Juli 1986 Presiden RI membentuk sebuah tim khusus di bidang HKI melalui Keputusan No. 34/1986 (Tim ini lebih dikenal dengan sebutan Tim Keppres 34). Tugas utama Tim Keppres 34 adalah mencangkup penyusunan kebijakan nasional di bidang HKI, perancangan peraturan perundang-undangan di bidang HKI dan sosialisasi sistem HKI di kalangan instansi pemerintah terkait, aparat penegak hukum dan masyarakat luas. Tim Keppres 34 selanjutnya membuat sejumlah terobosan, antara lain dengan mengambil inisiatif baru dalam menangani perdebatan nasional tentang perlunya sistem paten di tanah air. Setelah Tim Keppres 34 merevisi kembali RUU Paten yang telah diselesaikan pada tahun 1982, akhirnya pada tahun 1989 Pemerintah mengesahkan UU Paten.</p><p>Pada tanggal 19 September 1987 Pemerintah RI mengesahkan UU No. 7 tahun 1987 sebagai perubahan atas UU No. 12 tahun 1982 tentang Hak Cipta. Dalam penjelasan UU No. 7 tahun 1987 secara jelas dinyatakan bahwa perubahan atas UU No. 12 tahun 1982 dilakukan karena semakin meningkatnya pelanggaran hak cipta yang dapat membahayakan kehidupan sosial dan menghancurkan kreativitas masyarakat.</p><p>Menyusuli pengesahan UU No. 7 tahun 1987 Pemerintah Indonesia menandatangani sejumlah kesepakatan bilateral di bidang hak cipta sebagai pelaksanaan dari UU tersebut.</p><p>Pada tahun 1988 berdasarkan Keputusan Presiden No. 32 di tetapkan pembentukan Direktorat Jendral Hak Cipta, Paten dan Merek (DJ HCPM) untuk mengambil alih fungsi dan tugas Direktorat Paten dan Hak Cipta yang merupakan salah satu unit eselon II di lingkungan Direktorat Jendral Hukum dan Perundang-undangan, Departemen Kehakiman.</p><p>Pada tanggal 13 Oktober 1989 Dewan Perwakilan Rakyat menyetujui RUU tentang Paten, yang selanjutnya disahkan menjadi UU No. 6 tahun 1989 (UU Paten 1989) oleh Presiden RI pada tanggal 1 November 1989. UU Paten 1989 mulai berlaku tanggal 1 Agustus 1991. Pengesahan UU Paten 1989 mengakhiri perdebatan panjang tentang seberapa pentingnya sistem paten dan manfaatnya bagi bangsa Indonesia. Sebagaimana dinyatakan dalam pertimbangan UU Paten 1989, perangkat hukum di bidang paten diperlukan untuk memberikan perlindungan hukum dan mewujudkan suatu iklim yang lebih baik bagi kegiatan penemuan teknologi. Hal ini disebabkan karena dalam pembangunan nasional secara umum dan khususnya di sektor indusri, teknologi memiliki peranan sangat penting. Pengesahan UU Paten 1989 juga dimaksudkan untuk menarik investasi asing dan mempermudah masuknya teknologi ke dalam negeri. Namun demikian, ditegaskan pula bahwa upaya untuk mengembangkan sistem KI, termasuk paten, di Indonesia tidaklah semata-mata karena tekanan dunia internasional, namun juga karena kebutuhan nasional untuk menciptakan suatu sistem perlindungan HKI yang efektif.</p><p>Pada tanggal 28 Agustus 1992 Pemerintah RI mengesahkan UU No. 19 tahun 1992 tentang Merek (UU Merek 1992), yang mulai berlaku tanggal 1 April 1993. UU Merek 1992 menggantikan UU Merek 1961. Pada tanggal 15 April 1994 Pemerintah RI menandatangani Final Act Embodying the Result of the Uruguay Round of Multilateral Trade Negotiations, yang mencakup Agreement on Trade Related Aspects of Intellectual Property Rights(Persetujuan TRIPS).</p><p>Tiga tahun kemudian, pada tahun 1997 Pemerintah RI merevisi perangkat peraturan perundang-undangan di bidang KI, yaitu UU Hak Cipta 1987 jo. UU No. 6 tahun 1982, UU Paten 1989, dan UU Merek 1992.</p><p>Di penghujung tahun 2000, disahkan tiga UU baru di bidang KI, yaitu UU No. 30 tahun 2000 tentang Rahasia Dagang, UU No. 31 tahun 2000 tentang Desain Industri dan UU No 32 Tahun 2000 tentang Desain Tata Letak Sirkuit Terpadu.</p><p>Dalam upaya untuk menyelaraskan semua peraturan perundang-undangan di bidang KI dengan Persetujuan TRIPS, pada tahun 2001 Pemerintah Indonesia mengesahkan UU No. 14 tahun 2001 tentang Paten, dan UU No. 15 tahun 2001 tentang Merek. Kedua UU ini menggantikan UU yang lama di bidang terkait. Pada pertengahan tahun 2002 tentang Hak Cipta yang menggantikan UU yang lama dan berlaku efektif satu tahun sejak diundangkannya.</p><p><em><span style=\"color: rgb(247, 218, 100);\">Catatan: Perubahan Nomenklatur Departemen Hukum dan Hak Asasi Manusia menjadi Kementerian Hukum dan Hak Asasi Manusia berdasarkan Keputusan Menteri Nomor M.HH-02.OT.01.01 Tahun 2011 tentang Penyesuaian Penggunaan Nama Kementerian Hukum dan Hak Asasi Manusia Republik Indonesia</span></em></p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-17 16:22:58', '2018-10-24 17:40:08', NULL),
(4, 1, 'struktur-organisasi', 'Struktur Organisasi', '<p><a href=\"http://www.dgip.go.id/struktur-organisasi\"><strong><span style=\"font-size: 18px;\"><img class=\"fr-dib fr-draggable\" src=\"/uploaded/93119699a8422a1542623e1e352508610f6e1f08.PNG\" style=\"width: 439px; height: 169.747px;\"></span></strong></a></p><p><strong><a href=\"http://www.dgip.go.id/struktur-organisasi\"><span style=\"font-size: 18px;\">Direktorat Jenderal Kekayaan Intelektual</span></a></strong></p><hr><h3><a href=\"http://www.dgip.go.id/struktur-organisasi\"></a></h3><p>Direktorat Jenderal Kekayaan Intelektual adalah unsur pelaksana yang berada di bawah dan bertanggung jawab kepada Menteri Hukum dan Hak Asasi Manusia yang dipimpin oleh seorang Direktur Jenderal. Direktorat Jenderal Kekayaan Intelektual mempunyai tugas menyelenggarakan perumusan dan pelaksanaan kebijakan di bidang kekayaan intelektual sesuai dengan ketentuan peraturan perundangundangan.</p><p>Untuk melaksanakan tugas sebagaimana dimaksud, Direktorat Jenderal Kekayaan Intelektual menyelenggarakan fungsi :</p><ol><li>Perumusan kebijakan di bidang perlindungan hukum kekayaan intelektual, penyelesaian permohonan pendaftaran kekayaan intelektual, penyidikan, penyelesaian sengketa dan pengaduan pelanggaran kekayaan intelektual, kerja sama, promosi kekayaan intelektual, serta teknologi informasi di bidang kekayaan intelektual;</li><li>Pemberian bimbingan teknis dan supervisi di bidang perlindungan hukum kekayaan intelektual, penyelesaian permohonan pendaftaran kekayaan intelektual, penyidikan, penyelesaian sengketa dan pengaduan pelanggaran kekayaan intelektual, kerja sama, promosi kekayaan intelektual, serta teknologi informasi di bidang kekayaan intelektual;</li><li>Pelaksanaan pemantauan, evaluasi dan pelaporan di bidang perlindungan hukum kekayaan intelektual, penyelesaian permohonan pendaftaran kekayaan intelektual, penyidikan, penyelesaian sengketa dan pengaduan pelanggaran kekayaan intelektual, kerja sama, promosi kekayaan intelektual, serta teknologi informasi di bidang kekayaan intelektual;</li><li>Pelaksanaan administrasi Direktorat Jenderal Kekayaan Intelektual; dan</li><li>Pelaksanaan fungsi lain yang diberikan oleh Menteri.</li></ol><p>Direktorat Jenderal Kekayaan Intelektual terdiri atas:</p><ol><li>Sekretariat Direktorat Jenderal;</li><li>Direktorat Hak Cipta dan Desain Industri;</li><li>Direktorat Paten, Desain Tata Letak Sirkuit Terpadu dan Rahasia Dagang;</li><li>Direktorat Merek dan Indikasi Geografis;</li><li>Direktorat Kerja Sama dan Pemberdayaan Kekayaan Intelektual;</li><li>Direktorat Teknologi Informasi Kekayaan Intelektual; dan</li><li>Direktorat Penyidikan dan Penyelesaian Sengketa.</li></ol><hr><h3><img class=\"fr-dib fr-draggable\" src=\"/uploaded/0876ed1085aa785989664512c47f26a0bb687d66.png\" style=\"width: 355px; height: 253.233px;\"></h3><h3><strong>Sekretariat Direktorat Jenderal</strong></h3><p>Sekretariat Direktorat Jenderal mempunyai tugas memberikan pelayanan teknis dan administratif kepada seluruh satuan organisasi di lingkungan Direktorat Jenderal Kekayaan Intelektual.</p><p>Sekretariat Direktorat Jenderal menyelenggarakan fungsi:</p><ol><li>Koordinasi dan penyusunan rencana, program, dan anggaran;</li><li>Koordinasi dan penyusunan peraturan perundang undangan;</li><li>Fasilitasi pelaksanaan penataan kelembagaan dan reformasi birokrasi;</li><li>Evaluasi dan penyusunan laporan Direktorat Jenderal Kekayaan Intelektual;</li><li>Pembinaan dan pengelolaan urusan kepegawaian;</li><li>Pembinaan dan pengelolaan urusan keuangan;</li><li>Pelaksanaan urusan rumah tangga, pengelolaan barang milik negara, dan layanan pengadaan; dan</li><li>Pelaksanaan urusan tata usaha, hubungan masyarakat, persuratan dan perjalanan dinas.</li></ol><hr><h3><img class=\"fr-dib fr-draggable\" src=\"http://www.dgip.go.id/images/paten.png\" style=\"width: 329px; height: 239.073px;\"></h3><h3><strong>Direktorat Paten, Desain Tata Letak Sirkuit Terpadu dan Rahasia Dagang</strong></h3><p>Direktorat Paten, Desain Tata Letak Sirkuit Terpadu, dan Rahasia Dagang mempunyai tugas melaksanakan penyiapan perumusan dan pelaksanaan kebijakan, pemberian bimbingan teknis dan supervisi, dan pelaksanaan evaluasi dan pelaporan di bidang permohonan, publikasi dan dokumentasi, klasifikasi dan penelusuran paten, pemeriksaan, sertifikasi, pemeliharaan, mutasi, lisensi, dan pelayanan hukum paten, desain tata letak sirkuit terpadu, dan rahasia dagang.</p><p>Direktorat Paten, Desain Tata Letak Sirkuit Terpadu, dan Rahasia Dagang menyelenggarakan fungsi:</p><ol><li>Penyiapan perumusan kebijakan di bidang permohonan, publikasi, klasifikasi, penelusuran, pemeriksaan, sertifikasi, pemeliharaan, mutasi, lisensi, dan pelayanan hukum paten, desain tata letak sirkuit terpadu, dan rahasia dagang;</li><li>Pelaksanaan kebijakan di bidang permohonan, publikasi, klasifikasi, penelusuran, pemeriksaan, sertifikasi, pemeliharaan, mutasi, lisensi, dan pelayanan hukum paten, desain tata letak sirkuit terpadu, dan rahasia dagang;</li><li>Pelaksanaan fasilitasi komisi banding paten;</li><li>Pemberian bimbingan teknis dan supervisi di bidang permohonan, publikasi dan dokumentasi, klasifikasi, penelusuran, pemeriksaan, sertifikasi, pemeliharaan, mutasi, lisensi, dan pelayanan hukum;</li><li>Pelaksanaan evaluasi dan pelaporan di bidang paten, desain tata letak sirkuit terpadu, dan rahasia dagang; dan</li><li>Pengelolaan urusan tata usaha dan rumah tangga Direktorat Paten, Desain Tata Letak Sirkuit Terpadu dan Rahasia Dagang.</li></ol><p>Direktorat Paten, Desain Tata Letak Sirkuit Terpadu dan Rahasia Dagang terdiri atas:</p><ol><li>Subdirektorat Permohonan dan Publikasi;</li><li>Subdirektorat Klasifikasi dan Penelusuran Paten;</li><li>Subdirektorat Pemeriksaan Paten;</li><li>Subdirektorat Sertifikasi, Pemeliharaan, Mutasi dan Lisensi;</li><li>Subdirektorat Pelayanan Hukum dan Fasilitasi Komisi Banding Paten;</li><li>Subbagian Tata Usaha; dan</li><li>Kelompok Jabatan Fungsional.</li></ol>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-23 07:25:28', '2018-10-24 11:40:10', NULL),
(5, 1, 'penghargaan-untuk-djki', 'Penghargaan Untuk DJKI', '<p>1. Penghargaan Stand Terbaik ke-2 Kategori Edukasi pada Acara Palembang Expo 2018 dari Pemerintah Daerah Sumatera Selatan</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-23 07:36:01', '2018-10-23 07:36:01', NULL),
(6, 1, 'pengenalan-paten', 'Pengenalan Paten', '<h4>Pengertian Paten</h4><hr><p>Paten adalah hak eksklusif yang diberikan oleh negara kepada inventor atas hasil invensinya di bidang teknologi, yang untuk selama waktu tertentu melaksanakan sendiri invensinya tersebut kepada pihak lain untuk melaksanakannya.</p><hr><h4>Pengertian Invensi</h4><p>Invensi adalah ide inventor yang dituangkan ke dalam suatu kegiatan pemecahan masalah yang spesifik di bidang teknologi, dapat berupa produk atau proses, atau penyempurnaan dan pengembangan produk atau proses.</p><hr><h4>Berapa lama paten dilindungi?</h4><p>Paten (sesuai dengan ketentuan dalam Pasal 8 ayat 1 Undang-undang Nomor 14 Tahun 2001) diberikan untuk jangka waktu selama 20 (dua puluh) tahun terhitung sejak tanggal penerimaan dan jangka waktu itu tidak dapat diperpanjang.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 08:44:12', '2018-10-24 08:44:12', NULL),
(7, 1, 'susunan-komisi-banding-paten', 'Susunan Komisi Banding Paten', '<p style=\"text-align: justify;\"><strong>SEKILAS TERKAIT KELEMBAGAAN</strong></p><p style=\"text-align: justify;\">Undang-undang Nomor 14 Tahun 2001 tentang Paten mengatur Komisi Banding pada Pasal 64 :</p><ol><li style=\"text-align: justify;\">Komisi Banding Paten adalah badan khusus yang independen dan berada di lingkungan departemen yang membidangi Hak Kekayaan Intelektual.</li><li style=\"text-align: justify;\">Komisi Banding Paten terdiri atas seorang ketua merangkap anggota, seorang wakil ketua merangkap anggota, dan anggota yang terdiri atas beberapa ahli di bidang yang diperlukan serta Pemeriksa senior.</li><li style=\"text-align: justify;\">Anggota Komisi Banding Paten sebagaimana dimaksud pada ayat (1) diangkat dan diberhentikan oleh Menteri untuk masa jabatan 3 (tiga) tahun.</li><li style=\"text-align: justify;\">Ketua dan wakil ketua dipilih dari dan oleh para anggota Komisi Banding Paten.</li><li style=\"text-align: justify;\">Untuk memeriksa permohonan banding, Komisi Banding Paten membentuk majelis yang berjumlah ganjil sekurang-kurangnya 3 (tiga) orang, satu diantaranya adalah seorang Pemeriksa senior yang tidak melakukan pemeriksaaan substantif terhadap Permohonan.</li></ol><p style=\"text-align: justify;\">Pasal 65 menjelaskan lebih lanjut tentang Susunan organisasi, tugas dan fungsi Komisi Banding Paten diatur lebih lanjut dengan Peraturan Pemerintah Republik Indonesia Nomor 40 Tahun 2005 Tentang Susunan Organisasi, Tugas, dan Fungsi Komisi Banding Paten. Dalam ketentuan umum memuat :</p><ol><li style=\"text-align: justify;\">Komisi Banding Paten, yang selanjutnya disebut Komisi Banding adalah badan khusus yang independen dan berada di lingkungan departemen yang membidangi Hak Kekayaan Intelektual.</li><li style=\"text-align: justify;\">Undang-undang Paten adalah Undang-undang Nomor 14 Tahun 2001 tentang Paten.</li><li style=\"text-align: justify;\">Menteri adalah menteri yang membawahkan departemen dimana salah satu tugas dan tanggungjawabnya meliputi pembinaan di bidang Hak Kekayaan Intelektual, termasuk Paten.</li><li style=\"text-align: justify;\">Direktorat Jenderal adalah Direktorat Jenderal Hak Kekayaan Intelektual yang berada di bawah departemen yang dipimpin oleh Menteri.</li></ol><p style=\"text-align: justify;\">Susunan Organisasi Komisi Banding Paten terdapat dalam Pasal (2), Pasal (3), Pasal (4), Pasal (5), Pasal (6). Tugas dan Fungsi terdapat dalam Pasal (7), Pasal (8), Pasal (9), dan Pasal (10) pada Peraturan Pemerintah Nomor 40 Tahun 2005 tentang Komisi Banding Paten, yaitu :</p><p style=\"text-align: justify;\"><strong>Pasal 2</strong></p><ol><li style=\"text-align: justify;\">Komisi Banding terdiri atas :<ul type=\"disc\"><li style=\"text-align: justify;\">seorang Ketua merangkap Anggota;</li><li style=\"text-align: justify;\">Wakil Ketua merangkap Anggota; dan</li><li style=\"text-align: justify;\">anggota yang terdiri atas beberapa ahli di bidang yang diperlukan dan Pemeriksa senior.</li></ul></li><li style=\"text-align: justify;\">Anggota Komisi Banding sebagaimana dimaksud pada ayat (1) berjumlah paling banyak 15 (lima belas) orang.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 3</strong></p><ol><li style=\"text-align: justify;\">Untuk dapat diangkat menjadi sebagaimana dimaksud dalam Pasal 2 ayat (1), harus memenuhi persyaratan :<ul type=\"disc\"><li style=\"text-align: justify;\">warga nergara Republik Indonesia;</li><li style=\"text-align: justify;\">bertempat tinggal di wilayah Negara Republik Indonesia;</li><li style=\"text-align: justify;\">bertakwa kepada Tuhan Yang Maha Esa;</li><li style=\"text-align: justify;\">sehat jasmani dan rohani;</li><li style=\"text-align: justify;\">mempunyai kecakapan berbahasa Inggris;</li><li style=\"text-align: justify;\">memiliki pengetahuan, pemahaman, dan keahlian yang diperlukan di bidang Paten; dan</li><li style=\"text-align: justify;\">berumur setinggi-tingginya 65 (enampuluh lima) tahun pada saat pengangkatan.</li></ul></li><li style=\"text-align: justify;\">Selain memenuhi persyaratan sebagaimana dimaksud pada ayat (1) huruf b, huruf d, dan huruf e, Pemeriksa Senior yang dapat diangkat menjadi Anggota Komisi Banding adalah Pemeriksa Paten pada Direktorat Jenderal yang mempunyai jabatan paling rendah Pemeriksa Paten Muda dengan pangkat Penata Tingkat I/Golongan III/d.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 4</strong></p><ol><li style=\"text-align: justify;\">Anggota Komisi Banding, diangkat dan diberhentikan oleh Menteri, atas usul Direktur Jenderal Hak Kekayaan Intelektual.</li><li style=\"text-align: justify;\">Masa jabatan Anggota Komisi Banding adalah 3 (tiga) tahun.</li><li style=\"text-align: justify;\">Ketua dan Wakil Ketua Komisi Banding dipilih dari dan oleh para Anggota Komisi Banding.</li><li style=\"text-align: justify;\">Pemilihan Ketua dan Wakil Ketua Komisi Banding sebagaimana dimaksud pada ayat (3) dilakukan secara musyawarah, dan apabila musyawarah tidak dicapai kesepakatan pemilihan dilakukan dengan pemungutan suara terbanyak.</li><li style=\"text-align: justify;\">Ketua dan Wakil Ketua Komisi Banding yang dipilih sebagaimana dimaksud pada ayat (3) ditetapkan dengan Keputusan Menteri.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 5</strong></p><ol><li style=\"text-align: justify;\">Keanggotaan Komisi Banding berakhir, apabila :<ol type=\"a\"><li style=\"text-align: justify;\">meninggal dunia;</li><li style=\"text-align: justify;\">mengundurkan diri atas permintaan sendiri;</li><li style=\"text-align: justify;\">bertempat tinggal di luar wilayah Negara Republik Indonesia;</li><li style=\"text-align: justify;\">sakit jasmani dan / atau rohani terus-menerus selama 6 (enam) bulan yang dibuktikan dengan surat keterangan dokter;</li><li style=\"text-align: justify;\">berakhirnya masa jabatan keanggotaan Komisi Banding; atau</li><li style=\"text-align: justify;\">diberhentikan karena tidak dapat menjalankan tugasnya atau melakukan perbuatan tercela.</li></ol></li><li style=\"text-align: justify;\">Anggota Komisi Banding yang diberhentikan berdasarkan alasan sebagaimana dimaksud pada ayat (1) huruf f diberi kesempatan untuk membela diri.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 6</strong></p><ol><li style=\"text-align: justify;\">Dalam hal Ketua Komisi Banding mengundurkan diri atau meninggal dunai atau karena sesuatu hal tidak mampu menjalankan tugasnya sebagai Ketua atau diberhentikan sebelum masa jabatannya berakhir, Wakil Ketua Komisi Banding menggantikan Ketua Komisi Banding tersebut untuk jangka waktu sisa masa jabatannya.</li><li style=\"text-align: justify;\">Dalam hal Wakil Ketua Komisi Banding atau pada saat yang sama Ketua dan Wakil Ketua Komisi Banding mengundurkan diri atau meninggal dunia atau karena sesuatu hal tidak mampu menjalankan tugasnya atau diberhentikan sebelum masa jabatannya berakhir, para Anggota segera memilih dan mengusulkan pengganti ketua dan / atau Wakil Ketua Komisi Banding untuk jangka waktu sisa masa jabatannya.</li><li style=\"text-align: justify;\">Pemilihan dan penetapan Ketua dan / atau Wakil Ketua Komisi Banding sebagaimana dimaksud dalam Pasal 4 ayat (4) dan ayat (5).</li></ol><p style=\"text-align: justify;\"><strong>Pasal 7</strong></p><ol><li style=\"text-align: justify;\">Komisi Banding mempunyai tugas menerima, memeriksa, dan memutus permohonan banding terhadap penolakan permohonan Paten berdasarkan alasan :<ol type=\"a\"><li style=\"text-align: justify;\">apabila hasil pemeriksaan substantif yang dilaporkan oleh Pemeriksa menunjukkan bahwa Invensi yang dimohonkan dalam Pasal 2, Pasal 3, Pasal 5, Pasal 6, Pasal 35, Pasal 52 ayat (1), Pasal 52 ayat (2), atau yang dikecualikan berdasarkan ketentuan dalam Pasal 7 Undang-undang; atau</li><li style=\"text-align: justify;\">apabila hasil pemeriksaan substantif yang dilakukan oleh Pemeriksa menunjukkan bahwa Invensi yang dimohonkan Paten tidak memenuhi ketentuan dalam Pasal 36 ayat (2) atau ayat (3) Undang-undang.</li></ol></li><li style=\"text-align: justify;\">Dalam menjalankan tugas sebagaimana dimaksud pada ayat (1), Komisi Banding bersifat independen dan bekerja berdasarkan keahlian.</li><li style=\"text-align: justify;\">Dalam melaksanakan tugas sebagaimana dimaksud pada ayat (1), Komisi Banding menyelenggarakan fungsi pengadministrasian, pemeriksaan, pengkajian, penilaian, dan penganalisaan, serta pemberian keputusan terhadap permohonan banding.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 8</strong></p><p style=\"text-align: justify;\">Dalam menyelenggarakan tugas dan fungsinya, untuk kepentingan pemeriksaan banding, Komisi Banding dapat memanggil dan mendengar keterangan dari berbagai pihak.</p><p style=\"text-align: justify;\"><strong>Pasal 9</strong></p><ol><li style=\"text-align: justify;\">Dalam melakukan pemeriksaan permohonan banding, Ketua Komisi Banding membentuk majelis yang anggotanya berjumlah ganjil sekurang-kurangnya 3 (tiga) orang, satu di antaranya adalah seorang Pemeriksa Senior yang tidak melakukan pemeriksaan substantif terhadap Permohonan Paten yang ditolak.</li><li style=\"text-align: justify;\">Dalam hal majelis sebagaimana dimaksud pada ayat (1) berjumlah lebih dari 3 (tiga) orang, maka jumlah Pemeriksa Senior dapat ditambah paling banyak 1 (satu) orang.</li><li style=\"text-align: justify;\">Dalam melakukan pemeriksaan Permohonan Banding sebagaimana dimaksud pada ayat (1), Ketua dan Anggota Majelis ditunjuk oleh Ketua Komisi Banding.</li><li style=\"text-align: justify;\">Dalam hal Anggota Majelis Komisi Banding mengundurkan diri atau meninggal dunia atau karena sesuatu hal tidak mampu menjalankan tugas sebagai Anggota Majelis atau diberhentikan sebelum masa jabatannya berakhir, Ketua Komisi Banding menetapkan penggantinya yang berasal dari Anggota Komisi Banding.</li></ol><p style=\"text-align: justify;\"><strong>Pasal 10</strong></p><ol><li style=\"text-align: justify;\">Dalam melaksanakan tugasnya Komisi Banding dibantu Sekretariat yang dipimpin oleh seorang Sekretaris.</li><li style=\"text-align: justify;\">Sekretaris sebagaimana dimaksud pada ayat (1) dijabat oleh seorang pejabat struktural di lingkungan Direktorat Jenderal yang lingkup tugasnya mencakup pelayanan administrasi Banding Paten, yang diangkat dan diberhentikan oelh Menteri atas usul Direktur Jenderal Hak Kekayaan Intelektual.</li><li style=\"text-align: justify;\">Sekretaris dalam menjalankan tugasnya dibantu oleh staf yang berasal dari Direktorat Jenderal.</li><li style=\"text-align: justify;\">Ketentuan mengenai susunan organisasi dan tata kerja Sekretariat diatur lebih lanjut dengan Keputusan Menteri.</li></ol>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:08:54', '2018-10-24 09:10:01', NULL),
(8, 1, 'pengenalan-merek', 'Pengenalan Merek', '<h4 style=\"text-align: justify;\"><strong>Pengertian Merek</strong></h4><p style=\"text-align: justify;\">Merek adalah suatu &quot;tanda yang dapat ditampilkan secara grafis berupa gambar, logo, nama, kata, huruf, angka, susunan warna, dalam bentuk 2 (dua) dimensi dan/atau 3 (tiga) dimensi, suara, hologram, atau kombinasi dari 2 (dua) atau lebih unsur tersebut untuk membedakan barang dan/atau jasa yang diproduksi oleh orang atau badan hukum dalam kegiatan perdagangan barang dan/atau jasa</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Merek Dagang</strong></h4><p style=\"text-align: justify;\">Merek dagang adalah merek yang digunakan pada barang yang diperdagangkan oleh seseorang atau beberapa orang secara bersama-sama atau badan hukum untuk membedakan dengan barang-barang sejenis lainnya.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Merek Jasa</strong></h4><p style=\"text-align: justify;\">Merek jasa adalah merek yang digunakan pada jasa yang diperdagangkan oleh seseorang atau beberapa orang secara bersama-sama atau badan hukum untuk membedakan dengan jasa-jasa sejenis lainnya.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:14:30', '2018-10-24 09:15:13', NULL),
(9, 1, 'komisi-banding-merek', 'Komisi Banding Merek', '<p style=\"text-align: justify;\"><strong>TENTANG KOMISI BANDING</strong></p><p style=\"text-align: justify;\">Sekilas tentang Komisi Banding Merek :</p><ul><li style=\"text-align: justify;\">Komisi Banding Merek adalah badan khusus independen yang berada di lingkungan kementerian yang menyelenggarakan urusan pemerintahan di bidang hukum.</li></ul><p style=\"text-align: justify;\">Dasar Hukum :</p><ol><li style=\"text-align: justify;\">Undang-Undang Nomor 20 Tahun 2016 tentang Merek dan Indikasi Geografis;</li><li style=\"text-align: justify;\">Peraturan Pemerintah Republik Indonesia Nomor 07 Tahun 2005 tentang Susunan Organisasi, Tugas, dan Fungsi Komisi Banding Merek;</li><li style=\"text-align: justify;\">Peraturan Presiden Republik Indonesia Nomor 20 Tahun 2005 tentang Tata Cara Penerimaan, Pemeriksaan, dan Penyelesaian Permohonan Banding Merek.</li></ol><p style=\"text-align: justify;\"><strong>Tugas dan Fungsi Komisi Banding Merek</strong></p><ol><li style=\"text-align: justify;\">Menerima, memeriksa, dan memutus permohonan banding terhadap penolakan permintaan pendaftaran Merek berdasarkan alasan yang sebagaimana dimaksud dalam Pasal 20 dan/atau Pasal 21 Undang-Undang Nomor 20 Tahun 2016 tentang Merek dan Indikasi Geografis;</li><li style=\"text-align: justify;\">Dalam hal Merek terdaftar melanggar ideologi negara, peraturan perundang-undangan, moralitas, agama, kesusilaan, dan ketertiban umum, Komisi Banding Merek memberikan rekomendasi kepada Menteri untuk melakukan penghapusan;</li><li style=\"text-align: justify;\">Menerima, memeriksa, dan memutus permohonan banding atas Keberatan terhadap penolakan permohonan perpanjangan merek;</li><li style=\"text-align: justify;\">Menerima, memeriksa, dan memutus permohonan banding terhadap keputusan penolakan Indikasi Geografis yang memiliki persamaan pada keseluruhannya dengan Indikasi Geografis yang sudah terdaftar;</li><li style=\"text-align: justify;\">Menyelenggarakan fungsi pengadministrasian, pemeriksaan, pengkajian dan penilaian, serta pemberian keputusan terhadap permohonan banding.</li></ol><ul><li style=\"text-align: justify;\">Permohonan banding terhadap penolakan Permohonan (termasuk penolakan perpanjangan merek maupun penolakan permohonan Indikasi Geografis) diajukan dalam jangka waktu paling lama 90 (sembilan puluh) Hari terhitung sejak Tanggal Pengiriman surat pemberitahuan penolakan Permohonan.</li><li style=\"text-align: justify;\">Dalam hal permohonan banding tidak diajukan dalam jangka waktu yang telah ditentukan, penolakan dianggap diterima oleh Pemohon.</li><li style=\"text-align: justify;\">Dalam hal permohonan banding diajukan melampaui jangka waktu yang telah ditentukan undang-undang, Sekretaris Komisi Banding Merek memberitahukan secara tertulis kepada Pemohon Banding/kuasanya bahwa Permohonan Banding tidak dapat diterima.</li><li style=\"text-align: justify;\">Dalam melaksanakan tugasnya Komisi Banding dibantu Sekretariat yang dipimpin oleh seorang Sekretaris.</li><li style=\"text-align: justify;\">Pengangkatan Anggota Komisi Banding Merek berdasarkan Surat Keputusan Menteri Hukum dan Hak Asasi Manusia Republik Indonesia untuk masa jabatan selama 3 (tiga) tahun.</li><li style=\"text-align: justify;\">Anggota Komisi Banding Merek diangkat dan diberhentikan oleh Menteri atas usul Direktur Jenderal.</li></ul><p style=\"text-align: justify;\"><strong>Unsur keanggotaan Komisi Banding Merek</strong> :</p><p style=\"text-align: justify;\">Komisi Banding Merek terdiri atas :</p><ol><li style=\"text-align: justify;\">Seorang ketua merangkap anggota;</li><li style=\"text-align: justify;\">Seorang wakil ketua merangkap anggota;</li><li style=\"text-align: justify;\">Ahli di bidang Merek;</li><li style=\"text-align: justify;\">Pemeriksa Merek senior.</li></ol><p style=\"text-align: justify;\"><strong>Persidangan Pemeriksaan Substantif Permohonan Banding</strong></p><ul><li style=\"text-align: justify;\">Untuk memeriksa permohonan banding merek, Komisi Banding Merek membentuk majelis yang berjumlah ganjil paling sedikit 3 (tiga) orang, satu di antaranya adalah seorang Pemeriksa Merek senior yang tidak melakukan pemeriksaan substantif terhadap Permohonan Pendaftaran Merek yang ditolak.</li><li style=\"text-align: justify;\">Dalam melakukan pemeriksaan dalam persidangan permohonan banding, Ketua dan Anggota Majelis ditunjuk oleh Ketua Komisi Banding.</li><li style=\"text-align: justify;\">Pemohon Banding dan/atau kuasanya dapat mengajukan permintaan untuk dapat menyampaikan pendapatnya dalam persidangan dihadapan majelis melalui Ketua Komisi Banding.</li><li style=\"text-align: justify;\">Persidangan pemeriksaan banding bersifat terbuka untuk umum.</li></ul><p style=\"text-align: justify;\"><strong>Syarat Pengajuan Permohonan Banding</strong></p><p style=\"text-align: justify;\">Permohonan banding diajukan secara tertulis dalam Bahasa Indonesia oleh Pemohon atau Kuasanya kepada Komisi Banding Merek dengan tembusan yang disampaikan kepada Menteri, dengan menguraikan secara lengkap keberatan serta alasan terhadap penolakan Permohonan, dan &nbsp;melampirkan sekurang-kurangnya :</p><ol><li style=\"text-align: justify;\">Salinan atau fotokopi surat pemberitahuan penolakan permohonan;</li><li style=\"text-align: justify;\">Bukti pembayaran Permohonan Banding;</li><li style=\"text-align: justify;\">Apabila Permohonan Banding diajukan melalui kuasa, wajib dilengkapi dengan surat kuasa khusus.</li></ol><ul><li style=\"text-align: justify;\">Selama Permohonan Banding belum mendapat keputusan oleh Komisi Banding Merek, dapat ditarik kembali oleh Pemohon atau kuasanya dengan ketentuan biaya yang telah dibayarkan kepada Direktorat Jenderal tidak dapat ditarik kembali, dan Permohonan Banding tersebut tidak dapat diajukan lagi.</li></ul><p style=\"text-align: justify;\"><strong>Keputusan Komisi Banding Merek</strong></p><ul><li style=\"text-align: justify;\">Keputusan Komisi Banding Merek antara lain dapat :</li></ul><ol><li style=\"text-align: justify;\">Mengabulkan seluruh Pemohonan Banding;</li><li style=\"text-align: justify;\">Mengabulkan sebagian Pemohonan Banding;</li><li style=\"text-align: justify;\">Menolak Permohonan Banding.</li></ol><ul><li style=\"text-align: justify;\">Keputusan Komisi Banding Merek dibuat secara tertulis dan ditandatangani oleh Ketua Majelis dan Anggota yang memeriksa dan memutus Permohonan Banding, untuk kemudian disampaikan kepada Direktorat Jenderal dan Pemohon Banding atau kuasanya.</li><li style=\"text-align: justify;\">Dalam hal Komisi Banding Merek menolak permohonan banding, Pemohon atau Kuasanya dapat mengajukan gugatan atas putusan penolakan permohonan banding kepada Pengadilan Niaga dalam waktu paling lama 3 (tiga) bulan terhitung sejak tanggal diterimanya keputusan penolakan tersebut.</li></ul>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:19:44', '2018-10-24 17:39:27', NULL),
(10, 1, 'pengenalan-hak-cipta', 'Pengenalan Hak Cipta', '<h4 style=\"text-align: justify;\"><strong>Hak Cipta</strong></h4><p style=\"text-align: justify;\">Hak cipta adalah hak eksklusif bagi pencipta atau penerima hak untuk mengumumkan atau memperbanyak ciptaannya atau memberi izin untuk itu dengan tidak mengurangi pembatasan-pembatasan menurut peraturan perundang-undangan yang berlaku.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Pengumuman</strong></h4><p style=\"text-align: justify;\">Pengumuman adalah pembacaan, penyiaran, pameran, penjualan, pengedaran, atau penyebaran suatu ciptaan dengan menggunakan alat apapun, termasuk media internet, atau melakukan dengan cara apapun sehingga suatu ciptaan dapat dibaca, didengar, atau dilihat orang lain.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:24:38', '2018-10-24 09:24:38', NULL),
(11, 1, 'pengenalan-desain-industri', 'Pengenalan Desain Industri', '<h4 style=\"text-align: justify;\"><strong>Desain Industri (DI)</strong></h4><p style=\"text-align: justify;\">Desain Industri (DI) adalah suatu kreasi tentang bentuk, konfigurasi, atau komposisi garis atau warna, atau garis dan warna, atau gabungan daripadanya yang berbentuk tiga dimensi atau dua dimensi yang memberikan kesan estetis dan dapat diwujudkan dalam pola tiga dimensi atau dua dimensi serta dapat dipakai untuk menghasilkan suatu produk, barang, komoditas industri, atau kerajinan tangan.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Hak Prioritas</strong></h4><p style=\"text-align: justify;\">Hak Prioritas adalah hak Pemohon untuk mengajukan Permohonan yang berasal dari negara yang tergabung dalam Paris Convention for Protection of Industrial Property atau Agreement Establishing the World Trade Organization untuk memperoleh pengakuan bahwa Tanggal Penerimaan yang diajukannya ke negara tujuan, yang juga anggota Konvensi Paris atau Persetujuan Pembentukan Organisasi Perdagangan Dunia, memiliki tanggal yang sama dengan Tanggal Penerimaan yang diajukan di negara asal selama kurun waktu yang telah ditentukan berdasarkan Konvensi Paris. Permohonan dengan menggunakan hak prioritas harus diajukan dalam waktu paling lama 6 (enam) bulan terhitung sejak tanggal penerimaan permohonan pertama kali diterima negara lain yang merupakan anggota Paris Convention for Protection of Industrial Property atau Agreement Establishing the World Trade Organization.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:28:19', '2018-10-24 09:28:19', NULL),
(12, 1, 'prosedurdiagram-alir-desain-industri', 'Prosedur/Diagram Alir Desain Industri', '<p style=\"text-align: justify;\"><strong>Permohonan Pendaftaran Desain Industri</strong></p><ol><li style=\"text-align: justify;\">Permohonan pendaftaran Desain Industri diajukan dengan cara mengisi formulir yang disediakan untuk itu dalam bahasa Indonesia dan diketik rangkap 3 (tiga).</li><li style=\"text-align: justify;\">Pemohon wajib melampirkan:<ol type=\"a\"><li style=\"text-align: justify;\">tanggal, bulan, dan tahun surat Permohonan;</li><li style=\"text-align: justify;\">nama, alamat lengkap, dan kewarganegaraan Pendesain;</li><li style=\"text-align: justify;\">nama, alamat lengkap, dan kewarganegaraan Pemohon;</li><li style=\"text-align: justify;\">nama dan alamat lengkap Kuasa apabila Permohonan diajukan melalui Kuasa; dan</li><li style=\"text-align: justify;\">nama negara dan tanggal penerimaan permohonan yang pertama kali, dalam hal Permohonan diajukan dengan Hak Prioritas.</li></ol></li><li style=\"text-align: justify;\">Permohonan ditandatangani oleh Pemohon atau Kuasanya serta dilampiri dengan:<ol type=\"a\"><li style=\"text-align: justify;\">contoh fisik atau gambar atau foto dan uraian dari Desain Industri yang dimohonkan pendaftarannya (untuk mempermudah proses pengumuman permohonan, sebaiknya bentuk gambar atau foto tersebut dapat di-scan, atau dalam bentuk disket atau floppy disk dengan program sesuai);</li><li style=\"text-align: justify;\">surat kuasa khusus, dalam hal Permohonan diajukan melalui Kuasa;</li><li style=\"text-align: justify;\">surat pernyataan bahwa Desain Industri yang dimohonkan pendaftarannya adalah milik Pemohon atau milik Pendesain.</li></ol></li><li style=\"text-align: justify;\">Dalam hal Permohonan diajukan secara bersama-sama oleh lebih dari satu Pemohon, Permohonan tersebut ditandatangani oleh salah satu Pemohon dengan melampirkan persetujuan tertulis dari para Pemohon lain.</li><li style=\"text-align: justify;\">Dalam hal Permohonan diajukan oleh bukan Pendesain, Permohonan harus disertai pernyataan yang dilengkapi dengan bukti yang cukup bahwa Pemohon berhak atas Desain Industri yang bersangkutan.</li><li style=\"text-align: justify;\">Membayar biaya permohonan sebesar Rp 300.000,00 untuk Usaha Kecil dan Menengah (UKM) serta Rp 600.000,00 untuk non-UKM untuk setiap permohonan.</li></ol>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:30:23', '2018-10-24 09:30:23', NULL),
(13, 1, 'pengenalan-indikasi-geografis', 'Pengenalan Indikasi Geografis', '<h4 style=\"text-align: justify;\"><strong>Indikasi Geografis (IG)</strong></h4><p style=\"text-align: justify;\">Indikasi geografis adalah suatu tanda yang menunjukkan daerah asal suatu barang dan/atau produk yang karena faktor lingkungan geografis termasuk faktor alam, faktor manusia, atau kombinasi dari kedua faktor tersebut, memberikan reputasi dan kualitas, dan karakteristik terntentu pada barang dan/atau produk yang dihasilkan</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Indikasi Asal</strong></h4><p style=\"text-align: justify;\">Indikasi asal adalah suatu tanda yang memenuhi ketentuan tanda indikasi geografis yang tidak didaftarkan atau semata-mata menunjukan asal suatu barang atau jasa.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:33:53', '2018-10-24 09:33:53', NULL),
(14, 1, 'prosedurdiagram-alir-indikasi-geografis', 'Prosedur/Diagram Alir Indikasi Geografis', '<p style=\"text-align: justify;\">Peraturan Pemerintah No. 51 Tahun 2007 Tentang Indikasi Geografis mengenai prosedur pendaftaran</p><p style=\"text-align: justify;\">Dengan diberlakukannya PP. 51 Tahun 2007 pada tanggal 4 September 2007 sebagai aturan pelaksanaan dari Undang-undang Nomor 15 Tahun 2001 yang mengatur perlindungan Indikasi-Geografis maka hal tersebut telah membuka jalan untuk bisa didaftarkannya produk-produk Indikasi Geografis di tanah air. Peraturan Pemerintah No. 51 Tahun 2007 memuat ketentuan-ketentuan mengenai tatacara pendaftaran Indikasi-Geografis adapun tahap tatacara dapat dikelompokkan menjadi :</p><p style=\"text-align: justify;\">&nbsp;</p><p style=\"text-align: justify;\">I. Tahap Pertama : Mengajukan Permohonan</p><ul><li style=\"text-align: justify;\">Setiap Asosiasi, produsen atau organisasi yang mewakili produk Indikasi Geografis dapat mengajukan permohonan dengan memenuhi persyaratan&ndash;persyaratan yaitu dengan melampirkan :<ol type=\"1\"><li style=\"text-align: justify;\">Permohonan diajukan secara tertulis dalam bahasa Indonesia oleh Pemohon atau melalui Kuasanya dengan mengisi formulir dalam rangkap 3 (tiga) kepada Direktorat Jenderal</li><li style=\"text-align: justify;\">surat kuasa khusus, apabila Permohonan diajukan melalui Kuasa;</li><li style=\"text-align: justify;\">bukti pembayaran biaya</li><li style=\"text-align: justify;\">Buku Persyaratan yang terdiri atas:<ol type=\"i\"><li style=\"text-align: justify;\">nama Indikasi-geografisdimohonkan pendaftarannya;</li><li style=\"text-align: justify;\">nama barang yang dilindungi oleh Indikasi-geografis;</li><li style=\"text-align: justify;\">uraian mengenai karakteristik dan kualitas yang membedakan barang tertentu dengan barang lain yang memiliki kategori sama, dan menjelaskan tentang hubungannya dengan daerah tempat barang tersebut dihasilkan;</li><li style=\"text-align: justify;\">uraian mengenai lingkungan geografis serta faktor alam dan faktor manusia yang merupakan satu kesatuan dalam memberikan pengaruh terhadap kualitas atau karakteristik dari barang yang dihasilkan;</li><li style=\"text-align: justify;\">uraian tentang batas -batas daerah dan/atau peta wilayah yang dicakup oleh Indikasi-geografis;</li><li style=\"text-align: justify;\">uraian mengenai sejarah dan tradisi yang berhubungan dengan pemakaian Indikasi-geografis untuk menandai barang yang dihasilkan di daerah tersebut, termasuk pengakuan dari masyarakat mengenai Indikasi-geografis tersebut;</li><li style=\"text-align: justify;\">uraian yang menjelaskan tentang proses produksi, proses pengolahan, dan proses pembuatan yang digunakan sehingga memungkinkan setiap produsen di daerah tersebut untuk memproduksi, mengolah, atau membuat barang terkait;</li><li style=\"text-align: justify;\">uraian mengenai metode yang digunakan untuk menguji kualitas barang yang dihasilkan; dan</li><li style=\"text-align: justify;\">label yang digunakan pada barang dan memuat Indikasi-geografis.</li></ol></li><li style=\"text-align: justify;\">Uraian tentang batas-batas daerah dan/atau peta wilayah yang dicakup oleh Indikasi-geografis yang mendapat rekomendasi dari instansi yang berwenang.</li></ol></li></ul><p style=\"text-align: justify;\">II. Tahap Kedua : Pemeriksaan Administratif</p><ul><li style=\"text-align: justify;\">Pada tahap ini pemeriksa melakukan pemeriksaan secara cermat dari permohonan untuk melihat apabila adanya kekurangan-kekurangan persyaratan yang diajukan. Dalam hal adanya kekurangan Pemeriksa dapat mengkomunikasikan hal ini kepada pemohon untuk diperbaiki dalam tenggang waktu 3 (tiga) bulan dan apabila tidak dapat diperbaiki maka permohonan tersebut ditolak.</li></ul><p style=\"text-align: justify;\">III. Tahap Ketiga : Pemeriksaan Substansi</p><ul><li style=\"text-align: justify;\">Pada tahap ini permohonan diperiksa. Permohonan Indikasi geografis dengan tipe produk yang berbeda-beda, Tim Ahli yang terdiri dari para pemeriksa yang ahli pada bidangnya memeriksa isi dari pernyataan-pernyataan yang yang telah diajukan untuk memastikan kebenarannya dengan pengkoreksian, setelah dinyatakan memadai maka akan dikeluarkan Laporan Pemeriksaan yang usulannya akan disampaikan kepada Direktorat Jenderal.</li><li style=\"text-align: justify;\">Dalam Permohonan ditolak maka pemohon dapat mengajukan tanggapan terhadap penolakan tersebut, Pemeriksaan substansi dilaksanakan paling lama selama 2 Tahun.</li></ul><p style=\"text-align: justify;\">IV. Tahap Keempat : Pengumuman</p><ul><li style=\"text-align: justify;\">Dalam jangka waktu paling lama 10 (sepuluh) hari sejak tanggal disetujuinya Indikasi-geografis untuk didaftar maupun ditolak, Direktorat Jenderal mengumumkan keputusan tersebut dalam Berita Resmi Indikasi-geografis selama 3 (tiga) bulan.</li><li style=\"text-align: justify;\">Pengumuman akan memuat hal-hal antara lain: nomor Permohonan, nama lengkap dan alamat Pemohon, nama dan alamat Kuasanya, Tanggal Penerimaan, Indikasi-geografis dimaksud, dan abstrak dari Buku Persyaratan.</li></ul><p style=\"text-align: justify;\">V. Tahap Ke Lima : Oposisi Pendaftaran.</p><ul><li style=\"text-align: justify;\">Setiap orang yang memperhatikan Berita Resmi Indikasi geografis dapat mengajukan oposisi dengan adanya Persetujuan Pendaftaran Indikasi Geografis yang tercantum pada Berita Resmi Indikasi Geografis. Oposisi diajukan dengan membuat keberatan disertai dengan alasan-alasannya dan pihak pendaftar / pemohon Indikasi geografis dapat mengajukan sanggahan atas keberatan tersebut.</li></ul><p style=\"text-align: justify;\">VI. Tahap Ke Enam : Pendaftaran</p><ul><li style=\"text-align: justify;\">Terhadap Permohonan Indikasi Geografis yang disetujui dan tidak ada oposisi atau sudah adanya keputusan final atas oposisi untuk tetap didaftar. Tanggal pendaftaran sama dengan tanggal ketika diajukan aplikasi. Direktorat Jenderal kemudian memberikan sertifikat Pendaftaran Indikasi Geografis, Sertifikat dapat diperbaiki apabila terjadi kekeliruan.</li></ul><p style=\"text-align: justify;\">VII. Tahap Ketujuh: Pengawasan terhadap Pemakaian Indikasi-Geografis</p><ul><li style=\"text-align: justify;\">Pada Tahap ini Tim Ahli Indikasi-geografis mengorganisasikan dan memonitor pengawasan terhadap pemakaian Indikasi-geografis di wilayah Republik Indonesia. Dalam hal ini berarti bahwa Indikasi Geografis yang dipakai tetap sesuai sebagaimana buku persyaratan yang diajukan.</li></ul><p style=\"text-align: justify;\">VIII. Tahap Kedelapan : Banding</p><ul><li style=\"text-align: justify;\">Permohonan banding dapat diajukan kepada Komisi Banding Merek oleh Pemohon atau Kuasanya terhadap penolakan Permohonan dalam jangka waktu 3 (tiga Bulan) sejak putusan penolakan diterima dengan membayar biaya yang telah ditetapkan.</li></ul>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:36:03', '2018-10-24 09:36:03', NULL),
(15, 1, 'pengenalan-desain-tata-letak-sirkuit-terpadu', 'Pengenalan Desain Tata Letak Sirkuit Terpadu', '<h4 style=\"text-align: justify;\"><strong>Sirkuit Terpadu</strong></h4><p style=\"text-align: justify;\">Sirkuit Terpadu adalah suatu produk dalam bentuk jadi atau setengah jadi, yang di dalamnya terdapat berbagai elemen dan sekurang-kurangnya satu dari elemen tersebut adalah elemen aktif, yang sebagian atau seluruhnya saling berkaitan serta dibentuk secara terpadu di dalam sebuah bahan semikonduktor yang dimaksudkan untuk menghasilkan fungsi elektronik.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Desain Tata Letak</strong></h4><p style=\"text-align: justify;\">Desain Tata Letak adalah kreasi berupa rancangan peletakan tiga dimensi dari berbagai elemen, sekurang-kurangnya satu dari elemen tersebut adalah elemen aktif, serta sebagian atau semua interkoneksi dalam suatu Sirkuit Terpadu dan peletakan tiga dimensi tersebut dimaksudkan untuk persiapan pembuatan Sirkuit Terpadu.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Desain Tata Letak Sirkuit Terpadu</strong></h4><p style=\"text-align: justify;\">Hak Desain Tata Letak Sirkuit Terpadu adalah hak eksklusif yang diberikan oleh negara Republik Indonesia kepada Pendesain atas hasil kreasinya, untuk selama waktu tertentu melaksanakan sendiri, atau memberikan persetujuannya kepada pihak lain untuk melaksanakan hak tersebut</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:40:31', '2018-10-24 09:40:31', NULL);
INSERT INTO `pages` (`id`, `id_user`, `slug`, `title`, `content`, `keyword`, `image`, `category`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 1, 'prosedurdiagram-alir-pendaftaran-dtlst', 'Prosedur/Diagram Alir Pendaftaran DTLST', '<ol><li style=\"text-align: justify;\">Permohonan diajukan secara tertulis dalam bahasa Indonesia ke Direktorat Jenderal &nbsp;dengan &nbsp;membayar biaya sebagaimana diatur dalam Undang-undang ini.</li><li style=\"text-align: justify;\">Permohonan sebagaimana dimaksud dalam ayat (1) ditandatangani oleh Pemohon atau Kuasanya.</li><li style=\"text-align: justify;\">Permohonan harus memuat:<ol><li style=\"text-align: justify;\">tanggal, bulan, dan tahun surat Permohonan;</li><li style=\"text-align: justify;\">nama, alamat &nbsp;lengkap dan kewarganegaraan Pendesain;</li><li style=\"text-align: justify;\">nama, alamat &nbsp;lengkap, dan kewarganegaraan Pemohon;</li><li style=\"text-align: justify;\">nama dan alamat lengkap Kuasa apabila Permohonan diajukan melalui Kuasa; dan</li><li style=\"text-align: justify;\">tanggal pertama kali dieksploitasi secara komersial apabila sudah pernah dieksploitasi &nbsp;sebelum Permohonan diajukan.</li></ol></li><li style=\"text-align: justify;\">Permohonan sebagaimana dimaksud dalam ayat (3) dilampiri dengan:<ol><li style=\"text-align: justify;\">gambar atau foto serta uraian dari Desain Tata Letak Sirkuit Terpadu yang dimohonkan pendaftarannya;</li><li style=\"text-align: justify;\">surat kuasa khusus, dalam hal Permohonan diajukan melalui Kuasa;</li><li style=\"text-align: justify;\">surat pernyataan bahwa Desain Tata Letak Sirkuit Terpadu yang dimohonkan pendaftarannya adalah miliknya;</li><li style=\"text-align: justify;\">surat keterangan yang menjelaskan mengenai tanggal sebagaimana dimaksud dalam ayat (3) huruf e (5).</li></ol></li><li style=\"text-align: justify;\">Dalam hal Permohonan diajukan secara bersama-sama oleh lebih dari satu Pemohon, &nbsp; Permohonan tersebut ditandatangani oleh salah satu Pemohon dengan dilampiri persetujuan tertulis dari para Pemohon lain.</li><li style=\"text-align: justify;\">Dalam hal Permohonan diajukan oleh bukan Pendesain, Permohonan harus disertai &nbsp;pernyataan yang dilengkapi dengan bukti yang cukup bahwa Pemohon berhak atas Desain Tata Letak Sirkuit Terpadu yang bersangkutan.</li><li style=\"text-align: justify;\">Ketentuan tentang tata cara Permohonan diatur lebih lanjut dengan Peraturan Pemerintah.ng dimohonkan pendaftarannya;</li></ol>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:41:52', '2018-10-24 09:41:52', NULL),
(17, 1, 'pengenalan-rahasia-dagang', 'Pengenalan Rahasia Dagang', '<h4 style=\"text-align: justify;\"><strong>Rahasia Dagang</strong></h4><p style=\"text-align: justify;\">Rahasia Dagang adalah informasi yang tidak diketahui oleh umum di bidang teknologi dan/atau bisnis, mempunyai nilai ekonomi karena berguna dalam kegiatan usaha, dan dijaga kerahasiaannya oleh pemilik Rahasia Dagang.</p><p style=\"text-align: justify;\"><br></p><h4 style=\"text-align: justify;\"><strong>Dasar Perlindungan Rahasia Dagang</strong></h4><p style=\"text-align: justify;\">Perlindungan atas rahasia dagang diatur dalam Undang-undang Nomor 30 Tahun 2000 tentang Rahasia Dagang (UURD) dan mulai berlaku sejak tanggal 20 Desember 2000.</p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 09:44:07', '2018-10-24 09:44:07', NULL),
(18, 1, 'prosedur-permohonan-madrid-protocol', 'Prosedur Permohonan Madrid Protocol', '<p>Permohonan Internasional diajukan kepada Biro Internasional melalui Direktorat Jenderal Hak Kekayaan Intelektual.&nbsp;</p><p>Permohonan Internasional diajukan dengan mengisi formulir MM2 dalam bahasa Inggris.</p><p><u><a class=\"\" href=\"http://www.dgip.go.id/images/ki-images/pdf-files/merek/formulir-madrid.pdf\">Formulir MM2</a></u></p><p>Syarat subyek yang dapat mengajukan :</p><ol><li>Pemohon yang memiliki kewarganegaraan Indonesia;</li><li>Pemohon yang memiliki domisili atau tempat kedudukan hukum di wilayah Negara Kesatuan Republik Indonesia.</li><li>Pemohon yang memiliki kegiatan usaha industri atau komersial yang nyata di wilayah Negara Kesatuan Republik Indonesia.</li></ol><p>Syarat objek yang dapat diajukan :&nbsp;</p><p>Pengajuan Permohonan Internasional hanya dapat dilakukan jika Pemohon telah memiliki Permohonan atau Pendaftaran (secara nasional) di DJKI sebelumnya.</p><p>Prosedur permohonan merek secara singkat digambarkan dalam gambar di bawah ini:</p><p><img class=\"fr-dib fr-draggable\" src=\"http://www.dgip.go.id/images/ki-images/pdf-files/merek/ALUR%20MADRID%20PROTOKOL.png\" style=\"width: 381px; height: 196.85px;\"></p>', NULL, '[\"default.jpg\"]', 'default', NULL, '2018-10-24 17:36:03', '2018-10-24 17:36:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages_about`
--

CREATE TABLE `pages_about` (
  `about` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `founded` date NOT NULL,
  `industry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vision` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `maps` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages_about`
--

INSERT INTO `pages_about` (`about`, `founded`, `industry`, `vision`, `mission`, `maps`, `image`) VALUES
('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit dicta eveniet voluptatem laboriosam sequi illo ducimus, itaque, veritatis, eos suscipit voluptate! Hic, laborum eligendi perspiciatis, quidem ipsa placeat deleniti odio distinctio tempore. Quaerat, non deserunt quisquam iure dolores, fugiat quos sint dolore quod, perferendis deleniti suscipit dicta facere temporibus in.', '2018-10-09', 'Software', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum quasi illo inventore veniam ipsa velit doloremque optio a dolorem qui, ad esse perspiciatis vitae deserunt doloribus facere officiis minus reiciendis!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum quasi illo inventore veniam ipsa velit doloremque optio a dolorem qui, ad esse perspiciatis vitae deserunt doloribus facere officiis minus reiciendis!', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pages_about_team`
--

CREATE TABLE `pages_about_team` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_slide`
--

CREATE TABLE `pages_slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_work`
--

CREATE TABLE `pages_work` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortdesc` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','schedule','draft','hidden') COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `slug`, `title`, `content`, `keyword`, `image`, `category`, `comment`, `status`, `published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'djki-kementerian-hukum-dan-hak-asasi-manusia-meluncurkan-tiga-aplikasi-baru', 'DJKI Kementerian Hukum dan Hak Asasi Manusia meluncurkan tiga aplikasi baru', '<p>Bogor - Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia meluncurkan tiga aplikasi baru.</p><p>Aplikasi tersebut yaitu portal website DJKI berbahasa Inggris, website versi mobile berbasis android serta aplikasi Teman Kita Modul Merek (Sistem Manajemen Kekayaan Intelektual Terpadu dan Aman untuk Modul Merek) pada Rapat Kerja Teknis (Rakernis) Direktorat Teknologi Informasi Kekayaan Intelektual di Hotel Rancamaya, Jumat (5/10/2018) Malam.</p><p>Aplikasi Teman Kita menghadirkan fitur baru yang ringkas serta cepat, serta dibalut dengan tampilan yang memudahkan pengguna dalam mengakses aplikasi ini, mulai dari proses pendaftaran merek, hingga penerbitan sertifikat yang lebih mudah serta efisien.</p><p>Pengembangan sistem permohonan pendaftaran merek dengan nama Teman Kita Modul Merek yang akan menggantikan aplikasi yang selama ini kita gunakan, yaitu IPAS&rdquo;, ujar Direktur Teknologi Informasi KI, Razilu.</p><p>Selain itu, Razilu menjelaskan bahwa website DJKI berbahasa Inggris tidak hanya ada pada bentuk tampilan depannya atau home page saja.</p><p>&ldquo;Jadi portal DJKI tidak hanya tampak depannya saja yang berbahasa inggris, tetapi seluruh konten yang ada di dalamnya berbahasa inggris&rdquo;, ucap Razilu.</p><p>Direktur Jenderal Kekayaan Intelektual, Freddy Harris mengatakan dengan menghadirkan berbagai inovasi seperti ini DJKI akan menjadi salah satu lembaga yang bergengsi.</p><p>&ldquo;Saya mengapresiasi atas ini, karena sudah banyak mengalami berubahan menjadi lebih baik&rdquo;, ujar Freddy Harris.</p><p>Freddy Harris juga menyampaikan pentingnya peran Direktorat Teknologi Informasi yang menyediakan data kekayaan intelektual.</p><p>Melihat Global Innovation Index (GII) 2018 yang dirilis oleh Cornell University, INSEAD and the World Intellectual Property Organization (WIPO), Indonesia berada dalam urutan ke 85, naik dua peringkat dari capaian tahun lalu.</p><p>&ldquo;Kenapa Indonesia selalu kalah dari negara ASEAN bahkan vietnam, setelah diteliti salah satu masalahnya yaitu karena kita malas ngisi data&rdquo;, ujar Freddy Harris.</p><p>Peran Direktorat Teknologi Informasi menjadi penting untuk menyediakan data kekayaan intelektual yang valid untuk keperluan indikator penilaian GII.</p><p>&ldquo;Tanpa adanya data kita tidak mengisi&rdquo;, ujar Freddy Harris.</p><p>Rakernis yang dihadiri 102 peserta ini dilaksanakan dalam rangka memberikan prioritas dalam membangun dan mengembangkan sistem informasi kekayaan intelektual untuk meningkatkan layanan publik yang berkualitas dalam mewujudkan DJKI menjadi The Best 10 IP Office in the World.</p><p>Selain peluncuran aplikasi, adapula pemberian penghargaan apresiasi kepada Tim Penerjemah Konten Bahasa Inggris pada portal web DJKI, dan Empat Tim yang telah berpartisipasi pada kompetisi inovasi pelayanan publik 2018 (Pencatatan Hak Cipta Online), serta Unit Eselon II DJKI yang menggunakan email resmi DJKI paling banyak.</p>', NULL, '[\"899222.jpg\",\"876922.jpg\",\"827805.jpg\"]', '1', '1', 'publish', '2018-10-05 20:00:00', '2018-10-10 13:46:19', '2018-10-10 13:51:18', NULL),
(2, 1, 'testing', 'Testing', '<p>asdasdasdsa</p>', NULL, '[\"899222.jpg\"]', '0', '1', 'publish', '2018-10-11 02:41:00', '2018-10-11 02:41:00', '2018-10-11 10:16:47', '2018-10-11 10:16:47'),
(3, 1, 'djki-kementerian-hukum-dan-hak-asasi-manusia-meluncurkan-tiga-aplikasi-baru-1', 'DJKI Kementerian Hukum dan Hak Asasi Manusia meluncurkan tiga aplikasi baru 1', '<p>Bogor - Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia meluncurkan tiga aplikasi baru.</p><p>Aplikasi tersebut yaitu portal website DJKI berbahasa Inggris, website versi mobile berbasis android serta aplikasi Teman Kita Modul Merek (Sistem Manajemen Kekayaan Intelektual Terpadu dan Aman untuk Modul Merek) pada Rapat Kerja Teknis (Rakernis) Direktorat Teknologi Informasi Kekayaan Intelektual di Hotel Rancamaya, Jumat (5/10/2018) Malam.</p><p>Aplikasi Teman Kita menghadirkan fitur baru yang ringkas serta cepat, serta dibalut dengan tampilan yang memudahkan pengguna dalam mengakses aplikasi ini, mulai dari proses pendaftaran merek, hingga penerbitan sertifikat yang lebih mudah serta efisien.</p><p>Pengembangan sistem permohonan pendaftaran merek dengan nama Teman Kita Modul Merek yang akan menggantikan aplikasi yang selama ini kita gunakan, yaitu IPAS&rdquo;, ujar Direktur Teknologi Informasi KI, Razilu.</p><p>Selain itu, Razilu menjelaskan bahwa website DJKI berbahasa Inggris tidak hanya ada pada bentuk tampilan depannya atau home page saja.</p><p>&ldquo;Jadi portal DJKI tidak hanya tampak depannya saja yang berbahasa inggris, tetapi seluruh konten yang ada di dalamnya berbahasa inggris&rdquo;, ucap Razilu.</p><p>Direktur Jenderal Kekayaan Intelektual, Freddy Harris mengatakan dengan menghadirkan berbagai inovasi seperti ini DJKI akan menjadi salah satu lembaga yang bergengsi.</p><p>&ldquo;Saya mengapresiasi atas ini, karena sudah banyak mengalami berubahan menjadi lebih baik&rdquo;, ujar Freddy Harris.</p><p>Freddy Harris juga menyampaikan pentingnya peran Direktorat Teknologi Informasi yang menyediakan data kekayaan intelektual.</p><p>Melihat Global Innovation Index (GII) 2018 yang dirilis oleh Cornell University, INSEAD and the World Intellectual Property Organization (WIPO), Indonesia berada dalam urutan ke 85, naik dua peringkat dari capaian tahun lalu.</p><p>&ldquo;Kenapa Indonesia selalu kalah dari negara ASEAN bahkan vietnam, setelah diteliti salah satu masalahnya yaitu karena kita malas ngisi data&rdquo;, ujar Freddy Harris.</p><p>Peran Direktorat Teknologi Informasi menjadi penting untuk menyediakan data kekayaan intelektual yang valid untuk keperluan indikator penilaian GII.</p><p>&ldquo;Tanpa adanya data kita tidak mengisi&rdquo;, ujar Freddy Harris.</p><p>Rakernis yang dihadiri 102 peserta ini dilaksanakan dalam rangka memberikan prioritas dalam membangun dan mengembangkan sistem informasi kekayaan intelektual untuk meningkatkan layanan publik yang berkualitas dalam mewujudkan DJKI menjadi The Best 10 IP Office in the World.</p><p>Selain peluncuran aplikasi, adapula pemberian penghargaan apresiasi kepada Tim Penerjemah Konten Bahasa Inggris pada portal web DJKI, dan Empat Tim yang telah berpartisipasi pada kompetisi inovasi pelayanan publik 2018 (Pencatatan Hak Cipta Online), serta Unit Eselon II DJKI yang menggunakan email resmi DJKI paling banyak</p>', NULL, '[\"827805.jpg\"]', '1', '1', 'publish', '2018-10-11 05:33:00', '2018-10-11 05:33:25', '2018-10-11 10:17:04', '2018-10-11 10:17:04'),
(4, 1, 'kemenkumham-canangkan-gerakan-disiplin-nasional-dalam-pekan-hari-dharma-karyadhika-2018', 'Kemenkumham Canangkan Gerakan Disiplin Nasional Dalam Pekan Hari Dharma Karyadhika 2018', '<p>Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) mencanangkan Gerakan Disiplin Nasional serta pencanangan pekan Hari Dharma Karyadhika tahun 2018 yang diselenggarakan di lapangan upacara, Rabu (3/10).</p><p>Pencanangan Gerakan Disiplin Nasional ini untuk mewujudkan budaya kerja yang Profesional, Akuntabel, Sinergi, Transparan dan Inovatif (PASTI).</p><p>Menteri Hukum dan Hak Asasi Manusia, Yasonna H Laoly menyampaikan bahwa melalui pencanangan ini diharapkan dapat merubah <em>mindset</em> Aparatur Sipil Negara (ASN) di lingkungan Kemenkumham dalam wujudkan kinerja untuk mensukseskan pembangunan nasional.</p><p>Hari Dharma Karyadhika (HDKI) tahun ini mengusung tema &ldquo;Sinergi Kerja &ndash; Kami PASTI&rdquo; dengan Tupai sebagai maskotnya. Tupai menggambarkan hewan yang cerdas, lincah, tangguh dan pantang menyerah.</p><p>&ldquo;Ini dapat kita maknai bahwa kita pun harus mampu menjadi ASN yang dapat bekerja keras dan bekerja sama, serta berjiwa kesatria untuk mengabdi pada bangsa dan negara&rdquo;, ujar Yasonna H Laoly dalam pidato sambutannya.</p><p>Selain mendeklarasikan Gerakan Disiplin Nasional serta launching Maskot HDKD 2018, pada kesempatan ini, dilaksanakan defile kontingen yang terdiri dari 11 unit pusat di Kementerian Hukum dan HAM.</p><p>Acara ditutup dengan penggalangan dana untuk musibah bencana alam yang terjadi di Donggala, Sulawesi Tengah.</p><p>Menurut Sekretaris Direktorat Jenderal Kekayaan Intelektual (Sesditjen KI), R. Natanegara dalam laporannya mengatakan kegiatan HDKD ini juga diisi dengan acara bakti sosial, salah satunya, sunatan masal dan santunan anak yatim yang diselenggarakan di Cibulan, Bogor.</p><p>&ldquo;Kita juga selenggarakan Legal expo, sport competition, rewarding night, Kemenkumham peduli, launching data center, dan performance art. Ini sebagai bentuk semangat kerja nyata yang selama ini menjadi slogan jajaran kemenkumham&rdquo;, ungkapnya.</p><p>Kegiatan upacara pembukaan HDKD ini diikuti secara langsung secara serentak oleh kantor wilayah (Kanwil),UPT kemenkumham seluruh Indonesia.</p>', NULL, '[\"499480.jpg\",\"840826.jpg\",\"689481.jpg\"]', '1', '1', 'publish', '2018-10-03 00:00:00', '2018-10-11 10:19:08', '2018-10-11 10:21:18', NULL),
(5, 1, 'bimbingan-teknis-jabatan-fungsional-arsiparis-kementerian-hukum-dan-ham', 'Bimbingan Teknis Jabatan Fungsional Arsiparis Kementerian Hukum dan HAM', '<p>Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) menyelenggarakan Bimbingan Teknis Tim Penilai Jabatan Fungsional Arsiparis selama empat hari di Hotel Novotel Tangerang.</p><p>Pentingnya pengelolaan arsip atau dokumen di suatu instansi tidak dapat dipandang sebalah mata, terlebih terkait arsip di instansi pemerintahan. Dokumen tersebut perlu dikelola secara benar dalam penataannya oleh pejabat fungsional arsiparis.</p><p>Menurut Sekretaris Direktorat Jenderal Kekayaan Intelektual &nbsp;(Sesditjen KI), R. Natanegara bahwa pengarsipan menjadi penting karena memiliki kegunaan sebagai bukti suatu aktivitas dan kebijakan yang dapat dipertanggung jawabkan.</p><p>&ldquo;Pengarsipan merupakan bagian yang sangat penting dalam suatu dokumentasi&rdquo;, ujar R. Natanegara dalam sambutan acara, Senin (1/10/2018).</p><p>Bimbingan teknis ini diselenggarakan untuk menambah wawasan dan ilmu pejabat tim penilai sehingga mampu mengevaluasi keselarasan hasil penilaian yang dilakukan oleh arsiparis, serta sebagai bahan pertimbangan pejabat pembina kepegawaian dlam pengembangan aparatur sipil negara (ASN).</p><p>Seorang arsiparis perlu mengolah dan menyajikan arsip menjadi informasi, terlebih dengan memanfaatkan teknologi dalam mendukung pengelolaannya.</p>', NULL, '[\"585460.jpg\",\"944116.jpg\",\"644815.jpg\"]', '1', '1', 'publish', '2018-10-01 00:00:00', '2018-10-11 10:25:51', '2018-10-11 10:31:55', NULL),
(6, 1, 'kantor-kekayaan-intelektual-se-asia-tenggara-segera-integrasikan-database-merek-dan-desain-industri-secara-global', 'Kantor Kekayaan Intelektual Se-Asia Tenggara Segera Integrasikan Database Merek dan Desain Industri Secara Global', '<p><strong>Swiss</strong> - Kantor Kekayaan Intelektual (KI) di Indonesia, Brunei Darussalam dan Laos akan mengintegrasikan data merek dan desainnya ke dalam database pencarian merek dan desain global, yaitu TMview dan Designview.</p><p>Database-database ini telah dikembangkan oleh <em>European Union Intellectual Property Office</em> (EUIPO), bersama dengan mitra-mitra mereka dari Eropa dan Internasional.</p><p>Pada pertemuan di Jenewa hari ini, para Direktur Jenderal (Dirjen) dan pejabat senior lainnya dari kantor-kantor KI di Asia Tenggara berdiskusi dalam forum yang mempertemukan dengan perwakilan dari EUIPO dalam menyampaikan <em>state of the art</em> database tersebut kepada kantor-kantor KI di Asia tenggara, yang diatur dalam kerangka kerja program IP Key SEA yang didanai oleh Uni Eropa.</p><p>Dirjen KI Kementerian Hukum dan Hak Asasi Manusia, Freddy Harris mengatakan, penambahan data Indonesia akan mengkonsolidir penggunaan database TMview dan Designview secara lebih lanjut.</p><p>&ldquo;Database tersebut dapat menjadi sumber bagi para pemegang hak KI dan praktisi KI&rdquo;, ujar Freddy Harris dalam keterangan tertulis, Jumat (28/9/2018).</p><p>Sebagai informasi, TMview saat ini berisi lebih dari 50 juta merek dari 67 kantor KI di seluruh dunia, sementara itu Designview berisi sekitar 14 juta desain dari 67 kantor yang ikut serta.</p><p>Kedua database ini dapat digunakan secara gratis, mudah diakses dan tersedia 24 jam non stop. Para pengguna dapat mencari merek dan desain di setiap daftar merek dan desain industri dari kantor-kantor yang ikut serta.</p><p>Dirjen KI Laos, Khanlasy Keobounphanph berpendapat bahwa data lokal dari setiap negara yang terintegrasi ke dalam platform internasional dapat memudahkan para pemangku kepentingan dalam negeri &nbsp;maupun internasional.</p><p>&ldquo;Menjadi bagian dari database TMview global dan database Designview akan meningkatkan kekayaan intelektual negara Laos di kancah internasional &rdquo;, ujar Khanlasy.</p><p>Hal senada juga disampaikan Dirjen KI Brunei (BruIPO), Shahrinah Yusof Khan, yang mengakui pentingnya ikut serta dalam TMview dan Designview.</p><p>&ldquo;Pencantuman data merek dan desain industri Brunei akan membuat kantor KI kami memiliki jangkauan yang lebih luas dalam hal menyediakan informasi terkini dan akurat tentang merek dan desain yg dilindungi di negara kami&rdquo;, ucap Yusof Khan.</p><p>Pelaksana Tugas (Plt.) Direktur Eksekutif EUIPO, Christian Archambeau mengatakan, &ldquo;Pertemuan hari ini melanjutkan komitmen Uni Eropa dalam mendukung mitra-mitra kami di Asia tenggara dalam membangun layanan dan pelindungan kekayaan intelektual yang lebih kuat.&rdquo;</p>', NULL, '[\"885200.jpeg\"]', '1', '0', 'publish', '2018-09-28 00:00:00', '2018-10-11 10:35:03', '2018-10-11 10:35:03', NULL),
(7, 1, 'indonesia-telah-ratifikasi-traktat-beijing-untuk-lindungi-pelaku-seni-pertunjukan', 'Indonesia Telah Ratifikasi Traktat Beijing Untuk Lindungi Pelaku Seni Pertunjukan', '<p>Swiss - Menteri Hukum dan Hak Asasi Manusia (Menkumham), Yasonna H Laoly bersama Inspektur Jenderal Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham), Aidir Amin Daud, dan Direktur Jenderal Kekayaan Intelektual, Freddy Harris beserta jajarannya menghadiri sidang umum World Intellectual Property Organization (WIPO) ke 58 di Jenewa, Swiss.</p><p>Dalam sidang umum ini, Yasonna membahas tentang &nbsp;Hak Cipta, khususnya terkait pelindungan pelaku pertunjukan audio visual,dan Indikasi Geografis serta sumber daya genetik, pengetahuan tradisional, dan ekspresi budaya tradisional (SDGPTEBT).</p><p>&ldquo;Berkenaan dengan hak cipta, Indonesia menginformasikan telah mengadopsi ketentuan Traktat Marrakesh dan Traktat Beijing dalam Undang-Undang Nomor 28 Tahun 2014 tentang Hak Cipta&rdquo;, ujar Yasonna H Laoly saat pidato di Kantor Pusat WIPO, (24/9/2018).</p><p>Traktat Beijing penting bagi Indonesia untuk diratifikasi, karena memberikan pelindungan bagi para pelaku pertunjukan yang menampilkan audio-visual mereka, yang merupakan elemen penting dalam pengembangan kreativitas nasional.</p><p>&ldquo;Dampaknya, secara signifikan akan berkontribusi untuk meningkatkan pertumbuhan ekonomi kreatif. Dan pada akhirnya, akan berkontribusi pada pembangunan ekonomi dan kesejahteraan rakyat&rdquo;, ucap Menkumham.</p><p>Ia menjelaskan bahwa Traktat Beijing akan memberikan kepastian hukum untuk hak-hak moral dan hak-hak ekonomi para pelaku pertunjukan, terutama untuk melindungi kinerja pertunjukan di era digital.</p><p>&ldquo;Karena itu, Indonesia telah mengadopsi ketentuan Traktat Beijing dalam Pasal 22 dan 23 Undang-undang (UU) Hak Cipta. Ratifikasi Traktat Beijing salah satu komitmen Indonesia untuk menyesuaikan dengan perkembangan global Hak Cipta&rdquo;, Yasonna menjelaskan.</p><p>Dengan aturan ini, para pelaku seni pertunjukan memiliki kewenangan dalam memberikan izin atau melarang pihak lain untuk menyiarkan dan membuat fiksasi dari para pelaku pertunjukan audio-visual mereka.</p><p>Dalam hal ini, dengan meratifikasi Traktat Beijing, itu juga akan memberikan dampak positif bagi penerapan hak untuk memproduksi kembali sebuah musik kedalam media lain atau biasa disebut mechanical rights dan sistem royalti.</p><p>&ldquo;Bukan hanya perhatian pada pertunjukan audio saja, tetapi juga melindungi pertunjukan audio-visual&rdquo;, ujar Yasonna.</p><p>Selain itu, Yasonna dalam sidang umum WIPO menyampaikan bahwa Indonesia saat ini sedang membangun pendaftaran dan basis data tentang sumber daya genetik, pengetahuan tradisional, dan ekspresi budaya tradisional (SDGPTEBT).</p><p>&ldquo;Saya menginformasikan bahwa Indonesia baru-baru ini mengadopsi peraturan yang membahas mekanisme untuk akses dan pembagian manfaat dari sumber daya genetik&rdquo;, ungkapnya.</p><p>Yasonna berharap melalui sidang umum WIPO ini, Intergovernmental Committee on Intellectual Property and Genetic Resources, Traditional Knowledge and Folklore (IGC) dapat mempercepat tugasnya dalam menghasilkan instrumen hukum internasional tentang pelindungan SDGPTEBT.</p>', NULL, '[\"924210.jpg\",\"980105.jpeg\"]', '1', '1', 'publish', '2018-09-24 00:00:00', '2018-10-11 12:24:16', '2018-10-11 12:24:16', NULL),
(8, 1, 'pelatihan-pemeriksa-desain-industri-kerja-sama-djki-dengan-seco', 'Pelatihan Pemeriksa Desain Industri Kerja Sama DJKI dengan SECO', '<p>Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) bekerja sama dengan Swiss Secretariat for Economic Affairs (SECO) mengadakan pelatihan pemeriksa desain industri yang diselenggarakan di Aula DJKI Lantai 8, Senin (24/9/2018).</p><p>Kepala Sub Dit Klasifikasi Dan Pemeriksaan, Direktorat Hak Cipta dan Desain industri, Haryadi Punto Handoyo mengatakan pelatihan ini untuk menambah pengetahuan dan kemampuan terkait perkembangan pelindungan desain industri di dunia internasional.</p><p>&ldquo;Paradigma pelindungan desain industri di dunia internasional mengalami perkembangan yang signifikan, karenanya Undang-undang No.31 Tahun 2000 tentang Desain Industri perlu menyesuaikan perkembangan tersebut, dimana Indonesia sudah menjadi anggota WIPO dan WTO&rdquo;, ujar Haryadi Punto.</p><p>Sebagai contoh, Ia menjelaskan tentang ketentuan Pasal 25 Ayat (1) dalam Persetujuan TRIPS/WTO, yang menyatakan bahwa suatu desain industri dikatakan baru jika berbeda secara signifikan dengan desain sebelumnya atau bukan kombinasi dari fitur-fitur desain yang telah ada sebelumnya.</p><p>&ldquo;Sebagai anggota WTO tentunya Indonesia harus mengakomodir ketentuan dalam Pasal 25 Ayat (1) &nbsp;ini sebagai suatu syarat minimum yang harus dipenuhi dalam proses pemberian hak desain industri&rdquo;, ucap Haryadi Punto.</p><p>Sebagai informasi, Trade-Related Aspects of Intellectual Property Rights (TRIPS) merupakan Perjanjian yang menetapkan standar minimal untuk regulasi kekayaan intelektual di negara-negara anggota World Trade Organization (WTO).</p>', NULL, '[\"332655.jpg\",\"901742.jpg\"]', '1', '1', 'publish', '2018-09-24 00:00:00', '2018-10-11 12:28:14', '2018-10-11 12:28:14', NULL),
(9, 1, 'pencatatan-hak-cipta-online-dengan-teknologi-kriptografi-raih-penghargaan', 'Pencatatan Hak Cipta Online dengan Teknologi Kriptografi Raih Penghargaan', '<p><strong>Surabaya-</strong>Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham), dipimpin Direktur Jenderal Kekayaan Intelektual (KI) Freddy Harris meraih penghargaan Top 99 Inovasi Pelayanan Publik Tahun 2018, dari Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (Kemenpan-RB).</p><p>&ldquo;Kemenpan-RB memberikan penghargaan DJKI Kemenkumham, atas inovasi Sistem Pencatatan Hak Cipta Online dengan Teknologi Kriptografi,&rdquo; ucap Menteri Syafruddin, pimpinan baru di &nbsp;Kemenpan-RB di Hotel Shangri-La, Rabu (19/9) malam.</p><p>Penghargaan tersebut, juga diberikan Menteri Syafruddin langsung diterima Direktur Jenderal KI Freddy Harris. Menteri Syafruddin dalam pidatonya mengatakan, bahwa upaya mempercepat pembangunan nasional dibutuhkan kestabilan ekonomi yang kuat termasuk perekonomian di daerah.</p><p>Menteri Syafruddin menjelaskan, bahwa masuknya investasi ke Indonesia dikarenakan iklim perekonomian yang sehat dan pilar perekonomian daerah. Yang bertumpu pada penyelenggaraan kemudahan untuk berinvestasi dan berusaha (EODB).</p><p>&ldquo;Karenanya untuk percepatan EODB, dibutuhkan pelayanan publik yang semakin mudah, biaya ringan, dan tidak berbelit,&rdquo; ujarnya.</p><p>Maka, demi mewujudkan pelayanan publik yang semakin mudah, biaya ringan, dan tidak berbelit. DJKI Kemenkumham terpicu berinovasi dalam memudahkan masyarakat. Khususnya mengurus hak cipta melalui sistem online.</p><p>Direktur Jenderal KI Freddy Harris mengatakan, aplikasi inovasi Sistem Pencatatan Hak Cipta Online dengan Teknologi Kriptografi. Tercipta supaya masyarakat mendapat pelindungan hukum atas kekayaan intelektual.</p><p>Walhasil mempermudah masyarakat dalam mengakses pencatatan hak cipta. Juga diharapkan animo masyarakat untuk segera ikut mendaftarkan pencatatan atas hak ciptanya.</p><p>Sebab proses Sistem Pencatatan Hak Cipta Online dengan Teknologi Kriptografi, Freddy mengungkapkan, kini hanya memakan waktu maksimal 1 hari melalui digital. Padahal sebelumnya dapat mencapai seminggu sebulan, dua bulan, bahkan tiga bulan.</p><p>&quot;Sekarang pencatatan hak cipta sudah satu hari. Itu pun dengan proses auto-approve,&rdquo; ucapnya. &ldquo;Dan pendaftaran pencatatan hak cipta saat ini sudah mencapai puluhan ribu,&rdquo; ucap Dirjen KI itu.</p><p>DJKI Kemenkumham, Freddy meneruskan, tidak berpuas sampai di situ saja. Menurutnya, DJKI Kemenkumham ke depan akan semakin maju dan berkembang dalam pelayanan publik menggunakan sistem online. Juga terus berinovasi untuk pelayanan merek online dan pusat data KI ASEAN.</p><p>&quot;Konsen kita adalah kalau kita layani masyarakat dengan baik dan mudah. Maka feedback masyarakat kepada kita juga akan baik,&rdquo; tuturnya.</p><p>&quot;Penghargaan inovasi hak cipta ini juga adalah hasil kerja keras teman-teman DJKI Kemenkumham untuk melakukan perubahan pelayanan publik,&rdquo; tambahnya.</p>', NULL, '[\"183609.jpg\"]', '1', '1', 'publish', '2018-09-19 00:00:00', '2018-10-11 12:31:10', '2018-10-11 12:31:10', NULL),
(10, 1, 'persiapan-penilaian-direktorat-hak-cipta-dan-desain-industri-dalam-zona-integritas-menuju-wbk-dan-wbbm', 'Persiapan Penilaian Direktorat Hak Cipta dan Desain Industri dalam zona integritas menuju WBK dan WBBM', '<p>Jakarta &ndash; Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) tengah mempersiapkan komitmennya menjadi kawasan zona integritas menuju Wilayah Bebas Korupsi (WBK) dan Wilayah Birokrasi Bersih Melayani (WBBM).</p><p>Hal ini merupakan kesiapan Direktorat Hak Cipta dan Desain Industri yang dicanangkan ke dalam zona integritas menuju WBK dan WBBM.</p><p>Direktur Jenderal Kekayaan Intelektal (Dirjen KI) Freddy Harris menyampaikan bahwa WBK dan WBBM harus dilakukan, agar kantor DJKI dapat bersih dari korupsi dan memberikan pelayanan baik kepada masyarakat.</p><p>&ldquo;Memerangi sesuatu yang negatif itu sulit dan membicarakan sesuatu yang baik itu tidak mudah, butuh bertahun-tahun, pelan-pelan tapi ke depan harus lebih baik&rdquo;, ujar Freddy Harris dalam arahannya kepada seluruh pegawai DJKI, Selasa (18/9/2018).</p><p>Menurut Kepala Sub Direktorat Klasifikasi dan Pemeriksaan Direktorat Hak Cipta dan Desain Industri, Haryadi Punto Handoyo bahwa untuk Pelayanan Hak Cipta dan Desain Industri telah siap menuju WBK dan WBBM.</p><p>&ldquo;Jadi mohon dipahami wilayah kita bebas dari korupsi, artinya kita telah melangkah ke depan untuk melakukan suatu pembaharuan&rdquo;, ucap Haryadi Punto.</p>', NULL, '[\"681133.jpg\",\"774182.jpg\"]', '1', '1', 'publish', '2018-09-18 00:00:00', '2018-10-11 12:34:58', '2018-10-11 12:34:58', NULL),
(11, 1, 'djki-serahkan-surat-pencatatan-inventarisasi-kekayaan-intelektual-komunal-ekspresi-budaya-tradisional-aceh-kepada-masyarakat-gayo', 'DJKI Serahkan Surat Pencatatan Inventarisasi Kekayaan Intelektual Komunal Ekspresi Budaya Tradisional Aceh kepada Masyarakat Gayo', '<p>Banda Aceh - Ekspresi Budaya Tradisional &nbsp;(EBT) yang merupakan salah satu bagian pelindungan Kekayaan Intelektual Komunal (KIK) yang dimiliki Indonesia perlu di inventarisasi, dijaga dan dipelihara sehingga aman dari pengakuan dan pembajakan negara lain.</p><p>Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) untuk pertama kalinya menyerahkan Surat Pencatatan Inventarisasi KIK Ekspresi Budaya Tradisional untuk Tari Sining Gayo kepada kustodian Masyarakat Gayo, Kabupaten Aceh Tengah yang diterima oleh Ketua Dewan Perwakilan Rakyat Kabupaten (DPRK) Aceh Tengah, Ansaruddin Syarifuddin Naldin.</p><p>&ldquo;Inventarisasi KIK merupakan hal yang penting sebagai perlindungan defensif dan dalam upaya pelestarian budaya, adat istiadat dan KI Komunal,&rdquo; ujar Molan K. Tarigan, Direktur Kerja Sama dan Pemberdayaan KI saat ditemui usai acara, Senin (17/9/2018).</p><p>Hal ini penting dilakukan untuk menutup peluang negara lain yang ingin mengklaim KIK Indonesia. Karena menurut Undang-undang No 28 Tahun 2014 Pasal 38 menyatakan bahwa Hak Cipta atas EBT dipegang oleh Negara.</p><p>Selain itu, di acara yang sama Kantor Wilayah Kemenkumham Aceh menandatangani Perjanjian Kerja Sama (PKS) dengan 2 (dua) Universitas yaitu Universitas Muhammadiyah Aceh dan Universitas Islam Negeri Arraniry tentang Pelindungan dan Pemanfaatan Kekayaan Intelektual.</p><p>Kepala Kantor Wilayah Kemenkumham Aceh, Agus Toyib mengatakan bahwa melalui Universitas dapat berpartisipasi aktif dalam melindungi dan memanfaatkan KI dalam pemutakhiran data kekayaan budaya di daerah.</p><p>&ldquo;Semoga kerja sama ini dapat semakin meningkatkan pemahaman, pelindungan dan pemanfaatan KI di Universitas khususnya dan seluruh pemangku kepentingan di Provinsi Aceh pada umumnya,&rdquo; jelasnya.</p><p>Dalam kesempatan ini juga, DJKI mensosialisasikan pentingnya KI bagi tenaga pengajar dan mahasiswa di Universitas Muhammadiyah Aceh dengan narasumber, diantaranya Direktur Merek dan Indikasi Geografis, Fathlurahman; Direktur Paten, Desain Tata Letak Sirkuit Terpadu dan Rahasia Dagang, Dede Mia Yusanti, serta Direktur Kerja Sama dan Pemberdayaan KI, Molan K. Tarigan. (Humas DJKI, Sepetember 2018)</p>', NULL, '[\"831475.jpg\",\"346256.jpg\"]', '1', '0', 'publish', '2018-09-17 12:42:00', '2018-10-11 12:42:03', '2018-10-11 12:42:26', NULL),
(12, 1, 'djki-mudahkan-peneliti-dapatkan-database-paten', 'DJKI Mudahkan Peneliti Dapatkan Database Paten', '<p>Jakarta &ndash; Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) mengadakan pelatihan paten dalam rangka pengembangan program Technology and Innovation Support Centers (TISC) kepada akademisi yang mengelola Sentra Kekayaan Intelektual (KI) Universitas.</p><p>Hal ini dilakukan untuk memberikan akses database paten kepada peneliti atau masyarakat secara online melalui lembaga Litbang Perguruan Tinggi yang memiliki Sentra KI secara gratis tanpa biaya berlangganan.</p><p>Kepala Sub Direktorat Kerja Sama Dalam Negeri, Stephanie VY Kano mengatakan dengan adanya pelatihan ini diharapkan para peneliti dapat mengakses data paten yang ada, sebagai rujukan untuk rencana penelitian menghasilkan paten yang memiliki nilai ekonomi.</p><p>&ldquo;Dengan informasi dari database ini diharapkan seluruh rencana penelitian akan lebih terarah dan fokus untuk menghasilkan invensi atau inovasi yang benar-benar berpotensi paten&rdquo;, ujar Stephanie dalam sambutan acara di Hotel Aston Kuningan, Senin (17/9/2018).</p><p>Ia menambahkan, bahwa keuntungan dari program TISC ini dapat meminimalisir pengeluaran biaya penelitian sehingga hasil patennya tidak sia-sia dan dapat dikomersialisasikan.</p><p>Sebagai informasi, sejak tahun 2016 sampai saat ini, program TISC baru diikuti oleh 21 Universitas dan telah menjalin kerja sama dengan DJKI. (Humas DJKI, September 2018)</p>', NULL, '[\"970805.jpg\",\"806594.jpg\",\"120585.jpg\"]', '1', '0', 'publish', '2018-09-17 00:00:00', '2018-10-11 12:48:05', '2018-10-11 12:48:05', NULL),
(13, 3, 'penting-pelaku-ukm-dan-perguruan-tinggi-lindungi-kekayaan-intelektual', 'Penting Pelaku UKM dan Perguruan Tinggi Lindungi Kekayaan Intelektual', '<p>Kekayaan intelektual (KI) sangat penting di era modern saat ini dalam membangun perekonomian nasional. Hal tersebut yang kurang disadari sebagian besar masyarakat Indonesia.</p><p>&quot;Dalam hal pemahaman pentingnya KI, kita sangat tertinggal jauh dibandingkan dengan negara-negara lain&quot;, ujar Kepala Kantor Wilayah Kementerian Hukum dan HAM Kalimantan Timur, Agus Saryono dalam sambutan acara seminar KI di Hotel Aston Balikpapan, Senin (8 /10/2018).</p><p>Karenanya, Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia bekerja sama dengan Japan International Cooperation Agency (JICA) menggelar seminar keliling &quot;Peningkatan Pemahaman dan Pemanfaatan KI bagi Kalangan Universitas, Industri, dan Usaha Kecil Menengah (UKM)&quot; di Balikpapan.</p><p>Direktur Kerja Sama dan Pemberdayaan KI, Molan Karim Tarigan mengatakan, kekayaan intelektual yang dihasilkan universitas merupakan salah satu aset bangsa serta menjadi &nbsp;pilar utama tumbuhnya inovasi-inovasi baru dalam pengembangan teknologi.</p><p>&quot;Perguruan tinggi menyimpan banyak potensi kreator dan inovator. Karenanya hasil inovasi dan karya cipta yang dihasil perlu dilindungi secara hukum&quot;, ujar Molan saat menyampaikan paparannya di Hotel Aston Balikpapan, Selasa (9/10/2018).</p><p>Selain itu, sektor UKM dapat menjadi tulang punggung perekonomian nasional. Menurut Molan, UKM di Kalimantan Timur banyak yang belum didaftarkan kekayaan intelektual, baik itu merek, hak cipta, maupun patennya.</p><p>&quot;China sangat maju ekonominya. Salah satunya karena UKM-nya maju pesat. Maka kekayaan intelektualnya perlu dilindungi&quot;, ucap Molan.</p><p>Molan juga menghimbau kepada universitas dan perguruan tinggi di Kalimantan Timur untuk mendirikan Sentra KI. &quot;Sentra KI dapat menjadi wadah untuk fokus melindungi invensi-invensi yang dihasilkan para peneliti&quot;, ujarnya.</p><p>Dikesempatan yang sama, Kepala Divisi Pelayanan Hukum Kanwil Kemenkumham Kalimantan Timur, Santun, memberikan kiat-kiat kepada para pelaku UKM sebelum mendaftarkan permohonan KI-nya ke DJKI.</p><p>Yaitu, pertama pastikan permohonan yang kita ajukan tidak meniru karya orang lain; Kedua, cari merek yang unik dan mempunyai ciri yang khas; ketiga, mudah ingat dan dikenali konsumen; keempat, mempunyai daya pembeda; kelima, tidak terlalu rumit, dan terakhir, tidak terlalu sederhana.</p><p>Diharapkan setelah seminar ini, para pelaku Industri, UKM, serta Universitas di Kalimantan Timur, khususnya Balikpapan, dapat meningkatkan jumlah permohonan kekayaan intelektualnya ke DJKI. Adapun jumlah permohonan KI menjadi tolak ukur terhadap kesadaran masyarakat akan pentingnya pelindungan KI.</p>', NULL, '[\"585261.jpeg\",\"220506.jpeg\"]', '1', '1', 'publish', '2018-10-08 00:00:00', '2018-10-14 15:27:41', '2018-10-14 15:27:41', NULL),
(14, 4, 'roving-seminar-sosialisasi-madrid-protocol', 'Roving Seminar Sosialisasi Madrid Protocol', '<p>Medan - Direktorat Jenderal Kekayaan Intelektual (DJKI) bekerja sama dengan Kantor Wilayah Hukum dan Hak Asasi Manusia Sumatera Utara menyelenggarakan &quot;Roving Seminar Madrid Protocol&quot; yang bertujuan untuk sosialisasi langsung kepada 85 Peserta, diantaranya Sentra KI, Pelaku UMKM, Dosen Universitas, Komunitas Tangan Diatas, dan Anggota Gabungan Pengusaha Ekspor Indonesia yang berada di Provinsi Sumatera Utara.</p><p>&quot;Protocol Madrid adalah sistem yang menguntungkan untuk pemilik merek yang memiliki visi internasional. Sistem ini menyediakan prosedur pendaftaran secara efisien dan transparan, memberikan insentif bagi pemilik merek luar negeri untuk berinvestasi di Indonesia.&quot; Ujar Fathlurachman, Direktur Merek dan Indikasi Geografis Direktorat Jenderal Kekayaan Intelektual pada saat memberikan sambutan di Hotel JW Marriot, Medan (10/10/2018)</p><p>Priyadi, Kepala Kantor Wilayah Sumatera Utara juga memberikan sambutan kepada peserta seminar. Beliau mengatakan &quot;Kegiatan sosialisasi ini bertujuan untuk memberikan pemahaman akan manfaat dan keuntunngan aksesi Madrid Protocol bagi para akademis, pelaku usaha, dan para pemangku kepentingan KI. Selain itu, sosialisasi ini bertujuan untuk mensosialisasikan keanggotan Indonesia sebagai anggota Madrid Protocol, sosialisasi tata cara dan prosedur untuk mengajukan permohonan pendaftaran merek Internasional baik sebagai office of origin maupun sebagai designated country.&quot;</p>', NULL, '[\"160036.jpg\",\"645849.jpg\",\"965973.jpg\"]', '1', '1', 'publish', '2018-10-10 16:00:00', '2018-10-14 16:03:07', '2018-10-15 06:23:09', NULL),
(15, 3, 'press-release-launching-contact-center', 'Press Release - Launching Contact Center', '<p>Dalam rangka meningkatkan pelayanan informasi kepada masyarakat, Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) berikan kemudahan dalam memperoleh informasi terkait permohonan kekayaan intelektual, melalui layanan Contact Center.</p><p>Contact Center DJKI menjadi garda terdepan dalam merespon kebutuhan masyarakat mengenai permohonan kekayaan intelektual. Karenanya, Contact Center diharapkan dapat menjadi salah satu jembatan untuk membangun hubungan yang baik dengan masyarakat dengan memberikan kemudahan layanan bagi mereka.</p><p><strong>Contact Center</strong> DJKI memiliki beberapa saluran informasi, diantaranya Call Center, Live Chat, Email, dan LAPOR!. Dengan adanya beberapa saluran informasi yang tersedia tersebut, masyarakat dapat memilih media yang akan digunakan.</p><p>Seperti halnya layanan Call Center, yang sudah dipersiapkan secara matang oleh DJKI Kemenkumham dengan dukungan tenaga terlatih dan teknologi call center terkini, diharapkan layanan ini dapat menjawab segala kebutuhan masyarakat terkait permohonan kekayaan intelektual.</p><p>Masyarakat dapat mengakses layanan Call Center DJKI di nomor <strong>021-27899555</strong>. Untuk layanan Contact Center saat ini beroperasi sesuai hari kerja, Senin sampai Jumat, mulai dari jam 08.00 pagi sampai jam 16.00 sore.</p><p>Selain Call Center, layanan informasi unggulan DJKI adalah Live Chat. Di dunia yang serba cepat ini, masyarakat mengharapkan cara berkomunikasi yang cepat dan efektif. Karenanya, dengan menggunakan live chat dapat menjadi alternatif untuk berkomunikasi dengan masyarakat. Live Chat ini terdapat pada website resmi DJKI yaitu <a href=\"http://www.dgip.go.id/\">www.dgip.go.id</a>.</p><p>DJKI Kemenkumham juga melakukan peningkatan layanan publik dari segi portal website yang semakin berkualitas dalam mewujudkan DJKI The Best Ten IP Office In The World, yaitu dengan mengembangkan layanan Portal Web DJKI Berbahasa Inggris, dan pengembangan Mobile Portal DJKI berbasis android yang dapat di unduh melalui playstore dengan nama <strong>Portal DJK Ditjen Kekayaan Intelektual&nbsp;</strong>atau dapat di akses melalui <a href=\"https://play.google.com/store/apps/details?id=id.co.dgip\"></a><a href=\"https://play.google.com/store/apps/details?id=id.co.dgip\">https://play.google.com/store/apps/details?id=id.co.dgip</a>.</p><p>Selain itu, DJKI juga mengadakan sayembara logo yang telah dibuka sejak 10 September 2018 lalu, dan berakhir di tanggal 15 Oktober 2018. Sayembara logo DJKI ini berhadiah total 75 juta.</p><p>Informasi pendaftaran sayembara logo DJKI dapat diakses melalui laman <a href=\"http://sayembara-logo.dgip.go.id/\"></a><a href=\"http://sayembara-logo.dgip.go.id/\">http://sayembara-logo.dgip.go.id/</a> dan lomba ini tidak dipungut biaya, terbuka untuk Warga Negara Indonesia diatas umur 17 tahun, serta bisa perorangan maupun kelompok.</p>', NULL, '[\"508514.jpeg\",\"922767.jpeg\"]', '1', '1', 'publish', '2018-10-10 06:19:00', '2018-10-15 06:19:19', '2018-10-15 06:20:08', NULL),
(16, 3, 'kemenkumham-dan-pemerintah-provinsi-bengkulu-sepakat-tingkatkan-nilai-ekonomi-daerah-melalui-indikasi-geografis', 'Kemenkumham dan Pemerintah Provinsi Bengkulu Sepakat Tingkatkan Nilai Ekonomi Daerah Melalui Indikasi Geografis', '<p>Bengkulu - Direktur Jenderal Kekayaan Intelektual, Freddy Harris bersama Plt. Gubernur Provinsi Bengkulu, Rohidin Mersyah menandatangani Nota Kesepahaman tentang Pendayagunaan Sistem Kekayaan Intelektual yang disaksikan secara langsung oleh Menteri Hukum dan Hak Asasi Manusia (Menkumham) Yasonna H Laoly.</p><p>Yasonna H Laoly mengatakan, produk yang menjadi kekayaan asli atau khas suatu daerah, apabila dilindungi dengan cara mendaftarkan indikasi geografis (IG) ke Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) akan meningkatkan nilai jual produk tersebut.</p><p>&quot;Jika produk itu telah didaftarkan indikasi geografisnya, maka nilai ekonominya pasti bertambah&quot;, ujar Yasonna H Laoly saat memberikan sambutannya di Hotel Grage Horizon Bengkulu, Senin (15/10/2018).</p><p>Menkumham mencontohkan lada putih Muntok yang berasal dari Bangka Belitung, harga jualnya meningkat dari Rp 30.000, menjadi ratus ribu per Kilo-nya.</p><p>Ia juga mengucapkan terima kasih kepada Plt. Gubernur Provinsi Bengkulu karena telah aktif mendorong pendaftaran IG dan berharap agar potensi Indikasi geografis di Bengkulu terus didata untuk dilindungi.</p><p>&quot;Saya kira melalui momentum kerja sama &nbsp;yang baru saja berlangsung ini, kekayaan alam yang terdapat di seluruh daerah Bengkulu dapat mendaftarkan Indikasi Geografisnya&quot;, ujar Yasonna H Laoly.</p><p>Senada dengan Menkumham, Plt Gubernur Provinsi Bengkulu, Rohidin Mersyah juga mengajak seluruh Pemerintah Kota/Daerah di Bengkulu untuk mendaftarkan potensi alam serta potensi kearifan lokal dalam bentuk kreatifitas yang khas di daerahnya di daftarkan Indikasi Geografisnya, untuk meningkatkan ekonomi masyarakat.</p><p>&quot;Tolong ekonomi masyarakat Bengkulu melalui pendaftaran Indikasi Geografis ini, dan perlu kita dilindungi dengan baik&quot;, ujar Rohidin Mersyah.</p><p>Menurutnya, dengan didaftarkannya indikasi geografis, akan mampu menggerakan perekonomian daerah Bengkulu, dan menjaga produk tersebut dari pengakuan pihak lain.</p><p>Dari data yang disampaikan Kepala Kantor Wilayah Kemenkumham Bengkulu, Ilham Djaya mengatakan kantornya telah membantu mendaftarkan potensi indikasi geografis Provinsi Bengkulu secara online, yaitu kopi Sintaro, serta batik khas Bengkulu yaitu, Kain Besure dan Tenun Bumpak.</p><p>Sebagai informasi, Bengkulu juga mendaftarkan potensi IG Kopi Robusta Kepahiang yang diajukan oleh Masyarakat Pelindungan Indikasi Geografis (MPIG) Kopi Robusta Kabupaten Kepahiang.</p>', NULL, '[\"297591.jpg\",\"516855.JPG\",\"377746.JPG\"]', '1', '1', 'publish', '2018-10-15 10:40:00', '2018-10-17 01:27:35', '2018-10-17 09:53:53', NULL),
(17, 3, 'workshop-konsultan-ki', 'Workshop Konsultan KI', '<p>Jakarta - Direktorat Jenderal Kekayaan Intelektual (DJKI) Kementerian Hukum dan Hak Asasi Manusia (Kemenkumham) menggelar Workshop Konsultan Kekayaan Intelektual (KI) di Gedung Ex-Sentra Mulia, Lantai 17, &nbsp;Jumat (19/10/ 2018).</p><p>Workshop ini membahas mengenai penyempurnaan pengaturan PP No. 2 Tahun 2005 tentang konsultan KI yang sudah berumur 13 (tiga belas) tahun.</p><p>&quot;Masih banyak kekosongan hukum yang perlu untuk segera diperbaiki dan disempurnakan. Oleh karena itu perlu segera direvisi,&quot; ujar Stephanie VY Kano, Kepala Sub Direktorat Kerja Sama Dalam Negeri.</p><p>Menurut Stephanie, tugas konsultan KI tidak hanya berkaitan dengan jasa pengurusan dan pengajuan permohonan hak di bidang KI, namun juga meliputi penyebarluasan informasi tentang sistem KI.</p><p>&quot;Konsultan KI juga harus menyebarluaskan informasi KI secara menyeluruh kepada masyarakat, sehingga dapat membantu terciptanya sistem KI yang baik guna menunjang tujuan Pembangunan nasional, &quot; ucap Stephanie dihadapan 100 konsultan KI.</p><p>&nbsp;Stephanie menuturkan, ada 5 hal baru yang perlu diatur diantaranya, 1. Uji Kompetensi dan Sertifikasi Konsultan KI; 2. Pembentukan Majelis Pengawas Konsultan KI; 3. Pemberhentian sementara dan / atau cuti Konsultan KI; 4. Pembatasan usia pensiun bagi Konsultan KI; 5. Revitalisasi Asosiasi Profesi Konsultan KI</p>', NULL, '[\"634370.jpg\",\"433691.jpg\"]', '1', '1', 'publish', '2018-10-19 17:50:00', '2018-10-22 06:50:46', '2018-10-22 07:39:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts_category`
--

CREATE TABLE `posts_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_category`
--

INSERT INTO `posts_category` (`id`, `name`, `slug`) VALUES
(1, 'Liputan Humas', 'liputan-humas');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `meta_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` date NOT NULL,
  `key_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`meta_title`, `meta_description`, `meta_keyword`, `timezone`, `email`, `phone`, `address`, `maintenance`, `logo`, `favicon`, `og_image`, `facebook`, `twitter`, `google`, `linkedin`, `youtube`, `instagram`, `expired_at`, `key_token`) VALUES
('Your Website', 'Explain about this website', '', 'Asia/Makassar', '', '', '', '1', '', '', '', '', '', '', '', '', '', '2019-10-09', '85b60f29abdf51572d48aa4afa18bf034fe745a2');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setup` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `path`, `setup`, `status`) VALUES
(1, 'webdesa', '', 'false'),
(2, 'djki', '{\"widget\":{\"text\":{\"widget_chat\":\"#\"},\"repeater\":{\"direktur\":{\"1\":{\"text\":\"<h3>Direktur Jenderal Kekayaan Intelektual<\\/h3>\",\"link\":\"#\",\"image\":\"416138.jpg\"}}}}}', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Super Admin','Admin','Customer Service','Writer','Guest') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `status`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super_admin', 'Super Admin', 'superadmin@mail.com', 'Super Admin', '558673.png', '$2y$10$WGJ48WQpx26Ber3AFuYEUuzYosQThqnwg64qY1qeH4mx.AeqP65OK', 'H39v2cAKKgtd4jnSeOx8ZoPk6sxraDj79x95WLjedfZQpEtfOhfnusuyRwgR', '2018-10-09 19:00:43', '2018-10-25 05:11:30', NULL),
(2, 'admin', 'Admin', 'admin@mail.com', 'Admin', '371248.png', '$2y$10$p6OOAeY7QTK9uYbbkBtUd.uTM3.7J7fcbKAcWlLkrzvTm0Zce09HC', NULL, '2018-10-09 19:00:43', '2018-10-25 05:11:52', NULL),
(3, 'writera', 'Writer A', 'writera@mail.com', 'Writer', '512655.png', '$2y$10$a6htt9/1t0DoEZB.UzhupOHsK0A6zsk4zm5t4s9WFYACGx5.tG23q', '2YTW8TgCrZ6bjkuxzJ9VvatFt4t8VhvVrPOnqCSrM7WkjMNjoisj0wgMHsp8', '2018-10-13 05:47:32', '2018-10-25 05:11:57', NULL),
(4, 'writerb', 'Writer B', 'writerb@mail.com', 'Writer', '460468.png', '$2y$10$GMnWIlHLMeirYgj2Ex/WPuSoVfY4Q0S1B.lLBFPHeMnFBTbkIkA0u', 'n2JXnEb5mUFvY7LO9rn0pEg537ZIT3yKZuDSpgg3omtDpbHKhLRBS3eeB66G', '2018-10-13 05:47:56', '2018-10-25 05:12:04', NULL),
(5, 'writerc', 'Writer C', 'writerc@mail.com', 'Writer', '370331.png', '$2y$10$AXYWPl8SMqg0Ztd4BDgfnOKe5qFoMueDQ2sFb1WaHry3Tsq8Alve.', NULL, '2018-10-13 05:48:17', '2018-10-25 05:12:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip_address`, `url`, `browser`, `device`, `country`, `region`, `city`, `hits`, `date`, `created_at`, `updated_at`) VALUES
(1, '114.125.200.212', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 02:03:20', '2018-10-10 02:03:20'),
(2, '114.125.216.200', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 02:03:21', '2018-10-10 02:03:21'),
(3, '114.125.200.192', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 02:48:23', '2018-10-10 02:48:23'),
(4, '114.125.200.192', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 02:48:25', '2018-10-10 02:48:25'),
(5, '201.150.149.105', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Para', 'Nova Timboteua', 1, '2018-10-10', '2018-10-10 03:24:36', '2018-10-10 03:24:36'),
(6, '188.26.2.202', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Romania', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-10', '2018-10-10 04:14:41', '2018-10-10 04:14:41'),
(7, '152.250.74.186', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São José dos Campos', 1, '2018-10-10', '2018-10-10 04:47:21', '2018-10-10 04:47:21'),
(8, '92.112.21.102', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Luhans\'ka Oblast\'', 'Luhansk', 1, '2018-10-10', '2018-10-10 05:25:38', '2018-10-10 05:25:38'),
(9, '88.148.41.49', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Castille and León', 'Campohermoso', 1, '2018-10-10', '2018-10-10 06:09:03', '2018-10-10 06:09:03'),
(10, '140.213.3.63', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 08:04:46', '2018-10-10 08:04:46'),
(11, '185.52.117.38', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iraq', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-10', '2018-10-10 08:50:53', '2018-10-10 08:50:53'),
(12, '123.186.223.161', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'China', 'Liaoning', 'Shenyang', 1, '2018-10-10', '2018-10-10 09:29:28', '2018-10-10 09:29:28'),
(13, '123.186.223.161', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'China', 'Liaoning', 'Shenyang', 1, '2018-10-10', '2018-10-10 09:29:29', '2018-10-10 09:29:29'),
(14, '114.124.146.143', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 09:40:30', '2018-10-10 09:40:30'),
(15, '36.75.143.184', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 23, '2018-10-10', '2018-10-10 10:06:18', '2018-10-10 10:53:26'),
(16, '114.124.173.92', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-10', '2018-10-10 10:21:04', '2018-10-10 10:22:43'),
(17, '213.93.232.91', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Netherlands', 'North Brabant', 'Veldhoven', 1, '2018-10-10', '2018-10-10 10:41:59', '2018-10-10 10:41:59'),
(18, '36.75.143.184', '128.199.250.96/api/v1/posts?category=1&page=1', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 5, '2018-10-10', '2018-10-10 10:44:14', '2018-10-10 11:37:23'),
(19, '36.75.143.184', '128.199.250.96/api/v1/posts?', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-10', '2018-10-10 10:47:24', '2018-10-10 11:30:39'),
(20, '36.75.143.184', '128.199.250.96/api/v1/posts', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-10', '2018-10-10 10:47:30', '2018-10-10 11:30:26'),
(21, '36.75.143.184', '128.199.250.96/api/v1/menus', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 11:25:13', '2018-10-10 11:25:13'),
(22, '36.75.143.184', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 11:26:18', '2018-10-10 11:26:18'),
(23, '36.75.143.184', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 11:26:19', '2018-10-10 11:26:19'),
(24, '36.75.143.184', '128.199.250.96/api/v1/menus?', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 11:30:08', '2018-10-10 11:30:08'),
(25, '36.75.143.184', '128.199.250.96/api/v1/posts/detail/1', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 11:30:32', '2018-10-10 11:30:32'),
(26, '112.215.175.154', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sumatra', 'Palembang', 3, '2018-10-10', '2018-10-10 12:11:16', '2018-10-10 13:50:07'),
(27, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-10', '2018-10-10 12:36:07', '2018-10-10 12:38:02'),
(28, '36.79.133.140', '128.199.250.96/api/v1/menus', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 12:37:47', '2018-10-10 12:37:47'),
(29, '71.6.232.4', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'California', 'San Diego', 1, '2018-10-10', '2018-10-10 13:00:16', '2018-10-10 13:00:16'),
(30, '191.19.109.92', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Mirassol', 1, '2018-10-10', '2018-10-10 14:00:54', '2018-10-10 14:00:54'),
(31, '89.186.91.188', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Italy', 'Lombardy', 'Sondrio', 1, '2018-10-10', '2018-10-10 14:16:30', '2018-10-10 14:16:30'),
(32, '178.94.1.22', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ukraine', 'Kharkivs\'ka Oblast\'', 'Kharkiv', 1, '2018-10-10', '2018-10-10 14:34:20', '2018-10-10 14:34:20'),
(33, '180.214.233.76', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 12, '2018-10-10', '2018-10-10 15:22:10', '2018-10-10 18:42:37'),
(34, '36.91.36.147', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-10', '2018-10-10 16:43:53', '2018-10-10 16:43:53'),
(35, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 22, '2018-10-10', '2018-10-10 17:35:37', '2018-10-10 21:17:55'),
(36, '2.179.122.219', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-10', '2018-10-10 19:13:11', '2018-10-10 19:13:11'),
(37, '112.215.175.53', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-10', '2018-10-10 19:29:00', '2018-10-10 19:29:00'),
(38, '78.187.213.92', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Ordu', 'Ordu', 1, '2018-10-10', '2018-10-10 19:32:34', '2018-10-10 19:32:34'),
(39, '103.85.149.250', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 19:54:53', '2018-10-10 19:54:53'),
(40, '114.125.245.185', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sumatra', 'Palembang', 1, '2018-10-10', '2018-10-10 20:12:14', '2018-10-10 20:12:14'),
(41, '112.215.175.97', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-10', '2018-10-10 20:26:42', '2018-10-10 20:26:42'),
(42, '36.79.133.140', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-10', '2018-10-10 20:41:57', '2018-10-10 21:46:47'),
(43, '36.79.133.140', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-10', '2018-10-10 20:41:58', '2018-10-10 21:46:48'),
(44, '36.79.133.140', '128.199.250.96/dtcms/album/list', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 20:43:58', '2018-10-10 20:43:58'),
(45, '36.79.133.140', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-10', '2018-10-10 20:49:06', '2018-10-10 20:49:08'),
(46, '36.79.133.140', '128.199.250.96/api/v1/menus', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-10', '2018-10-10 20:50:34', '2018-10-10 20:50:34'),
(47, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-10', '2018-10-10 20:51:51', '2018-10-10 21:18:00'),
(48, '186.226.219.113', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Santa Catarina', 'Balneário Camboriú', 1, '2018-10-10', '2018-10-10 21:26:58', '2018-10-10 21:26:58'),
(49, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-10', '2018-10-10 21:41:58', '2018-10-10 21:41:58'),
(50, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-10', '2018-10-10 21:41:59', '2018-10-10 21:41:59'),
(51, '180.214.233.93', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-10', '2018-10-10 22:09:10', '2018-10-10 22:09:13'),
(52, '62.76.74.84', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Russia', 'Moscow', 'Moscow', 1, '2018-10-10', '2018-10-10 22:17:31', '2018-10-10 22:17:31'),
(53, '182.0.198.30', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 23:36:38', '2018-10-10 23:36:38'),
(54, '182.0.199.31', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 23:36:44', '2018-10-10 23:36:44'),
(55, '182.0.196.160', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 23:36:54', '2018-10-10 23:36:54'),
(56, '182.0.196.160', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-10', '2018-10-10 23:37:25', '2018-10-10 23:37:25'),
(57, '201.93.18.234', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-10', '2018-10-10 23:52:20', '2018-10-10 23:52:20'),
(58, '103.84.228.23', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'West Java', 'Bandung', 1, '2018-10-11', '2018-10-11 00:41:47', '2018-10-11 00:41:47'),
(59, '123.186.223.161', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'China', 'Liaoning', 'Shenyang', 1, '2018-10-11', '2018-10-11 00:47:12', '2018-10-11 00:47:12'),
(60, '123.186.223.161', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'China', 'Liaoning', 'Shenyang', 1, '2018-10-11', '2018-10-11 00:47:14', '2018-10-11 00:47:14'),
(61, '120.79.81.74', '128.199.250.96/index.php', 'Any browser', 'Dekstop', 'China', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 02:10:45', '2018-10-11 02:10:45'),
(62, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 39, '2018-10-11', '2018-10-11 02:31:05', '2018-10-11 19:51:04'),
(63, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 6, '2018-10-11', '2018-10-11 02:31:10', '2018-10-11 19:28:31'),
(64, '43.229.93.50', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 04:56:29', '2018-10-11 04:56:29'),
(65, '112.215.175.14', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 2, '2018-10-11', '2018-10-11 09:07:55', '2018-10-11 12:04:08'),
(66, '112.215.175.14', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-11', '2018-10-11 09:08:13', '2018-10-11 09:08:13'),
(67, '51.38.12.21', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 09:34:20', '2018-10-11 09:34:20'),
(68, '51.38.12.21', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 09:34:21', '2018-10-11 09:34:21'),
(69, '35.173.235.97', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-11', '2018-10-11 09:40:31', '2018-10-11 09:40:31'),
(70, '36.79.133.140', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 6, '2018-10-11', '2018-10-11 09:41:11', '2018-10-11 20:01:30'),
(71, '36.79.133.140', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 6, '2018-10-11', '2018-10-11 09:41:12', '2018-10-11 20:01:31'),
(72, '120.188.6.191', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 10:42:36', '2018-10-11 10:42:36'),
(73, '220.247.173.202', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 10:42:46', '2018-10-11 10:42:46'),
(74, '140.213.41.138', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 11:50:15', '2018-10-11 11:50:15'),
(75, '140.213.41.138', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 11:50:21', '2018-10-11 11:50:21'),
(76, '198.108.66.176', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 11:50:21', '2018-10-11 11:50:21'),
(77, '198.108.66.176', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 11:50:22', '2018-10-11 11:50:22'),
(78, '103.94.0.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-11', '2018-10-11 12:08:33', '2018-10-11 12:09:41'),
(79, '190.122.40.49', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Cordoba', 'Rio Tercero', 1, '2018-10-11', '2018-10-11 12:27:52', '2018-10-11 12:27:52'),
(80, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/3', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-11', '2018-10-11 12:34:44', '2018-10-11 15:41:09'),
(81, '18.223.82.211', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'Ohio', 'Columbus', 1, '2018-10-11', '2018-10-11 12:51:10', '2018-10-11 12:51:10'),
(82, '151.234.17.237', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 13:36:31', '2018-10-11 13:36:31'),
(83, '120.188.4.67', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 14:21:14', '2018-10-11 14:21:14'),
(84, '203.142.78.33', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-11', '2018-10-11 14:33:58', '2018-10-11 14:34:02'),
(85, '191.19.95.194', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-11', '2018-10-11 15:38:16', '2018-10-11 15:38:16'),
(86, '52.66.208.93', '128.199.250.96/', 'Any browser', 'Dekstop', 'India', 'Maharashtra', 'Mumbai', 1, '2018-10-11', '2018-10-11 15:50:41', '2018-10-11 15:50:41'),
(87, '52.66.208.93', '128.199.250.96/503', 'Any browser', 'Dekstop', 'India', 'Maharashtra', 'Mumbai', 1, '2018-10-11', '2018-10-11 15:50:41', '2018-10-11 15:50:41'),
(88, '123.186.223.118', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'China', 'Liaoning', 'Shenyang', 1, '2018-10-11', '2018-10-11 15:51:15', '2018-10-11 15:51:15'),
(89, '177.105.232.171', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Joao Pinheiro', 1, '2018-10-11', '2018-10-11 16:06:46', '2018-10-11 16:06:46'),
(90, '80.82.77.33', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Seychelles', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 16:07:10', '2018-10-11 16:07:10'),
(91, '80.82.77.33', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Seychelles', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 16:07:11', '2018-10-11 16:07:11'),
(92, '139.162.106.181', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-11', '2018-10-11 16:44:05', '2018-10-11 16:44:05'),
(93, '36.79.133.140', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 21, '2018-10-11', '2018-10-11 17:17:54', '2018-10-11 19:47:51'),
(94, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-11', '2018-10-11 17:20:01', '2018-10-11 19:29:52'),
(95, '36.79.133.140', '128.199.250.96/dtcms/album/list', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 5, '2018-10-11', '2018-10-11 17:25:59', '2018-10-11 19:28:42'),
(96, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-11', '2018-10-11 17:32:15', '2018-10-11 19:30:01'),
(97, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/6', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-11', '2018-10-11 17:36:14', '2018-10-11 17:36:28'),
(98, '182.253.163.35', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 17:42:09', '2018-10-11 17:42:09'),
(99, '182.253.163.35', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 17:42:10', '2018-10-11 17:42:10'),
(100, '36.79.133.140', '128.199.250.96/api/v1/menus', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-11', '2018-10-11 18:01:37', '2018-10-11 18:06:54'),
(101, '182.253.163.39', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-11', '2018-10-11 18:03:51', '2018-10-11 18:04:00'),
(102, '179.125.110.129', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Parana', 'Palmeira', 1, '2018-10-11', '2018-10-11 19:28:19', '2018-10-11 19:28:19'),
(103, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/9', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-11', '2018-10-11 19:31:21', '2018-10-11 19:36:57'),
(104, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/10', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-11', '2018-10-11 19:35:34', '2018-10-11 19:35:34'),
(105, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/11', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-11', '2018-10-11 19:42:49', '2018-10-11 19:42:49'),
(106, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-11', '2018-10-11 19:48:28', '2018-10-11 19:48:28'),
(107, '64.126.140.162', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'United States', 'Idaho', 'Moscow', 1, '2018-10-11', '2018-10-11 20:01:45', '2018-10-11 20:01:45'),
(108, '179.98.156.101', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Carapicuiba', 1, '2018-10-11', '2018-10-11 20:19:04', '2018-10-11 20:19:04'),
(109, '112.215.175.252', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sumatra', 'Palembang', 2, '2018-10-11', '2018-10-11 20:20:17', '2018-10-11 21:17:00'),
(110, '182.253.163.41', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-11', '2018-10-11 20:28:55', '2018-10-11 20:35:59'),
(111, '182.253.163.41', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 20:29:47', '2018-10-11 20:29:47'),
(112, '182.253.163.41', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-11', '2018-10-11 20:30:17', '2018-10-11 20:30:26'),
(113, '182.253.163.41', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 20:30:36', '2018-10-11 20:30:36'),
(114, '182.253.163.41', '128.199.250.96/api/v1/posts/detail/6', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-11', '2018-10-11 20:30:50', '2018-10-11 20:30:50'),
(115, '197.159.116.118', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Tanzania', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-11', '2018-10-11 20:58:10', '2018-10-11 20:58:10'),
(116, '36.83.188.181', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'West Nusa Tenggara', 'Mataram', 2, '2018-10-11', '2018-10-11 21:07:25', '2018-10-11 21:20:21'),
(117, '93.124.12.153', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Penzenskaya Oblast\'', 'Kuznetsk', 1, '2018-10-11', '2018-10-11 21:07:30', '2018-10-11 21:07:30'),
(118, '112.215.175.252', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'South Sumatra', 'Palembang', 1, '2018-10-11', '2018-10-11 21:17:05', '2018-10-11 21:17:05'),
(119, '182.1.98.212', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 1, '2018-10-11', '2018-10-11 22:13:56', '2018-10-11 22:13:56'),
(120, '36.75.48.156', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Central Kalimantan', 'Sampit', 1, '2018-10-11', '2018-10-11 23:16:17', '2018-10-11 23:16:17'),
(121, '62.24.109.95', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Kenya', 'Nairobi Province', 'Nairobi', 1, '2018-10-12', '2018-10-12 00:26:52', '2018-10-12 00:26:52'),
(122, '189.47.181.222', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Amparo', 1, '2018-10-12', '2018-10-12 02:49:12', '2018-10-12 02:49:12'),
(123, '188.190.174.76', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ukraine', 'Khmel\'nyts\'ka Oblast\'', 'Khmelnytskyi', 1, '2018-10-12', '2018-10-12 02:52:42', '2018-10-12 02:52:42'),
(124, '112.215.175.94', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 2, '2018-10-12', '2018-10-12 05:54:04', '2018-10-12 05:54:17'),
(125, '112.215.175.94', '128.199.250.96/api/v1/posts/detail/7', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-12', '2018-10-12 05:54:08', '2018-10-12 05:54:08'),
(126, '181.211.10.138', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ecuador', 'Provincia de Pichincha', 'Quito', 1, '2018-10-12', '2018-10-12 08:55:07', '2018-10-12 08:55:07'),
(127, '103.94.0.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-12', '2018-10-12 09:25:28', '2018-10-12 09:25:48'),
(128, '120.188.4.250', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-12', '2018-10-12 09:42:45', '2018-10-12 09:42:45'),
(129, '120.188.4.250', '128.199.250.96/api/v1/posts/detail/10', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-12', '2018-10-12 09:42:53', '2018-10-12 09:42:53'),
(130, '212.225.229.138', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Andalusia', 'Estepa', 1, '2018-10-12', '2018-10-12 10:06:00', '2018-10-12 10:06:00'),
(131, '186.237.223.58', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Goias', 'Silvania', 1, '2018-10-12', '2018-10-12 10:35:20', '2018-10-12 10:35:20'),
(132, '203.142.78.32', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-12', '2018-10-12 10:49:17', '2018-10-12 10:49:17'),
(133, '203.142.78.32', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-12', '2018-10-12 10:49:32', '2018-10-12 10:49:32'),
(134, '185.212.67.9', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Poland', 'Greater Poland', 'Lipka', 1, '2018-10-12', '2018-10-12 11:14:56', '2018-10-12 11:14:56'),
(135, '179.99.133.39', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'Araraquara', 1, '2018-10-12', '2018-10-12 11:17:09', '2018-10-12 11:17:09'),
(136, '179.99.133.39', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Araraquara', 1, '2018-10-12', '2018-10-12 11:17:09', '2018-10-12 11:17:09'),
(137, '131.196.56.2', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Vespasiano', 1, '2018-10-12', '2018-10-12 11:58:34', '2018-10-12 11:58:34'),
(138, '139.162.106.181', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-12', '2018-10-12 12:54:50', '2018-10-12 12:54:50'),
(139, '140.213.51.254', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-12', '2018-10-12 13:01:25', '2018-10-12 13:01:25'),
(140, '185.99.215.53', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-12', '2018-10-12 13:20:28', '2018-10-12 13:20:28'),
(141, '177.45.94.166', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Taboao da Serra', 1, '2018-10-12', '2018-10-12 15:03:40', '2018-10-12 15:03:40'),
(142, '114.4.59.179', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-12', '2018-10-12 15:58:15', '2018-10-12 16:05:45'),
(143, '114.4.59.179', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-12', '2018-10-12 16:04:08', '2018-10-12 16:05:47'),
(144, '212.91.249.93', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Germany', 'Land Berlin', 'Berlin', 1, '2018-10-12', '2018-10-12 16:31:35', '2018-10-12 16:31:35'),
(145, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-12', '2018-10-12 17:45:06', '2018-10-12 17:45:06'),
(146, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-12', '2018-10-12 17:45:14', '2018-10-12 17:45:14'),
(147, '78.174.169.85', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Ankara', 'Ankara', 1, '2018-10-12', '2018-10-12 18:28:54', '2018-10-12 18:28:54'),
(148, '168.195.85.250', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Rio Grande do Sul', 'Makassar', 1, '2018-10-12', '2018-10-12 19:39:01', '2018-10-12 19:39:01'),
(149, '88.234.138.156', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Istanbul', 'Istanbul', 1, '2018-10-12', '2018-10-12 20:13:58', '2018-10-12 20:13:58'),
(150, '103.62.136.201', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'National Capital Territory of ', 'Delhi', 1, '2018-10-12', '2018-10-12 20:30:41', '2018-10-12 20:30:41'),
(151, '177.200.204.244', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Santa Catarina', 'Itajaí', 1, '2018-10-12', '2018-10-12 21:22:20', '2018-10-12 21:22:20'),
(152, '36.69.103.127', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-13', '2018-10-13 00:29:35', '2018-10-13 19:53:13'),
(153, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 00:29:43', '2018-10-13 00:29:43'),
(154, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 00:29:50', '2018-10-13 00:30:31'),
(155, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/6', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-13', '2018-10-13 00:30:37', '2018-10-13 00:31:03'),
(156, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 00:31:17', '2018-10-13 00:31:17'),
(157, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 00:31:22', '2018-10-13 00:31:51'),
(158, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/11', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 00:31:36', '2018-10-13 00:31:55'),
(159, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/10', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 00:32:00', '2018-10-13 00:32:00'),
(160, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/9', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 00:32:07', '2018-10-13 00:32:19'),
(161, '36.69.103.127', '128.199.250.96/api/v1/posts/detail/8', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 00:32:26', '2018-10-13 00:32:26'),
(162, '88.235.228.254', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Istanbul', 'Istanbul', 1, '2018-10-13', '2018-10-13 00:43:03', '2018-10-13 00:43:03'),
(163, '36.69.103.127', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 02:13:57', '2018-10-13 02:13:57'),
(164, '36.69.103.127', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 02:13:58', '2018-10-13 02:13:58'),
(165, '217.13.228.176', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Sweden', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-13', '2018-10-13 04:59:09', '2018-10-13 04:59:09'),
(166, '161.22.4.59', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Buenos Aires', 'Del Viso', 2, '2018-10-13', '2018-10-13 05:56:29', '2018-10-13 05:56:29'),
(167, '186.208.27.211', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rio Grande do Sul', 'Camaqua', 1, '2018-10-13', '2018-10-13 06:20:52', '2018-10-13 06:20:52'),
(168, '45.6.193.87', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Makassar', 1, '2018-10-13', '2018-10-13 06:40:26', '2018-10-13 06:40:26'),
(169, '218.211.168.178', '128.199.250.96/', 'Any browser', 'Dekstop', 'Taiwan', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-13', '2018-10-13 06:44:16', '2018-10-13 06:44:16'),
(170, '218.211.168.178', '128.199.250.96/503', 'Any browser', 'Dekstop', 'Taiwan', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-13', '2018-10-13 06:44:16', '2018-10-13 06:44:16'),
(171, '120.188.5.139', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 08:04:27', '2018-10-13 08:04:27'),
(172, '177.144.144.3', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Varzea Paulista', 1, '2018-10-13', '2018-10-13 09:43:17', '2018-10-13 09:43:17'),
(173, '140.213.41.242', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-13', '2018-10-13 09:48:12', '2018-10-13 09:50:54'),
(174, '140.213.41.242', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 09:48:39', '2018-10-13 09:49:36'),
(175, '140.213.41.242', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-13', '2018-10-13 09:49:03', '2018-10-13 09:49:15'),
(176, '140.213.41.242', '128.199.250.96/api/v1/posts/detail/8', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 09:50:03', '2018-10-13 09:50:03'),
(177, '140.213.41.242', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-13', '2018-10-13 09:50:16', '2018-10-13 09:50:16'),
(178, '114.125.199.45', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-13', '2018-10-13 12:46:00', '2018-10-13 12:48:32'),
(179, '114.125.199.45', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-13', '2018-10-13 12:46:01', '2018-10-13 12:48:33'),
(180, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-13', '2018-10-13 15:22:28', '2018-10-13 15:22:31'),
(181, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-13', '2018-10-13 15:23:19', '2018-10-13 15:23:19'),
(182, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-13', '2018-10-13 15:24:30', '2018-10-13 15:24:30'),
(183, '36.83.82.9', '128.199.250.96/api/v1/pages/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-13', '2018-10-13 17:49:59', '2018-10-13 17:52:57'),
(184, '36.79.133.140', '128.199.250.96/api/v1/pages/16', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-13', '2018-10-13 17:54:23', '2018-10-13 17:54:23'),
(185, '89.163.249.5', '128.199.250.96/', 'Mozilla Firefox', 'Dekstop', 'Germany', 'North Rhine-Westphalia', 'Bochum', 1, '2018-10-13', '2018-10-13 20:01:46', '2018-10-13 20:01:46'),
(186, '89.163.249.5', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'Germany', 'North Rhine-Westphalia', 'Bochum', 1, '2018-10-13', '2018-10-13 20:01:50', '2018-10-13 20:01:50'),
(187, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-13', '2018-10-13 22:10:08', '2018-10-13 22:10:08'),
(188, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-13', '2018-10-13 22:10:11', '2018-10-13 22:10:11'),
(189, '212.233.149.4', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Bulgaria', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-13', '2018-10-13 22:19:05', '2018-10-13 22:19:05'),
(190, '187.110.209.120', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Alfenas', 1, '2018-10-13', '2018-10-13 22:35:30', '2018-10-13 22:35:30'),
(191, '114.142.169.37', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-14', '2018-10-14 00:10:36', '2018-10-14 00:10:36'),
(192, '180.150.242.163', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Gujarat', 'Rajkot', 1, '2018-10-14', '2018-10-14 04:39:15', '2018-10-14 04:39:15'),
(193, '103.78.182.195', '128.199.250.96:80/', 'Safari', 'Dekstop', 'India', 'Rajasthan', 'Udaipur', 1, '2018-10-14', '2018-10-14 04:50:29', '2018-10-14 04:50:29'),
(194, '189.110.165.247', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-14', '2018-10-14 06:18:25', '2018-10-14 06:18:25'),
(195, '134.119.219.226', '128.199.250.96/', 'Mozilla Firefox', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 8, '2018-10-14', '2018-10-14 06:33:09', '2018-10-14 07:51:06'),
(196, '134.119.219.226', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 8, '2018-10-14', '2018-10-14 06:33:10', '2018-10-14 07:51:07'),
(197, '110.137.143.170', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Bengkulu', 'Bengkulu', 1, '2018-10-14', '2018-10-14 06:38:15', '2018-10-14 06:38:15'),
(198, '154.73.4.46', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'South Africa', 'KwaZulu-Natal', 'KwaNdlovu', 1, '2018-10-14', '2018-10-14 08:11:29', '2018-10-14 08:11:29'),
(199, '149.34.42.169', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Andalusia', 'Rota', 1, '2018-10-14', '2018-10-14 08:40:25', '2018-10-14 08:40:25'),
(200, '114.124.228.94', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-14', '2018-10-14 08:50:20', '2018-10-14 08:50:20'),
(201, '93.174.93.67', '128.199.250.96/', 'Any browser', 'Dekstop', 'Seychelles', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-14', '2018-10-14 09:08:11', '2018-10-14 09:08:11'),
(202, '139.193.24.99', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-14', '2018-10-14 09:59:26', '2018-10-14 21:32:32'),
(203, '201.69.98.22', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Santo Antonio do Pinhal', 1, '2018-10-14', '2018-10-14 12:06:33', '2018-10-14 12:06:33'),
(204, '200.69.141.202', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-14', '2018-10-14 15:13:44', '2018-10-14 15:13:44'),
(205, '82.164.7.220', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Norway', 'Oslo County', 'Oslo', 1, '2018-10-14', '2018-10-14 15:38:35', '2018-10-14 15:38:35'),
(206, '80.245.160.250', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Greece', 'Attica', 'Athens', 1, '2018-10-14', '2018-10-14 15:48:18', '2018-10-14 15:48:18'),
(207, '172.104.108.109', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-14', '2018-10-14 16:09:20', '2018-10-14 16:09:20'),
(208, '141.105.103.241', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Balearic Islands', 'Sineu', 1, '2018-10-14', '2018-10-14 17:01:55', '2018-10-14 17:01:55'),
(209, '88.249.47.37', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Antalya', 'Antalya', 1, '2018-10-14', '2018-10-14 17:04:31', '2018-10-14 17:04:31'),
(210, '139.162.106.181', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-14', '2018-10-14 17:12:23', '2018-10-14 17:12:23'),
(211, '85.113.48.148', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Russia', 'Samara Oblast', 'Samara', 1, '2018-10-14', '2018-10-14 18:27:24', '2018-10-14 18:27:24'),
(212, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-14', '2018-10-14 20:13:34', '2018-10-14 23:58:30'),
(213, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-14', '2018-10-14 20:13:39', '2018-10-14 20:14:16'),
(214, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/7', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-14', '2018-10-14 20:14:23', '2018-10-14 20:14:23'),
(215, '139.193.24.99', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-14', '2018-10-14 21:32:37', '2018-10-14 21:32:37'),
(216, '125.161.212.208', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-14', '2018-10-14 22:10:59', '2018-10-14 22:37:41'),
(217, '125.161.212.208', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-14', '2018-10-14 22:10:59', '2018-10-14 22:37:42'),
(218, '125.161.212.208', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-14', '2018-10-14 22:20:14', '2018-10-14 22:35:34'),
(219, '125.161.212.208', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 6, '2018-10-14', '2018-10-14 22:25:02', '2018-10-14 23:48:16'),
(220, '125.161.212.208', '128.199.250.96/api/v1/posts/detail/13', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-14', '2018-10-14 22:28:02', '2018-10-14 22:35:18'),
(221, '202.67.37.21', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-14', '2018-10-14 23:01:14', '2018-10-14 23:03:49'),
(222, '202.67.37.21', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-14', '2018-10-14 23:01:14', '2018-10-14 23:03:50'),
(223, '92.247.36.82', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Bulgaria', 'Sofia-Capital', 'Sofia', 1, '2018-10-14', '2018-10-14 23:20:06', '2018-10-14 23:20:06'),
(224, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-14', '2018-10-14 23:57:04', '2018-10-14 23:57:04'),
(225, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/13', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-14', '2018-10-14 23:58:34', '2018-10-14 23:58:34'),
(226, '125.161.212.208', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-15', '2018-10-15 00:30:07', '2018-10-15 23:21:57'),
(227, '180.214.232.90', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 00:34:27', '2018-10-15 00:34:27'),
(228, '46.239.161.136', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Poland', 'Kujawsko-Pomorskie', 'Bydgoszcz', 1, '2018-10-15', '2018-10-15 00:43:33', '2018-10-15 00:43:33'),
(229, '2.177.194.39', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 01:12:42', '2018-10-15 01:12:42'),
(230, '185.114.246.153', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Autonomous Republic of Crimea', 'Sudak', 1, '2018-10-15', '2018-10-15 01:19:04', '2018-10-15 01:19:04'),
(231, '46.158.115.177', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Krasnodarskiy Kray', 'Khadyzhensk', 1, '2018-10-15', '2018-10-15 02:52:31', '2018-10-15 02:52:31'),
(232, '203.76.113.146', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Bangladesh', 'Dhaka Division', 'Dhaka', 1, '2018-10-15', '2018-10-15 03:32:03', '2018-10-15 03:32:03'),
(233, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 4, '2018-10-15', '2018-10-15 05:28:30', '2018-10-15 20:11:30'),
(234, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-15', '2018-10-15 05:28:35', '2018-10-15 20:11:42'),
(235, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/13', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-15', '2018-10-15 05:29:06', '2018-10-15 05:29:06'),
(236, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/5', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-15', '2018-10-15 05:29:14', '2018-10-15 05:29:14'),
(237, '109.233.196.232', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Republic of Moldova', 'Strășeni', 'Straseni', 1, '2018-10-15', '2018-10-15 09:05:47', '2018-10-15 09:05:47'),
(238, '138.204.135.169', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Goias', 'Porangatu', 1, '2018-10-15', '2018-10-15 09:10:35', '2018-10-15 09:10:35'),
(239, '177.52.24.75', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Santa Adelia', 1, '2018-10-15', '2018-10-15 09:22:19', '2018-10-15 09:22:19'),
(240, '189.18.185.207', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'Santo André', 1, '2018-10-15', '2018-10-15 10:03:55', '2018-10-15 10:03:55'),
(241, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-15', '2018-10-15 10:39:54', '2018-10-15 10:39:54'),
(242, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-15', '2018-10-15 10:39:56', '2018-10-15 10:39:56'),
(243, '187.18.90.94', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Parana', 'Londrina', 1, '2018-10-15', '2018-10-15 11:30:59', '2018-10-15 11:30:59'),
(244, '113.13.14.14', 'ip138.com/', 'Any browser', 'Dekstop', 'China', 'Guangxi', 'Makassar', 1, '2018-10-15', '2018-10-15 11:36:44', '2018-10-15 11:36:44'),
(245, '107.170.219.152', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'New York', 'New York', 1, '2018-10-15', '2018-10-15 11:45:35', '2018-10-15 11:45:35'),
(246, '42.189.222.37', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Malaysia', 'Penang', 'Kampung Batu Uban', 1, '2018-10-15', '2018-10-15 11:56:47', '2018-10-15 11:56:47'),
(247, '151.234.183.39', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 12:11:20', '2018-10-15 12:11:20'),
(248, '223.255.225.73', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-15', '2018-10-15 12:57:35', '2018-10-15 13:23:40'),
(249, '223.255.225.73', '128.199.250.96/api/v1/posts/detail/13', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 12:57:45', '2018-10-15 12:57:45'),
(250, '223.255.225.73', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-15', '2018-10-15 12:57:54', '2018-10-15 13:21:37'),
(251, '176.212.28.73', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Irkutsk Oblast', 'Irkutsk', 1, '2018-10-15', '2018-10-15 13:06:54', '2018-10-15 13:06:54'),
(252, '103.94.0.147', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 10, '2018-10-15', '2018-10-15 13:10:57', '2018-10-15 14:02:32'),
(253, '103.94.0.148', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 13:25:54', '2018-10-15 13:25:54'),
(254, '103.94.0.148', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 13:49:50', '2018-10-15 13:49:50'),
(255, '103.94.0.148', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-15', '2018-10-15 13:49:51', '2018-10-15 13:49:59'),
(256, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 14:02:38', '2018-10-15 14:02:38'),
(257, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 14:02:43', '2018-10-15 14:02:43'),
(258, '200.79.162.67', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Mexico', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 14:22:18', '2018-10-15 14:22:18'),
(259, '158.140.180.15', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Banten', 'Tangerang', 1, '2018-10-15', '2018-10-15 16:28:44', '2018-10-15 16:28:44'),
(260, '138.204.134.167', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Goias', 'Porangatu', 1, '2018-10-15', '2018-10-15 17:59:35', '2018-10-15 17:59:35'),
(261, '125.161.212.208', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-15', '2018-10-15 18:31:23', '2018-10-15 18:32:00'),
(262, '125.161.212.208', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 18:31:49', '2018-10-15 18:31:49'),
(263, '95.38.51.25', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 18:56:24', '2018-10-15 18:56:24'),
(264, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-15', '2018-10-15 20:12:04', '2018-10-15 20:12:04'),
(265, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-15', '2018-10-15 20:12:12', '2018-10-15 20:12:12'),
(266, '103.18.81.145', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Bangladesh', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 21:12:49', '2018-10-15 21:12:49'),
(267, '202.5.42.185', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Bangladesh', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-15', '2018-10-15 21:20:07', '2018-10-15 21:20:07'),
(268, '191.242.245.230', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Parana', 'Mandaguari', 1, '2018-10-15', '2018-10-15 21:21:35', '2018-10-15 21:21:35'),
(269, '159.65.27.66', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United Kingdom', 'England', 'London', 1, '2018-10-15', '2018-10-15 22:03:13', '2018-10-15 22:03:13'),
(270, '188.247.117.50', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ukraine', 'Mykolayivs\'ka Oblast\'', 'Mykolayiv', 1, '2018-10-15', '2018-10-15 22:17:31', '2018-10-15 22:17:31'),
(271, '125.161.212.208', '128.199.250.96/dtcms/album/list', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 23:22:23', '2018-10-15 23:22:23'),
(272, '125.161.212.208', '128.199.250.96/dtcms/album/list?page=2', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-15', '2018-10-15 23:22:29', '2018-10-15 23:22:35'),
(273, '125.161.212.208', '128.199.250.96/dtcms/album/list/data/delete', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 23:22:34', '2018-10-15 23:22:34');
INSERT INTO `visitors` (`id`, `ip_address`, `url`, `browser`, `device`, `country`, `region`, `city`, `hits`, `date`, `created_at`, `updated_at`) VALUES
(274, '125.161.212.208', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 23:30:20', '2018-10-15 23:30:20'),
(275, '125.161.212.208', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-15', '2018-10-15 23:30:21', '2018-10-15 23:30:21'),
(276, '191.8.100.105', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-16', '2018-10-16 01:55:04', '2018-10-16 01:55:04'),
(277, '45.114.145.88', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Rajasthan', 'Jaipur', 1, '2018-10-16', '2018-10-16 02:18:27', '2018-10-16 02:18:27'),
(278, '177.126.18.199', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Santa Catarina', 'Braco do Norte', 1, '2018-10-16', '2018-10-16 02:36:32', '2018-10-16 02:36:32'),
(279, '213.248.179.251', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Turkey', 'Ankara', 'Ankara', 1, '2018-10-16', '2018-10-16 04:01:06', '2018-10-16 04:01:06'),
(280, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-16', '2018-10-16 04:11:18', '2018-10-16 04:11:18'),
(281, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-16', '2018-10-16 04:11:19', '2018-10-16 04:11:19'),
(282, '177.11.142.39', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Passa Quatro', 1, '2018-10-16', '2018-10-16 05:25:10', '2018-10-16 05:25:10'),
(283, '170.239.31.1', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Argentina', 'Buenos Aires', 'Berisso', 1, '2018-10-16', '2018-10-16 05:55:53', '2018-10-16 05:55:53'),
(284, '139.193.24.99', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 06:13:39', '2018-10-16 06:13:39'),
(285, '139.193.24.99', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 06:13:45', '2018-10-16 06:13:45'),
(286, '138.121.128.6', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Piaui', 'Teresina', 1, '2018-10-16', '2018-10-16 06:35:05', '2018-10-16 06:35:05'),
(287, '66.249.64.20', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 07:41:13', '2018-10-16 07:41:13'),
(288, '66.249.75.15', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 07:52:46', '2018-10-16 07:52:46'),
(289, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-16', '2018-10-16 09:01:54', '2018-10-16 09:01:54'),
(290, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-16', '2018-10-16 09:02:05', '2018-10-16 09:02:05'),
(291, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-16', '2018-10-16 09:03:52', '2018-10-16 09:03:52'),
(292, '114.124.175.138', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 09:17:09', '2018-10-16 09:17:09'),
(293, '114.124.175.138', '128.199.250.96/api/v1/posts/detail/6', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 09:17:31', '2018-10-16 09:17:31'),
(294, '114.124.175.138', '128.199.250.96/api/v1/posts/detail/7', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 09:17:56', '2018-10-16 09:17:56'),
(295, '201.68.149.214', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Ibate', 1, '2018-10-16', '2018-10-16 09:28:11', '2018-10-16 09:28:11'),
(296, '5.200.70.93', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 09:37:15', '2018-10-16 09:37:15'),
(297, '198.108.66.112', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 09:42:27', '2018-10-16 09:42:27'),
(298, '198.108.66.112', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 09:42:27', '2018-10-16 09:42:27'),
(299, '103.94.0.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 10:18:55', '2018-10-16 10:18:55'),
(300, '41.248.129.78', '128.199.250.96/', 'Any browser', 'Dekstop', 'Morocco', 'Tanger-Tetouan-Al Hoceima', 'Larache', 2, '2018-10-16', '2018-10-16 10:22:06', '2018-10-16 10:22:08'),
(301, '41.248.129.78', '128.199.250.96/503', 'Any browser', 'Dekstop', 'Morocco', 'Tanger-Tetouan-Al Hoceima', 'Larache', 2, '2018-10-16', '2018-10-16 10:22:07', '2018-10-16 10:22:10'),
(302, '112.215.210.86', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'West Java', 'Bandung', 2, '2018-10-16', '2018-10-16 10:41:30', '2018-10-16 17:16:52'),
(303, '46.101.252.89', '128.199.250.96/', 'Any browser', 'Dekstop', 'Germany', 'Hesse', 'Frankfurt am Main', 1, '2018-10-16', '2018-10-16 10:41:39', '2018-10-16 10:41:39'),
(304, '46.101.252.89', '128.199.250.96/503', 'Any browser', 'Dekstop', 'Germany', 'Hesse', 'Frankfurt am Main', 1, '2018-10-16', '2018-10-16 10:41:40', '2018-10-16 10:41:40'),
(305, '114.124.173.149', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 11:19:11', '2018-10-16 11:19:11'),
(306, '201.95.170.41', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-16', '2018-10-16 11:26:06', '2018-10-16 11:26:06'),
(307, '172.104.108.109', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-16', '2018-10-16 12:05:32', '2018-10-16 12:05:32'),
(308, '5.250.81.103', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-16', '2018-10-16 13:26:27', '2018-10-16 13:26:27'),
(309, '182.0.199.117', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-16', '2018-10-16 13:45:03', '2018-10-16 13:45:03'),
(310, '103.47.217.38', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Bihar', 'Patna', 1, '2018-10-16', '2018-10-16 15:05:19', '2018-10-16 15:05:19'),
(311, '18.212.104.34', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-16', '2018-10-16 15:25:34', '2018-10-16 15:25:34'),
(312, '31.211.190.70', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Spain', 'Andalusia', 'Málaga', 1, '2018-10-16', '2018-10-16 15:31:32', '2018-10-16 15:31:32'),
(313, '189.79.66.75', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-16', '2018-10-16 15:52:49', '2018-10-16 15:52:49'),
(314, '110.139.94.102', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 1, '2018-10-16', '2018-10-16 15:54:42', '2018-10-16 15:54:42'),
(315, '139.162.106.181', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-16', '2018-10-16 16:22:19', '2018-10-16 16:22:19'),
(316, '37.156.112.107', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Yazd', 'Yazd', 1, '2018-10-16', '2018-10-16 17:49:11', '2018-10-16 17:49:11'),
(317, '177.21.93.234', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Parana', 'Paranavai', 1, '2018-10-16', '2018-10-16 19:34:18', '2018-10-16 19:34:18'),
(318, '158.69.202.201', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Canada', 'Quebec', 'Montreal', 1, '2018-10-16', '2018-10-16 20:19:16', '2018-10-16 20:19:16'),
(319, '92.154.58.146', '128.199.250.96/index.php', 'Mozilla Firefox', 'Dekstop', 'France', 'Île-de-France', 'Paris', 1, '2018-10-16', '2018-10-16 22:36:26', '2018-10-16 22:36:26'),
(320, '154.47.128.224', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Spain', 'Andalusia', 'Granada', 1, '2018-10-16', '2018-10-16 23:28:16', '2018-10-16 23:28:16'),
(321, '51.39.10.60', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Saudi Arabia', 'Ar Riyāḑ', 'Riyadh', 1, '2018-10-17', '2018-10-17 00:23:19', '2018-10-17 00:23:19'),
(322, '88.68.168.151', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Germany', 'Hesse', 'Guxhagen', 1, '2018-10-17', '2018-10-17 00:26:18', '2018-10-17 00:26:18'),
(323, '177.68.238.188', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Pitangueiras', 1, '2018-10-17', '2018-10-17 01:02:36', '2018-10-17 01:02:36'),
(324, '36.79.133.140', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-17', '2018-10-17 01:17:39', '2018-10-17 04:31:21'),
(325, '36.79.133.140', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-17', '2018-10-17 01:17:50', '2018-10-17 01:17:50'),
(326, '201.43.235.214', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Carapicuiba', 1, '2018-10-17', '2018-10-17 01:47:25', '2018-10-17 01:47:25'),
(327, '86.122.58.239', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Romania', 'Judetul Brasov', 'Sacele', 1, '2018-10-17', '2018-10-17 02:44:59', '2018-10-17 02:44:59'),
(328, '177.130.46.15', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rio Grande do Sul', 'Garibaldi', 1, '2018-10-17', '2018-10-17 04:06:11', '2018-10-17 04:06:11'),
(329, '201.42.93.80', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-17', '2018-10-17 04:19:29', '2018-10-17 04:19:29'),
(330, '177.190.176.41', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Belo Horizonte', 1, '2018-10-17', '2018-10-17 06:42:32', '2018-10-17 06:42:32'),
(331, '95.9.75.122', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Tokat', 'Tokat Province', 1, '2018-10-17', '2018-10-17 07:08:06', '2018-10-17 07:08:06'),
(332, '189.110.143.86', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Suzano', 1, '2018-10-17', '2018-10-17 07:18:32', '2018-10-17 07:18:32'),
(333, '103.94.0.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-17', '2018-10-17 07:47:02', '2018-10-17 08:09:05'),
(334, '103.94.0.148', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 5, '2018-10-17', '2018-10-17 08:23:42', '2018-10-17 08:31:12'),
(335, '103.94.0.147', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-17', '2018-10-17 08:29:10', '2018-10-17 16:41:53'),
(336, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-17', '2018-10-17 08:29:17', '2018-10-17 16:41:56'),
(337, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-17', '2018-10-17 08:29:41', '2018-10-17 08:29:41'),
(338, '178.94.35.216', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'L\'vivs\'ka Oblast\'', 'Lviv', 1, '2018-10-17', '2018-10-17 08:42:21', '2018-10-17 08:42:21'),
(339, '2.187.242.187', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-17', '2018-10-17 09:08:21', '2018-10-17 09:08:21'),
(340, '90.63.253.126', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'France', 'Île-de-France', 'Paris', 1, '2018-10-17', '2018-10-17 09:32:54', '2018-10-17 09:32:54'),
(341, '43.239.153.114', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Haryana', 'Faridabad', 1, '2018-10-17', '2018-10-17 09:54:45', '2018-10-17 09:54:45'),
(342, '104.42.34.168', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'California', 'San Jose', 1, '2018-10-17', '2018-10-17 10:48:31', '2018-10-17 10:48:31'),
(343, '104.42.34.168', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'California', 'San Jose', 1, '2018-10-17', '2018-10-17 10:48:32', '2018-10-17 10:48:32'),
(344, '189.47.53.139', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-17', '2018-10-17 10:59:14', '2018-10-17 10:59:14'),
(345, '187.32.199.23', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Federal District', 'Brasília', 1, '2018-10-17', '2018-10-17 12:12:09', '2018-10-17 12:12:09'),
(346, '186.4.125.171', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Buenos Aires', 'Lobos', 1, '2018-10-17', '2018-10-17 12:37:49', '2018-10-17 12:37:49'),
(347, '140.213.1.99', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-17', '2018-10-17 13:16:53', '2018-10-17 13:16:53'),
(348, '140.213.1.99', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-17', '2018-10-17 13:17:06', '2018-10-17 13:17:06'),
(349, '46.46.99.202', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Zaporizhia', 'Zaporizhia', 1, '2018-10-17', '2018-10-17 13:45:46', '2018-10-17 13:45:46'),
(350, '105.212.61.55', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'South Africa', 'Gauteng', 'Midrand', 1, '2018-10-17', '2018-10-17 15:37:31', '2018-10-17 15:37:31'),
(351, '125.161.212.208', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 7, '2018-10-17', '2018-10-17 15:38:00', '2018-10-17 19:43:14'),
(352, '125.161.212.208', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 8, '2018-10-17', '2018-10-17 15:38:09', '2018-10-17 19:42:28'),
(353, '41.102.138.220', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Algeria', 'Chlef', 'Sidi Akkacha', 1, '2018-10-17', '2018-10-17 15:39:34', '2018-10-17 15:39:34'),
(354, '189.111.22.111', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'Avare', 1, '2018-10-17', '2018-10-17 15:57:21', '2018-10-17 15:57:21'),
(355, '125.161.212.208', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-17', '2018-10-17 16:03:38', '2018-10-17 16:03:38'),
(356, '125.161.212.208', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-17', '2018-10-17 16:03:38', '2018-10-17 16:03:39'),
(357, '125.161.212.208', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-17', '2018-10-17 16:37:29', '2018-10-17 16:37:29'),
(358, '94.229.32.82', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Slovakia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-17', '2018-10-17 18:11:32', '2018-10-17 18:11:32'),
(359, '121.52.137.219', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'West Java', 'Bandung', 1, '2018-10-17', '2018-10-17 19:31:53', '2018-10-17 19:31:53'),
(360, '71.6.232.4', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'California', 'San Diego', 1, '2018-10-17', '2018-10-17 20:29:10', '2018-10-17 20:29:10'),
(361, '196.46.114.97', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Congo', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-17', '2018-10-17 22:07:14', '2018-10-17 22:07:14'),
(362, '187.1.41.229', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Maranhao', 'Makassar', 1, '2018-10-17', '2018-10-17 22:37:15', '2018-10-17 22:37:15'),
(363, '131.196.57.64', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Belo Horizonte', 1, '2018-10-17', '2018-10-17 22:45:41', '2018-10-17 22:45:41'),
(364, '82.53.121.55', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Italy', 'Umbria', 'Narni', 1, '2018-10-17', '2018-10-17 23:09:31', '2018-10-17 23:09:31'),
(365, '188.121.4.42', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Poland', 'Lower Silesia', 'Wrocław', 1, '2018-10-17', '2018-10-17 23:14:57', '2018-10-17 23:14:57'),
(366, '190.85.206.175', '128.199.250.96/', 'Mozilla Firefox', 'Dekstop', 'Colombia', 'Bogota D.C.', 'Bogotá', 1, '2018-10-17', '2018-10-17 23:23:45', '2018-10-17 23:23:45'),
(367, '190.85.206.175', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'Colombia', 'Bogota D.C.', 'Bogotá', 1, '2018-10-17', '2018-10-17 23:23:46', '2018-10-17 23:23:46'),
(368, '36.79.128.44', '128.199.250.96/api/v1/pages/3', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-17', '2018-10-17 23:24:40', '2018-10-17 23:24:40'),
(369, '177.128.152.79', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Avare', 1, '2018-10-18', '2018-10-18 01:01:22', '2018-10-18 01:01:22'),
(370, '177.129.132.233', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Paracatu', 1, '2018-10-18', '2018-10-18 01:26:43', '2018-10-18 01:26:43'),
(371, '189.76.88.229', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Montes Claros', 1, '2018-10-18', '2018-10-18 01:43:51', '2018-10-18 01:43:51'),
(372, '5.8.54.27', '128.199.250.96/?XDEBUG_SESSION_START=phpstorm', 'Google Chrome', 'Dekstop', 'Russia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 02:15:40', '2018-10-18 02:15:40'),
(373, '5.8.54.27', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Russia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 02:15:41', '2018-10-18 02:15:41'),
(374, '186.178.10.54', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ecuador', 'Provincia del Guayas', 'Guayaquil', 1, '2018-10-18', '2018-10-18 02:59:17', '2018-10-18 02:59:17'),
(375, '66.249.64.22', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 03:47:47', '2018-10-18 03:47:47'),
(376, '189.47.47.2', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Salto Grande', 1, '2018-10-18', '2018-10-18 04:20:28', '2018-10-18 04:20:29'),
(377, '172.104.108.109', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-18', '2018-10-18 05:46:53', '2018-10-18 05:46:53'),
(378, '139.255.97.118', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 08:25:04', '2018-10-18 08:25:04'),
(379, '95.143.143.6', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Czechia', 'Ustecky kraj', 'Steti', 1, '2018-10-18', '2018-10-18 09:16:21', '2018-10-18 09:16:21'),
(380, '35.230.57.189', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'California', 'Mountain View', 1, '2018-10-18', '2018-10-18 11:02:08', '2018-10-18 11:02:08'),
(381, '35.230.57.189', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'California', 'Mountain View', 1, '2018-10-18', '2018-10-18 11:02:09', '2018-10-18 11:02:09'),
(382, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-18', '2018-10-18 11:54:06', '2018-10-18 11:54:06'),
(383, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-18', '2018-10-18 11:54:10', '2018-10-18 11:54:10'),
(384, '36.74.52.137', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 1, '2018-10-18', '2018-10-18 13:27:16', '2018-10-18 13:27:16'),
(385, '170.79.91.162', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Colombia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 13:33:12', '2018-10-18 13:33:12'),
(386, '46.172.76.23', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Donets\'ka Oblast\'', 'Donetsk', 1, '2018-10-18', '2018-10-18 13:54:44', '2018-10-18 13:54:44'),
(387, '96.9.87.53', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Cambodia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 14:01:10', '2018-10-18 14:01:10'),
(388, '140.213.8.139', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 14:05:11', '2018-10-18 14:05:11'),
(389, '125.161.212.208', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 4, '2018-10-18', '2018-10-18 14:20:50', '2018-10-18 18:30:27'),
(390, '191.13.220.191', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Valinhos', 1, '2018-10-18', '2018-10-18 14:30:05', '2018-10-18 14:30:05'),
(391, '103.94.0.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 14:58:00', '2018-10-18 14:58:00'),
(392, '103.94.0.147', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 15:07:27', '2018-10-18 15:07:27'),
(393, '191.205.66.211', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Guarulhos', 1, '2018-10-18', '2018-10-18 15:55:15', '2018-10-18 15:55:15'),
(394, '125.161.212.208', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 18:30:38', '2018-10-18 18:30:38'),
(395, '177.11.142.39', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Passa Quatro', 1, '2018-10-18', '2018-10-18 18:54:07', '2018-10-18 18:54:07'),
(396, '200.185.215.62', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Brazil', 'Rio Grande do Sul', 'Caxias do Sul', 1, '2018-10-18', '2018-10-18 20:52:33', '2018-10-18 20:52:33'),
(397, '140.213.15.79', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 21:18:08', '2018-10-18 21:18:08'),
(398, '140.213.15.79', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 21:18:17', '2018-10-18 21:18:17'),
(399, '140.213.15.79', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-18', '2018-10-18 21:18:56', '2018-10-18 21:18:56'),
(400, '196.22.51.106', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Mozambique', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-18', '2018-10-18 22:32:13', '2018-10-18 22:32:13'),
(401, '54.88.35.245', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-18', '2018-10-18 22:35:22', '2018-10-18 22:35:22'),
(402, '84.54.146.171', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Bulgaria', 'Burgas', 'Sredets', 1, '2018-10-18', '2018-10-18 22:58:53', '2018-10-18 22:58:53'),
(403, '93.183.249.10', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ukraine', 'Kyiv City', 'Kyiv', 1, '2018-10-18', '2018-10-18 23:52:51', '2018-10-18 23:52:51'),
(404, '107.170.212.151', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'California', 'Bellflower', 1, '2018-10-19', '2018-10-19 00:52:24', '2018-10-19 00:52:24'),
(405, '192.241.142.223', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'Massachusetts', 'Dedham', 1, '2018-10-19', '2018-10-19 01:05:06', '2018-10-19 01:05:06'),
(406, '95.38.50.112', '128.199.250.96/', 'Safari', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 03:27:16', '2018-10-19 03:27:16'),
(407, '187.56.7.121', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Araraquara', 1, '2018-10-19', '2018-10-19 04:32:24', '2018-10-19 04:32:24'),
(408, '5.234.105.236', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 04:42:03', '2018-10-19 04:42:03'),
(409, '66.249.64.22', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 04:47:46', '2018-10-19 04:47:46'),
(410, '208.97.119.150', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Canada', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 05:03:02', '2018-10-19 05:03:02'),
(411, '86.109.43.94', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Iran', 'Ostan-e Tehran', 'Tehran', 1, '2018-10-19', '2018-10-19 05:09:15', '2018-10-19 05:09:15'),
(412, '139.193.24.99', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-19', '2018-10-19 06:26:22', '2018-10-19 19:17:58'),
(413, '139.193.24.99', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 06:26:36', '2018-10-19 06:26:36'),
(414, '191.255.167.249', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Ribeirão Preto', 1, '2018-10-19', '2018-10-19 07:28:17', '2018-10-19 07:28:17'),
(415, '101.109.58.54', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Thailand', 'Bangkok', 'Bangkok', 1, '2018-10-19', '2018-10-19 08:01:32', '2018-10-19 08:01:32'),
(416, '36.67.56.130', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 09:27:38', '2018-10-19 09:27:38'),
(417, '36.67.56.130', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 09:27:55', '2018-10-19 09:27:55'),
(418, '36.67.56.130', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 09:28:58', '2018-10-19 09:28:58'),
(419, '182.0.135.86', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Banten', 'Tangerang', 2, '2018-10-19', '2018-10-19 10:45:44', '2018-10-19 10:45:50'),
(420, '18.212.104.34', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-19', '2018-10-19 11:44:11', '2018-10-19 11:44:11'),
(421, '201.54.72.119', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Parana', 'Londrina', 1, '2018-10-19', '2018-10-19 12:07:23', '2018-10-19 12:07:23'),
(422, '78.182.45.216', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Hatay', 'Antakya', 1, '2018-10-19', '2018-10-19 12:34:27', '2018-10-19 12:34:27'),
(423, '200.89.106.2', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Colombia', 'Atlántico', 'Barranquilla', 1, '2018-10-19', '2018-10-19 12:37:43', '2018-10-19 12:37:43'),
(424, '128.199.123.214', '128.199.250.96/', 'Any browser', 'Dekstop', 'Singapore', 'Central Singapore Community De', 'Singapore', 1, '2018-10-19', '2018-10-19 13:48:18', '2018-10-19 13:48:18'),
(425, '128.199.123.214', '128.199.250.96/503', 'Any browser', 'Dekstop', 'Singapore', 'Central Singapore Community De', 'Singapore', 1, '2018-10-19', '2018-10-19 13:48:19', '2018-10-19 13:48:19'),
(426, '140.213.45.221', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 14:50:33', '2018-10-19 14:50:33'),
(427, '114.124.213.6', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 14:55:50', '2018-10-19 14:55:50'),
(428, '220.84.232.206', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Republic of Korea', 'Busan', 'Busan', 1, '2018-10-19', '2018-10-19 15:36:04', '2018-10-19 15:36:04'),
(429, '185.129.228.129', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 17:32:55', '2018-10-19 17:32:55'),
(430, '185.129.228.129', '128.199.250.96/', 'Safari', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 17:33:16', '2018-10-19 17:33:16'),
(431, '103.216.185.157', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-19', '2018-10-19 18:51:28', '2018-10-19 18:51:28'),
(432, '190.6.112.34', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Argentina', 'Santa Fe', 'Rafaela', 1, '2018-10-19', '2018-10-19 19:12:56', '2018-10-19 19:12:56'),
(433, '139.193.24.99', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-19', '2018-10-19 19:18:01', '2018-10-19 19:18:01'),
(434, '139.162.119.197', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-19', '2018-10-19 20:06:49', '2018-10-19 20:06:49'),
(435, '177.55.245.194', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Ceara', 'Fortaleza', 1, '2018-10-19', '2018-10-19 20:17:27', '2018-10-19 20:17:27'),
(436, '182.119.193.77', '128.199.250.96/', 'Any browser', 'Dekstop', 'China', 'Henan', 'Makassar', 1, '2018-10-20', '2018-10-20 01:35:00', '2018-10-20 01:35:00'),
(437, '172.104.108.109', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-20', '2018-10-20 02:42:24', '2018-10-20 02:42:24'),
(438, '138.204.112.38', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Franco da Rocha', 1, '2018-10-20', '2018-10-20 04:42:22', '2018-10-20 04:42:22'),
(439, '139.162.106.181', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-20', '2018-10-20 04:58:17', '2018-10-20 04:58:17'),
(440, '92.253.245.142', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'L\'vivs\'ka Oblast\'', 'Lviv', 1, '2018-10-20', '2018-10-20 07:30:03', '2018-10-20 07:30:03'),
(441, '138.68.101.0', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'New York', 'New York', 1, '2018-10-20', '2018-10-20 08:02:17', '2018-10-20 08:02:17'),
(442, '154.47.128.46', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Andalusia', 'Granada', 1, '2018-10-20', '2018-10-20 08:12:27', '2018-10-20 08:12:27'),
(443, '103.224.186.169', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Nagaland', 'Makassar', 1, '2018-10-20', '2018-10-20 08:23:44', '2018-10-20 08:23:44'),
(444, '189.19.178.209', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Taboao da Serra', 1, '2018-10-20', '2018-10-20 10:10:33', '2018-10-20 10:10:33'),
(445, '37.156.188.119', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Andalusia', 'Málaga', 1, '2018-10-20', '2018-10-20 10:27:26', '2018-10-20 10:27:26'),
(446, '182.1.21.46', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-20', '2018-10-20 10:32:35', '2018-10-20 10:32:35'),
(447, '182.1.4.180', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-20', '2018-10-20 10:32:54', '2018-10-20 10:32:54'),
(448, '182.1.4.63', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'North Sumatra', 'Medan', 1, '2018-10-20', '2018-10-20 10:33:17', '2018-10-20 10:33:17'),
(449, '43.252.220.91', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Rajasthan', 'Udaipur', 1, '2018-10-20', '2018-10-20 13:01:53', '2018-10-20 13:01:53'),
(450, '35.239.54.155', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'California', 'Mountain View', 1, '2018-10-20', '2018-10-20 14:01:43', '2018-10-20 14:01:43'),
(451, '35.239.54.155', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'California', 'Mountain View', 1, '2018-10-20', '2018-10-20 14:01:44', '2018-10-20 14:01:44'),
(452, '177.45.30.161', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 2, '2018-10-20', '2018-10-20 14:39:51', '2018-10-20 14:39:51'),
(453, '202.91.82.132', '128.199.250.96:80/', 'Safari', 'Dekstop', 'India', 'Rajasthan', 'Ganganagar', 1, '2018-10-20', '2018-10-20 15:31:39', '2018-10-20 15:31:39'),
(454, '150.242.254.235', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Rajasthan', 'Udaipur', 1, '2018-10-20', '2018-10-20 15:52:00', '2018-10-20 15:52:00'),
(455, '176.215.254.29', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Irkutsk Oblast', 'Irkutsk', 1, '2018-10-20', '2018-10-20 16:17:44', '2018-10-20 16:17:44'),
(456, '18.234.110.107', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-20', '2018-10-20 17:03:20', '2018-10-20 17:03:20'),
(457, '18.234.110.107', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'United States', 'Virginia', 'Ashburn', 1, '2018-10-20', '2018-10-20 17:03:20', '2018-10-20 17:03:20'),
(458, '79.117.80.99', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Romania', 'Bihor', 'Oradea', 1, '2018-10-20', '2018-10-20 17:23:58', '2018-10-20 17:23:58'),
(459, '139.193.24.99', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-20', '2018-10-20 18:16:58', '2018-10-20 18:16:59'),
(460, '180.214.232.77', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-20', '2018-10-20 18:39:16', '2018-10-20 18:39:16'),
(461, '177.72.88.58', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rio Grande do Norte', 'Sao Paulo do Potengi', 1, '2018-10-20', '2018-10-20 19:10:19', '2018-10-20 19:10:19'),
(462, '179.228.32.249', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-20', '2018-10-20 20:50:01', '2018-10-20 20:50:01'),
(463, '212.115.250.47', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Ukraine', 'Dnipropetrovsk', 'Dnipro', 1, '2018-10-20', '2018-10-20 21:18:17', '2018-10-20 21:18:17'),
(464, '42.189.237.47', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Malaysia', 'Kedah', 'Alor Star', 1, '2018-10-20', '2018-10-20 21:42:26', '2018-10-20 21:42:26'),
(465, '180.249.54.94', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 3, '2018-10-20', '2018-10-20 22:25:22', '2018-10-20 22:27:40'),
(466, '180.249.54.94', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-20', '2018-10-20 22:25:33', '2018-10-20 22:25:33'),
(467, '180.249.54.94', '128.199.250.96/api/v1/posts/detail/11', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-20', '2018-10-20 22:26:12', '2018-10-20 22:26:26'),
(468, '180.249.54.94', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-20', '2018-10-20 22:27:54', '2018-10-20 22:27:54'),
(469, '87.245.140.200', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Moscow', 'Moscow', 1, '2018-10-20', '2018-10-20 23:12:22', '2018-10-20 23:12:22'),
(470, '187.11.40.139', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 2, '2018-10-20', '2018-10-20 23:43:09', '2018-10-20 23:43:10'),
(471, '187.19.29.234', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Minas Gerais', 'Piau', 1, '2018-10-21', '2018-10-21 01:39:31', '2018-10-21 01:39:31'),
(472, '186.251.230.224', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Parana', 'Marquinho', 1, '2018-10-21', '2018-10-21 01:53:32', '2018-10-21 01:53:32'),
(473, '93.115.63.116', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Italy', 'Veneto', 'Ariano nel Polesine', 1, '2018-10-21', '2018-10-21 02:26:28', '2018-10-21 02:26:28'),
(474, '88.250.191.208', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Turkey', 'Bursa', 'Bursa', 1, '2018-10-21', '2018-10-21 02:48:47', '2018-10-21 02:48:47'),
(475, '202.138.244.115', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Indonesia', 'West Java', 'Bandung', 1, '2018-10-21', '2018-10-21 03:18:11', '2018-10-21 03:18:11'),
(476, '185.224.103.65', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Albania', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-21', '2018-10-21 08:22:25', '2018-10-21 08:22:25'),
(477, '173.206.18.164', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Canada', 'Ontario', 'Mississauga', 1, '2018-10-21', '2018-10-21 09:09:05', '2018-10-21 09:09:05'),
(478, '177.45.205.191', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Campinas', 1, '2018-10-21', '2018-10-21 11:32:18', '2018-10-21 11:32:18'),
(479, '103.82.72.94', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Haryana', 'Faridabad', 1, '2018-10-21', '2018-10-21 11:58:18', '2018-10-21 11:58:18'),
(480, '81.140.10.255', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United Kingdom', 'England', 'London', 1, '2018-10-21', '2018-10-21 12:04:47', '2018-10-21 12:04:47'),
(481, '85.11.20.196', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Sweden', 'Västerbotten', 'Umeå', 1, '2018-10-21', '2018-10-21 12:11:23', '2018-10-21 12:11:23'),
(482, '110.138.97.204', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Pacitan', 1, '2018-10-21', '2018-10-21 16:04:10', '2018-10-21 16:04:10'),
(483, '198.167.223.52', '1627047808/', 'Any browser', 'Dekstop', 'St Kitts and Nevis', 'Saint John Capesterre', 'Dieppe Bay Town', 1, '2018-10-21', '2018-10-21 18:09:08', '2018-10-21 18:09:08'),
(484, '37.221.136.89', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'L\'vivs\'ka Oblast\'', 'Lviv', 1, '2018-10-21', '2018-10-21 18:33:48', '2018-10-21 18:33:48'),
(485, '190.217.114.81', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-21', '2018-10-21 19:44:13', '2018-10-21 19:44:13'),
(486, '5.154.13.237', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Spain', 'Murcia', 'Murcia', 1, '2018-10-21', '2018-10-21 20:34:01', '2018-10-21 20:34:01'),
(487, '82.99.130.29', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Czechia', 'Kralovehradecky kraj', 'Trutnov', 1, '2018-10-21', '2018-10-21 21:36:34', '2018-10-21 21:36:34'),
(488, '114.125.109.218', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 1, '2018-10-21', '2018-10-21 22:11:18', '2018-10-21 22:11:18'),
(489, '114.125.109.218', '128.199.250.96/api/v1/posts/detail/4', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 1, '2018-10-21', '2018-10-21 22:11:29', '2018-10-21 22:11:29'),
(490, '201.92.5.22', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Campinas', 1, '2018-10-21', '2018-10-21 22:23:23', '2018-10-21 22:23:23'),
(491, '94.158.5.8', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Russia', 'Irkutsk Oblast', 'Irkutsk', 1, '2018-10-21', '2018-10-21 22:25:05', '2018-10-21 22:25:05'),
(492, '201.147.144.89', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Mexico', 'Mexico City', 'Mexico City', 1, '2018-10-21', '2018-10-21 22:35:39', '2018-10-21 22:35:39'),
(493, '94.183.237.63', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-21', '2018-10-21 23:24:39', '2018-10-21 23:24:39'),
(494, '77.93.52.140', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Zaporizhia', 'Zaporizhia', 1, '2018-10-21', '2018-10-21 23:41:36', '2018-10-21 23:41:36'),
(495, '172.104.108.109', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-22', '2018-10-22 01:51:33', '2018-10-22 01:51:33'),
(496, '45.5.200.11', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Pernambuco', 'Buique', 1, '2018-10-22', '2018-10-22 03:17:32', '2018-10-22 03:17:32'),
(497, '185.17.188.35', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Serbia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-22', '2018-10-22 04:46:38', '2018-10-22 04:46:38'),
(498, '38.87.239.58', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Puerto Rico', 'Sulawesi Selatan', 'Arecibo', 1, '2018-10-22', '2018-10-22 05:19:34', '2018-10-22 05:19:34'),
(499, '109.86.219.249', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Kharkivs\'ka Oblast\'', 'Kharkiv', 1, '2018-10-22', '2018-10-22 05:48:24', '2018-10-22 05:48:24'),
(500, '107.170.217.137', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'California', 'Orange', 1, '2018-10-22', '2018-10-22 06:57:18', '2018-10-22 06:57:18'),
(501, '177.103.124.143', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Taboao da Serra', 1, '2018-10-22', '2018-10-22 08:18:12', '2018-10-22 08:18:12'),
(502, '111.220.95.76', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Australia', 'Queensland', 'Goodna', 1, '2018-10-22', '2018-10-22 08:34:53', '2018-10-22 08:34:53'),
(503, '114.124.231.133', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-22', '2018-10-22 08:40:34', '2018-10-22 08:40:34'),
(504, '103.213.128.236', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-22', '2018-10-22 08:58:51', '2018-10-22 08:58:51'),
(505, '54.183.61.47', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'California', 'San Jose', 1, '2018-10-22', '2018-10-22 09:43:16', '2018-10-22 09:43:16'),
(506, '84.202.165.13', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Norway', 'Trøndelag', 'Trondheim', 1, '2018-10-22', '2018-10-22 10:53:55', '2018-10-22 10:53:55'),
(507, '103.94.0.147', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 6, '2018-10-22', '2018-10-22 11:22:56', '2018-10-22 14:40:32'),
(508, '154.127.126.210', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'South Africa', 'Gauteng', 'Pretoria', 1, '2018-10-22', '2018-10-22 11:39:32', '2018-10-22 11:39:32'),
(509, '170.84.146.245', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Piaui', 'Teresina', 1, '2018-10-22', '2018-10-22 12:01:09', '2018-10-22 12:01:09'),
(510, '143.137.161.252', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Amazonas', 'Manaus', 1, '2018-10-22', '2018-10-22 12:18:29', '2018-10-22 12:18:29'),
(511, '195.184.208.249', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Donets\'ka Oblast\'', 'Donetsk', 1, '2018-10-22', '2018-10-22 12:46:03', '2018-10-22 12:46:04'),
(512, '192.210.198.178', '128.199.250.96/', 'Mozilla Firefox', 'Dekstop', 'United States', 'New York', 'Buffalo', 1, '2018-10-22', '2018-10-22 12:49:49', '2018-10-22 12:49:49'),
(513, '192.210.198.178', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'United States', 'New York', 'Buffalo', 1, '2018-10-22', '2018-10-22 12:49:50', '2018-10-22 12:49:50'),
(514, '103.94.0.148', '128.199.250.96/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-22', '2018-10-22 14:33:33', '2018-10-22 14:33:41'),
(515, '114.124.174.110', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-22', '2018-10-22 14:34:19', '2018-10-22 14:34:19'),
(516, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-22', '2018-10-22 14:37:18', '2018-10-22 14:37:18'),
(517, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-22', '2018-10-22 14:37:24', '2018-10-22 14:38:03'),
(518, '103.94.0.147', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-22', '2018-10-22 14:40:38', '2018-10-22 14:40:45'),
(519, '195.94.144.210', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Italy', 'Latium', 'Rome', 1, '2018-10-22', '2018-10-22 15:14:26', '2018-10-22 15:14:26'),
(520, '86.127.49.227', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Romania', 'Ilfov', 'Otopeni', 1, '2018-10-22', '2018-10-22 15:21:46', '2018-10-22 15:21:46'),
(521, '51.38.12.21', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-22', '2018-10-22 15:23:35', '2018-10-22 15:23:35'),
(522, '51.38.12.21', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-22', '2018-10-22 15:23:37', '2018-10-22 15:23:37'),
(523, '36.79.128.44', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-22', '2018-10-22 16:20:30', '2018-10-22 16:20:30'),
(524, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 2, '2018-10-22', '2018-10-22 16:20:33', '2018-10-22 16:21:45'),
(525, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 2, '2018-10-22', '2018-10-22 16:21:06', '2018-10-22 16:23:25'),
(526, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-22', '2018-10-22 16:22:36', '2018-10-22 16:22:36'),
(527, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-22', '2018-10-22 16:23:47', '2018-10-22 16:23:47'),
(528, '187.11.128.142', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Embu', 1, '2018-10-22', '2018-10-22 17:24:32', '2018-10-22 17:24:32'),
(529, '140.213.34.149', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-22', '2018-10-22 17:52:42', '2018-10-22 17:52:46'),
(530, '88.250.191.208', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Turkey', 'Bursa', 'Bursa', 1, '2018-10-22', '2018-10-22 18:55:36', '2018-10-22 18:55:36'),
(531, '109.242.213.200', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Greece', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-22', '2018-10-22 19:12:45', '2018-10-22 19:12:45'),
(532, '177.95.114.226', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-22', '2018-10-22 19:34:41', '2018-10-22 19:34:41'),
(533, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-22', '2018-10-22 20:02:57', '2018-10-22 20:02:57'),
(534, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-22', '2018-10-22 20:02:59', '2018-10-22 20:02:59'),
(535, '193.112.41.239', '128.199.250.96/index.php', 'Internet Explorer', 'Dekstop', 'China', 'Beijing', 'Makassar', 1, '2018-10-22', '2018-10-22 20:39:01', '2018-10-22 20:39:01'),
(536, '114.124.213.207', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-22', '2018-10-22 21:13:39', '2018-10-22 21:13:39'),
(537, '112.215.65.45', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 2, '2018-10-22', '2018-10-22 21:13:57', '2018-10-22 21:13:59'),
(538, '191.13.186.165', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Sao Jose do Rio Pardo', 2, '2018-10-22', '2018-10-22 21:39:47', '2018-10-22 21:39:48'),
(539, '141.105.110.178', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Spain', 'Balearic Islands', 'Sencelles', 1, '2018-10-22', '2018-10-22 22:24:58', '2018-10-22 22:24:58'),
(540, '139.162.119.197', '128.199.250.96/', 'Any browser', 'Dekstop', 'Japan', 'Tokyo', 'Tokyo', 1, '2018-10-23', '2018-10-23 00:55:10', '2018-10-23 00:55:10'),
(541, '179.100.64.3', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-23', '2018-10-23 01:27:52', '2018-10-23 01:27:52'),
(542, '103.233.123.19', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Rajasthan', 'Udaipur', 1, '2018-10-23', '2018-10-23 02:26:27', '2018-10-23 02:26:27'),
(543, '202.154.178.146', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-23', '2018-10-23 05:00:06', '2018-10-23 05:00:06'),
(544, '114.124.137.21', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 05:33:49', '2018-10-23 05:33:49'),
(545, '114.124.137.21', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 05:34:00', '2018-10-23 05:34:00'),
(546, '114.124.137.21', '128.199.250.96/api/v1/posts/detail/16', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 05:34:14', '2018-10-23 05:34:14'),
(547, '114.124.170.148', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 05:35:18', '2018-10-23 05:35:18'),
(548, '114.124.170.148', '128.199.250.96/api/v1/posts/detail/15', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 05:35:58', '2018-10-23 05:35:58'),
(549, '138.36.188.22', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Maranhao', 'Codó', 1, '2018-10-23', '2018-10-23 05:51:15', '2018-10-23 05:51:15'),
(550, '187.94.114.218', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rio de Janeiro', 'Armacao de Buzios', 1, '2018-10-23', '2018-10-23 06:14:45', '2018-10-23 06:14:45'),
(551, '130.0.61.149', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Odessa', 'Odesa', 1, '2018-10-23', '2018-10-23 07:03:14', '2018-10-23 07:03:14'),
(552, '157.100.58.174', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ecuador', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-23', '2018-10-23 07:17:19', '2018-10-23 07:17:19');
INSERT INTO `visitors` (`id`, `ip_address`, `url`, `browser`, `device`, `country`, `region`, `city`, `hits`, `date`, `created_at`, `updated_at`) VALUES
(553, '112.215.151.187', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-23', '2018-10-23 07:35:33', '2018-10-23 07:36:27'),
(554, '112.215.151.187', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 07:35:42', '2018-10-23 07:35:42'),
(555, '200.148.76.177', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-23', '2018-10-23 12:41:48', '2018-10-23 12:41:48'),
(556, '189.126.202.130', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'São Paulo', 1, '2018-10-23', '2018-10-23 12:54:02', '2018-10-23 12:54:02'),
(557, '131.221.193.30', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rio Grande do Sul', 'Uruguaiana', 1, '2018-10-23', '2018-10-23 13:36:15', '2018-10-23 13:36:15'),
(558, '120.188.33.20', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 14:44:51', '2018-10-23 14:44:51'),
(559, '120.188.33.20', '128.199.250.96/api/v1/posts/detail/1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 14:44:57', '2018-10-23 14:44:57'),
(560, '187.56.159.93', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Itapevi', 1, '2018-10-23', '2018-10-23 15:10:49', '2018-10-23 15:10:49'),
(561, '187.56.159.93', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Brazil', 'Sao Paulo', 'Itapevi', 1, '2018-10-23', '2018-10-23 15:10:49', '2018-10-23 15:10:49'),
(562, '103.194.248.26', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'India', 'Himachal Pradesh', 'Hamirpur', 1, '2018-10-23', '2018-10-23 17:18:50', '2018-10-23 17:18:50'),
(563, '164.215.219.71', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-23', '2018-10-23 17:46:09', '2018-10-23 17:46:09'),
(564, '51.15.191.81', '128.199.250.96/', 'Mozilla Firefox', 'Dekstop', 'France', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-23', '2018-10-23 17:55:52', '2018-10-23 17:55:52'),
(565, '5.188.62.15', '128.199.250.96/', 'Any browser', 'Dekstop', 'Russia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-23', '2018-10-23 18:02:30', '2018-10-23 18:02:30'),
(566, '103.248.119.141', '128.199.250.96:80/', 'Safari', 'Dekstop', 'India', 'Haryana', 'Sonipat', 1, '2018-10-23', '2018-10-23 19:00:51', '2018-10-23 19:00:51'),
(567, '114.124.139.218', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-23', '2018-10-23 19:57:56', '2018-10-23 19:58:17'),
(568, '114.124.169.91', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 19:58:07', '2018-10-23 19:58:07'),
(569, '114.124.168.251', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 1, '2018-10-23', '2018-10-23 20:04:13', '2018-10-23 20:04:13'),
(570, '115.178.235.68', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'East Java', 'Surabaya', 2, '2018-10-23', '2018-10-23 20:30:02', '2018-10-23 20:30:09'),
(571, '177.73.55.35', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Goias', 'Orizona', 1, '2018-10-23', '2018-10-23 21:44:26', '2018-10-23 21:44:26'),
(572, '213.235.76.74', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Czechia', 'Zlín', 'Valasske Mezirici', 1, '2018-10-23', '2018-10-23 22:42:30', '2018-10-23 22:42:30'),
(573, '190.249.147.17', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Colombia', 'Antioquia', 'Medellín', 1, '2018-10-23', '2018-10-23 23:21:58', '2018-10-23 23:21:58'),
(574, '176.98.29.179', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ukraine', 'Kyiv City', 'Kyiv', 1, '2018-10-23', '2018-10-23 23:33:29', '2018-10-23 23:33:29'),
(575, '112.215.208.82', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'West Java', 'Bandung', 1, '2018-10-23', '2018-10-23 23:36:33', '2018-10-23 23:36:33'),
(576, '177.188.82.52', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Cravinhos', 1, '2018-10-24', '2018-10-24 01:07:29', '2018-10-24 01:07:29'),
(577, '80.82.67.214', '128.199.250.96/', 'Any browser', 'Dekstop', 'Seychelles', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 02:21:49', '2018-10-24 02:21:49'),
(578, '95.81.104.208', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-24', '2018-10-24 02:43:51', '2018-10-24 02:43:52'),
(579, '161.22.8.96', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Argentina', 'Buenos Aires', 'Del Viso', 1, '2018-10-24', '2018-10-24 02:44:12', '2018-10-24 02:44:12'),
(580, '36.79.128.44', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-24', '2018-10-24 02:57:08', '2018-10-24 02:57:08'),
(581, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-24', '2018-10-24 02:57:12', '2018-10-24 02:57:12'),
(582, '36.79.128.44', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'Yogyakarta', 'Sleman', 1, '2018-10-24', '2018-10-24 02:57:24', '2018-10-24 02:57:24'),
(583, '195.181.89.210', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 03:56:46', '2018-10-24 03:56:46'),
(584, '199.96.239.152', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'United States', 'Minnesota', 'Watkins', 1, '2018-10-24', '2018-10-24 05:53:32', '2018-10-24 05:53:32'),
(585, '36.75.142.157', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-24', '2018-10-24 06:06:03', '2018-10-24 06:07:26'),
(586, '36.75.142.157', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-24', '2018-10-24 06:06:10', '2018-10-24 06:06:10'),
(587, '36.75.142.157', '128.199.250.96/api/v1/posts/detail/12', 'Any browser', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 2, '2018-10-24', '2018-10-24 06:06:24', '2018-10-24 06:07:36'),
(588, '41.203.75.50', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Nigeria', 'Lagos', 'Lagos', 1, '2018-10-24', '2018-10-24 06:47:13', '2018-10-24 06:47:13'),
(589, '138.97.144.254', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Rondonia', 'Makassar', 1, '2018-10-24', '2018-10-24 10:02:15', '2018-10-24 10:02:15'),
(590, '109.94.115.203', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Serbia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 10:03:33', '2018-10-24 10:03:33'),
(591, '114.115.129.191', '128.199.250.96/index.php', 'Google Chrome', 'Dekstop', 'China', 'Beijing', 'Makassar', 1, '2018-10-24', '2018-10-24 10:36:35', '2018-10-24 10:36:35'),
(592, '177.42.184.232', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Pernambuco', 'Recife', 1, '2018-10-24', '2018-10-24 11:26:51', '2018-10-24 11:26:51'),
(593, '187.120.136.134', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Brazil', 'Sao Paulo', 'Bauru', 1, '2018-10-24', '2018-10-24 11:46:11', '2018-10-24 11:46:11'),
(594, '35.208.92.12', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'California', 'Mountain View', 1, '2018-10-24', '2018-10-24 12:11:42', '2018-10-24 12:11:42'),
(595, '46.252.42.94', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Albania', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 13:34:51', '2018-10-24 13:34:51'),
(596, '60.191.38.77', '128.199.250.96:80/', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-24', '2018-10-24 13:53:51', '2018-10-24 13:53:51'),
(597, '60.191.38.77', '128.199.250.96/503', 'Mozilla Firefox', 'Dekstop', 'China', 'Zhejiang', 'Makassar', 1, '2018-10-24', '2018-10-24 13:53:53', '2018-10-24 13:53:53'),
(598, '36.65.125.85', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Central Java', 'Sukoharjo', 1, '2018-10-24', '2018-10-24 14:00:11', '2018-10-24 14:00:11'),
(599, '211.21.7.196', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Taiwan', 'Taipei City', 'Taipei', 1, '2018-10-24', '2018-10-24 14:13:25', '2018-10-24 14:13:25'),
(600, '211.21.7.196', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Taiwan', 'Taipei City', 'Taipei', 2, '2018-10-24', '2018-10-24 14:13:33', '2018-10-24 14:13:38'),
(601, '211.21.7.196', '128.199.250.96/api/v1/posts/detail/14', 'Any browser', 'Dekstop', 'Taiwan', 'Taipei City', 'Taipei', 1, '2018-10-24', '2018-10-24 14:13:57', '2018-10-24 14:13:57'),
(602, '31.223.115.70', '128.199.250.96:80/', 'Safari', 'Dekstop', 'Turkey', 'Denizli', 'Denizli', 1, '2018-10-24', '2018-10-24 14:45:49', '2018-10-24 14:45:49'),
(603, '66.249.64.148', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'United States', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 14:48:44', '2018-10-24 14:48:44'),
(604, '91.235.23.68', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Poland', 'Greater Poland', 'Poznan', 1, '2018-10-24', '2018-10-24 14:53:46', '2018-10-24 14:53:46'),
(605, '132.232.146.133', '128.199.250.96/index.php', 'Internet Explorer', 'Dekstop', 'China', 'Beijing', 'Makassar', 1, '2018-10-24', '2018-10-24 14:55:37', '2018-10-24 14:55:37'),
(606, '36.75.140.174', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-24', '2018-10-24 14:56:19', '2018-10-24 14:56:19'),
(607, '36.75.140.174', '128.199.250.96/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'South Sulawesi', 'Makassar', 1, '2018-10-24', '2018-10-24 14:56:19', '2018-10-24 14:56:19'),
(608, '95.38.75.16', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 16:24:18', '2018-10-24 16:24:18'),
(609, '71.6.232.4', '128.199.250.96/', 'Google Chrome', 'Dekstop', 'United States', 'California', 'San Diego', 1, '2018-10-24', '2018-10-24 17:00:37', '2018-10-24 17:00:37'),
(610, '35.194.88.20', '128.199.250.96/', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Makassar', 1, '2018-10-24', '2018-10-24 17:05:43', '2018-10-24 17:05:43'),
(611, '35.194.88.20', '128.199.250.96/503', 'Any browser', 'Dekstop', 'United States', 'Virginia', 'Makassar', 1, '2018-10-24', '2018-10-24 17:05:44', '2018-10-24 17:05:44'),
(612, '124.106.83.63', '128.199.250.96/index.php', 'Google Chrome', 'Dekstop', 'Philippines', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 18:03:58', '2018-10-24 18:03:58'),
(613, '181.112.219.130', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Ecuador', 'Provincia del Guayas', 'Guayaquil', 1, '2018-10-24', '2018-10-24 18:15:18', '2018-10-24 18:15:18'),
(614, '36.70.0.21', '128.199.250.96/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-24', '2018-10-24 18:29:12', '2018-10-24 18:31:13'),
(615, '36.70.0.21', '128.199.250.96/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Jakarta', 'Jakarta', 3, '2018-10-24', '2018-10-24 18:29:43', '2018-10-24 18:31:11'),
(616, '151.234.168.154', '128.199.250.96:80/', 'Google Chrome', 'Dekstop', 'Iran', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 18:30:52', '2018-10-24 18:30:52'),
(617, '155.4.225.211', '128.199.250.96/', 'Internet Explorer', 'Dekstop', 'Sweden', 'Västra Götaland', 'Gothenburg', 1, '2018-10-24', '2018-10-24 18:50:29', '2018-10-24 18:50:29'),
(618, '127.0.0.1', 'djki-live.test/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-24', '2018-10-24 11:36:11', '2018-10-24 11:38:23'),
(619, '127.0.0.1', 'djki-live.test/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-24', '2018-10-24 11:36:16', '2018-10-24 11:38:23'),
(620, '127.0.0.1', 'djki-live.test/api/v1/posts?category=2&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-24', '2018-10-24 11:42:12', '2018-10-24 11:42:12'),
(621, '127.0.0.1', 'djki-live.test/api/v1/posts?category=1&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 3, '2018-10-24', '2018-10-24 11:42:33', '2018-10-24 12:12:40'),
(622, '127.0.0.1', 'djki-live.test/api/v1/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 5, '2018-10-24', '2018-10-24 11:43:20', '2018-10-24 12:19:28'),
(623, '127.0.0.1', 'djki-live.test/api/v2/directory/1/filter?month=10&year=2018', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 7, '2018-10-24', '2018-10-24 11:53:31', '2018-10-24 12:02:24'),
(624, '127.0.0.1', 'djki-live.test/api/v2/directory/1/filter?month=all&year=all', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-24', '2018-10-24 12:02:49', '2018-10-24 12:12:30'),
(625, '127.0.0.1', 'djki-live.test/dtcms/album/list', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-24', '2018-10-24 12:03:11', '2018-10-24 12:11:55'),
(626, '127.0.0.1', 'djki-live.test/dtcms/album/list?page=2', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 7, '2018-10-24', '2018-10-24 12:03:16', '2018-10-24 12:12:08'),
(627, '127.0.0.1', 'djki-live.test/api/v2/posts/detail/17', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 6, '2018-10-24', '2018-10-24 12:13:17', '2018-10-24 12:19:00'),
(628, '127.0.0.1', 'djki.test/', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 4, '2018-10-25', '2018-10-25 11:59:58', '2018-10-25 12:10:51'),
(629, '127.0.0.1', 'djki.test/dtcms/album/list', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 5, '2018-10-25', '2018-10-25 12:00:11', '2018-10-25 12:01:00'),
(630, '127.0.0.1', 'djki.test/dtcms/album/list?page=2', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 4, '2018-10-25', '2018-10-25 12:00:15', '2018-10-25 12:01:14'),
(631, '127.0.0.1', 'djki.test/dtcms/album/list/data/delete', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-25', '2018-10-25 12:01:03', '2018-10-25 12:01:03'),
(632, '127.0.0.1', 'djki.test/api/v2/customizer?get=chat', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-25', '2018-10-25 12:03:11', '2018-10-25 12:09:57'),
(633, '127.0.0.1', 'djki.test/503', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-25', '2018-10-25 12:03:34', '2018-10-25 12:09:44'),
(634, '127.0.0.1', 'djki.test/dtcms/album/list/data/store', 'Google Chrome', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-25', '2018-10-25 12:09:31', '2018-10-25 12:09:31'),
(635, '127.0.0.1', 'djki.test/api/v2/posts?category=2&page=1', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-25', '2018-10-25 12:10:21', '2018-10-25 12:10:21'),
(636, '127.0.0.1', 'djki.test/api/v2/menus', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 2, '2018-10-25', '2018-10-25 13:47:20', '2018-10-25 13:47:35'),
(637, '127.0.0.1', 'djki.test/api/v2/pages/1?menu=9', 'Any browser', 'Dekstop', 'Indonesia', 'Sulawesi Selatan', 'Makassar', 1, '2018-10-25', '2018-10-25 13:47:46', '2018-10-25 13:47:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career`
--
ALTER TABLE `career`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries_images`
--
ALTER TABLE `galleries_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_archive`
--
ALTER TABLE `group_archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_album`
--
ALTER TABLE `media_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_about_team`
--
ALTER TABLE `pages_about_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_slide`
--
ALTER TABLE `pages_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_work`
--
ALTER TABLE `pages_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD UNIQUE KEY `password_resets_email_unique` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_category`
--
ALTER TABLE `posts_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `career`
--
ALTER TABLE `career`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries_images`
--
ALTER TABLE `galleries_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `group_archive`
--
ALTER TABLE `group_archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media_album`
--
ALTER TABLE `media_album`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages_about_team`
--
ALTER TABLE `pages_about_team`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages_slide`
--
ALTER TABLE `pages_slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages_work`
--
ALTER TABLE `pages_work`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `posts_category`
--
ALTER TABLE `posts_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=638;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
