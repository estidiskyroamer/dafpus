-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 05:21 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

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
(5, 2, 1, '{penulis_initial}. {tahun}. {judul_italic}. {edisi}. {penerbit}. {kota}.'),
(6, 2, 2, '{penulis_initial}. {tahun}. \"{judul}\": {nama_jurnal_italic} {volume_bold} ({issue}): {halaman}.'),
(7, 2, 4, '{penulis_initial}. {tahun}. {nama_website}. {url}. Accessed on {tanggal_diakses}.');

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
('R-1628927800', 'GR-162375280', 1, '{\"penulis\":\"Tim TIK UB-corporate\", \"judul\":\"Panduan VPN L2TP Universitas Brawijaya\", \"tahun\":\"2018\", \"kota\":\"Malang\", \"penerbit\":\"TIK UB\", \"edisi\":\"\"}', '2021-08-14 02:56:40', 'steady'),
('R-1628927896', 'GR-162375280', 1, '{\"penulis\":\"Tim Universitas Brawijaya-corporate\", \"judul\":\"Panduan Pembelajaran Daring Saat Kondisi Darurat COVID-19\", \"tahun\":\"2020\", \"kota\":\"Malang\", \"penerbit\":\"Universitas Brawijaya\", \"edisi\":\"\"}', '2021-08-14 02:58:16', 'steady'),
('R-1628927959', 'GR-162375280', 1, '{\"penulis\":\"Menteri Kesehatan Republik Indonesia-corporate\", \"judul\":\"PERATURAN MENTERI KESEHATAN REPUBLIK INDONESIA NOMOR 9 TAHUN 2020 TENTANG PEDOMAN PEMBATASAN SOSIAL BERSKALA BESAR DALAM RANGKA PERCEPATAN PENANGANAN CORONA VIRUS DISEASE 2019 (COVID-19)\", \"tahun\":\"2020\", \"kota\":\"Jakarta\", \"penerbit\":\"Sekretariat Negara\", \"edisi\":\"\"}', '2021-08-14 02:59:19', 'steady'),
('R-1628928001', 'GR-162375280', 1, '{\"penulis\":\"JALA Associates, Inc.-corporate\", \"judul\":\"Telecommunications and Energy: The Energy Conservation Implications for California of Telecommunications Substitutes for Transportation\", \"tahun\":\"1983\", \"kota\":\"Sacramento\", \"penerbit\":\"California Energy Commission\", \"edisi\":\"\"}', '2021-08-14 03:00:01', 'steady'),
('R-1628928044', 'GR-162375280', 4, '{\"penulis\":\"Universitas Brawijaya-corporate\", \"nama_website\":\"Website Universitas Brawijaya\", \"tahun\":\"2021\", \"tanggal_diakses\":\"10 March 2021\", \"url\":\"https://ub.ac.id/about/ub-by-the-number/\"}', '2021-08-14 03:00:44', 'steady'),
('R-1628928102', 'GR-162375280', 4, '{\"penulis\":\"Theros Adanom\", \"nama_website\":\"WHO Director-General\'s opening remarks at the media briefing on COVID-19 - 11 March 2020\", \"tahun\":\"2020\", \"tanggal_diakses\":\"3 March 2021\", \"url\":\"https://www.who.int/director-general/speeches/detail/who-director-general-s-opening-remarks-at-the-media-briefing-on-covid-19---11-march-2020\"}', '2021-08-14 03:01:42', 'steady'),
('R-1628928195', 'GR-162375280', 4, '{\"penulis\":\"Zainul Arifin\", \"nama_website\":\"Usai PSBB, Malang Raya Siap Masuk ke Masa Transisi New Normal\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://www.liputan6.com/regional/read/4264764/usai-psbb-malang-raya-siap-masuk-ke-masa-transisi-new-normal\"}', '2021-08-14 03:03:15', 'steady'),
('R-1628928267', 'GR-162375280', 4, '{\"penulis\":\"Lingfeng Bao; Tao Li; Xin Xia; Kaiyu Zhu; Hui Li; Xiaohu Yang\", \"nama_website\":\"How does Working from Home Affect Developer Productivity? A Case Study of Baidu During the COVID-19 Pandemic\", \"tahun\":\"2021\", \"tanggal_diakses\":\"20 June 2021\", \"url\":\"https://arxiv.org/abs/2005.13167\"}', '2021-08-14 03:04:27', 'steady'),
('R-1628928332', 'GR-162375280', 2, '{\"penulis\":\"France Bélanger; Mary Beth Watson-Manheim; Bret R. Swan\", \"judul\":\"A multi-level socio-technical systems telecommuting framework\", \"nama_jurnal\":\"Behaviour & Information Technology\", \"tahun\":\"2013\", \"halaman\":\"1257-1279\", \"volume\":\"32\", \"issue\":\"12\"}', '2021-08-14 03:05:32', 'steady'),
('R-1628928379', 'GR-162375280', 1, '{\"penulis\":\"Thomas H. Davenport\", \"judul\":\"Process Innovation: Reengineering Work Through Information Technology\", \"tahun\":\"1993\", \"kota\":\"Cambridge\", \"penerbit\":\"Harvard Business Press\", \"edisi\":\"\"}', '2021-08-14 03:06:19', 'steady'),
('R-1628928415', 'GR-162375280', 2, '{\"penulis\":\"Gerardine DeSanctis; Marshall Scott Poole\", \"judul\":\"Capturing the Complexity in Advanced Technology Use: Adaptive Structuration Theory\", \"nama_jurnal\":\"Organization Science\", \"tahun\":\"1994\", \"halaman\":\"121-147\", \"volume\":\"5\", \"issue\":\"2\"}', '2021-08-14 03:06:55', 'steady'),
('R-1628928488', 'GR-162375280', 1, '{\"penulis\":\"Dr. Rukin, S.Pd., M.Si.-corporate\", \"judul\":\"Metodologi Penelitian Kualitatif\", \"tahun\":\"2019\", \"kota\":\"Takalar\", \"penerbit\":\"Yayasan Ahmar Cendekia Indonesia\", \"edisi\":\"\"}', '2021-08-14 03:08:08', 'steady'),
('R-1628928538', 'GR-162375280', 1, '{\"penulis\":\"Yrjö Engeström\", \"judul\":\"Developmental Work Research: Expanding Activity Theory in Practice\", \"tahun\":\"2005\", \"kota\":\"Berlin\", \"penerbit\":\"Lehmanns Media\", \"edisi\":\"\"}', '2021-08-14 03:08:58', 'steady'),
('R-1628928575', 'GR-162375280', 2, '{\"penulis\":\"Faturochman\", \"judul\":\"The Job Characteristics Theory: A Review\", \"nama_jurnal\":\"Buletin Psikologi\", \"tahun\":\"1997\", \"halaman\":\"1-13\", \"volume\":\"5\", \"issue\":\"2\"}', '2021-08-14 03:09:35', 'steady'),
('R-1628928621', 'GR-162375280', 2, '{\"penulis\":\"Hans-Martin von Gaudecker; Radost Holler; Lena Janys; Bettina Siflinger; Christian Zimpelmann\", \"judul\":\"Labour Supply in the Early Stages of the COVID-19 Pandemic: Empirical Evidence on Hours, Home Office, and Expectations\", \"nama_jurnal\":\"IZA Discussion Paper\", \"tahun\":\"2020\", \"halaman\":\"1-25\", \"volume\":\"\", \"issue\":\"13158\"}', '2021-08-23 02:44:47', 'steady'),
('R-1628928679', 'GR-162375280', 2, '{\"penulis\":\"Timothy D. Golden; John F. Veiga\", \"judul\":\"The Impact of Extent of Telecommuting on Job Satisfaction: Resolving Inconsistent Findings\", \"nama_jurnal\":\"Journal of Management\", \"tahun\":\"2005\", \"halaman\":\"301-318\", \"volume\":\"31\", \"issue\":\"2\"}', '2021-08-14 03:11:19', 'steady'),
('R-1628928717', 'GR-162375280', 4, '{\"penulis\":\"Marchio Irfan Gorbiano\", \"nama_website\":\"BREAKING: Jokowi announces Indonesia’s first two confirmed COVID-19 cases\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://www.thejakartapost.com/news/2020/03/02/breaking-jokowi-announces-indonesias-first-two-confirmed-covid-19-cases.html\"}', '2021-08-14 03:11:57', 'steady'),
('R-1628928752', 'GR-162375280', 4, '{\"penulis\":\"Aakash Gupta\", \"nama_website\":\"The History Of Remote Work: How It Came To Be What It Is Today\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://www.sorryonmute.com/history-remote-work-industries/\"}', '2021-08-14 03:12:32', 'steady'),
('R-1628928867', 'GR-162375280', 4, '{\"penulis\":\"Nur Hazlina Hashim; M. L. Jones\", \"nama_website\":\"Activity Theory: A framework for qualitative analysis\", \"tahun\":\"2007\", \"tanggal_diakses\":\"13 June 2021\", \"url\":\"http://ro.uow.edu.au/commpapers/408\"}', '2021-08-14 03:14:27', 'steady'),
('R-1628928902', 'GR-162375280', 1, '{\"penulis\":\"Helaluddin; Hengki Wijaya\", \"judul\":\"Analisis Data Kualitatif: Sebuah Tinjauan Teori & Praktik\", \"tahun\":\"2019\", \"kota\":\"Makassar\", \"penerbit\":\"Sekolah Tinggi Theologia Jaffray\", \"edisi\":\"\"}', '2021-08-14 03:15:02', 'steady'),
('R-1628928943', 'GR-162375280', 2, '{\"penulis\":\"Chaolin Huang; Yeming Wang; Xingwang Li; Lili Ren; Jianping Zhao; Yi Hu\", \"judul\":\"Clinical features of patients infected with 2019 novel coronavirus in Wuhan, China\", \"nama_jurnal\":\"The Lancet\", \"tahun\":\"2020\", \"halaman\":\"497-506\", \"volume\":\"\", \"issue\":\"\"}', '2021-08-14 03:15:43', 'steady'),
('R-1628928968', 'GR-162375280', 4, '{\"penulis\":\"Joel\", \"nama_website\":\"Preparing for Large-Scale Remote Working in the Wake of COVID-19\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://www.itsecurityguru.org/2020/03/11/preparing-for-large-scale-remote-working-in-the-wake-of-covid-19/\"}', '2021-08-14 03:16:08', 'steady'),
('R-1628929004', 'GR-162375280', 2, '{\"penulis\":\"Anne Kaduk; Katie Genadek; Erin L. Kelly; Phyllis Moen\", \"judul\":\"Involuntary vs. voluntary flexible work: insights for scholars and stakeholders\", \"nama_jurnal\":\"Community, Work & Family\", \"tahun\":\"2019\", \"halaman\":\"412-442\", \"volume\":\"22\", \"issue\":\"4\"}', '2021-08-14 03:16:44', 'steady'),
('R-1628929037', 'GR-162375280', 1, '{\"penulis\":\"Yvonna S. Lincoln; Egon G. Guba\", \"judul\":\"Naturalistic Inquiry\", \"tahun\":\"1985\", \"kota\":\"Beverly Hills\", \"penerbit\":\"Sage Publications\", \"edisi\":\"\"}', '2021-08-14 03:17:17', 'steady'),
('R-1628929065', 'GR-162375280', 4, '{\"penulis\":\"Sania Mashabi\", \"nama_website\":\"6 Bulan Pandemi Covid-19: Catatan tentang PSBB dan Penerapan Protokol Kesehatan...\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://nasional.kompas.com/read/2020/09/03/09002161/6-bulan-pandemi-covid-19-catatan-tentang-psbb-dan-penerapan-protokol?page=all\"}', '2021-08-14 03:17:45', 'steady'),
('R-1628929109', 'GR-162375280', 1, '{\"penulis\":\"Matthew B. Miles; A. Michael Huberman; Johnny Saldana\", \"judul\":\"Qualitative Data Analysis: A Methods Sourcebook\", \"tahun\":\"2018\", \"kota\":\"Thousand Oaks\", \"penerbit\":\"SAGE Publications\", \"edisi\":\"4th Edition\"}', '2021-08-14 03:18:29', 'steady'),
('R-1628929145', 'GR-162375280', 1, '{\"penulis\":\"Patricia Lyon Mokhtarian\", \"judul\":\"Defining Telecommuting\", \"tahun\":\"1991\", \"kota\":\"Davis\", \"penerbit\":\"UC Davis: Institute of Transportation Studies\", \"edisi\":\"\"}', '2021-08-14 03:19:05', 'steady'),
('R-1628929194', 'GR-162375280', 2, '{\"penulis\":\"Valerie J. Morganson; Debra A. Major; Kurt L. Oborn; Jennifer M. Verive; Michelle P. Heelan\", \"judul\":\"Comparing telework locations and traditional work arrangements: Differences in work‐life balance support, job satisfaction, and inclusion\", \"nama_jurnal\":\"Journal of Managerial Psychology\", \"tahun\":\"2010\", \"halaman\":\"578-595\", \"volume\":\"25\", \"issue\":\"6\"}', '2021-08-14 03:19:54', 'steady'),
('R-1628929220', 'GR-162375280', 2, '{\"penulis\":\"Oswar Mungkasa\", \"judul\":\"Bekerja dari Rumah (Working From Home/WFH): Menuju Tatanan Baru Era Pandemi COVID 19\", \"nama_jurnal\":\"The Indonesian Journal of Development Planning\", \"tahun\":\"2020\", \"halaman\":\"126-150\", \"volume\":\"4\", \"issue\":\"2\"}', '2021-08-14 03:20:20', 'steady'),
('R-1628929246', 'GR-162375280', 2, '{\"penulis\":\"Muslim\", \"judul\":\"Varian-varian Paradigma, Pendekatan, Metode, dan Jenis Penelitian dalam Ilmu Komunikasi\", \"nama_jurnal\":\"Wahana\", \"tahun\":\"2015\", \"halaman\":\"77-85\", \"volume\":\"1\", \"issue\":\"10\"}', '2021-08-14 03:20:46', 'steady'),
('R-1628929278', 'GR-162375280', 2, '{\"penulis\":\"Lisa Nagel\", \"judul\":\"The influence of the COVID-19 pandemic on the digital transformation of work\", \"nama_jurnal\":\"International Journal of Sociology and Social Policy\", \"tahun\":\"2020\", \"halaman\":\"861-875\", \"volume\":\"40\", \"issue\":\"9/10\"}', '2021-08-14 03:21:18', 'steady'),
('R-1628929304', 'GR-162375280', 2, '{\"penulis\":\"Sharon K. Parker; Gudela Grote\", \"judul\":\"Automation, Algorithms, and Beyond: Why Work Design Matters More Than Ever in A Digital World\", \"nama_jurnal\":\"Applied Psychology\", \"tahun\":\"2019\", \"halaman\":\"1-45\", \"volume\":\"0\", \"issue\":\"0\"}', '2021-08-14 03:21:44', 'steady'),
('R-1628929327', 'GR-162375280', 2, '{\"penulis\":\"Sharon K. Parker\", \"judul\":\"Beyond Motivation: Job and Work Design for Development, Health, Ambidexterity, and More\", \"nama_jurnal\":\"Annual Review of Psychology\", \"tahun\":\"2014\", \"halaman\":\"661-691\", \"volume\":\"65\", \"issue\":\"1\"}', '2021-08-14 03:22:07', 'steady'),
('R-1628929354', 'GR-162375280', 1, '{\"penulis\":\"Michael Quinn Patton\", \"judul\":\"Qualitative Evaluation Methods\", \"tahun\":\"1987\", \"kota\":\"Beverly Hills\", \"penerbit\":\"SAGE Publications\", \"edisi\":\"\"}', '2021-08-14 03:22:34', 'steady'),
('R-1628929387', 'GR-162375280', 4, '{\"penulis\":\"Mudjia Rahardjo\", \"nama_website\":\"Paradigma Interpretif\", \"tahun\":\"2018\", \"tanggal_diakses\":\"12 June 2021\", \"url\":\"http://repository.uin-malang.ac.id/2437/1/2437.pdf\"}', '2021-08-14 03:23:07', 'steady'),
('R-1628929433', 'GR-162375280', 4, '{\"penulis\":\"Adil Abdul Rahman; Khalid Alharthi\", \"nama_website\":\"An introduction to research paradigms\", \"tahun\":\"2018\", \"tanggal_diakses\":\"07 August 2021\", \"url\":\"https://www.researchgate.net/publication/325022648\"}', '2021-08-14 03:23:53', 'steady'),
('R-1628929458', 'GR-162375280', 1, '{\"penulis\":\"Samsu, S.Ag., M.Pd.I., Ph.D.-corporate\", \"judul\":\"Metode Penelitian: Teori dan Aplikasi Penelitian Kualitatif, Kuantitatif, Mixed Methods, serta Research & Development\", \"tahun\":\"2017\", \"kota\":\"Jambi\", \"penerbit\":\"Pusaka\", \"edisi\":\"\"}', '2021-08-14 03:24:18', 'steady'),
('R-1628929489', 'GR-162375280', 2, '{\"penulis\":\"Stuart Sanders; Joanna Karmowska\", \"judul\":\"Voluntary flexible working arrangements and their effects on managers and employees\", \"nama_jurnal\":\"Harvard Deusto Business Research\", \"tahun\":\"2020\", \"halaman\":\"197-220\", \"volume\":\"9\", \"issue\":\"2\"}', '2021-08-14 03:24:49', 'steady'),
('R-1628929514', 'GR-162375280', 2, '{\"penulis\":\"Richard J. Torraco\", \"judul\":\"Work Design Theory: A Review and Critique with Implications for Human Resource Development\", \"nama_jurnal\":\"Human Resource Development Quarterly\", \"tahun\":\"2005\", \"halaman\":\"85-109\", \"volume\":\"16\", \"issue\":\"1\"}', '2021-08-14 03:25:14', 'steady'),
('R-1628929548', 'GR-162375280', 2, '{\"penulis\":\"Toby D. Wall; Chris W. Clegg; Paul R. Jackson\", \"judul\":\"An Evaluation of the Job Characteristics Model\", \"nama_jurnal\":\"Journal of Occupational Psychology\", \"tahun\":\"1978\", \"halaman\":\"183-196\", \"volume\":\"51\", \"issue\":\"2\"}', '2021-08-14 03:25:48', 'steady'),
('R-1628929583', 'GR-162375280', 2, '{\"penulis\":\"Bin Wang; Yukun Lui; Jing Qian; Sharon K. Parker\", \"judul\":\"Achieving Effective Remote Working During the COVID‐19 Pandemic: A Work Design Perspective\", \"nama_jurnal\":\"Applied Psychology\", \"tahun\":\"2020\", \"halaman\":\"16-59\", \"volume\":\"70\", \"issue\":\"1\"}', '2021-08-14 03:26:23', 'steady'),
('R-1628929618', 'GR-162375280', 2, '{\"penulis\":\"Bin Wang; Yukun Liu; Sharon K. Parker\", \"judul\":\"How Does The Use of Information Communication Technology Affects Individuals? A Work Design Perspective\", \"nama_jurnal\":\"Academy of Management Annals\", \"tahun\":\"2020\", \"halaman\":\"1-73\", \"volume\":\"14\", \"issue\":\"2\"}', '2021-08-14 03:26:58', 'steady'),
('R-1628929646', 'GR-162375280', 2, '{\"penulis\":\"Johan Wiklund\", \"judul\":\"Working in Bed ‐ A commentary on “Automation, Algorithms, and Beyond: Why Work Design Matters More Than Ever in A Digital World” by Parker and Grote\", \"nama_jurnal\":\"Applied Psychology\", \"tahun\":\"2020\", \"halaman\":\"1-6\", \"volume\":\"0\", \"issue\":\"0\"}', '2021-08-14 03:27:26', 'steady'),
('R-1628929687', 'GR-162375280', 2, '{\"penulis\":\"Yijing Xiao; Burcin Becerik-Gerber; Lucas Gale; Shawn C. Roll\", \"judul\":\"Impacts of Working From Home During COVID-19 Pandemic on Physical and Mental Well-Being of Office Workstation Users\", \"nama_jurnal\":\"Journal of occupational and environmental medicine\", \"tahun\":\"2021\", \"halaman\":\"181-190\", \"volume\":\"63\", \"issue\":\"3\"}', '2021-08-14 03:28:07', 'steady'),
('R-1628929812', 'GR-162375280', 4, '{\"penulis\":\"Yu Gao; Yanfeng Peng; Rui Yang; Yuding Feng; Danmeng Ma; Flynn Murphy; Wei Han; Timmy Shen\", \"nama_website\":\"In Depth: How Early Signs of a SARS-Like Virus Were Spotted, Spread, and Throttled\", \"tahun\":\"2020\", \"tanggal_diakses\":\"28 February 2021\", \"url\":\"https://www.caixinglobal.com/2020-02-29/in-depth-how-early-signs-of-a-sars-like-virus-were-spotted-spread-and-throttled-101521745.html\"}', '2021-08-14 03:30:12', 'steady');

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
