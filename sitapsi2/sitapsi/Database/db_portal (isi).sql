-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Apr 2026 pada 07.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_portal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('SuperAdmin','Admin') DEFAULT 'SuperAdmin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `nama_lengkap`, `role`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Super Admin Tatib', 'SuperAdmin', '2026-04-02 04:49:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota_kelas`
--

CREATE TABLE `tb_anggota_kelas` (
  `id_anggota` bigint(20) NOT NULL,
  `no_induk` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL,
  `poin_kelakuan` int(11) DEFAULT 0,
  `poin_kerajinan` int(11) DEFAULT 0,
  `poin_kerapian` int(11) DEFAULT 0,
  `total_poin_umum` int(11) DEFAULT 0,
  `status_sp_kelakuan` enum('Aman','SP1','SP2','SP3','Sanksi oleh Sekolah') DEFAULT 'Aman',
  `status_sp_kerajinan` enum('Aman','SP1','SP2','SP3','Sanksi oleh Sekolah') DEFAULT 'Aman',
  `status_sp_kerapian` enum('Aman','SP1','SP2','SP3','Sanksi oleh Sekolah') DEFAULT 'Aman',
  `status_sp_terakhir` enum('Aman','SP1','SP2','SP3','Sanksi oleh Sekolah') DEFAULT 'Aman',
  `status_reward` enum('None','Kandidat Reward Semester','Kandidat Sertifikat') DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_anggota_kelas`
--

INSERT INTO `tb_anggota_kelas` (`id_anggota`, `no_induk`, `id_kelas`, `id_tahun`, `poin_kelakuan`, `poin_kerajinan`, `poin_kerapian`, `total_poin_umum`, `status_sp_kelakuan`, `status_sp_kerajinan`, `status_sp_kerapian`, `status_sp_terakhir`, `status_reward`) VALUES
(1, '1127', 15, 1, 0, 0, 0, 0, 'Aman', 'Aman', 'Aman', 'Aman', 'None'),
(2, '2024001', 1, 1, 0, 0, 0, 0, 'Aman', 'Aman', 'Aman', 'Aman', 'None'),
(3, '2025002', 2, 1, 0, 0, 0, 0, 'Aman', 'Aman', 'Aman', 'Aman', 'None');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_aturan_sp`
--

CREATE TABLE `tb_aturan_sp` (
  `id_aturan_sp` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `level_sp` enum('SP1','SP2','SP3','Sanksi oleh Sekolah') NOT NULL,
  `batas_bawah_poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_aturan_sp`
--

INSERT INTO `tb_aturan_sp` (`id_aturan_sp`, `id_kategori`, `level_sp`, `batas_bawah_poin`) VALUES
(1, 1, 'SP1', 250),
(2, 1, 'SP2', 750),
(3, 1, 'SP3', 1500),
(4, 1, 'Sanksi oleh Sekolah', 2000),
(5, 2, 'SP1', 75),
(6, 2, 'SP2', 300),
(7, 2, 'SP3', 450),
(8, 2, 'Sanksi oleh Sekolah', 600),
(9, 3, 'SP1', 100),
(10, 3, 'SP2', 300),
(11, 3, 'SP3', 450),
(12, 3, 'Sanksi oleh Sekolah', 600);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `kode_guru` varchar(10) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `pin_validasi` varchar(6) NOT NULL,
  `status` enum('Aktif','Non-Aktif') DEFAULT 'Aktif',
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `homebase` varchar(50) DEFAULT NULL,
  `isBK` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nama_guru`, `nip`, `kode_guru`, `id_kelas`, `pin_validasi`, `status`, `email`, `phone`, `mapel`, `homebase`, `isBK`, `created_at`) VALUES
(1, 'Sr. M. Elfrida Suhartati, SPM, S.Psi.,MM', '10001', '1', NULL, '123456', 'Aktif', 'guru1@sekolah.id', NULL, '-', '-', 0, '2026-04-02 04:50:43'),
(2, 'Antonetta Maria Kuntodiati, S.Pd', '10002', '2', NULL, '123456', 'Aktif', 'guru2@sekolah.id', NULL, 'Ilmu Pengetahuan Alam (IX)', 'Lab Fisika', 0, '2026-04-02 04:50:43'),
(3, 'Dra. Maria Marsiti', '10003', '3', NULL, '123456', 'Aktif', 'guru3@sekolah.id', NULL, 'Bimbingan Konseling (IX), Bahasa Daerah (VII, VIII, IX)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(4, 'Trianto Thomas, S.Pd', '10004', '4', NULL, '123456', 'Aktif', 'guru4@sekolah.id', NULL, 'Bahasa Indonesia (IX)', 'Ruang B. Indonesia 9', 0, '2026-04-02 04:50:43'),
(5, 'Agustina Peni Sarasati, S.Pd', '10005', '5', NULL, '123456', 'Aktif', 'guru5@sekolah.id', NULL, 'Matematika (VII)', 'Ruang Matematika 7', 0, '2026-04-02 04:50:43'),
(6, 'Y. Pamungkas, S.Pd', '10006', '6', NULL, '123456', 'Aktif', 'guru6@sekolah.id', NULL, 'Ilmu Pengetahuan Sosial (VII, VIII)', 'Ruang Geografi', 0, '2026-04-02 04:50:43'),
(7, 'Joseph Andiek Kristian, S.Pd, S.Kom', '10007', '7', NULL, '123456', 'Aktif', 'guru7@sekolah.id', NULL, 'Informatika (VIII, IX)', 'Laboratorium Komputer', 0, '2026-04-02 04:50:43'),
(8, 'Albertha Yulanti Susetyo, M.Pd', '10008', '8', NULL, '123456', 'Aktif', 'guru8@sekolah.id', NULL, 'Matematika (IX)', 'Ruang Matematika 9', 0, '2026-04-02 04:50:43'),
(9, 'Galang Bagus Afridianto, M.Pd', '10009', '9', NULL, '123456', 'Aktif', 'guru9@sekolah.id', NULL, 'Ilmu Pengetahuan Sosial (VIII, IX)', 'Ruang IPS', 0, '2026-04-02 04:50:43'),
(10, 'Hendrik Kiswanto, S.Pd.', '10010', '10', NULL, '123456', 'Aktif', 'guru10@sekolah.id', NULL, 'Seni Budaya (VII, VIII, IX)', 'Ruang Prakarya', 0, '2026-04-02 04:50:43'),
(11, 'Margareta Esti Wulan, S.Pd.', '10011', '11', NULL, '123456', 'Aktif', 'guru11@sekolah.id', NULL, 'Ilmu Pengetahuan Alam (VIII)', 'Lab Biologi', 0, '2026-04-02 04:50:43'),
(12, 'Theresia Sri Wahyuni, S.Pd, M.M.', '10012', '12', NULL, '123456', 'Aktif', 'guru12@sekolah.id', NULL, 'Bimbingan Konseling (VII, VIII)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(13, 'Yosua Beni Setiawan, S.Pd.', '10014', '14', NULL, '123456', 'Aktif', 'guru14@sekolah.id', NULL, 'Bahasa Inggris (VIII)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(14, 'God Life Endob Mesak, S.Pd', '10015', '15', NULL, '123456', 'Aktif', 'guru15@sekolah.id', NULL, 'Pendidikan Jasmani Olahraga dan Kesehatan (VIII, IX)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(15, 'Agnes Herawaty Sinurat, S.E., M.M.', '10016', '16', NULL, '123456', 'Aktif', 'guru16@sekolah.id', NULL, 'Ilmu Pengetahuan Sosial (VII), Pendidikan Kewarganegaraan (VIII, IX)', 'Ruang Kewarganegaraan', 0, '2026-04-02 04:50:43'),
(16, 'Deka Nanda Kurniawati, S.Pd.', '10017', '17', NULL, '123456', 'Aktif', 'guru17@sekolah.id', NULL, 'Bahasa Inggris (VII)', 'Ruang B.Inggris 7', 0, '2026-04-02 04:50:43'),
(17, 'Agatha Novenia Bintang Prieska, S.Pd.', '10018', '18', NULL, '123456', 'Aktif', 'guru18@sekolah.id', NULL, 'Bahasa Indonesia (VIII)', 'Ruang B. Indonesia 8', 0, '2026-04-02 04:50:43'),
(18, 'Bernadetha Devia Tindy Noveyra, S.Pd.', '10019', '19', NULL, '123456', 'Aktif', 'guru19@sekolah.id', NULL, 'Pendidikan Agama (VII, IX)', 'Ruang Agama', 0, '2026-04-02 04:50:43'),
(19, 'Drs. Albertus Magnus Meo Depa', '10020', '20', NULL, '123456', 'Aktif', 'guru20@sekolah.id', NULL, 'Bahasa Inggris (IX)', 'Ruang B.Inggris 9', 0, '2026-04-02 04:50:43'),
(20, 'Giovani Bimby Dwiantonio, S.Pd', '10021', '21', NULL, '123456', 'Aktif', 'guru21@sekolah.id', NULL, 'Pendidikan Agama (VII, VIII), Team Teaching (VII)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(21, 'Arnoldus Kobe Tegar Felix Sai, S.Pd.', '10022', '22', NULL, '123456', 'Aktif', 'guru22@sekolah.id', NULL, 'Matematika (VIII)', 'Ruang Matematika 8', 0, '2026-04-02 04:50:43'),
(22, 'Haniar Mey Sila Kinanti, S.Pd.', '10023', '23', NULL, '123456', 'Aktif', 'guru23@sekolah.id', NULL, 'Ilmu Pengetahuan Alam (VII)', 'Laboratorium IPA', 0, '2026-04-02 04:50:43'),
(23, 'Anjelina Wulandari Sitina De Sareng, S.Pd', '10024', '24', NULL, '123456', 'Aktif', 'guru24@sekolah.id', NULL, 'Pendidikan Kewarganegaraan (VII, VIII), Team Teaching (VIII)', 'Ruang PPKN', 0, '2026-04-02 04:50:43'),
(24, 'Lydia Uli Permatasari, S.Pd.', '10025', '25', NULL, '123456', 'Aktif', 'guru25@sekolah.id', NULL, 'Pendidikan Jasmani Olahraga dan Kesehatan (VII, VIII), Team Teaching (VIII)', 'Tidak ada', 0, '2026-04-02 04:50:43'),
(25, 'Albertus Bayu Seto, S.Pd', '10026', '26', NULL, '123456', 'Aktif', 'guru26@sekolah.id', NULL, 'Bahasa Inggris (VII, VIII, IX)', 'Ruang B Inggris 8', 0, '2026-04-02 04:50:43'),
(26, 'Brigita Natalia Setyaningrum, S.Pd.', '10027', '27', NULL, '123456', 'Aktif', 'guru27@sekolah.id', NULL, 'Bahasa Indonesia (VII)', 'Ruang B. Indonesia 7', 0, '2026-04-02 04:50:43'),
(27, 'Amelia Rangel Da Silva, S.Pd', '10028', '28', NULL, '123456', 'Aktif', 'guru28@sekolah.id', NULL, 'Seni Musik (VII)', 'Ruang Seni Musik', 0, '2026-04-02 04:50:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_izin`
--

CREATE TABLE `tb_izin` (
  `id_izin` int(11) NOT NULL,
  `no_induk` varchar(50) NOT NULL,
  `parent_email` varchar(100) DEFAULT NULL,
  `tipe` enum('IZIN','SAKIT') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `selfie_url` mediumtext DEFAULT NULL,
  `attachment_url` mediumtext DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
  `review_notes` text DEFAULT NULL,
  `reviewed_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `slot` varchar(20) NOT NULL,
  `time_range` varchar(50) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `kode_guru` varchar(10) DEFAULT NULL,
  `subject_hint` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_pelanggaran`
--

CREATE TABLE `tb_jenis_pelanggaran` (
  `id_jenis` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `sub_kategori` varchar(100) DEFAULT NULL,
  `nama_pelanggaran` text NOT NULL,
  `poin_default` int(11) NOT NULL,
  `sanksi_default` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jenis_pelanggaran`
--

INSERT INTO `tb_jenis_pelanggaran` (`id_jenis`, `id_kategori`, `sub_kategori`, `nama_pelanggaran`, `poin_default`, `sanksi_default`) VALUES
(1, 1, '01. Kegiatan Sekolah', 'Tidak mengikuti kegiatan wajib sekolah / upacara tanpa keterangan.', 100, '5'),
(2, 1, '01. Kegiatan Sekolah', 'Bergurau/tidak tertib saat kegiatan berlangsung', 100, '5'),
(3, 1, '02. Sikap & Moral', 'Berkata tidak sopan/kasar/jorok', 100, '1'),
(4, 1, '02. Sikap & Moral', 'Mencuri/memalak/meminta paksa', 500, '1,4,7'),
(5, 1, '02. Sikap & Moral', 'Berbohong', 100, '1'),
(6, 1, '02. Sikap & Moral', 'Menghina/mengejek Guru/Karyawan', 200, '1,5'),
(7, 1, '02. Sikap & Moral', 'Menghina/mengejek Siswa/Teman', 100, '1'),
(8, 1, '02. Sikap & Moral', 'Perundungan (Bullying)', 100, '1,5,7,8,9'),
(9, 1, '02. Sikap & Moral', 'Membanting pintu/melempar benda', 100, '1'),
(10, 1, '02. Sikap & Moral', 'Memanggil ortu dengan sebutan tidak sopan', 100, '1,2,5,8'),
(11, 1, '02. Sikap & Moral', 'Bersikap tidak sopan (duduk di meja dll)', 100, '1,2'),
(12, 1, '02. Sikap & Moral', 'Merayakan HUT teman secara negatif', 100, '1,5'),
(13, 1, '02. Sikap & Moral', 'Memicu keributan di medsos/sekolah', 100, '1,2,7,8'),
(14, 1, '02. Sikap & Moral', 'Membiarkan/mendorong kerusakan fasilitas', 100, '1,3'),
(15, 1, '02. Sikap & Moral', 'Membiarkan teman celaka/sakit', 100, '1,2,7,8'),
(16, 1, '03. Dokumen', 'Memalsukan surat/tanda tangan', 300, '7'),
(17, 1, '04. Rokok & Miras', 'Membawa rokok', 300, '7,8'),
(18, 1, '04. Rokok & Miras', 'Merokok (langsung/medsos)', 500, '7,8,9,10'),
(19, 1, '04. Rokok & Miras', 'Membawa minuman keras', 300, '7,8'),
(20, 1, '04. Rokok & Miras', 'Meminum minuman keras', 500, '7,8,9,10'),
(21, 1, '05. NAPZA', 'Membawa/mengedarkan/menggunakan NAPZA', 9999, '10'),
(22, 1, '06. Pelecehan Seksual', 'Membawa/akses/sebar konten porno', 300, '1,7'),
(23, 1, '06. Pelecehan Seksual', 'Melakukan tindakan Pelecehan Seksual', 500, '1,7,8,9'),
(24, 1, '07. Kekerasan', 'Terlibat perkelahian/main hakim sendiri', 300, '1,2,7,8,9'),
(25, 1, '07. Kekerasan', 'Mengancam Kepala Sekolah/Guru/Karyawan', 300, '10'),
(26, 1, '07. Kekerasan', 'Tindak kriminal terbukti hukum', 9999, '10'),
(27, 1, '08. Gank', 'Terlibat Gank negatif', 300, '1,7,8'),
(28, 1, '09. Sarana Prasarana', 'Mencorat-coret/merusak sarana sekolah', 75, '1,3'),
(29, 1, '09. Sarana Prasarana', 'Bermain alat PBM/sapu di kelas', 75, '1,3'),
(30, 1, '09. Sarana Prasarana', 'Makan dan minum di dalam kelas', 50, '1,2'),
(31, 1, '10. Ketertiban PBM', 'Ramai/tidak memperhatikan saat PBM', 50, '1,2'),
(32, 1, '10. Ketertiban PBM', 'Keluar kelas saat PBM tanpa izin', 50, '1,2'),
(33, 1, '10. Ketertiban PBM', 'Menyontek saat ulangan', 300, '1,5'),
(34, 1, '10. Ketertiban PBM', 'Mengambil alat PBM teman tanpa izin', 50, '1,2'),
(35, 1, '10. Ketertiban PBM', 'Penyalahgunaan HP saat PBM', 50, '1,2'),
(36, 1, '11. 10 K', 'Tidak mendukung 10 K', 50, '1,2,6'),
(37, 1, '12. Kendaraan', 'Mengendarai kendaraan bermotor sendiri', 300, '1,7,8,9'),
(38, 2, '01. Kehadiran', 'Terlambat sekolah/tambahan/ekstra', 25, '2,5,7,8'),
(39, 2, '02. Efektif Sekolah', 'Tidak hadir tanpa keterangan (Alpa)', 75, '7,8'),
(40, 2, '02. Efektif Sekolah', 'Meninggalkan sekolah saat PBM (Bolos)', 75, '7,8'),
(41, 2, '03. PBM', 'Tidak masuk kelas jam pertama', 300, '1,7'),
(42, 2, '03. PBM', 'Tidak ikut olahraga/praktikum tanpa izin', 500, '1,7,8,9'),
(43, 2, '04. Perlengkapan', 'Tidak bawa buku pelajaran', 50, '1,2'),
(44, 2, '04. Perlengkapan', 'Buku catatan campur/tidak rapi', 50, '1,2'),
(45, 2, '04. Perlengkapan', 'Tidak bawa LKS/PR/Tugas', 50, '1,2'),
(46, 2, '04. Perlengkapan', 'Membawa barang non-PBM', 75, '7,8'),
(47, 2, '04. Perlengkapan', 'Tidak membawa buku tatib/literasi', 25, '1'),
(48, 2, '05. Tugas', 'Mencontoh PR/Tugas', 50, '2'),
(49, 2, '05. Tugas', 'Tidak mengumpulkan PR/Tugas', 50, '2'),
(50, 2, '06. Ekstrakurikuler', 'Tidak ikut ekstra tanpa izin', 50, '7,8'),
(51, 2, '06. Ekstrakurikuler', 'Ramai saat kegiatan ekstra', 50, '2'),
(52, 2, '06. Ekstrakurikuler', 'Tidak ikut tambahan pelajaran', 50, '7'),
(53, 3, '01. Seragam', 'Seragam tidak sesuai ketentuan', 75, '1,2,5,7'),
(54, 3, '01. Seragam', 'Pakai rompi/jaket hanya aksesoris', 75, '1,2,5,7'),
(55, 3, '01. Seragam', 'Seragam olahraga dari rumah/saat pulang', 50, '1'),
(56, 3, '01. Seragam', 'Tidak pakai kaos dalam', 50, '1'),
(57, 3, '01. Seragam', 'Atribut tidak lengkap (topi/dasi/sabuk/dll)', 50, '1'),
(58, 3, '01. Seragam', 'Kaos kaki pendek/warna-warni/sepatu non-hitam', 50, '5'),
(59, 3, '01. Seragam', 'Seragam dicoret-coret', 100, '1'),
(60, 3, '01. Seragam', 'Mencoret anggota tubuh', 100, '1'),
(61, 3, '01. Seragam', 'Baju tidak dimasukkan/rok-celana tidak standar', 50, '1,2,5,7'),
(62, 3, '02. Aksesoris', 'Perhiasan/aksesoris berlebihan', 50, '1'),
(63, 3, '02. Aksesoris', 'Putra memakai gelang/anting/kalung', 50, '1'),
(64, 3, '02. Aksesoris', 'Putri memakai gelang/double anting', 50, '1'),
(65, 3, '02. Aksesoris', 'Kuku panjang/dicat', 50, '1'),
(66, 3, '03. Rambut', 'Rambut dicat', 100, '1,7'),
(67, 3, '03. Rambut', 'Putra rambut panjang/gundul', 50, '1'),
(68, 3, '03. Rambut', 'Rambut menutupi wajah/tidak rapi', 50, '1'),
(69, 3, '04. Kegiatan', 'Tidak rapi/bersepatu saat ekstra/tambahan', 50, '1'),
(70, 3, '05. Sepeda', 'Parkir sepeda tidak teratur/tidak dikunci', 25, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal`
--

CREATE TABLE `tb_jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `kode_guru` varchar(10) DEFAULT '',
  `tanggal` date NOT NULL,
  `topik` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jurnal`
--

INSERT INTO `tb_jurnal` (`id_jurnal`, `id_jadwal`, `kode_guru`, `tanggal`, `topik`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1327, '10', '2026-04-01', 'Seni Ukir', '', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(2, 1277, '10', '2026-04-01', 'seni ukir', '', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(3, 1277, '10', '2026-04-02', 'seni patung', '', '2026-04-01 20:59:53', '2026-04-01 20:59:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori_pelanggaran`
--

CREATE TABLE `tb_kategori_pelanggaran` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori_pelanggaran`
--

INSERT INTO `tb_kategori_pelanggaran` (`id_kategori`, `nama_kategori`) VALUES
(1, 'KELAKUAN'),
(2, 'KERAJINAN'),
(3, 'KERAPIAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `guru_wali` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Aman',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `tingkat`, `guru_wali`, `status`, `created_at`) VALUES
(1, 'VII A', 7, NULL, 'Aman', '2026-04-02 04:50:45'),
(2, 'VII B', 7, NULL, 'Aman', '2026-04-02 04:50:45'),
(3, 'VII C', 7, NULL, 'Aman', '2026-04-02 04:50:45'),
(4, 'VII D', 7, NULL, 'Aman', '2026-04-02 04:50:45'),
(5, 'VII E', 7, NULL, 'Aman', '2026-04-02 04:50:45'),
(6, 'VIII A', 8, NULL, 'Aman', '2026-04-02 04:50:45'),
(7, 'VIII B', 8, NULL, 'Aman', '2026-04-02 04:50:45'),
(8, 'VIII C', 8, NULL, 'Aman', '2026-04-02 04:50:45'),
(9, 'VIII D', 8, NULL, 'Aman', '2026-04-02 04:50:45'),
(10, 'VIII E', 8, NULL, 'Aman', '2026-04-02 04:50:45'),
(11, 'IX A', 9, NULL, 'Aman', '2026-04-02 04:50:45'),
(12, 'IX B', 9, NULL, 'Aman', '2026-04-02 04:50:45'),
(13, 'IX C', 9, NULL, 'Aman', '2026-04-02 04:50:45'),
(14, 'IX D', 9, NULL, 'Aman', '2026-04-02 04:50:45'),
(15, 'IX E', 9, NULL, 'Aman', '2026-04-02 04:50:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(100) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `hours` int(11) DEFAULT 0,
  `cat` varchar(50) DEFAULT 'Umum',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `kode_mapel`, `nama_mapel`, `grade`, `hours`, `cat`, `created_at`) VALUES
(1, 'MTK7', 'Matematika', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(2, 'MTK8', 'Matematika', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(3, 'MTK9', 'Matematika', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(4, 'IND7', 'Bahasa Indonesia', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(5, 'IND8', 'Bahasa Indonesia', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(6, 'IND9', 'Bahasa Indonesia', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(7, 'ING7', 'Bahasa Inggris', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(8, 'ING8', 'Bahasa Inggris', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(9, 'ING9', 'Bahasa Inggris', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(10, 'IPA7', 'Ilmu Pengetahuan Alam', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(11, 'IPA8', 'Ilmu Pengetahuan Alam', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(12, 'IPA9', 'Ilmu Pengetahuan Alam', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(13, 'IPS7', 'Ilmu Pengetahuan Sosial', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(14, 'IPS8', 'Ilmu Pengetahuan Sosial', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(15, 'IPS9', 'Ilmu Pengetahuan Sosial', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(16, 'SBD7', 'Seni Budaya', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(17, 'SBD8', 'Seni Budaya', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(18, 'SBD9', 'Seni Budaya', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(19, 'SMK7', 'Seni Musik', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(20, 'BK7', 'Bimbingan Konseling', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(21, 'BK8', 'Bimbingan Konseling', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(22, 'BK9', 'Bimbingan Konseling', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(23, 'INF7', 'Informatika', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(24, 'INF8', 'Informatika', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(25, 'INF9', 'Informatika', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(26, 'PJK7', 'Pendidikan Jasmani Olahraga dan Kesehatan', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(27, 'PJK8', 'Pendidikan Jasmani Olahraga dan Kesehatan', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(28, 'PJK9', 'Pendidikan Jasmani Olahraga dan Kesehatan', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(29, 'PKN7', 'Pendidikan Kewarganegaraan', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(30, 'PKN8', 'Pendidikan Kewarganegaraan', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(31, 'PKN9', 'Pendidikan Kewarganegaraan', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(32, 'PAG7', 'Pendidikan Agama', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(33, 'PAG8', 'Pendidikan Agama', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(34, 'PAG9', 'Pendidikan Agama', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(35, 'BDR7', 'Bahasa Daerah', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(36, 'BDR8', 'Bahasa Daerah', 'VIII', 4, 'Umum', '2026-03-12 23:26:21'),
(37, 'BDR9', 'Bahasa Daerah', 'IX', 4, 'Umum', '2026-03-12 23:26:21'),
(38, 'TTC7', 'Team Teaching', 'VII', 4, 'Umum', '2026-03-12 23:26:21'),
(39, 'TTC8', 'Team Teaching', 'VIII', 4, 'Umum', '2026-03-12 23:26:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_orang_tua`
--

CREATE TABLE `tb_orang_tua` (
  `id_ortu` int(11) NOT NULL,
  `nik_ortu` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `no_hp_ortu` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_orang_tua`
--

INSERT INTO `tb_orang_tua` (`id_ortu`, `nik_ortu`, `password`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `no_hp_ortu`, `alamat`, `created_at`) VALUES
(1, '3573012345678901', 'e10adc3949ba59abbe56e057f20f883e', 'Bpk. Dani', 'Swasta', 'Ibu Dani', 'Ibu Rumah Tangga', '081234567890', 'Jl. Merdeka No. 1, Malang', '2026-04-02 05:13:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggaran_detail`
--

CREATE TABLE `tb_pelanggaran_detail` (
  `id_detail` bigint(20) NOT NULL,
  `id_transaksi` bigint(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `poin_saat_itu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggaran_header`
--

CREATE TABLE `tb_pelanggaran_header` (
  `id_transaksi` bigint(20) NOT NULL,
  `id_anggota` bigint(20) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `tipe_form` enum('Piket','Kelas') NOT NULL,
  `bukti_foto` varchar(255) DEFAULT NULL,
  `lampiran_link` text DEFAULT NULL,
  `status_revisi` enum('None','Pending','Disetujui','Ditolak') DEFAULT 'None',
  `alasan_revisi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggaran_sanksi`
--

CREATE TABLE `tb_pelanggaran_sanksi` (
  `id_trans_sanksi` bigint(20) NOT NULL,
  `id_transaksi` bigint(20) NOT NULL,
  `id_sanksi_ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_predikat_nilai`
--

CREATE TABLE `tb_predikat_nilai` (
  `id_predikat` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `huruf_mutu` char(1) NOT NULL,
  `batas_bawah` int(11) NOT NULL,
  `batas_atas` int(11) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_predikat_nilai`
--

INSERT INTO `tb_predikat_nilai` (`id_predikat`, `id_kategori`, `huruf_mutu`, `batas_bawah`, `batas_atas`, `keterangan`) VALUES
(1, 1, 'A', 0, 49, 'Sangat Baik'),
(2, 1, 'B', 50, 249, 'Baik'),
(3, 1, 'C', 250, 1499, 'Cukup (SP1/SP2)'),
(4, 1, 'D', 1500, 9999, 'Kurang (SP3/Berat)'),
(5, 2, 'A', 0, 24, 'Sangat Baik'),
(6, 2, 'B', 25, 74, 'Baik'),
(7, 2, 'C', 75, 449, 'Cukup (SP1/SP2)'),
(8, 2, 'D', 450, 9999, 'Kurang (SP3/Berat)'),
(9, 3, 'A', 0, 49, 'Sangat Baik'),
(10, 3, 'B', 50, 99, 'Baik'),
(11, 3, 'C', 100, 449, 'Cukup (SP1/SP2)'),
(12, 3, 'D', 450, 9999, 'Kurang (SP3/Berat)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_presensi`
--

CREATE TABLE `tb_presensi` (
  `id_presensi` int(11) NOT NULL,
  `id_anggota` bigint(20) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `kode_guru` varchar(10) DEFAULT '',
  `subject_name` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('HADIR','IZIN','SAKIT','ALPHA','TERLAMBAT','KEPERLUAN_SEKOLAH') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_presensi`
--

INSERT INTO `tb_presensi` (`id_presensi`, `id_anggota`, `id_jadwal`, `kode_guru`, `subject_name`, `tanggal`, `status`, `created_at`, `updated_at`) VALUES
(1, 345, 1327, '10', 'Seni Budaya', '2026-04-01', 'SAKIT', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(2, 349, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(3, 338, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(4, 336, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(5, 348, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(6, 339, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(7, 337, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(8, 347, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(9, 350, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(10, 346, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(11, 344, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(12, 341, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(13, 343, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(14, 342, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(15, 340, 1327, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:48:56', '2026-04-01 06:48:56'),
(16, 262, 1277, '10', 'Seni Budaya', '2026-04-01', 'IZIN', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(17, 263, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(18, 273, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(19, 267, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(20, 269, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(21, 268, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(22, 270, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(23, 264, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(24, 266, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(25, 265, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(26, 271, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(27, 274, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(28, 261, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(29, 272, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(30, 275, 1277, '10', 'Seni Budaya', '2026-04-01', 'HADIR', '2026-04-01 06:57:35', '2026-04-01 06:57:35'),
(31, 262, 1277, '10', 'Seni Budaya', '2026-04-02', 'SAKIT', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(32, 263, 1277, '10', 'Seni Budaya', '2026-04-02', 'IZIN', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(33, 273, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(34, 267, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(35, 269, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(36, 268, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(37, 270, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(38, 264, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(39, 266, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(40, 265, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(41, 271, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(42, 274, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(43, 261, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(44, 272, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53'),
(45, 275, 1277, '10', 'Seni Budaya', '2026-04-02', 'HADIR', '2026-04-01 20:59:53', '2026-04-01 20:59:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_riwayat_sp`
--

CREATE TABLE `tb_riwayat_sp` (
  `id_sp` int(11) NOT NULL,
  `id_anggota` bigint(20) NOT NULL,
  `tingkat_sp` enum('SP1','SP2','SP3','Sanksi oleh Sekolah') NOT NULL,
  `kategori_pemicu` varchar(50) DEFAULT NULL,
  `tanggal_terbit` date NOT NULL,
  `tanggal_validasi` date DEFAULT NULL,
  `status` enum('Pending','Selesai') DEFAULT 'Pending',
  `id_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ruangan`
--

CREATE TABLE `tb_ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `kode_ruangan` varchar(50) NOT NULL,
  `nama_ruangan` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ruangan`
--

INSERT INTO `tb_ruangan` (`id_ruangan`, `kode_ruangan`, `nama_ruangan`, `lokasi`, `pic`) VALUES
(26, 'R001', 'Lab Fisika', 'Lantai 2', 'Antonetta Maria Kuntodiati, S.Pd.'),
(27, 'R002', 'Lab Biologi', 'Lantai 1', 'Margareta Esti Wulan, S.Pd.'),
(28, 'R003', 'Ruang Geografi', 'Lantai 2', 'Y. Pamungkas, S.Pd.'),
(29, 'R004', 'Ruang Matematika 7', 'Lantai 2', 'Agustina Peni Sarasati, S.Pd.'),
(30, 'R005', 'Ruang B.Inggris 7', 'Lantai 2', 'Deka Nanda Kurniawati, S.Pd.'),
(31, 'R006', 'Ruang B.Inggris 9', 'Lantai 2', 'Drs. Albertus Magnus Meo Depa'),
(32, 'R007', 'Ruang Matematika 9', 'Lantai 2', 'Albertha Yulanti Susetyo, M.Pd.'),
(33, 'R008', 'Ruang Kewarganegaraan', 'Lantai 2', 'Agnes Herawaty, S.E.MM'),
(34, 'R009', 'Ruang PPKN', 'Lantai 2', 'Anjelina Wulandari Sitina De Sareng, S.Pd.'),
(35, 'R010', 'Laboratorium IPA', 'Lantai 1', 'Haniar Mey Sila Kinanti, S.Pd.'),
(36, 'R011', 'Laboratorium Komputer', 'Lantai 1', 'Joseph Andiek Kristian, S.Pd.,S.Kom.'),
(37, 'R012', 'Ruang B Inggris 8', 'Lantai 2', 'Albertus Bayu Seta, S.Pd.'),
(38, 'R013', 'Ruang Matematika 8', 'Lantai 2', 'Arnoldus Kobe Tegar Felix Sai, S.Pd.'),
(39, 'R014', 'Ruang IPS', 'Lantai 1', 'Galang Bagus Afridianto, M.Pd.'),
(40, 'R015', 'Ruang Agama', 'Lantai 2', 'Bernadetha Devia Tindy Noveyra, S.Pd'),
(41, 'R016', 'Ruang Prakarya', 'Lantai 1', 'Hendrik Kiswanto, S.Pd'),
(42, 'R017', 'Ruang Seni Musik', 'Lantai 1', 'Amelia Rangel Da Silva'),
(43, 'R018', 'Ruang B. Indonesia 7', 'Lantai 1', 'Brigita Natalia Setyaningrum, S.Pd.'),
(45, 'R020', 'Ruang B. Indonesia 9', 'Lantai 2', 'Trianto Thomas, S.Pd.'),
(46, 'R021', 'Ruang B. Indonesia 8', 'Lantai 1', 'Agatha Novenia Bintang Prieska, S.Pd.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sanksi_ref`
--

CREATE TABLE `tb_sanksi_ref` (
  `id_sanksi_ref` int(11) NOT NULL,
  `kode_sanksi` varchar(5) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_sanksi_ref`
--

INSERT INTO `tb_sanksi_ref` (`id_sanksi_ref`, `kode_sanksi`, `deskripsi`) VALUES
(1, '1', 'Meminta maaf dan berjanji tidak mengulang'),
(2, '2', 'Dikeluarkan saat PBM (Proses Belajar Mengajar)'),
(3, '3', 'Mengganti/memperbaiki fasilitas sekolah yang rusak'),
(4, '4', 'Mengganti/mengembalikan uang atau barang yang dipinjam/diambil'),
(5, '5', 'Menjalani pembinaan oleh Wali Kelas'),
(6, '6', 'Membersihkan lingkungan sekolah'),
(7, '7', 'Pemanggilan orang tua/wali siswa'),
(8, '8', 'Menjalani pembinaan oleh BK'),
(9, '9', 'Menjalani pembinaan khusus oleh Tim Tatib'),
(10, '10', 'Diserahkan kembali pendidikannya kepada orang tua (Dikeluarkan)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `no_induk` varchar(50) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `no_hp_ortu` varchar(15) DEFAULT NULL,
  `id_ortu` int(11) DEFAULT NULL,
  `status_aktif` enum('Aktif','Lulus','Keluar','Dikeluarkan') DEFAULT 'Aktif',
  `nisn` varchar(20) DEFAULT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `wa` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`no_induk`, `nama_siswa`, `jenis_kelamin`, `kota`, `tanggal_lahir`, `alamat`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `no_hp_ortu`, `id_ortu`, `status_aktif`, `nisn`, `parent`, `wa`, `created_at`) VALUES
('1001', 'Maya Mahendra', 'P', 'Gresik', '2011-12-18', 'Jl. Contoh No. 33', 'Ayah Mahendra', 'Wiraswasta', 'Ibu Mahendra', 'Karyawan', NULL, NULL, 'Aktif', '1101122334', 'Ayah Mahendra', '0812345671001', '2026-03-24 03:25:45'),
('1002', 'Nurul Hidayat', 'P', 'Gresik', '2011-11-19', 'Jl. Contoh No. 3', 'Ayah Hidayat', 'Polisi', 'Ibu Hidayat', 'Buruh', NULL, NULL, 'Aktif', '1101122335', 'Ayah Hidayat', '0812345671002', '2026-03-24 03:25:45'),
('1003', 'Dina Safira', 'P', 'Malang', '2011-08-17', 'Jl. Contoh No. 64', 'Ayah Safira', 'TNI', 'Ibu Safira', 'Pedagang', NULL, NULL, 'Aktif', '1101122336', 'Ayah Safira', '0812345671003', '2026-03-24 03:25:45'),
('1004', 'Elsa Putri', 'P', 'Mojokerto', '2010-12-11', 'Jl. Contoh No. 34', 'Ayah Putri', 'PNS', 'Ibu Putri', 'TNI', NULL, NULL, 'Aktif', '1101122337', 'Ayah Putri', '0812345671004', '2026-03-24 03:25:45'),
('1005', 'Iwan Pertiwi', 'L', 'Malang', '2010-03-26', 'Jl. Contoh No. 17', 'Ayah Pertiwi', 'Pedagang', 'Ibu Pertiwi', 'PNS', NULL, NULL, 'Aktif', '1101122338', 'Ayah Pertiwi', '0812345671005', '2026-03-24 03:25:45'),
('1006', 'Nadia Sanjaya', 'P', 'Surabaya', '2010-12-23', 'Jl. Contoh No. 96', 'Ayah Sanjaya', 'Karyawan', 'Ibu Sanjaya', 'PNS', NULL, NULL, 'Aktif', '1101122339', 'Ayah Sanjaya', '0812345671006', '2026-03-24 03:25:45'),
('1007', 'Dina Santoso', 'P', 'Malang', '2010-01-18', 'Jl. Contoh No. 41', 'Ayah Santoso', 'Buruh', 'Ibu Santoso', 'PNS', NULL, NULL, 'Aktif', '1101122340', 'Ayah Santoso', '0812345671007', '2026-03-24 03:25:45'),
('1008', 'Kevin Pertiwi', 'L', 'Malang', '2011-09-04', 'Jl. Contoh No. 53', 'Ayah Pertiwi', 'Buruh', 'Ibu Pertiwi', 'Pedagang', NULL, NULL, 'Aktif', '1101122341', 'Ayah Pertiwi', '0812345671008', '2026-03-24 03:25:45'),
('1009', 'Yulia Prasetyo', 'P', 'Gresik', '2010-02-05', 'Jl. Contoh No. 97', 'Ayah Prasetyo', 'PNS', 'Ibu Prasetyo', 'Polisi', NULL, NULL, 'Aktif', '1101122342', 'Ayah Prasetyo', '0812345671009', '2026-03-24 03:25:45'),
('1010', 'Ulya Purnama', 'P', 'Surabaya', '2011-03-08', 'Jl. Contoh No. 53', 'Ayah Purnama', 'Pedagang', 'Ibu Purnama', 'Pedagang', NULL, NULL, 'Aktif', '1101122343', 'Ayah Purnama', '0812345671010', '2026-03-24 03:25:45'),
('1011', 'Ahmad Sari', 'L', 'Mojokerto', '2011-04-27', 'Jl. Contoh No. 31', 'Ayah Sari', 'Pedagang', 'Ibu Sari', 'PNS', NULL, NULL, 'Aktif', '1101122344', 'Ayah Sari', '0812345671011', '2026-03-24 03:25:45'),
('1012', 'Gita Utami', 'P', 'Surabaya', '2010-10-03', 'Jl. Contoh No. 53', 'Ayah Utami', 'TNI', 'Ibu Utami', 'Guru', NULL, NULL, 'Aktif', '1101122345', 'Ayah Utami', '0812345671012', '2026-03-24 03:25:45'),
('1013', 'Dewi Prasetyo', 'P', 'Malang', '2011-09-01', 'Jl. Contoh No. 56', 'Ayah Prasetyo', 'Wiraswasta', 'Ibu Prasetyo', 'PNS', NULL, NULL, 'Aktif', '1101122346', 'Ayah Prasetyo', '0812345671013', '2026-03-24 03:25:45'),
('1014', 'Elsa Hidayat', 'P', 'Surabaya', '2010-04-25', 'Jl. Contoh No. 33', 'Ayah Hidayat', 'Buruh', 'Ibu Hidayat', 'Guru', NULL, NULL, 'Aktif', '1101122347', 'Ayah Hidayat', '0812345671014', '2026-03-24 03:25:45'),
('1015', 'Andi Fahira', 'L', 'Mojokerto', '2011-05-26', 'Jl. Contoh No. 80', 'Ayah Fahira', 'PNS', 'Ibu Fahira', 'TNI', NULL, NULL, 'Aktif', '1101122348', 'Ayah Fahira', '0812345671015', '2026-03-24 03:25:45'),
('1016', 'Taufik Ramadhan', 'L', 'Mojokerto', '2010-03-22', 'Jl. Contoh No. 64', 'Ayah Ramadhan', 'Buruh', 'Ibu Ramadhan', 'PNS', NULL, NULL, 'Aktif', '1101122349', 'Ayah Ramadhan', '0812345671016', '2026-03-24 03:25:45'),
('1017', 'Dewi Putri', 'P', 'Malang', '2010-03-23', 'Jl. Contoh No. 37', 'Ayah Putri', 'Wiraswasta', 'Ibu Putri', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122350', 'Ayah Putri', '0812345671017', '2026-03-24 03:25:45'),
('1018', 'Dina Prasetyo', 'P', 'Gresik', '2011-09-09', 'Jl. Contoh No. 99', 'Ayah Prasetyo', 'Pedagang', 'Ibu Prasetyo', 'Karyawan', NULL, NULL, 'Aktif', '1101122351', 'Ayah Prasetyo', '0812345671018', '2026-03-24 03:25:45'),
('1019', 'Hana Mahendra', 'P', 'Surabaya', '2010-02-24', 'Jl. Contoh No. 93', 'Ayah Mahendra', 'PNS', 'Ibu Mahendra', 'PNS', NULL, NULL, 'Aktif', '1101122352', 'Ayah Mahendra', '0812345671019', '2026-03-24 03:25:45'),
('1020', 'Kartika Kusuma', 'P', 'Malang', '2010-10-25', 'Jl. Contoh No. 54', 'Ayah Kusuma', 'Pedagang', 'Ibu Kusuma', 'Polisi', NULL, NULL, 'Aktif', '1101122353', 'Ayah Kusuma', '0812345671020', '2026-03-24 03:25:45'),
('1021', 'Irfan Nugroho', 'L', 'Malang', '2011-05-20', 'Jl. Contoh No. 49', 'Ayah Nugroho', 'Guru', 'Ibu Nugroho', 'Karyawan', NULL, NULL, 'Aktif', '1101122354', 'Ayah Nugroho', '0812345671021', '2026-03-24 03:25:45'),
('1022', 'Eko Mahendra', 'L', 'Gresik', '2010-04-25', 'Jl. Contoh No. 32', 'Ayah Mahendra', 'TNI', 'Ibu Mahendra', 'Guru', NULL, NULL, 'Aktif', '1101122355', 'Ayah Mahendra', '0812345671022', '2026-03-24 03:25:45'),
('1023', 'Gilang Ramadhan', 'L', 'Sidoarjo', '2011-07-24', 'Jl. Contoh No. 9', 'Ayah Ramadhan', 'TNI', 'Ibu Ramadhan', 'TNI', NULL, NULL, 'Aktif', '1101122356', 'Ayah Ramadhan', '0812345671023', '2026-03-24 03:25:45'),
('1024', 'Fajar Nugroho', 'L', 'Surabaya', '2010-02-23', 'Jl. Contoh No. 40', 'Ayah Nugroho', 'Polisi', 'Ibu Nugroho', 'Pedagang', NULL, NULL, 'Aktif', '1101122357', 'Ayah Nugroho', '0812345671024', '2026-03-24 03:25:45'),
('1025', 'Gita Safira', 'P', 'Sidoarjo', '2010-11-15', 'Jl. Contoh No. 36', 'Ayah Safira', 'Karyawan', 'Ibu Safira', 'Buruh', NULL, NULL, 'Aktif', '1101122358', 'Ayah Safira', '0812345671025', '2026-03-24 03:25:45'),
('1026', 'Kartika Saputra', 'P', 'Gresik', '2010-02-13', 'Jl. Contoh No. 98', 'Ayah Saputra', 'Pedagang', 'Ibu Saputra', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122359', 'Ayah Saputra', '0812345671026', '2026-03-24 03:25:45'),
('1027', 'Vino Purnama', 'L', 'Sidoarjo', '2011-06-06', 'Jl. Contoh No. 100', 'Ayah Purnama', 'Karyawan', 'Ibu Purnama', 'Guru', NULL, NULL, 'Aktif', '1101122360', 'Ayah Purnama', '0812345671027', '2026-03-24 03:25:45'),
('1028', 'Dina Ramadhan', 'P', 'Gresik', '2010-05-08', 'Jl. Contoh No. 50', 'Ayah Ramadhan', 'TNI', 'Ibu Ramadhan', 'TNI', NULL, NULL, 'Aktif', '1101122361', 'Ayah Ramadhan', '0812345671028', '2026-03-24 03:25:45'),
('1029', 'Rizky Utami', 'L', 'Malang', '2011-01-18', 'Jl. Contoh No. 59', 'Ayah Utami', 'Wiraswasta', 'Ibu Utami', 'Pedagang', NULL, NULL, 'Aktif', '1101122362', 'Ayah Utami', '0812345671029', '2026-03-24 03:25:45'),
('1030', 'Zaki Fahira', 'L', 'Gresik', '2011-12-22', 'Jl. Contoh No. 21', 'Ayah Fahira', 'Pedagang', 'Ibu Fahira', 'Pedagang', NULL, NULL, 'Aktif', '1101122363', 'Ayah Fahira', '0812345671030', '2026-03-24 03:25:45'),
('1031', 'Dina Ramadhan', 'P', 'Gresik', '2011-02-08', 'Jl. Contoh No. 29', 'Ayah Ramadhan', 'Buruh', 'Ibu Ramadhan', 'Polisi', NULL, NULL, 'Aktif', '1101122364', 'Ayah Ramadhan', '0812345671031', '2026-03-24 03:25:45'),
('1032', 'Joko Ramadhan', 'L', 'Mojokerto', '2010-06-05', 'Jl. Contoh No. 84', 'Ayah Ramadhan', 'Polisi', 'Ibu Ramadhan', 'PNS', NULL, NULL, 'Aktif', '1101122365', 'Ayah Ramadhan', '0812345671032', '2026-03-24 03:25:45'),
('1033', 'Muhammad Safira', 'L', 'Surabaya', '2010-10-07', 'Jl. Contoh No. 40', 'Ayah Safira', 'Wiraswasta', 'Ibu Safira', 'Buruh', NULL, NULL, 'Aktif', '1101122366', 'Ayah Safira', '0812345671033', '2026-03-24 03:25:45'),
('1034', 'Muhammad Wulandari', 'L', 'Malang', '2010-12-25', 'Jl. Contoh No. 12', 'Ayah Wulandari', 'Pedagang', 'Ibu Wulandari', 'Guru', NULL, NULL, 'Aktif', '1101122367', 'Ayah Wulandari', '0812345671034', '2026-03-24 03:25:45'),
('1035', 'Elsa Prasetyo', 'P', 'Surabaya', '2011-03-05', 'Jl. Contoh No. 6', 'Ayah Prasetyo', 'Polisi', 'Ibu Prasetyo', 'Polisi', NULL, NULL, 'Aktif', '1101122368', 'Ayah Prasetyo', '0812345671035', '2026-03-24 03:25:45'),
('1036', 'Rizky Ramadhan', 'L', 'Sidoarjo', '2011-08-05', 'Jl. Contoh No. 23', 'Ayah Ramadhan', 'PNS', 'Ibu Ramadhan', 'Guru', NULL, NULL, 'Aktif', '1101122369', 'Ayah Ramadhan', '0812345671036', '2026-03-24 03:25:45'),
('1037', 'Eko Putri', 'L', 'Mojokerto', '2010-12-26', 'Jl. Contoh No. 31', 'Ayah Putri', 'Wiraswasta', 'Ibu Putri', 'Buruh', NULL, NULL, 'Aktif', '1101122370', 'Ayah Putri', '0812345671037', '2026-03-24 03:25:45'),
('1038', 'Elsa Putri', 'P', 'Malang', '2011-05-26', 'Jl. Contoh No. 50', 'Ayah Putri', 'Polisi', 'Ibu Putri', 'PNS', NULL, NULL, 'Aktif', '1101122371', 'Ayah Putri', '0812345671038', '2026-03-24 03:25:45'),
('1039', 'Fajar Fahira', 'L', 'Gresik', '2011-04-01', 'Jl. Contoh No. 32', 'Ayah Fahira', 'TNI', 'Ibu Fahira', 'Pedagang', NULL, NULL, 'Aktif', '1101122372', 'Ayah Fahira', '0812345671039', '2026-03-24 03:25:45'),
('1040', 'Oka Kusuma', 'L', 'Surabaya', '2011-04-24', 'Jl. Contoh No. 73', 'Ayah Kusuma', 'Guru', 'Ibu Kusuma', 'Pedagang', NULL, NULL, 'Aktif', '1101122373', 'Ayah Kusuma', '0812345671040', '2026-03-24 03:25:45'),
('1041', 'Candra Saputra', 'L', 'Gresik', '2011-08-06', 'Jl. Contoh No. 39', 'Ayah Saputra', 'Wiraswasta', 'Ibu Saputra', 'Guru', NULL, NULL, 'Aktif', '1101122374', 'Ayah Saputra', '0812345671041', '2026-03-24 03:25:45'),
('1042', 'Queen Saputra', 'P', 'Surabaya', '2010-08-02', 'Jl. Contoh No. 34', 'Ayah Saputra', 'Buruh', 'Ibu Saputra', 'PNS', NULL, NULL, 'Aktif', '1101122375', 'Ayah Saputra', '0812345671042', '2026-03-24 03:25:45'),
('1043', 'Fajar Kusuma', 'L', 'Surabaya', '2011-12-08', 'Jl. Contoh No. 85', 'Ayah Kusuma', 'Buruh', 'Ibu Kusuma', 'Pedagang', NULL, NULL, 'Aktif', '1101122376', 'Ayah Kusuma', '0812345671043', '2026-03-24 03:25:45'),
('1044', 'Queen Santoso', 'P', 'Mojokerto', '2010-06-20', 'Jl. Contoh No. 91', 'Ayah Santoso', 'Pedagang', 'Ibu Santoso', 'Polisi', NULL, NULL, 'Aktif', '1101122377', 'Ayah Santoso', '0812345671044', '2026-03-24 03:25:45'),
('1045', 'Dewi Fahira', 'P', 'Sidoarjo', '2011-04-08', 'Jl. Contoh No. 20', 'Ayah Fahira', 'Wiraswasta', 'Ibu Fahira', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122378', 'Ayah Fahira', '0812345671045', '2026-03-24 03:25:45'),
('1046', 'Rizky Saputra', 'L', 'Sidoarjo', '2010-10-28', 'Jl. Contoh No. 60', 'Ayah Saputra', 'Buruh', 'Ibu Saputra', 'Guru', NULL, NULL, 'Aktif', '1101122379', 'Ayah Saputra', '0812345671046', '2026-03-24 03:25:45'),
('1047', 'Xavier Pertiwi', 'L', 'Surabaya', '2010-08-03', 'Jl. Contoh No. 97', 'Ayah Pertiwi', 'Karyawan', 'Ibu Pertiwi', 'TNI', NULL, NULL, 'Aktif', '1101122380', 'Ayah Pertiwi', '0812345671047', '2026-03-24 03:25:45'),
('1048', 'Gilang Prasetyo', 'L', 'Gresik', '2011-11-23', 'Jl. Contoh No. 6', 'Ayah Prasetyo', 'TNI', 'Ibu Prasetyo', 'TNI', NULL, NULL, 'Aktif', '1101122381', 'Ayah Prasetyo', '0812345671048', '2026-03-24 03:25:45'),
('1049', 'Wanda Aulia', 'P', 'Mojokerto', '2010-02-28', 'Jl. Contoh No. 95', 'Ayah Aulia', 'Polisi', 'Ibu Aulia', 'Guru', NULL, NULL, 'Aktif', '1101122382', 'Ayah Aulia', '0812345671049', '2026-03-24 03:25:45'),
('1050', 'Nurul Utami', 'P', 'Gresik', '2011-06-01', 'Jl. Contoh No. 80', 'Ayah Utami', 'TNI', 'Ibu Utami', 'Pedagang', NULL, NULL, 'Aktif', '1101122383', 'Ayah Utami', '0812345671050', '2026-03-24 03:25:45'),
('1051', 'Yulia Mahendra', 'P', 'Malang', '2010-11-16', 'Jl. Contoh No. 10', 'Ayah Mahendra', 'Polisi', 'Ibu Mahendra', 'Pedagang', NULL, NULL, 'Aktif', '1101122384', 'Ayah Mahendra', '0812345671051', '2026-03-24 03:25:45'),
('1052', 'Iwan Nugroho', 'L', 'Surabaya', '2011-12-06', 'Jl. Contoh No. 29', 'Ayah Nugroho', 'Guru', 'Ibu Nugroho', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122385', 'Ayah Nugroho', '0812345671052', '2026-03-24 03:25:45'),
('1053', 'Rizky Ramadhan', 'L', 'Malang', '2011-02-11', 'Jl. Contoh No. 7', 'Ayah Ramadhan', 'Wiraswasta', 'Ibu Ramadhan', 'TNI', NULL, NULL, 'Aktif', '1101122386', 'Ayah Ramadhan', '0812345671053', '2026-03-24 03:25:45'),
('1054', 'Nadia Purnama', 'P', 'Mojokerto', '2011-01-19', 'Jl. Contoh No. 55', 'Ayah Purnama', 'Karyawan', 'Ibu Purnama', 'Pedagang', NULL, NULL, 'Aktif', '1101122387', 'Ayah Purnama', '0812345671054', '2026-03-24 03:25:45'),
('1055', 'Elsa Setiawan', 'P', 'Malang', '2010-06-01', 'Jl. Contoh No. 23', 'Ayah Setiawan', 'TNI', 'Ibu Setiawan', 'TNI', NULL, NULL, 'Aktif', '1101122388', 'Ayah Setiawan', '0812345671055', '2026-03-24 03:25:45'),
('1056', 'Ulya Safira', 'P', 'Sidoarjo', '2011-04-13', 'Jl. Contoh No. 89', 'Ayah Safira', 'Pedagang', 'Ibu Safira', 'PNS', NULL, NULL, 'Aktif', '1101122389', 'Ayah Safira', '0812345671056', '2026-03-24 03:25:45'),
('1057', 'Bella Utami', 'P', 'Mojokerto', '2010-03-19', 'Jl. Contoh No. 27', 'Ayah Utami', 'TNI', 'Ibu Utami', 'Karyawan', NULL, NULL, 'Aktif', '1101122390', 'Ayah Utami', '0812345671057', '2026-03-24 03:25:45'),
('1058', 'Kevin Utami', 'L', 'Surabaya', '2010-02-22', 'Jl. Contoh No. 48', 'Ayah Utami', 'Karyawan', 'Ibu Utami', 'Polisi', NULL, NULL, 'Aktif', '1101122391', 'Ayah Utami', '0812345671058', '2026-03-24 03:25:45'),
('1059', 'Dewi Nugroho', 'P', 'Gresik', '2010-10-16', 'Jl. Contoh No. 64', 'Ayah Nugroho', 'Guru', 'Ibu Nugroho', 'Buruh', NULL, NULL, 'Aktif', '1101122392', 'Ayah Nugroho', '0812345671059', '2026-03-24 03:25:45'),
('1060', 'Eko Utami', 'L', 'Surabaya', '2011-11-11', 'Jl. Contoh No. 74', 'Ayah Utami', 'Polisi', 'Ibu Utami', 'TNI', NULL, NULL, 'Aktif', '1101122393', 'Ayah Utami', '0812345671060', '2026-03-24 03:25:45'),
('1061', 'Rizky Pertiwi', 'L', 'Mojokerto', '2010-09-24', 'Jl. Contoh No. 46', 'Ayah Pertiwi', 'TNI', 'Ibu Pertiwi', 'Karyawan', NULL, NULL, 'Aktif', '1101122394', 'Ayah Pertiwi', '0812345671061', '2026-03-24 03:25:45'),
('1062', 'Jihan Setiawan', 'P', 'Surabaya', '2011-11-06', 'Jl. Contoh No. 47', 'Ayah Setiawan', 'Buruh', 'Ibu Setiawan', 'Pedagang', NULL, NULL, 'Aktif', '1101122395', 'Ayah Setiawan', '0812345671062', '2026-03-24 03:25:45'),
('1063', 'Rizky Setiawan', 'L', 'Surabaya', '2010-06-05', 'Jl. Contoh No. 9', 'Ayah Setiawan', 'TNI', 'Ibu Setiawan', 'TNI', NULL, NULL, 'Aktif', '1101122396', 'Ayah Setiawan', '0812345671063', '2026-03-24 03:25:45'),
('1064', 'Farida Utami', 'P', 'Gresik', '2011-07-07', 'Jl. Contoh No. 31', 'Ayah Utami', 'Buruh', 'Ibu Utami', 'Polisi', NULL, NULL, 'Aktif', '1101122397', 'Ayah Utami', '0812345671064', '2026-03-24 03:25:45'),
('1065', 'Andi Sanjaya', 'L', 'Mojokerto', '2010-11-10', 'Jl. Contoh No. 5', 'Ayah Sanjaya', 'PNS', 'Ibu Sanjaya', 'Karyawan', NULL, NULL, 'Aktif', '1101122398', 'Ayah Sanjaya', '0812345671065', '2026-03-24 03:25:45'),
('1066', 'Larasati Pertiwi', 'P', 'Gresik', '2010-05-07', 'Jl. Contoh No. 17', 'Ayah Pertiwi', 'Polisi', 'Ibu Pertiwi', 'Pedagang', NULL, NULL, 'Aktif', '1101122399', 'Ayah Pertiwi', '0812345671066', '2026-03-24 03:25:45'),
('1067', 'Budi Ramadhan', 'L', 'Mojokerto', '2011-03-17', 'Jl. Contoh No. 19', 'Ayah Ramadhan', 'Karyawan', 'Ibu Ramadhan', 'Guru', NULL, NULL, 'Aktif', '1101122400', 'Ayah Ramadhan', '0812345671067', '2026-03-24 03:25:45'),
('1068', 'Candra Setiawan', 'L', 'Mojokerto', '2011-08-05', 'Jl. Contoh No. 27', 'Ayah Setiawan', 'Guru', 'Ibu Setiawan', 'Guru', NULL, NULL, 'Aktif', '1101122401', 'Ayah Setiawan', '0812345671068', '2026-03-24 03:25:45'),
('1069', 'Salsabila Saputra', 'P', 'Gresik', '2011-02-21', 'Jl. Contoh No. 8', 'Ayah Saputra', 'Pedagang', 'Ibu Saputra', 'Guru', NULL, NULL, 'Aktif', '1101122402', 'Ayah Saputra', '0812345671069', '2026-03-24 03:25:45'),
('1070', 'Zaki Ramadhan', 'L', 'Malang', '2010-05-07', 'Jl. Contoh No. 2', 'Ayah Ramadhan', 'Pedagang', 'Ibu Ramadhan', 'Guru', NULL, NULL, 'Aktif', '1101122403', 'Ayah Ramadhan', '0812345671070', '2026-03-24 03:25:45'),
('1071', 'Eko Kusuma', 'L', 'Sidoarjo', '2011-06-21', 'Jl. Contoh No. 95', 'Ayah Kusuma', 'Polisi', 'Ibu Kusuma', 'Karyawan', NULL, NULL, 'Aktif', '1101122404', 'Ayah Kusuma', '0812345671071', '2026-03-24 03:25:45'),
('1072', 'Iwan Saputra', 'L', 'Gresik', '2010-02-27', 'Jl. Contoh No. 62', 'Ayah Saputra', 'Karyawan', 'Ibu Saputra', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122405', 'Ayah Saputra', '0812345671072', '2026-03-24 03:25:45'),
('1073', 'Wanda Fahira', 'P', 'Surabaya', '2011-07-09', 'Jl. Contoh No. 5', 'Ayah Fahira', 'Guru', 'Ibu Fahira', 'Polisi', NULL, NULL, 'Aktif', '1101122406', 'Ayah Fahira', '0812345671073', '2026-03-24 03:25:45'),
('1074', 'Budi Utami', 'L', 'Sidoarjo', '2010-01-16', 'Jl. Contoh No. 89', 'Ayah Utami', 'Guru', 'Ibu Utami', 'Polisi', NULL, NULL, 'Aktif', '1101122407', 'Ayah Utami', '0812345671074', '2026-03-24 03:25:45'),
('1075', 'Andi Sanjaya', 'L', 'Surabaya', '2011-02-14', 'Jl. Contoh No. 62', 'Ayah Sanjaya', 'TNI', 'Ibu Sanjaya', 'Polisi', NULL, NULL, 'Aktif', '1101122408', 'Ayah Sanjaya', '0812345671075', '2026-03-24 03:25:45'),
('1076', 'Larasati Prasetyo', 'P', 'Malang', '2011-04-15', 'Jl. Contoh No. 47', 'Ayah Prasetyo', 'PNS', 'Ibu Prasetyo', 'TNI', NULL, NULL, 'Aktif', '1101122409', 'Ayah Prasetyo', '0812345671076', '2026-03-24 03:25:45'),
('1077', 'Elsa Lestari', 'P', 'Surabaya', '2010-12-02', 'Jl. Contoh No. 93', 'Ayah Lestari', 'Guru', 'Ibu Lestari', 'Polisi', NULL, NULL, 'Aktif', '1101122410', 'Ayah Lestari', '0812345671077', '2026-03-24 03:25:45'),
('1078', 'Ahmad Pertiwi', 'L', 'Sidoarjo', '2010-02-19', 'Jl. Contoh No. 22', 'Ayah Pertiwi', 'Buruh', 'Ibu Pertiwi', 'PNS', NULL, NULL, 'Aktif', '1101122411', 'Ayah Pertiwi', '0812345671078', '2026-03-24 03:25:45'),
('1079', 'Kartika Utami', 'P', 'Gresik', '2011-11-23', 'Jl. Contoh No. 36', 'Ayah Utami', 'Karyawan', 'Ibu Utami', 'Buruh', NULL, NULL, 'Aktif', '1101122412', 'Ayah Utami', '0812345671079', '2026-03-24 03:25:45'),
('1080', 'Nadia Nugroho', 'P', 'Gresik', '2011-10-06', 'Jl. Contoh No. 95', 'Ayah Nugroho', 'Karyawan', 'Ibu Nugroho', 'Guru', NULL, NULL, 'Aktif', '1101122413', 'Ayah Nugroho', '0812345671080', '2026-03-24 03:25:45'),
('1081', 'Kartika Purnama', 'P', 'Malang', '2010-09-24', 'Jl. Contoh No. 44', 'Ayah Purnama', 'Pedagang', 'Ibu Purnama', 'TNI', NULL, NULL, 'Aktif', '1101122414', 'Ayah Purnama', '0812345671081', '2026-03-24 03:25:45'),
('1082', 'Vino Mahendra', 'L', 'Gresik', '2010-11-24', 'Jl. Contoh No. 62', 'Ayah Mahendra', 'Polisi', 'Ibu Mahendra', 'Karyawan', NULL, NULL, 'Aktif', '1101122415', 'Ayah Mahendra', '0812345671082', '2026-03-24 03:25:45'),
('1083', 'Ulya Nugroho', 'P', 'Sidoarjo', '2011-07-03', 'Jl. Contoh No. 4', 'Ayah Nugroho', 'Wiraswasta', 'Ibu Nugroho', 'TNI', NULL, NULL, 'Aktif', '1101122416', 'Ayah Nugroho', '0812345671083', '2026-03-24 03:25:45'),
('1084', 'Oka Sari', 'L', 'Surabaya', '2011-10-17', 'Jl. Contoh No. 91', 'Ayah Sari', 'PNS', 'Ibu Sari', 'Pedagang', NULL, NULL, 'Aktif', '1101122417', 'Ayah Sari', '0812345671084', '2026-03-24 03:25:45'),
('1085', 'Larasati Setiawan', 'P', 'Surabaya', '2010-12-18', 'Jl. Contoh No. 82', 'Ayah Setiawan', 'Wiraswasta', 'Ibu Setiawan', 'Polisi', NULL, NULL, 'Aktif', '1101122418', 'Ayah Setiawan', '0812345671085', '2026-03-24 03:25:45'),
('1086', 'Muhammad Purnama', 'L', 'Mojokerto', '2010-09-07', 'Jl. Contoh No. 54', 'Ayah Purnama', 'Guru', 'Ibu Purnama', 'PNS', NULL, NULL, 'Aktif', '1101122419', 'Ayah Purnama', '0812345671086', '2026-03-24 03:25:45'),
('1087', 'Muhammad Prasetyo', 'L', 'Gresik', '2011-10-03', 'Jl. Contoh No. 72', 'Ayah Prasetyo', 'Karyawan', 'Ibu Prasetyo', 'Karyawan', NULL, NULL, 'Aktif', '1101122420', 'Ayah Prasetyo', '0812345671087', '2026-03-24 03:25:45'),
('1088', 'Budi Mahendra', 'L', 'Sidoarjo', '2010-06-09', 'Jl. Contoh No. 1', 'Ayah Mahendra', 'TNI', 'Ibu Mahendra', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122421', 'Ayah Mahendra', '0812345671088', '2026-03-24 03:25:45'),
('1089', 'Ulya Mahendra', 'P', 'Gresik', '2010-12-03', 'Jl. Contoh No. 81', 'Ayah Mahendra', 'PNS', 'Ibu Mahendra', 'Karyawan', NULL, NULL, 'Aktif', '1101122422', 'Ayah Mahendra', '0812345671089', '2026-03-24 03:25:45'),
('1090', 'Siti Purnama', 'P', 'Gresik', '2011-06-15', 'Jl. Contoh No. 61', 'Ayah Purnama', 'Polisi', 'Ibu Purnama', 'Guru', NULL, NULL, 'Aktif', '1101122423', 'Ayah Purnama', '0812345671090', '2026-03-24 03:25:45'),
('1091', 'Dina Santoso', 'P', 'Gresik', '2011-04-09', 'Jl. Contoh No. 90', 'Ayah Santoso', 'Karyawan', 'Ibu Santoso', 'TNI', NULL, NULL, 'Aktif', '1101122424', 'Ayah Santoso', '0812345671091', '2026-03-24 03:25:45'),
('1092', 'Herman Mahendra', 'L', 'Surabaya', '2011-06-06', 'Jl. Contoh No. 88', 'Ayah Mahendra', 'Polisi', 'Ibu Mahendra', 'PNS', NULL, NULL, 'Aktif', '1101122425', 'Ayah Mahendra', '0812345671092', '2026-03-24 03:25:45'),
('1093', 'Budi Sanjaya', 'L', 'Gresik', '2010-07-16', 'Jl. Contoh No. 53', 'Ayah Sanjaya', 'Karyawan', 'Ibu Sanjaya', 'PNS', NULL, NULL, 'Aktif', '1101122426', 'Ayah Sanjaya', '0812345671093', '2026-03-24 03:25:45'),
('1094', 'Herman Kusuma', 'L', 'Sidoarjo', '2011-03-18', 'Jl. Contoh No. 6', 'Ayah Kusuma', 'Pedagang', 'Ibu Kusuma', 'TNI', NULL, NULL, 'Aktif', '1101122427', 'Ayah Kusuma', '0812345671094', '2026-03-24 03:25:45'),
('1095', 'Zaki Sari', 'L', 'Surabaya', '2010-12-20', 'Jl. Contoh No. 19', 'Ayah Sari', 'TNI', 'Ibu Sari', 'Polisi', NULL, NULL, 'Aktif', '1101122428', 'Ayah Sari', '0812345671095', '2026-03-24 03:25:45'),
('1096', 'Wanda Utami', 'P', 'Surabaya', '2010-03-14', 'Jl. Contoh No. 100', 'Ayah Utami', 'Pedagang', 'Ibu Utami', 'Polisi', NULL, NULL, 'Aktif', '1101122429', 'Ayah Utami', '0812345671096', '2026-03-24 03:25:45'),
('1097', 'Yulia Aulia', 'P', 'Mojokerto', '2010-02-09', 'Jl. Contoh No. 85', 'Ayah Aulia', 'Karyawan', 'Ibu Aulia', 'Pedagang', NULL, NULL, 'Aktif', '1101122430', 'Ayah Aulia', '0812345671097', '2026-03-24 03:25:45'),
('1098', 'Xavier Sari', 'L', 'Mojokerto', '2010-08-27', 'Jl. Contoh No. 62', 'Ayah Sari', 'Wiraswasta', 'Ibu Sari', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122431', 'Ayah Sari', '0812345671098', '2026-03-24 03:25:45'),
('1099', 'Siti Putri', 'P', 'Sidoarjo', '2010-04-22', 'Jl. Contoh No. 23', 'Ayah Putri', 'Buruh', 'Ibu Putri', 'Karyawan', NULL, NULL, 'Aktif', '1101122432', 'Ayah Putri', '0812345671099', '2026-03-24 03:25:45'),
('1100', 'Andi Pertiwi', 'L', 'Surabaya', '2011-12-09', 'Jl. Contoh No. 75', 'Ayah Pertiwi', 'Karyawan', 'Ibu Pertiwi', 'Pedagang', NULL, NULL, 'Aktif', '1101122433', 'Ayah Pertiwi', '0812345671100', '2026-03-24 03:25:45'),
('1101', 'Rizky Mahendra', 'L', 'Gresik', '2010-06-09', 'Jl. Contoh No. 43', 'Ayah Mahendra', 'Buruh', 'Ibu Mahendra', 'Buruh', NULL, NULL, 'Aktif', '1101122434', 'Ayah Mahendra', '0812345671101', '2026-03-24 03:25:45'),
('1102', 'Kevin Sanjaya', 'L', 'Malang', '2010-05-11', 'Jl. Contoh No. 23', 'Ayah Sanjaya', 'Guru', 'Ibu Sanjaya', 'Pedagang', NULL, NULL, 'Aktif', '1101122435', 'Ayah Sanjaya', '0812345671102', '2026-03-24 03:25:45'),
('1103', 'Elsa Kusuma', 'P', 'Malang', '2011-09-12', 'Jl. Contoh No. 82', 'Ayah Kusuma', 'PNS', 'Ibu Kusuma', 'PNS', NULL, NULL, 'Aktif', '1101122436', 'Ayah Kusuma', '0812345671103', '2026-03-24 03:25:45'),
('1104', 'Budi Hidayat', 'L', 'Gresik', '2011-05-13', 'Jl. Contoh No. 40', 'Ayah Hidayat', 'TNI', 'Ibu Hidayat', 'Karyawan', NULL, NULL, 'Aktif', '1101122437', 'Ayah Hidayat', '0812345671104', '2026-03-24 03:25:45'),
('1105', 'Nurul Mahendra', 'P', 'Mojokerto', '2010-01-28', 'Jl. Contoh No. 73', 'Ayah Mahendra', 'PNS', 'Ibu Mahendra', 'Pedagang', NULL, NULL, 'Aktif', '1101122438', 'Ayah Mahendra', '0812345671105', '2026-03-24 03:25:45'),
('1106', 'Fajar Sanjaya', 'L', 'Surabaya', '2010-10-27', 'Jl. Contoh No. 58', 'Ayah Sanjaya', 'Guru', 'Ibu Sanjaya', 'Guru', NULL, NULL, 'Aktif', '1101122439', 'Ayah Sanjaya', '0812345671106', '2026-03-24 03:25:45'),
('1107', 'Kartika Ramadhan', 'P', 'Surabaya', '2010-02-25', 'Jl. Contoh No. 8', 'Ayah Ramadhan', 'TNI', 'Ibu Ramadhan', 'TNI', NULL, NULL, 'Aktif', '1101122440', 'Ayah Ramadhan', '0812345671107', '2026-03-24 03:25:45'),
('1108', 'Fajar Pertiwi', 'L', 'Malang', '2011-04-02', 'Jl. Contoh No. 87', 'Ayah Pertiwi', 'Guru', 'Ibu Pertiwi', 'Buruh', NULL, NULL, 'Aktif', '1101122441', 'Ayah Pertiwi', '0812345671108', '2026-03-24 03:25:45'),
('1109', 'Siti Lestari', 'P', 'Gresik', '2011-05-05', 'Jl. Contoh No. 94', 'Ayah Lestari', 'Polisi', 'Ibu Lestari', 'TNI', NULL, NULL, 'Aktif', '1101122442', 'Ayah Lestari', '0812345671109', '2026-03-24 03:25:45'),
('1110', 'Xavier Hidayat', 'L', 'Malang', '2010-02-08', 'Jl. Contoh No. 59', 'Ayah Hidayat', 'Polisi', 'Ibu Hidayat', 'Buruh', NULL, NULL, 'Aktif', '1101122443', 'Ayah Hidayat', '0812345671110', '2026-03-24 03:25:45'),
('1111', 'Vino Nugroho', 'L', 'Mojokerto', '2010-02-08', 'Jl. Contoh No. 88', 'Ayah Nugroho', 'PNS', 'Ibu Nugroho', 'Buruh', NULL, NULL, 'Aktif', '1101122444', 'Ayah Nugroho', '0812345671111', '2026-03-24 03:25:45'),
('1112', 'Salsabila Safira', 'P', 'Mojokerto', '2010-06-15', 'Jl. Contoh No. 81', 'Ayah Safira', 'PNS', 'Ibu Safira', 'TNI', NULL, NULL, 'Aktif', '1101122445', 'Ayah Safira', '0812345671112', '2026-03-24 03:25:45'),
('1113', 'Dina Hidayat', 'P', 'Surabaya', '2011-11-03', 'Jl. Contoh No. 22', 'Ayah Hidayat', 'TNI', 'Ibu Hidayat', 'TNI', NULL, NULL, 'Aktif', '1101122446', 'Ayah Hidayat', '0812345671113', '2026-03-24 03:25:45'),
('1114', 'Hana Santoso', 'P', 'Sidoarjo', '2010-10-15', 'Jl. Contoh No. 55', 'Ayah Santoso', 'Buruh', 'Ibu Santoso', 'Guru', NULL, NULL, 'Aktif', '1101122447', 'Ayah Santoso', '0812345671114', '2026-03-24 03:25:45'),
('1115', 'Muhammad Putri', 'L', 'Surabaya', '2011-09-24', 'Jl. Contoh No. 16', 'Ayah Putri', 'Pedagang', 'Ibu Putri', 'Karyawan', NULL, NULL, 'Aktif', '1101122448', 'Ayah Putri', '0812345671115', '2026-03-24 03:25:45'),
('1116', 'Elsa Ramadhan', 'P', 'Malang', '2011-05-19', 'Jl. Contoh No. 84', 'Ayah Ramadhan', 'Pedagang', 'Ibu Ramadhan', 'PNS', NULL, NULL, 'Aktif', '1101122449', 'Ayah Ramadhan', '0812345671116', '2026-03-24 03:25:45'),
('1117', 'Eko Prasetyo', 'L', 'Surabaya', '2010-01-23', 'Jl. Contoh No. 85', 'Ayah Prasetyo', 'Polisi', 'Ibu Prasetyo', 'Guru', NULL, NULL, 'Aktif', '1101122450', 'Ayah Prasetyo', '0812345671117', '2026-03-24 03:25:45'),
('1118', 'Indah Prasetyo', 'P', 'Malang', '2010-10-20', 'Jl. Contoh No. 67', 'Ayah Prasetyo', 'PNS', 'Ibu Prasetyo', 'Pedagang', NULL, NULL, 'Aktif', '1101122451', 'Ayah Prasetyo', '0812345671118', '2026-03-24 03:25:45'),
('1119', 'Dewi Saputra', 'P', 'Gresik', '2011-04-16', 'Jl. Contoh No. 8', 'Ayah Saputra', 'Polisi', 'Ibu Saputra', 'PNS', NULL, NULL, 'Aktif', '1101122452', 'Ayah Saputra', '0812345671119', '2026-03-24 03:25:45'),
('1120', 'Bella Sari', 'P', 'Gresik', '2011-07-11', 'Jl. Contoh No. 31', 'Ayah Sari', 'Pedagang', 'Ibu Sari', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122453', 'Ayah Sari', '0812345671120', '2026-03-24 03:25:45'),
('1121', 'Vino Sari', 'L', 'Gresik', '2010-05-10', 'Jl. Contoh No. 28', 'Ayah Sari', 'Guru', 'Ibu Sari', 'TNI', NULL, NULL, 'Aktif', '1101122454', 'Ayah Sari', '0812345671121', '2026-03-24 03:25:45'),
('1122', 'Kartika Setiawan', 'P', 'Gresik', '2011-10-09', 'Jl. Contoh No. 54', 'Ayah Setiawan', 'Guru', 'Ibu Setiawan', 'Guru', NULL, NULL, 'Aktif', '1101122455', 'Ayah Setiawan', '0812345671122', '2026-03-24 03:25:45'),
('1123', 'Rizky Setiawan', 'L', 'Mojokerto', '2010-03-15', 'Jl. Contoh No. 5', 'Ayah Setiawan', 'Karyawan', 'Ibu Setiawan', 'TNI', NULL, NULL, 'Aktif', '1101122456', 'Ayah Setiawan', '0812345671123', '2026-03-24 03:25:45'),
('1124', 'Elsa Aulia', 'P', 'Malang', '2011-11-01', 'Jl. Contoh No. 57', 'Ayah Aulia', 'TNI', 'Ibu Aulia', 'Buruh', NULL, NULL, 'Aktif', '1101122457', 'Ayah Aulia', '0812345671124', '2026-03-24 03:25:45'),
('1125', 'Dewi Aulia', 'P', 'Gresik', '2011-04-12', 'Jl. Contoh No. 57', 'Ayah Aulia', 'Wiraswasta', 'Ibu Aulia', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122458', 'Ayah Aulia', '0812345671125', '2026-03-24 03:25:45'),
('1126', 'Kartika Purnama', 'P', 'Surabaya', '2011-04-21', 'Jl. Contoh No. 93', 'Ayah Purnama', 'Guru', 'Ibu Purnama', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122459', 'Ayah Purnama', '0812345671126', '2026-03-24 03:25:45'),
('1127', 'Ahmad Fahira', 'L', 'Sidoarjo', '2010-03-25', 'Jl. Contoh No. 49', 'Ayah Fahira', 'Polisi', 'Ibu Fahira', 'Pedagang', '081234561251', NULL, 'Aktif', '1101122460', 'Ayah Fahira', '0812345671127', '2026-03-24 03:25:45'),
('1128', 'Dina Setiawan', 'P', 'Malang', '2010-06-05', 'Jl. Contoh No. 44', 'Ayah Setiawan', 'PNS', 'Ibu Setiawan', 'Guru', NULL, NULL, 'Aktif', '1101122461', 'Ayah Setiawan', '0812345671128', '2026-03-24 03:25:45'),
('1129', 'Kevin Setiawan', 'L', 'Malang', '2011-12-09', 'Jl. Contoh No. 83', 'Ayah Setiawan', 'Buruh', 'Ibu Setiawan', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122462', 'Ayah Setiawan', '0812345671129', '2026-03-24 03:25:45'),
('1130', 'Zaki Setiawan', 'L', 'Malang', '2010-10-07', 'Jl. Contoh No. 36', 'Ayah Setiawan', 'TNI', 'Ibu Setiawan', 'Polisi', NULL, NULL, 'Aktif', '1101122463', 'Ayah Setiawan', '0812345671130', '2026-03-24 03:25:45'),
('1131', 'Eko Utami', 'L', 'Surabaya', '2011-02-23', 'Jl. Contoh No. 67', 'Ayah Utami', 'PNS', 'Ibu Utami', 'PNS', NULL, NULL, 'Aktif', '1101122464', 'Ayah Utami', '0812345671131', '2026-03-24 03:25:45'),
('1132', 'Pratama Santoso', 'L', 'Malang', '2011-03-22', 'Jl. Contoh No. 40', 'Ayah Santoso', 'Karyawan', 'Ibu Santoso', 'Karyawan', NULL, NULL, 'Aktif', '1101122465', 'Ayah Santoso', '0812345671132', '2026-03-24 03:25:45'),
('1133', 'Dewi Santoso', 'P', 'Sidoarjo', '2010-05-05', 'Jl. Contoh No. 25', 'Ayah Santoso', 'PNS', 'Ibu Santoso', 'Guru', NULL, NULL, 'Aktif', '1101122466', 'Ayah Santoso', '0812345671133', '2026-03-24 03:25:45'),
('1134', 'Queen Sanjaya', 'P', 'Malang', '2011-11-27', 'Jl. Contoh No. 11', 'Ayah Sanjaya', 'TNI', 'Ibu Sanjaya', 'PNS', NULL, NULL, 'Aktif', '1101122467', 'Ayah Sanjaya', '0812345671134', '2026-03-24 03:25:45'),
('1135', 'Kartika Mahendra', 'P', 'Mojokerto', '2010-10-17', 'Jl. Contoh No. 53', 'Ayah Mahendra', 'Pedagang', 'Ibu Mahendra', 'Guru', NULL, NULL, 'Aktif', '1101122468', 'Ayah Mahendra', '0812345671135', '2026-03-24 03:25:45'),
('1136', 'Irfan Aulia', 'L', 'Malang', '2011-07-12', 'Jl. Contoh No. 30', 'Ayah Aulia', 'Pedagang', 'Ibu Aulia', 'Karyawan', NULL, NULL, 'Aktif', '1101122469', 'Ayah Aulia', '0812345671136', '2026-03-24 03:25:45'),
('1137', 'Indah Safira', 'P', 'Malang', '2010-07-01', 'Jl. Contoh No. 72', 'Ayah Safira', 'TNI', 'Ibu Safira', 'PNS', NULL, NULL, 'Aktif', '1101122470', 'Ayah Safira', '0812345671137', '2026-03-24 03:25:45'),
('1138', 'Iwan Pertiwi', 'L', 'Sidoarjo', '2011-05-09', 'Jl. Contoh No. 61', 'Ayah Pertiwi', 'Wiraswasta', 'Ibu Pertiwi', 'Guru', NULL, NULL, 'Aktif', '1101122471', 'Ayah Pertiwi', '0812345671138', '2026-03-24 03:25:45'),
('1139', 'Siti Kusuma', 'P', 'Surabaya', '2011-12-16', 'Jl. Contoh No. 46', 'Ayah Kusuma', 'Karyawan', 'Ibu Kusuma', 'Polisi', NULL, NULL, 'Aktif', '1101122472', 'Ayah Kusuma', '0812345671139', '2026-03-24 03:25:45'),
('1140', 'Indah Safira', 'P', 'Malang', '2010-09-21', 'Jl. Contoh No. 8', 'Ayah Safira', 'Wiraswasta', 'Ibu Safira', 'PNS', NULL, NULL, 'Aktif', '1101122473', 'Ayah Safira', '0812345671140', '2026-03-24 03:25:45'),
('1141', 'Irfan Hidayat', 'L', 'Surabaya', '2011-11-15', 'Jl. Contoh No. 47', 'Ayah Hidayat', 'Guru', 'Ibu Hidayat', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122474', 'Ayah Hidayat', '0812345671141', '2026-03-24 03:25:45'),
('1142', 'Budi Kusuma', 'L', 'Mojokerto', '2010-04-23', 'Jl. Contoh No. 95', 'Ayah Kusuma', 'Pedagang', 'Ibu Kusuma', 'Polisi', NULL, NULL, 'Aktif', '1101122475', 'Ayah Kusuma', '0812345671142', '2026-03-24 03:25:45'),
('1143', 'Irfan Pertiwi', 'L', 'Gresik', '2011-05-28', 'Jl. Contoh No. 30', 'Ayah Pertiwi', 'Buruh', 'Ibu Pertiwi', 'Guru', NULL, NULL, 'Aktif', '1101122476', 'Ayah Pertiwi', '0812345671143', '2026-03-24 03:25:45'),
('1144', 'Muhammad Hidayat', 'L', 'Mojokerto', '2011-08-14', 'Jl. Contoh No. 59', 'Ayah Hidayat', 'Wiraswasta', 'Ibu Hidayat', 'Karyawan', NULL, NULL, 'Aktif', '1101122477', 'Ayah Hidayat', '0812345671144', '2026-03-24 03:25:45'),
('1145', 'Fajar Aulia', 'L', 'Malang', '2011-05-01', 'Jl. Contoh No. 87', 'Ayah Aulia', 'Buruh', 'Ibu Aulia', 'PNS', NULL, NULL, 'Aktif', '1101122478', 'Ayah Aulia', '0812345671145', '2026-03-24 03:25:45'),
('1146', 'Jihan Mahendra', 'P', 'Mojokerto', '2010-12-10', 'Jl. Contoh No. 54', 'Ayah Mahendra', 'Pedagang', 'Ibu Mahendra', 'Pedagang', NULL, NULL, 'Aktif', '1101122479', 'Ayah Mahendra', '0812345671146', '2026-03-24 03:25:45'),
('1147', 'Dewi Lestari', 'P', 'Mojokerto', '2010-07-08', 'Jl. Contoh No. 74', 'Ayah Lestari', 'PNS', 'Ibu Lestari', 'PNS', NULL, NULL, 'Aktif', '1101122480', 'Ayah Lestari', '0812345671147', '2026-03-24 03:25:45'),
('1148', 'Eko Nugroho', 'L', 'Surabaya', '2011-06-02', 'Jl. Contoh No. 1', 'Ayah Nugroho', 'Guru', 'Ibu Nugroho', 'PNS', NULL, NULL, 'Aktif', '1101122481', 'Ayah Nugroho', '0812345671148', '2026-03-24 03:25:45'),
('1149', 'Kartika Prasetyo', 'P', 'Sidoarjo', '2011-04-10', 'Jl. Contoh No. 71', 'Ayah Prasetyo', 'Karyawan', 'Ibu Prasetyo', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122482', 'Ayah Prasetyo', '0812345671149', '2026-03-24 03:25:45'),
('1150', 'Taufik Sari', 'L', 'Malang', '2011-03-09', 'Jl. Contoh No. 7', 'Ayah Sari', 'PNS', 'Ibu Sari', 'Buruh', NULL, NULL, 'Aktif', '1101122483', 'Ayah Sari', '0812345671150', '2026-03-24 03:25:45'),
('1151', 'Kartika Prasetyo', 'P', 'Mojokerto', '2011-03-25', 'Jl. Contoh No. 63', 'Ayah Prasetyo', 'Polisi', 'Ibu Prasetyo', 'TNI', NULL, NULL, 'Aktif', '1101122484', 'Ayah Prasetyo', '0812345671151', '2026-03-24 03:25:45'),
('1152', 'Fajar Wulandari', 'L', 'Gresik', '2010-11-07', 'Jl. Contoh No. 25', 'Ayah Wulandari', 'Wiraswasta', 'Ibu Wulandari', 'PNS', NULL, NULL, 'Aktif', '1101122485', 'Ayah Wulandari', '0812345671152', '2026-03-24 03:25:45'),
('1153', 'Kartika Saputra', 'P', 'Malang', '2011-09-07', 'Jl. Contoh No. 57', 'Ayah Saputra', 'Buruh', 'Ibu Saputra', 'TNI', NULL, NULL, 'Aktif', '1101122486', 'Ayah Saputra', '0812345671153', '2026-03-24 03:25:45'),
('1154', 'Gilang Kusuma', 'L', 'Malang', '2011-12-19', 'Jl. Contoh No. 83', 'Ayah Kusuma', 'Karyawan', 'Ibu Kusuma', 'Buruh', NULL, NULL, 'Aktif', '1101122487', 'Ayah Kusuma', '0812345671154', '2026-03-24 03:25:45'),
('1155', 'Nurul Ramadhan', 'P', 'Gresik', '2010-08-12', 'Jl. Contoh No. 50', 'Ayah Ramadhan', 'TNI', 'Ibu Ramadhan', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122488', 'Ayah Ramadhan', '0812345671155', '2026-03-24 03:25:45'),
('1156', 'Kartika Utami', 'P', 'Gresik', '2010-07-09', 'Jl. Contoh No. 7', 'Ayah Utami', 'Karyawan', 'Ibu Utami', 'PNS', NULL, NULL, 'Aktif', '1101122489', 'Ayah Utami', '0812345671156', '2026-03-24 03:25:45'),
('1157', 'Farida Hidayat', 'P', 'Gresik', '2011-05-18', 'Jl. Contoh No. 89', 'Ayah Hidayat', 'TNI', 'Ibu Hidayat', 'TNI', NULL, NULL, 'Aktif', '1101122490', 'Ayah Hidayat', '0812345671157', '2026-03-24 03:25:45'),
('1158', 'Salsabila Hidayat', 'P', 'Sidoarjo', '2010-11-12', 'Jl. Contoh No. 48', 'Ayah Hidayat', 'Wiraswasta', 'Ibu Hidayat', 'TNI', NULL, NULL, 'Aktif', '1101122491', 'Ayah Hidayat', '0812345671158', '2026-03-24 03:25:45'),
('1159', 'Farida Mahendra', 'P', 'Sidoarjo', '2011-11-12', 'Jl. Contoh No. 45', 'Ayah Mahendra', 'Karyawan', 'Ibu Mahendra', 'Karyawan', NULL, NULL, 'Aktif', '1101122492', 'Ayah Mahendra', '0812345671159', '2026-03-24 03:25:45'),
('1160', 'Joko Wulandari', 'L', 'Mojokerto', '2010-10-19', 'Jl. Contoh No. 35', 'Ayah Wulandari', 'Pedagang', 'Ibu Wulandari', 'TNI', NULL, NULL, 'Aktif', '1101122493', 'Ayah Wulandari', '0812345671160', '2026-03-24 03:25:45'),
('1161', 'Siti Prasetyo', 'P', 'Malang', '2010-12-23', 'Jl. Contoh No. 90', 'Ayah Prasetyo', 'Wiraswasta', 'Ibu Prasetyo', 'Polisi', NULL, NULL, 'Aktif', '1101122494', 'Ayah Prasetyo', '0812345671161', '2026-03-24 03:25:45'),
('1162', 'Kevin Wulandari', 'L', 'Sidoarjo', '2010-06-13', 'Jl. Contoh No. 22', 'Ayah Wulandari', 'Karyawan', 'Ibu Wulandari', 'Karyawan', NULL, NULL, 'Aktif', '1101122495', 'Ayah Wulandari', '0812345671162', '2026-03-24 03:25:45'),
('1163', 'Iwan Lestari', 'L', 'Sidoarjo', '2011-11-26', 'Jl. Contoh No. 61', 'Ayah Lestari', 'TNI', 'Ibu Lestari', 'TNI', NULL, NULL, 'Aktif', '1101122496', 'Ayah Lestari', '0812345671163', '2026-03-24 03:25:45'),
('1164', 'Andi Lestari', 'L', 'Mojokerto', '2010-08-09', 'Jl. Contoh No. 14', 'Jimin', 'Wiraswasta', 'Joy', 'Guru', NULL, NULL, 'Aktif', '1101122497', 'Ayah Lestari', '0812345671164', '2026-03-24 03:25:45'),
('1165', 'Siti Santoso', 'P', 'Surabaya', '2010-09-03', 'Jl. Contoh No. 77', 'Ayah Santoso', 'TNI', 'Ibu Santoso', 'TNI', NULL, NULL, 'Aktif', '1101122498', 'Ayah Santoso', '0812345671165', '2026-03-24 03:25:45'),
('1166', 'Taufik Fahira', 'L', 'Sidoarjo', '2011-06-09', 'Jl. Contoh No. 71', 'Ayah Fahira', 'Wiraswasta', 'Ibu Fahira', 'Polisi', NULL, NULL, 'Aktif', '1101122499', 'Ayah Fahira', '0812345671166', '2026-03-24 03:25:45'),
('1167', 'Queen Setiawan', 'P', 'Mojokerto', '2011-03-07', 'Jl. Contoh No. 34', 'Ayah Setiawan', 'Pedagang', 'Ibu Setiawan', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122500', 'Ayah Setiawan', '0812345671167', '2026-03-24 03:25:45'),
('1168', 'Ahmad Utami', 'L', 'Sidoarjo', '2011-03-20', 'Jl. Contoh No. 63', 'Ayah Utami', 'Polisi', 'Ibu Utami', 'Guru', NULL, NULL, 'Aktif', '1101122501', 'Ayah Utami', '0812345671168', '2026-03-24 03:25:45'),
('1169', 'Salsabila Putri', 'P', 'Sidoarjo', '2011-06-14', 'Jl. Contoh No. 90', 'Ayah Putri', 'PNS', 'Ibu Putri', 'Buruh', NULL, NULL, 'Aktif', '1101122502', 'Ayah Putri', '0812345671169', '2026-03-24 03:25:45'),
('1170', 'Elsa Purnama', 'P', 'Malang', '2010-02-27', 'Jl. Contoh No. 97', 'Ayah Purnama', 'Pedagang', 'Ibu Purnama', 'Pedagang', NULL, NULL, 'Aktif', '1101122503', 'Ayah Purnama', '0812345671170', '2026-03-24 03:25:45'),
('1171', 'Rizky Setiawan', 'L', 'Surabaya', '2011-05-27', 'Jl. Contoh No. 89', 'Ayah Setiawan', 'Wiraswasta', 'Ibu Setiawan', 'TNI', NULL, NULL, 'Aktif', '1101122504', 'Ayah Setiawan', '0812345671171', '2026-03-24 03:25:45'),
('1172', 'Bella Pertiwi', 'P', 'Sidoarjo', '2011-03-14', 'Jl. Contoh No. 33', 'Ayah Pertiwi', 'PNS', 'Ibu Pertiwi', 'Guru', NULL, NULL, 'Aktif', '1101122505', 'Ayah Pertiwi', '0812345671172', '2026-03-24 03:25:45'),
('1173', 'Taufik Kusuma', 'L', 'Mojokerto', '2011-03-07', 'Jl. Contoh No. 54', 'Ayah Kusuma', 'TNI', 'Ibu Kusuma', 'TNI', NULL, NULL, 'Aktif', '1101122506', 'Ayah Kusuma', '0812345671173', '2026-03-24 03:25:45'),
('1174', 'Jihan Hidayat', 'P', 'Mojokerto', '2010-11-08', 'Jl. Contoh No. 56', 'Ayah Hidayat', 'Guru', 'Ibu Hidayat', 'Guru', NULL, NULL, 'Aktif', '1101122507', 'Ayah Hidayat', '0812345671174', '2026-03-24 03:25:45'),
('1175', 'Gilang Putri', 'L', 'Mojokerto', '2011-07-17', 'Jl. Contoh No. 3', 'Ayah Putri', 'Polisi', 'Ibu Putri', 'Guru', NULL, NULL, 'Aktif', '1101122508', 'Ayah Putri', '0812345671175', '2026-03-24 03:25:45'),
('1176', 'Iwan Sari', 'L', 'Malang', '2010-11-13', 'Jl. Contoh No. 64', 'Ayah Sari', 'Karyawan', 'Ibu Sari', 'Polisi', NULL, NULL, 'Aktif', '1101122509', 'Ayah Sari', '0812345671176', '2026-03-24 03:25:45'),
('1177', 'Elsa Santoso', 'P', 'Gresik', '2011-04-16', 'Jl. Contoh No. 9', 'Ayah Santoso', 'Polisi', 'Ibu Santoso', 'Buruh', NULL, NULL, 'Aktif', '1101122510', 'Ayah Santoso', '0812345671177', '2026-03-24 03:25:45'),
('1178', 'Pratama Santoso', 'L', 'Gresik', '2011-01-06', 'Jl. Contoh No. 31', 'Ayah Santoso', 'Wiraswasta', 'Ibu Santoso', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122511', 'Ayah Santoso', '0812345671178', '2026-03-24 03:25:45'),
('1179', 'Jihan Lestari', 'P', 'Mojokerto', '2010-11-25', 'Jl. Contoh No. 45', 'Ayah Lestari', 'Polisi', 'Ibu Lestari', 'Pedagang', NULL, NULL, 'Aktif', '1101122512', 'Ayah Lestari', '0812345671179', '2026-03-24 03:25:45'),
('1180', 'Larasati Sari', 'P', 'Malang', '2011-10-11', 'Jl. Contoh No. 47', 'Ayah Sari', 'Wiraswasta', 'Ibu Sari', 'Polisi', NULL, NULL, 'Aktif', '1101122513', 'Ayah Sari', '0812345671180', '2026-03-24 03:25:45'),
('1181', 'Jihan Sari', 'P', 'Sidoarjo', '2011-02-02', 'Jl. Contoh No. 50', 'Ayah Sari', 'Polisi', 'Ibu Sari', 'PNS', NULL, NULL, 'Aktif', '1101122514', 'Ayah Sari', '0812345671181', '2026-03-24 03:25:45'),
('1182', 'Zaki Putri', 'L', 'Gresik', '2011-03-21', 'Jl. Contoh No. 85', 'Ayah Putri', 'Pedagang', 'Ibu Putri', 'Pedagang', NULL, NULL, 'Aktif', '1101122515', 'Ayah Putri', '0812345671182', '2026-03-24 03:25:45'),
('1183', 'Ahmad Purnama', 'L', 'Mojokerto', '2011-04-05', 'Jl. Contoh No. 91', 'Ayah Purnama', 'Guru', 'Ibu Purnama', 'Karyawan', NULL, NULL, 'Aktif', '1101122516', 'Ayah Purnama', '0812345671183', '2026-03-24 03:25:45'),
('1184', 'Elsa Setiawan', 'P', 'Gresik', '2010-11-10', 'Jl. Contoh No. 93', 'Ayah Setiawan', 'Pedagang', 'Ibu Setiawan', 'Pedagang', NULL, NULL, 'Aktif', '1101122517', 'Ayah Setiawan', '0812345671184', '2026-03-24 03:25:45'),
('1185', 'Herman Kusuma', 'L', 'Malang', '2011-02-01', 'Jl. Contoh No. 9', 'Ayah Kusuma', 'Karyawan', 'Ibu Kusuma', 'TNI', NULL, NULL, 'Aktif', '1101122518', 'Ayah Kusuma', '0812345671185', '2026-03-24 03:25:45'),
('1186', 'Pratama Aulia', 'L', 'Surabaya', '2010-02-27', 'Jl. Contoh No. 83', 'Ayah Aulia', 'Polisi', 'Ibu Aulia', 'TNI', NULL, NULL, 'Aktif', '1101122519', 'Ayah Aulia', '0812345671186', '2026-03-24 03:25:45'),
('1187', 'Ulya Putri', 'P', 'Mojokerto', '2011-01-01', 'Jl. Contoh No. 21', 'Ayah Putri', 'Pedagang', 'Ibu Putri', 'Pedagang', NULL, NULL, 'Aktif', '1101122520', 'Ayah Putri', '0812345671187', '2026-03-24 03:25:45'),
('1188', 'Jihan Wulandari', 'P', 'Malang', '2011-08-14', 'Jl. Contoh No. 77', 'Ayah Wulandari', 'TNI', 'Ibu Wulandari', 'Polisi', NULL, NULL, 'Aktif', '1101122521', 'Ayah Wulandari', '0812345671188', '2026-03-24 03:25:45'),
('1189', 'Gilang Utami', 'L', 'Surabaya', '2010-01-14', 'Jl. Contoh No. 26', 'Ayah Utami', 'Karyawan', 'Ibu Utami', 'Buruh', NULL, NULL, 'Aktif', '1101122522', 'Ayah Utami', '0812345671189', '2026-03-24 03:25:45'),
('1190', 'Elsa Pertiwi', 'P', 'Mojokerto', '2011-12-26', 'Jl. Contoh No. 44', 'Ayah Pertiwi', 'Wiraswasta', 'Ibu Pertiwi', 'TNI', NULL, NULL, 'Aktif', '1101122523', 'Ayah Pertiwi', '0812345671190', '2026-03-24 03:25:45'),
('1191', 'Budi Safira', 'L', 'Gresik', '2010-07-22', 'Jl. Contoh No. 63', 'Ayah Safira', 'Polisi', 'Ibu Safira', 'Karyawan', NULL, NULL, 'Aktif', '1101122524', 'Ayah Safira', '0812345671191', '2026-03-24 03:25:45'),
('1192', 'Gilang Wulandari', 'L', 'Surabaya', '2011-11-10', 'Jl. Contoh No. 97', 'Ayah Wulandari', 'Pedagang', 'Ibu Wulandari', 'Pedagang', NULL, NULL, 'Aktif', '1101122525', 'Ayah Wulandari', '0812345671192', '2026-03-24 03:25:45'),
('1193', 'Larasati Setiawan', 'P', 'Mojokerto', '2010-05-14', 'Jl. Contoh No. 24', 'Ayah Setiawan', 'Pedagang', 'Ibu Setiawan', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122526', 'Ayah Setiawan', '0812345671193', '2026-03-24 03:25:45'),
('1194', 'Wanda Putri', 'P', 'Surabaya', '2010-03-23', 'Jl. Contoh No. 19', 'Ayah Putri', 'TNI', 'Ibu Putri', 'Buruh', NULL, NULL, 'Aktif', '1101122527', 'Ayah Putri', '0812345671194', '2026-03-24 03:25:45'),
('1195', 'Nadia Setiawan', 'P', 'Mojokerto', '2011-09-09', 'Jl. Contoh No. 30', 'Ayah Setiawan', 'Pedagang', 'Ibu Setiawan', 'Guru', NULL, NULL, 'Aktif', '1101122528', 'Ayah Setiawan', '0812345671195', '2026-03-24 03:25:45'),
('1196', 'Joko Putri', 'L', 'Surabaya', '2011-06-05', 'Jl. Contoh No. 94', 'Ayah Putri', 'Buruh', 'Ibu Putri', 'PNS', NULL, NULL, 'Aktif', '1101122529', 'Ayah Putri', '0812345671196', '2026-03-24 03:25:45'),
('1197', 'Taufik Aulia', 'L', 'Malang', '2010-08-10', 'Jl. Contoh No. 68', 'Ayah Aulia', 'Polisi', 'Ibu Aulia', 'PNS', NULL, NULL, 'Aktif', '1101122530', 'Ayah Aulia', '0812345671197', '2026-03-24 03:25:45'),
('1198', 'Indah Fahira', 'P', 'Surabaya', '2011-05-16', 'Jl. Contoh No. 4', 'Ayah Fahira', 'Pedagang', 'Ibu Fahira', 'Karyawan', NULL, NULL, 'Aktif', '1101122531', 'Ayah Fahira', '0812345671198', '2026-03-24 03:25:45'),
('1199', 'Vino Purnama', 'L', 'Malang', '2011-08-14', 'Jl. Contoh No. 68', 'Ayah Purnama', 'Karyawan', 'Ibu Purnama', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122532', 'Ayah Purnama', '0812345671199', '2026-03-24 03:25:45'),
('1200', 'Nurul Wulandari', 'P', 'Sidoarjo', '2011-02-13', 'Jl. Contoh No. 81', 'Ayah Wulandari', 'PNS', 'Ibu Wulandari', 'PNS', NULL, NULL, 'Aktif', '1101122533', 'Ayah Wulandari', '0812345671200', '2026-03-24 03:25:45'),
('1201', 'Gita Setiawan', 'P', 'Sidoarjo', '2010-06-21', 'Jl. Contoh No. 94', 'Ayah Setiawan', 'PNS', 'Ibu Setiawan', 'Guru', NULL, NULL, 'Aktif', '1101122534', 'Ayah Setiawan', '0812345671201', '2026-03-24 03:25:45'),
('1202', 'Queen Setiawan', 'P', 'Sidoarjo', '2011-04-28', 'Jl. Contoh No. 69', 'Ayah Setiawan', 'Guru', 'Ibu Setiawan', 'Pedagang', NULL, NULL, 'Aktif', '1101122535', 'Ayah Setiawan', '0812345671202', '2026-03-24 03:25:45'),
('1203', 'Ahmad Santoso', 'L', 'Sidoarjo', '2011-04-27', 'Jl. Contoh No. 83', 'Ayah Santoso', 'Karyawan', 'Ibu Santoso', 'Karyawan', NULL, NULL, 'Aktif', '1101122536', 'Ayah Santoso', '0812345671203', '2026-03-24 03:25:45'),
('1204', 'Zaki Safira', 'L', 'Sidoarjo', '2011-08-15', 'Jl. Contoh No. 42', 'Ayah Safira', 'Buruh', 'Ibu Safira', 'Polisi', NULL, NULL, 'Aktif', '1101122537', 'Ayah Safira', '0812345671204', '2026-03-24 03:25:45'),
('1205', 'Gita Nugroho', 'P', 'Mojokerto', '2011-05-20', 'Jl. Contoh No. 72', 'Ayah Nugroho', 'Wiraswasta', 'Ibu Nugroho', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122538', 'Ayah Nugroho', '0812345671205', '2026-03-24 03:25:45'),
('1206', 'Nadia Purnama', 'P', 'Malang', '2011-06-22', 'Jl. Contoh No. 68', 'Ayah Purnama', 'Buruh', 'Ibu Purnama', 'Polisi', NULL, NULL, 'Aktif', '1101122539', 'Ayah Purnama', '0812345671206', '2026-03-24 03:25:45'),
('1207', 'Budi Lestari', 'L', 'Sidoarjo', '2011-06-24', 'Jl. Contoh No. 29', 'Ayah Lestari', 'Pedagang', 'Ibu Lestari', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122540', 'Ayah Lestari', '0812345671207', '2026-03-24 03:25:45'),
('1208', 'Taufik Fahira', 'L', 'Mojokerto', '2010-12-08', 'Jl. Contoh No. 53', 'Ayah Fahira', 'TNI', 'Ibu Fahira', 'Guru', NULL, NULL, 'Aktif', '1101122541', 'Ayah Fahira', '0812345671208', '2026-03-24 03:25:45'),
('1209', 'Dewi Sari', 'P', 'Mojokerto', '2011-02-13', 'Jl. Contoh No. 41', 'Ayah Sari', 'Guru', 'Ibu Sari', 'Guru', NULL, NULL, 'Aktif', '1101122542', 'Ayah Sari', '0812345671209', '2026-03-24 03:25:45'),
('1210', 'Siti Kusuma', 'P', 'Mojokerto', '2011-08-01', 'Jl. Contoh No. 39', 'Ayah Kusuma', 'Wiraswasta', 'Ibu Kusuma', 'Guru', NULL, NULL, 'Aktif', '1101122543', 'Ayah Kusuma', '0812345671210', '2026-03-24 03:25:45'),
('1211', 'Dewi Setiawan', 'P', 'Gresik', '2010-06-14', 'Jl. Contoh No. 2', 'Ayah Setiawan', 'Karyawan', 'Ibu Setiawan', 'TNI', NULL, NULL, 'Aktif', '1101122544', 'Ayah Setiawan', '0812345671211', '2026-03-24 03:25:45'),
('1212', 'Gilang Utami', 'L', 'Gresik', '2010-12-08', 'Jl. Contoh No. 29', 'Ayah Utami', 'TNI', 'Ibu Utami', 'Pedagang', NULL, NULL, 'Aktif', '1101122545', 'Ayah Utami', '0812345671212', '2026-03-24 03:25:45'),
('1213', 'Maya Santoso', 'P', 'Gresik', '2010-06-22', 'Jl. Contoh No. 81', 'Ayah Santoso', 'PNS', 'Ibu Santoso', 'Polisi', NULL, NULL, 'Aktif', '1101122546', 'Ayah Santoso', '0812345671213', '2026-03-24 03:25:45'),
('1214', 'Elsa Wulandari', 'P', 'Gresik', '2011-05-15', 'Jl. Contoh No. 52', 'Ayah Wulandari', 'Buruh', 'Ibu Wulandari', 'PNS', NULL, NULL, 'Aktif', '1101122547', 'Ayah Wulandari', '0812345671214', '2026-03-24 03:25:45'),
('1215', 'Nadia Nugroho', 'P', 'Surabaya', '2010-06-04', 'Jl. Contoh No. 78', 'Ayah Nugroho', 'Buruh', 'Ibu Nugroho', 'PNS', NULL, NULL, 'Aktif', '1101122548', 'Ayah Nugroho', '0812345671215', '2026-03-24 03:25:45'),
('1216', 'Nadia Pertiwi', 'P', 'Gresik', '2010-03-17', 'Jl. Contoh No. 14', 'Ayah Pertiwi', 'Pedagang', 'Ibu Pertiwi', 'Guru', NULL, NULL, 'Aktif', '1101122549', 'Ayah Pertiwi', '0812345671216', '2026-03-24 03:25:45'),
('1217', 'Kartika Ramadhan', 'P', 'Surabaya', '2010-07-17', 'Jl. Contoh No. 65', 'Ayah Ramadhan', 'Guru', 'Ibu Ramadhan', 'Guru', NULL, NULL, 'Aktif', '1101122550', 'Ayah Ramadhan', '0812345671217', '2026-03-24 03:25:45'),
('1218', 'Kartika Ramadhan', 'P', 'Gresik', '2010-07-01', 'Jl. Contoh No. 99', 'Ayah Ramadhan', 'Buruh', 'Ibu Ramadhan', 'Pedagang', NULL, NULL, 'Aktif', '1101122551', 'Ayah Ramadhan', '0812345671218', '2026-03-24 03:25:45'),
('1219', 'Ahmad Prasetyo', 'L', 'Surabaya', '2011-06-19', 'Jl. Contoh No. 8', 'Ayah Prasetyo', 'PNS', 'Ibu Prasetyo', 'Buruh', NULL, NULL, 'Aktif', '1101122552', 'Ayah Prasetyo', '0812345671219', '2026-03-24 03:25:45'),
('1220', 'Siti Pertiwi', 'P', 'Surabaya', '2010-12-12', 'Jl. Contoh No. 72', 'Ayah Pertiwi', 'Karyawan', 'Ibu Pertiwi', 'Polisi', NULL, NULL, 'Aktif', '1101122553', 'Ayah Pertiwi', '0812345671220', '2026-03-24 03:25:45'),
('1221', 'Ahmad Pertiwi', 'L', 'Surabaya', '2011-08-25', 'Jl. Contoh No. 70', 'Ayah Pertiwi', 'Buruh', 'Ibu Pertiwi', 'Wiraswasta', NULL, NULL, 'Aktif', '1101122554', 'Ayah Pertiwi', '0812345671221', '2026-03-24 03:25:45'),
('1222', 'Irfan Kusuma', 'L', 'Mojokerto', '2010-07-10', 'Jl. Contoh No. 22', 'Ayah Kusuma', 'PNS', 'Ibu Kusuma', 'Buruh', NULL, NULL, 'Aktif', '1101122555', 'Ayah Kusuma', '0812345671222', '2026-03-24 03:25:45'),
('1223', 'Kartika Utami', 'P', 'Malang', '2010-03-28', 'Jl. Contoh No. 13', 'Ayah Utami', 'Pedagang', 'Ibu Utami', 'Polisi', NULL, NULL, 'Aktif', '1101122556', 'Ayah Utami', '0812345671223', '2026-03-24 03:25:45'),
('1224', 'Wanda Kusuma', 'P', 'Gresik', '2011-02-26', 'Jl. Contoh No. 19', 'Ayah Kusuma', 'Guru', 'Ibu Kusuma', 'Polisi', NULL, NULL, 'Aktif', '1101122557', 'Ayah Kusuma', '0812345671224', '2026-03-24 03:25:45'),
('1225', 'Hana Saputra', 'P', 'Sidoarjo', '2011-02-26', 'Jl. Contoh No. 28', 'Ayah Saputra', 'Buruh', 'Ibu Saputra', 'TNI', NULL, NULL, 'Aktif', '1101122558', 'Ayah Saputra', '0812345671225', '2026-03-24 03:25:45'),
('2024001', 'Ahmad Roland', 'L', 'Malang', '2010-05-15', 'Jl. Merdeka No. 1', 'Bpk. Dani', 'Swasta', 'Ibu Dani', 'Ibu Rumah Tangga', '081234567890', 1, 'Aktif', NULL, NULL, NULL, '2026-04-02 05:12:55'),
('2025002', 'Budi Roland', 'L', 'Malang', '2012-08-20', 'Jl. Merdeka No. 1', NULL, NULL, NULL, NULL, NULL, 1, 'Aktif', NULL, NULL, NULL, '2026-04-02 05:13:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tahun_ajaran`
--

CREATE TABLE `tb_tahun_ajaran` (
  `id_tahun` int(11) NOT NULL,
  `nama_tahun` varchar(20) NOT NULL,
  `status` enum('Aktif','Arsip') DEFAULT 'Aktif',
  `semester_aktif` enum('Ganjil','Genap') DEFAULT 'Ganjil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_tahun_ajaran`
--

INSERT INTO `tb_tahun_ajaran` (`id_tahun`, `nama_tahun`, `status`, `semester_aktif`) VALUES
(1, '2025/2026', 'Aktif', 'Ganjil');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_anggota_kelas`
--
ALTER TABLE `tb_anggota_kelas`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `no_induk` (`no_induk`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_tahun` (`id_tahun`);

--
-- Indeks untuk tabel `tb_aturan_sp`
--
ALTER TABLE `tb_aturan_sp`
  ADD PRIMARY KEY (`id_aturan_sp`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_izin`
--
ALTER TABLE `tb_izin`
  ADD PRIMARY KEY (`id_izin`),
  ADD KEY `no_induk` (`no_induk`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_jenis_pelanggaran`
--
ALTER TABLE `tb_jenis_pelanggaran`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `tb_kategori_pelanggaran`
--
ALTER TABLE `tb_kategori_pelanggaran`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD UNIQUE KEY `kode_mapel` (`kode_mapel`);

--
-- Indeks untuk tabel `tb_orang_tua`
--
ALTER TABLE `tb_orang_tua`
  ADD PRIMARY KEY (`id_ortu`),
  ADD UNIQUE KEY `nik_ortu` (`nik_ortu`);

--
-- Indeks untuk tabel `tb_pelanggaran_detail`
--
ALTER TABLE `tb_pelanggaran_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indeks untuk tabel `tb_pelanggaran_header`
--
ALTER TABLE `tb_pelanggaran_header`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_tahun` (`id_tahun`);

--
-- Indeks untuk tabel `tb_pelanggaran_sanksi`
--
ALTER TABLE `tb_pelanggaran_sanksi`
  ADD PRIMARY KEY (`id_trans_sanksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_sanksi_ref` (`id_sanksi_ref`);

--
-- Indeks untuk tabel `tb_predikat_nilai`
--
ALTER TABLE `tb_predikat_nilai`
  ADD PRIMARY KEY (`id_predikat`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_presensi`
--
ALTER TABLE `tb_presensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `tb_riwayat_sp`
--
ALTER TABLE `tb_riwayat_sp`
  ADD PRIMARY KEY (`id_sp`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  ADD PRIMARY KEY (`id_ruangan`),
  ADD UNIQUE KEY `kode_ruangan` (`kode_ruangan`);

--
-- Indeks untuk tabel `tb_sanksi_ref`
--
ALTER TABLE `tb_sanksi_ref`
  ADD PRIMARY KEY (`id_sanksi_ref`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`no_induk`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD KEY `fk_ortu_siswa` (`id_ortu`);

--
-- Indeks untuk tabel `tb_tahun_ajaran`
--
ALTER TABLE `tb_tahun_ajaran`
  ADD PRIMARY KEY (`id_tahun`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_anggota_kelas`
--
ALTER TABLE `tb_anggota_kelas`
  MODIFY `id_anggota` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_aturan_sp`
--
ALTER TABLE `tb_aturan_sp`
  MODIFY `id_aturan_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_izin`
--
ALTER TABLE `tb_izin`
  MODIFY `id_izin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jenis_pelanggaran`
--
ALTER TABLE `tb_jenis_pelanggaran`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori_pelanggaran`
--
ALTER TABLE `tb_kategori_pelanggaran`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tb_orang_tua`
--
ALTER TABLE `tb_orang_tua`
  MODIFY `id_ortu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggaran_detail`
--
ALTER TABLE `tb_pelanggaran_detail`
  MODIFY `id_detail` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggaran_header`
--
ALTER TABLE `tb_pelanggaran_header`
  MODIFY `id_transaksi` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggaran_sanksi`
--
ALTER TABLE `tb_pelanggaran_sanksi`
  MODIFY `id_trans_sanksi` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_predikat_nilai`
--
ALTER TABLE `tb_predikat_nilai`
  MODIFY `id_predikat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_presensi`
--
ALTER TABLE `tb_presensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `tb_riwayat_sp`
--
ALTER TABLE `tb_riwayat_sp`
  MODIFY `id_sp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `tb_sanksi_ref`
--
ALTER TABLE `tb_sanksi_ref`
  MODIFY `id_sanksi_ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_tahun_ajaran`
--
ALTER TABLE `tb_tahun_ajaran`
  MODIFY `id_tahun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_anggota_kelas`
--
ALTER TABLE `tb_anggota_kelas`
  ADD CONSTRAINT `tb_anggota_kelas_ibfk_1` FOREIGN KEY (`no_induk`) REFERENCES `tb_siswa` (`no_induk`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_anggota_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`),
  ADD CONSTRAINT `tb_anggota_kelas_ibfk_3` FOREIGN KEY (`id_tahun`) REFERENCES `tb_tahun_ajaran` (`id_tahun`);

--
-- Ketidakleluasaan untuk tabel `tb_aturan_sp`
--
ALTER TABLE `tb_aturan_sp`
  ADD CONSTRAINT `tb_aturan_sp_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori_pelanggaran` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD CONSTRAINT `tb_guru_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tb_izin`
--
ALTER TABLE `tb_izin`
  ADD CONSTRAINT `tb_izin_ibfk_1` FOREIGN KEY (`no_induk`) REFERENCES `tb_siswa` (`no_induk`);

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `tb_jenis_pelanggaran`
--
ALTER TABLE `tb_jenis_pelanggaran`
  ADD CONSTRAINT `tb_jenis_pelanggaran_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori_pelanggaran` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD CONSTRAINT `tb_jurnal_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`);

--
-- Ketidakleluasaan untuk tabel `tb_pelanggaran_detail`
--
ALTER TABLE `tb_pelanggaran_detail`
  ADD CONSTRAINT `tb_pelanggaran_detail_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_pelanggaran_header` (`id_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_pelanggaran_detail_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis_pelanggaran` (`id_jenis`);

--
-- Ketidakleluasaan untuk tabel `tb_pelanggaran_header`
--
ALTER TABLE `tb_pelanggaran_header`
  ADD CONSTRAINT `tb_pelanggaran_header_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota_kelas` (`id_anggota`),
  ADD CONSTRAINT `tb_pelanggaran_header_ibfk_2` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`),
  ADD CONSTRAINT `tb_pelanggaran_header_ibfk_3` FOREIGN KEY (`id_tahun`) REFERENCES `tb_tahun_ajaran` (`id_tahun`);

--
-- Ketidakleluasaan untuk tabel `tb_pelanggaran_sanksi`
--
ALTER TABLE `tb_pelanggaran_sanksi`
  ADD CONSTRAINT `tb_pelanggaran_sanksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_pelanggaran_header` (`id_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_pelanggaran_sanksi_ibfk_2` FOREIGN KEY (`id_sanksi_ref`) REFERENCES `tb_sanksi_ref` (`id_sanksi_ref`);

--
-- Ketidakleluasaan untuk tabel `tb_predikat_nilai`
--
ALTER TABLE `tb_predikat_nilai`
  ADD CONSTRAINT `tb_predikat_nilai_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori_pelanggaran` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_presensi`
--
ALTER TABLE `tb_presensi`
  ADD CONSTRAINT `tb_presensi_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota_kelas` (`id_anggota`),
  ADD CONSTRAINT `tb_presensi_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`);

--
-- Ketidakleluasaan untuk tabel `tb_riwayat_sp`
--
ALTER TABLE `tb_riwayat_sp`
  ADD CONSTRAINT `tb_riwayat_sp_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota_kelas` (`id_anggota`),
  ADD CONSTRAINT `tb_riwayat_sp_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `fk_ortu_siswa` FOREIGN KEY (`id_ortu`) REFERENCES `tb_orang_tua` (`id_ortu`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
