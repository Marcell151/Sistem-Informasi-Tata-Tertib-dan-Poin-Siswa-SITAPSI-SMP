<?php
/**
 * PORTAL TERPADU - App Launchpad (SSO)
 * Lokasi: C:\xampp\htdocs\portal_sekolah\launchpad.php
 * FIXED: Masalah penamaan folder untuk SuperAdmin agar diarahkan ke folder 'admin'
 */
session_start();

if (!isset($_SESSION['user_id']) || !isset($_SESSION['role'])) { 
    header("Location: index.php"); 
    exit; 
}

// 1. PANGGIL KONFIGURASI PDO ANDA
require_once 'config/database.php'; 

$nama_user = $_SESSION['nama_lengkap'];
$role = $_SESSION['role'];

// --- LOGIKA PENENTUAN FOLDER & FILE TUJUAN ---
// Jika SuperAdmin atau Admin, arahkan ke folder 'admin' dan file 'dashboard.php'
// Jika Guru, arahkan ke folder 'guru' dan file 'input_pelanggaran.php'
$folder_tujuan = ($role === 'SuperAdmin' || $role === 'Admin') ? 'admin' : strtolower($role);
$file_tujuan   = ($role === 'SuperAdmin' || $role === 'Admin') ? 'dashboard' : 'input_pelanggaran';
// ---------------------------------------------

// ==========================================
// 2. PENGECEKAN SETUP AWAL (TAHUN AJARAN)
// Menggunakan fungsi fetchOne() dari database.php
// ==========================================
$cek_ta = fetchOne("SELECT id_tahun FROM tb_tahun_ajaran WHERE status = 'Aktif'");

// Jika tidak ada data yang kembali (KOSONG)
if (!$cek_ta) {
    if ($role === 'SuperAdmin' || $role === 'Admin') {
        // Paksa Admin ke halaman Setup
        header("Location: core_admin/views/setup_tahun_ajaran.php");
        exit;
    } else {
        // Blokir Guru
        ?>
        <!DOCTYPE html>
        <html lang="id">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sistem Belum Siap</title>
            <script src="https://cdn.tailwindcss.com"></script>
            <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;700&display=swap" rel="stylesheet">
            <style>body { font-family: 'Plus Jakarta Sans', sans-serif; }</style>
        </head>
        <body class="bg-slate-50 min-h-screen flex items-center justify-center p-4">
            <div class="bg-white p-8 rounded-3xl shadow-xl max-w-md w-full text-center border-t-4 border-amber-500">
                <div class="w-20 h-20 bg-amber-100 text-amber-500 rounded-full flex items-center justify-center mx-auto mb-6">
                    <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                </div>
                <h2 class="text-2xl font-bold text-slate-800 mb-2">Sistem Belum Dikonfigurasi</h2>
                <p class="text-slate-500 mb-8">Mohon maaf, Portal Terpadu saat ini belum memiliki Tahun Ajaran yang aktif. Silakan hubungi <b>Admin Pusat</b> untuk melakukan konfigurasi awal.</p>
                <a href="logout.php" class="inline-block bg-slate-800 text-white font-bold py-3 px-6 rounded-xl hover:bg-slate-900 transition-colors w-full">Keluar dari Portal</a>
            </div>
        </body>
        </html>
        <?php
        exit;
    }
}
// ==========================================
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Launchpad - SMPK Santa Maria 2</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Plus Jakarta Sans', sans-serif; } </style>
</head>
<body class="bg-[#F8FAFC] min-h-screen">

    <nav class="bg-white border-b border-slate-200 sticky top-0 z-50">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0">
                    <img src="sitapsi/assets/img/logo.png" alt="Logo Santa Maria" class="w-full h-full object-contain">
                </div>
                <span class="font-extrabold text-slate-800 tracking-tight">Portal Terpadu</span>
                <span class="ml-2 px-2 py-0.5 bg-slate-100 border border-slate-200 text-slate-500 rounded text-[10px] font-bold uppercase hidden sm:inline">Hak Akses: <?= $role ?></span>
            </div>
            <a href="logout.php" onclick="return confirm('Keluar dari portal terpadu?')" class="flex items-center text-sm font-bold text-red-500 hover:text-red-700 bg-red-50 px-3 py-1.5 rounded-lg transition-colors">
                <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                Keluar
            </a>
        </div>
    </nav>

    <main class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="mb-10 text-center">
            <h1 class="text-3xl sm:text-4xl font-extrabold text-slate-800 mb-2">Selamat Datang, <?= htmlspecialchars($nama_user) ?></h1>
            <p class="text-slate-500 font-medium">Pilih modul sistem yang ingin Anda akses hari ini.</p>
        </div>

        <?php if ($role === 'Admin' || $role === 'SuperAdmin'): ?>
        <div class="max-w-4xl mx-auto mb-10">
            <h2 class="text-xs font-extrabold text-slate-400 uppercase tracking-widest mb-4">Pengaturan Master (Core System)</h2>
            <div class="grid grid-cols-2 md:grid-cols-5 gap-4">
                <a href="core_admin/views/data_siswa.php" class="bg-white p-4 rounded-2xl border border-slate-200 shadow-sm hover:border-[#000080] hover:shadow-md transition-all text-center group">
                    <div class="w-10 h-10 bg-slate-100 text-slate-600 rounded-full flex items-center justify-center mx-auto mb-3 group-hover:bg-[#000080] group-hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    </div>
                    <span class="text-[11px] font-bold text-slate-700">Data Siswa</span>
                </a>
                <a href="core_admin/views/data_guru.php" class="bg-white p-4 rounded-2xl border border-slate-200 shadow-sm hover:border-[#000080] hover:shadow-md transition-all text-center group">
                    <div class="w-10 h-10 bg-slate-100 text-slate-600 rounded-full flex items-center justify-center mx-auto mb-3 group-hover:bg-[#000080] group-hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
                    </div>
                    <span class="text-[11px] font-bold text-slate-700">Data Guru</span>
                </a>
                <a href="core_admin/views/data_ortu.php" class="bg-white p-4 rounded-2xl border border-slate-200 shadow-sm hover:border-[#000080] hover:shadow-md transition-all text-center group">
                    <div class="w-10 h-10 bg-slate-100 text-slate-600 rounded-full flex items-center justify-center mx-auto mb-3 group-hover:bg-[#000080] group-hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    </div>
                    <span class="text-[11px] font-bold text-slate-700">Wali Murid</span>
                </a>
                <a href="core_admin/views/pengaturan_akademik.php" class="bg-white p-4 rounded-2xl border border-slate-200 shadow-sm hover:border-[#000080] hover:shadow-md transition-all text-center group">
                    <div class="w-10 h-10 bg-slate-100 text-slate-600 rounded-full flex items-center justify-center mx-auto mb-3 group-hover:bg-[#000080] group-hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect><line x1="8" y1="21" x2="16" y2="21"></line><line x1="12" y1="17" x2="12" y2="21"></line></svg>
                    </div>
                    <span class="text-[11px] font-bold text-slate-700">Akademik</span>
                </a>
                <a href="core_admin/views/arsip_tahun.php" class="bg-white p-4 rounded-2xl border border-slate-200 shadow-sm hover:border-slate-400 hover:shadow-md transition-all text-center group col-span-2 md:col-span-1">
                    <div class="w-10 h-10 bg-slate-100 text-slate-600 rounded-full flex items-center justify-center mx-auto mb-3 group-hover:bg-slate-700 group-hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M21 8v13H3V8"></path><path d="M1 3h22v5H1z"></path><path d="M10 12h4"></path></svg>
                    </div>
                    <span class="text-[11px] font-bold text-slate-700">Arsip Global</span>
                </a>
            </div>
        </div>
        <?php endif; ?>

        <div class="max-w-4xl mx-auto">
            <h2 class="text-xs font-extrabold text-slate-400 uppercase tracking-widest mb-4">Modul Operasional</h2>
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-6">
                
                <a href="sitapsi/views/<?= $folder_tujuan ?>/<?= $file_tujuan ?>.php" class="bg-white rounded-3xl p-6 border border-slate-200 shadow-sm hover:shadow-xl hover:border-[#000080] transition-all group relative overflow-hidden flex flex-col h-full">
                    <div class="absolute top-0 right-0 w-32 h-32 bg-blue-50 rounded-full transform translate-x-10 -translate-y-10 group-hover:scale-150 transition-transform duration-500 -z-10"></div>
                    <div class="w-14 h-14 bg-[#000080] text-white rounded-2xl flex items-center justify-center mb-6 shadow-md shadow-blue-900/20 group-hover:scale-110 transition-transform">
                        <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    </div>
                    <h3 class="text-xl font-extrabold text-slate-800 mb-2">SITAPSI</h3>
                    <p class="text-sm text-slate-500 font-medium flex-1">Sistem Tata Tertib. Kelola poin kedisiplinan dan SP.</p>
                    <div class="mt-6 flex items-center text-[#000080] font-bold text-sm">
                        Buka Modul <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                    </div>
                </a>

                <a href="#" onclick="alert('Modul Absensi masih dalam tahap pengembangan.')" class="bg-white rounded-3xl p-6 border border-slate-200 shadow-sm hover:shadow-xl hover:border-emerald-500 transition-all group relative overflow-hidden flex flex-col h-full opacity-90">
                    <div class="absolute top-0 right-0 w-32 h-32 bg-emerald-50 rounded-full transform translate-x-10 -translate-y-10 group-hover:scale-150 transition-transform duration-500 -z-10"></div>
                    <div class="w-14 h-14 bg-emerald-500 text-white rounded-2xl flex items-center justify-center mb-6 shadow-md shadow-emerald-900/20 group-hover:scale-110 transition-transform">
                        <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                    </div>
                    <h3 class="text-xl font-extrabold text-slate-800 mb-2">E-Absensi</h3>
                    <p class="text-sm text-slate-500 font-medium flex-1">Presensi kehadiran kelas harian (Sakit, Izin, Alpa).</p>
                    <div class="mt-6 flex items-center text-emerald-600 font-bold text-sm">
                        Buka Modul <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                    </div>
                </a>

                <a href="#" onclick="alert('Modul Ekstrakurikuler masih dalam tahap pengembangan.')" class="bg-white rounded-3xl p-6 border border-slate-200 shadow-sm hover:shadow-xl hover:border-amber-500 transition-all group relative overflow-hidden flex flex-col h-full opacity-90">
                    <div class="absolute top-0 right-0 w-32 h-32 bg-amber-50 rounded-full transform translate-x-10 -translate-y-10 group-hover:scale-150 transition-transform duration-500 -z-10"></div>
                    <div class="w-14 h-14 bg-amber-500 text-white rounded-2xl flex items-center justify-center mb-6 shadow-md shadow-amber-900/20 group-hover:scale-110 transition-transform">
                        <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
                    </div>
                    <h3 class="text-xl font-extrabold text-slate-800 mb-2">SI-Ekstra</h3>
                    <p class="text-sm text-slate-500 font-medium flex-1">Manajemen nilai dan kegiatan bakat minat siswa.</p>
                    <div class="mt-6 flex items-center text-amber-600 font-bold text-sm">
                        Buka Modul <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                    </div>
                </a>

            </div>
        </div>

    </main>
</body>
</html>