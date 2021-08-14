-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 08:51 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dafpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE `format` (
  `id` int(5) NOT NULL,
  `style_id` int(5) NOT NULL,
  `type_id` int(5) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`id`, `style_id`, `type_id`, `content`) VALUES
(1, 1, 1, '{penulis_initial}. ({tahun}) {judul_italic}. {kota}: {penerbit}.'),
(2, 1, 2, '{penulis_initial}. ({tahun}) \'{judul}\', {nama_jurnal_italic}, {volume}({issue}), pp. {halaman}.'),
(3, 1, 4, '{penulis_initial}. ({tahun}) {nama_website_italic}. Available at: {url} (Accessed: {tanggal_diakses}).'),
(4, 1, 3, '{penulis_initial}. {tahun} \'{judul}\'. {nama_konferensi_italic}, {kota}.'),
(5, 2, 1, '{penulis}. {tahun}. {judul_italic}. {edisi}. {penerbit}. {kota}.'),
(6, 2, 2, '{penulis}. {tahun}. \"{judul}\": {nama_jurnal} {volume} ({issue}): {halaman}.'),
(7, 2, 4, '{penulis}. {tahun}. {nama_website}. {url}. Accessed on {tanggal_diakses}.');

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` varchar(12) NOT NULL,
  `reference_group_id` varchar(12) DEFAULT NULL,
  `type_id` int(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`id`, `reference_group_id`, `type_id`, `content`, `date_created`, `user`) VALUES
('R-1623752840', 'GR-162375280', 4, '{\"penulis\":\"Zainul Arifin\", \"nama_website\":\"Usai PSBB, Malang Raya Siap Masuk ke Masa Transisi New Normal\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://www.liputan6.com/regional/read/4264764/usai-psbb-malang-raya-siap-masuk-ke-masa-transisi-new-normal\"}', '2021-06-15 05:27:20', 'steady'),
('R-1623752899', 'GR-162375280', 1, '{\"penulis\":\"Thomas H. Davenport\", \"judul\":\"Process Innovation: Reengineering Work Through Information Technology\", \"tahun\":\"1993\", \"kota\":\"Cambridge\", \"penerbit\":\"Harvard Business Press\", \"edisi\":\"1st Edition\"}', '2021-06-15 15:34:00', 'steady'),
('R-1623752983', 'GR-162375280', 2, '{\"penulis\":\"Gerardine DeSanctis; Marshall Scott Poole\", \"judul\":\"Capturing the Complexity in Advanced Technology Use: Adaptive Structuration Theory\", \"nama_jurnal\":\"Organization Science\", \"tahun\":\"1994\", \"halaman\":\"121-147\", \"volume\":\"5\", \"issue\":\"2\"}', '2021-06-15 05:29:43', 'steady'),
('R-1623753049', 'GR-162375280', 1, '{\"penulis\":\"Dr. Rukin, S.Pd., M.Si.\", \"judul\":\"Metodologi Penelitian Kualitatif\", \"tahun\":\"2019\", \"kota\":\"Takalar\", \"penerbit\":\"Yayasan Ahmar Cendekia Indonesia\", \"edisi\":\"Edisi pertama\"}', '2021-06-15 15:33:27', 'steady'),
('R-1623753089', 'GR-162375280', 1, '{\"penulis\":\"Yrjö Engeström\", \"judul\":\"Developmental Work Research: Expanding Activity Theory in Practice\", \"tahun\":\"2005\", \"kota\":\"Berlin\", \"penerbit\":\"Lehmanns Media\", \"edisi\":\"1st Edition\"}', '2021-06-15 15:33:10', 'steady'),
('R-1623753121', 'GR-162375280', 2, '{\"penulis\":\"Faturochman\", \"judul\":\"The Job Characteristics Theory: A Review\", \"nama_jurnal\":\"Buletin Psikologi\", \"tahun\":\"1997\", \"halaman\":\"1-13\", \"volume\":\"5\", \"issue\":\"2\"}', '2021-06-15 05:32:01', 'steady'),
('R-1623753145', 'GR-162375280', 1, '{\"penulis\":\"John Kenneth Galbraith\", \"judul\":\"The New Industrial State\", \"tahun\":\"1967\", \"kota\":\"Boston\", \"penerbit\":\"Houghton Mifflin\", \"edisi\":\"1st\"}', '2021-06-15 05:32:25', 'steady'),
('R-1623753256', 'GR-162375280', 2, '{\"penulis\":\"Hans-Martin von Gaudecker; Radost Holler; Lena Janys; Bettina Siflinger; Christian Zimpelmann\", \"judul\":\"Labour Supply in the Early Stages of the COVID-19 Pandemic: Empirical Evidence on Hours, Home Office, and Expectations\", \"nama_jurnal\":\"IZA Discussion Paper\", \"tahun\":\"2020\", \"halaman\":\"\", \"volume\":\"\", \"issue\":\"13158\"}', '2021-06-15 05:34:16', 'steady'),
('R-1623753288', 'GR-162375280', 4, '{\"penulis\":\"Marchio Irfan Gorbiano\", \"nama_website\":\"BREAKING: Jokowi announces Indonesia’s first two confirmed COVID-19 cases\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://www.thejakartapost.com/news/2020/03/02/breaking-jokowi-announces-indonesias-first-two-confirmed-covid-19-cases.html\"}', '2021-06-15 05:34:48', 'steady'),
('R-1623753318', 'GR-162375280', 4, '{\"penulis\":\"Aakash Gupta\", \"nama_website\":\"The History Of Remote Work: How It Came To Be What It Is Today\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://www.sorryonmute.com/history-remote-work-industries/\"}', '2021-06-15 05:35:18', 'steady'),
('R-1623753468', 'GR-162375280', 4, '{\"penulis\":\"Nor Hazlina Hashim; M. L. Jones\", \"nama_website\":\"Activity theory: a framework for qualitative analysis\", \"tahun\":\"2007\", \"tanggal_diakses\":\"13 Juni 2021\", \"url\":\"https://ro.uow.edu.au/commpapers/408/\"}', '2021-06-15 05:37:48', 'steady'),
('R-1623753495', 'GR-162375280', 1, '{\"penulis\":\"Helaluddin; Hengki Wijaya\", \"judul\":\"Analisis Data Kualitatif: Sebuah Tinjauan Teori & Praktik\", \"tahun\":\"2019\", \"kota\":\"Makassar\", \"penerbit\":\"Sekolah Tinggi Theologia Jaffray\", \"edisi\":\"Edisi pertama\"}', '2021-06-15 15:33:44', 'steady'),
('R-1623753527', 'GR-162375280', 4, '{\"penulis\":\"Sjoerd van den Heuvel\", \"nama_website\":\"COVID-19 beats current technology acceptance theories\", \"tahun\":\"2020\", \"tanggal_diakses\":\"11 Januari 2021\", \"url\":\"https://www.linkedin.com/pulse/covid-19-beats-current-technology-acceptance-theories-van-den-heuvel\"}', '2021-06-15 05:38:47', 'steady'),
('R-1623753620', 'GR-162375280', 2, '{\"penulis\":\"Chaolin Huang; Yeming Wang; Xingwang Li; Lili Ren; Jianping Zhao; Yi Hu\", \"judul\":\"Clinical features of patients infected with 2019 novel coronavirus in Wuhan, China\", \"nama_jurnal\":\"The Lancet\", \"tahun\":\"2020\", \"halaman\":\"497-506\", \"volume\":\"395\", \"issue\":\"10223\"}', '2021-06-15 05:40:20', 'steady'),
('R-1623753655', 'GR-162375280', 4, '{\"penulis\":\"Joel\", \"nama_website\":\"Preparing for Large-Scale Remote Working in the Wake of COVID-19\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://www.itsecurityguru.org/2020/03/11/preparing-for-large-scale-remote-working-in-the-wake-of-covid-19/\"}', '2021-06-15 05:40:55', 'steady'),
('R-1623753677', 'GR-162375280', 4, '{\"penulis\":\"Sania Mashabi\", \"nama_website\":\"6 Bulan Pandemi Covid-19: Catatan tentang PSBB dan Penerapan Protokol Kesehatan...\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://nasional.kompas.com/read/2020/09/03/09002161/6-bulan-pandemi-covid-19-catatan-tentang-psbb-dan-penerapan-protokol?page=all\"}', '2021-06-15 05:41:17', 'steady'),
('R-1623753716', 'GR-162375280', 1, '{\"penulis\":\"Matthew B. Miles; A. Michael Huberman; Johnny Saldana\", \"judul\":\"Qualitative Data Analysis: A Methods Sourcebook\", \"tahun\":\"2018\", \"kota\":\"Thousand Oaks\", \"penerbit\":\"SAGE Publications\", \"edisi\":\"4th Edition\"}', '2021-06-15 05:41:56', 'steady'),
('R-1623753746', 'GR-162375280', 1, '{\"penulis\":\"Henry Mintzberg\", \"judul\":\"Power In and Around Organizations\", \"tahun\":\"1983\", \"kota\":\"Hoboken\", \"penerbit\":\"Prentice Hall\", \"edisi\":\"1st Edition\"}', '2021-06-15 05:42:26', 'steady'),
('R-1623753768', 'GR-162375280', 2, '{\"penulis\":\"Muslim\", \"judul\":\"Varian-varian Paradigma, Pendekatan, Metode, dan Jenis Penelitian dalam Ilmu Komunikasi\", \"nama_jurnal\":\"Wahana\", \"tahun\":\"2015\", \"halaman\":\"77-85\", \"volume\":\"1\", \"issue\":\"10\"}', '2021-06-15 05:42:48', 'steady'),
('R-1623753791', 'GR-162375280', 2, '{\"penulis\":\"Lisa Nagel\", \"judul\":\"The influence of the COVID-19 pandemic on the digital transformation of work\", \"nama_jurnal\":\"International Journal of Sociology and Social Policy\", \"tahun\":\"2020\", \"halaman\":\"861-875\", \"volume\":\"40\", \"issue\":\"9/10\"}', '2021-06-15 05:43:11', 'steady'),
('R-1623753817', 'GR-162375280', 2, '{\"penulis\":\"Sharon K. Parker; Gudela Grote\", \"judul\":\"Automation, Algorithms, and Beyond: Why Work Design Matters More Than Ever in A Digital World\", \"nama_jurnal\":\"Applied Psychology\", \"tahun\":\"2019\", \"halaman\":\"1-45\", \"volume\":\"0\", \"issue\":\"0\"}', '2021-06-15 05:43:37', 'steady'),
('R-1623753841', 'GR-162375280', 2, '{\"penulis\":\"Sharon K. Parker\", \"judul\":\"Beyond Motivation: Job and Work Design for Development, Health, Ambidexterity, and More\", \"nama_jurnal\":\"Annual Review of Psychology\", \"tahun\":\"2014\", \"halaman\":\"661-691\", \"volume\":\"65\", \"issue\":\"1\"}', '2021-06-15 05:44:01', 'steady'),
('R-1623753871', 'GR-162375280', 1, '{\"penulis\":\"Michael Quinn Patton\", \"judul\":\"Qualitative Evaluation Methods\", \"tahun\":\"1987\", \"kota\":\"Beverly Hills\", \"penerbit\":\"Sage Publications\", \"edisi\":\"1st Edition\"}', '2021-06-15 05:44:31', 'steady'),
('R-1623753895', 'GR-162375280', 4, '{\"penulis\":\"Mudjia Rahardjo\", \"nama_website\":\"Paradigma Interpretif\", \"tahun\":\"2018\", \"tanggal_diakses\":\"12 Juni 2021\", \"url\":\"http://repository.uin-malang.ac.id/2437/1/2437.pdf\"}', '2021-06-15 05:44:55', 'steady'),
('R-1623753967', 'GR-162375280', 2, '{\"penulis\":\"Mohammad Razif; Bobby Ardiansyah Miraja; Satria Fadil Persada; Reny Nadlifatin; Prawira Fajarindra Belgiawan; Anak Agung Ngurah Perwira Redi; Shu-Chiang Lin\", \"judul\":\"Investigating The Role of Environmental Concern and The Unified Theory of Acceptance and use of Technology on Working From Home Technologies Adoption During COVID-19\", \"nama_jurnal\":\"Entrepreneurship and Sustainability Issues\", \"tahun\":\"2020\", \"halaman\":\"795-808\", \"volume\":\"8\", \"issue\":\"1\"}', '2021-06-15 05:46:07', 'steady'),
('R-1623753998', 'GR-162375280', 2, '{\"penulis\":\"Richard J. Torraco\", \"judul\":\"Work Design Theory: A Review and Critique with Implications for Human Resource Development\", \"nama_jurnal\":\"Human Resource Development Quarterly\", \"tahun\":\"2005\", \"halaman\":\"85-109\", \"volume\":\"16\", \"issue\":\"1\"}', '2021-06-15 05:46:38', 'steady'),
('R-1623770736', 'GR-162375280', 1, '{\"penulis\":\"Anisa Vahed; Ashley Ross; Suzanne Francis; Bernie Millar; Oliver Mtapuri; Ruth Searle\", \"judul\":\"Research as Transformation and Transformation as Research\", \"tahun\":\"2018\", \"kota\":\"Stellenbosch\", \"penerbit\":\"African Sun Media\", \"edisi\":\"1st Edition\"}', '2021-06-15 10:25:36', 'steady'),
('R-1623770881', 'GR-162375280', 2, '{\"penulis\":\"Toby D. Wall; Chris W. Clegg; Paul R. Jackson\", \"judul\":\"An Evaluation of the Job Characteristics Model\", \"nama_jurnal\":\"Journal of Occupational Psychology\", \"tahun\":\"1978\", \"halaman\":\"183-196\", \"volume\":\"51\", \"issue\":\"2\"}', '2021-06-15 10:28:01', 'steady'),
('R-1623770943', 'GR-162375280', 4, '{\"penulis\":\"Gao Yu; Peng Yanfeng; Yang Rui; Feng Yuding; Ma Danmeng; Flynn Murphy; Han Wei; Timmy Shen\", \"nama_website\":\"In Depth: How Early Signs of a SARS-Like Virus Were Spotted, Spread, and Throttled\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 Februari 2021\", \"url\":\"https://www.caixinglobal.com/2020-02-29/in-depth-how-early-signs-of-a-sars-like-virus-were-spotted-spread-and-throttled-101521745.html\"}', '2021-06-15 15:31:37', 'steady');

-- --------------------------------------------------------

--
-- Table structure for table `reference_group`
--

CREATE TABLE `reference_group` (
  `id` varchar(12) NOT NULL,
  `nama` varchar(500) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_last_changed` date NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reference_group`
--

INSERT INTO `reference_group` (`id`, `nama`, `date_created`, `date_last_changed`, `user`) VALUES
('GR-162375280', 'Thesis', '2021-06-15 05:26:45', '2021-06-15', 'steady');

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `id` int(5) NOT NULL,
  `nama_style` varchar(25) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`id`, `nama_style`, `timestamp`, `user`) VALUES
(1, 'Harvard', '2021-06-15 06:05:42', 'steady'),
(2, 'FIA S2 MAB UB', '2021-06-15 10:17:42', '');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(5) NOT NULL,
  `nama_type` varchar(100) NOT NULL,
  `fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `nama_type`, `fields`) VALUES
(1, 'Buku', '[\"penulis\", \"judul\", \"tahun\", \"kota\", \"penerbit\", \"edisi\"]'),
(2, 'Jurnal', '[\"penulis\", \"judul\", \"nama_jurnal\", \"tahun\", \"halaman\", \"volume\", \"issue\"]'),
(3, 'Prosiding', '[\"penulis\", \"judul\", \"tahun\", \"nama_konferensi\", \"kota\"]'),
(4, 'Website', '[\"penulis\", \"nama_website\", \"tahun\", \"tanggal_diakses\", \"url\"]'),
(5, 'Skripsi/Makalah', '[\"penulis\", \"judul\", \"tahun\", \"fakultas\", \"prodi\", \"universitas\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `style_id` (`style_id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citation_group_id` (`reference_group_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `reference_group`
--
ALTER TABLE `reference_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `format`
--
ALTER TABLE `format`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `format`
--
ALTER TABLE `format`
  ADD CONSTRAINT `format_ibfk_1` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`),
  ADD CONSTRAINT `format_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`reference_group_id`) REFERENCES `reference_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
