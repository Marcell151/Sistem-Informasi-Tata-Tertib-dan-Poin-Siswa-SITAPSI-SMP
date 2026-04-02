<?php
/**
 * PORTAL TERPADU - Halaman Login SSO
 * Lokasi: htdocs/portal_sekolah/index.php
 */
session_start();

// Jika sudah login, langsung ke Launchpad
if (isset($_SESSION['user_id'])) {
    header("Location: launchpad.php");
    exit;
}

// Panggil koneksi database dari folder sitapsi
require_once 'config/database.php';

// Ambil daftar guru untuk Dropdown
$guru_list = fetchAll("SELECT id_guru, nama_guru FROM tb_guru WHERE status = 'Aktif' ORDER BY nama_guru ASC");

// Tangkap pesan error jika ada
$error = $_SESSION['error_message'] ?? '';
unset($_SESSION['error_message']);

// Baca Cookies "Ingat Saya"
$saved_admin_user = $_COOKIE['saved_admin_user'] ?? '';
$saved_admin_pass = $_COOKIE['saved_admin_pass'] ?? '';
$saved_guru_id    = $_COOKIE['saved_guru_id'] ?? '';
$saved_guru_pin   = $_COOKIE['saved_guru_pin'] ?? '';

// Tentukan Tab Aktif (Jika sebelumnya login sebagai guru, buka tab guru)
$active_tab = ($saved_guru_id) ? 'guru' : 'admin';
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Terpadu - SMPK Santa Maria 2</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Plus Jakarta Sans', sans-serif; } </style>
</head>
<body class="bg-slate-50 min-h-screen flex flex-col items-center justify-center p-4 relative overflow-hidden">

    <div class="fixed inset-0 pointer-events-none z-0">
        <div class="absolute -top-32 -right-32 w-96 h-96 bg-[#000080] rounded-full mix-blend-multiply filter blur-3xl opacity-10"></div>
        <div class="absolute -bottom-32 -left-32 w-96 h-96 bg-blue-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20"></div>
    </div>

    <div class="w-full max-w-md relative z-10 mb-6">
        
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-white shadow-md border border-slate-100 mb-4 p-2">
                <img src="sitapsi/assets/img/logo.png" alt="Logo Santa Maria" class="w-full h-full object-contain">
            </div>
            <h1 class="text-3xl font-extrabold text-slate-800 tracking-tight">Portal Terpadu</h1>
            <p class="text-sm font-medium text-slate-500 mt-1">SMPK Santa Maria 2 Malang</p>
        </div>

        <div class="bg-white rounded-3xl shadow-xl border border-slate-100 overflow-hidden">
            
            <div class="flex border-b border-slate-200">
                <button onclick="switchTab('admin')" id="tab-admin" class="flex-1 py-4 text-sm font-extrabold transition-colors <?= $active_tab === 'admin' ? 'text-[#000080] border-b-2 border-[#000080]' : 'text-slate-400 hover:text-slate-600' ?>">Administrator</button>
                <button onclick="switchTab('guru')" id="tab-guru" class="flex-1 py-4 text-sm font-extrabold transition-colors <?= $active_tab === 'guru' ? 'text-[#000080] border-b-2 border-[#000080]' : 'text-slate-400 hover:text-slate-600' ?>">Guru / Pegawai</button>
            </div>

            <div class="p-8">
                <?php if ($error): ?>
                <div class="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-xl mb-6 flex items-center shadow-sm">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line></svg>
                    <p class="text-sm font-bold"><?= htmlspecialchars($error) ?></p>
                </div>
                <?php endif; ?>

                <form id="form-admin" action="login_process.php" method="POST" class="space-y-5 <?= $active_tab !== 'admin' ? 'hidden' : '' ?>">
                    <input type="hidden" name="login_type" value="admin">
                    <div>
                        <label class="block text-xs font-bold text-slate-500 mb-2 uppercase">Username Admin</label>
                        <input type="text" name="username" required value="<?= htmlspecialchars($saved_admin_user) ?>" placeholder="Masukkan Username" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-[#000080]/20 focus:border-[#000080] text-sm font-semibold transition-all">
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-500 mb-2 uppercase">Password</label>
                        <input type="password" name="password" required value="<?= htmlspecialchars($saved_admin_pass) ?>" placeholder="••••••••" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-[#000080]/20 focus:border-[#000080] text-sm font-semibold transition-all">
                    </div>
                    <div class="flex items-center space-x-2 pt-1">
                        <input type="checkbox" name="remember_me" id="rem_admin" class="w-4 h-4 rounded border-slate-300 text-[#000080]" <?= $saved_admin_user ? 'checked' : '' ?>>
                        <label for="rem_admin" class="text-xs text-slate-500 font-medium cursor-pointer">Ingat data login saya</label>
                    </div>
                    <button type="submit" class="w-full py-3.5 mt-2 bg-[#000080] text-white rounded-xl font-bold text-sm shadow-lg hover:bg-blue-900 transition-all flex justify-center items-center">
                        Masuk sebagai Admin <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                    </button>
                </form>

                <form id="form-guru" action="login_process.php" method="POST" class="space-y-5 <?= $active_tab !== 'guru' ? 'hidden' : '' ?>">
                    <input type="hidden" name="login_type" value="guru">
                    <div>
                        <label class="block text-xs font-bold text-slate-500 mb-2 uppercase">Pilih Nama Guru</label>
                        <select name="id_guru" required class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-[#000080]/20 focus:border-[#000080] text-sm font-semibold transition-all">
                            <option value="">-- Pilih Nama Anda --</option>
                            <?php foreach($guru_list as $g): ?>
                                <option value="<?= $g['id_guru'] ?>" <?= ($saved_guru_id == $g['id_guru']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($g['nama_guru']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-500 mb-2 uppercase">PIN Akses (6 Angka)</label>
                        <input type="password" name="pin_validasi" required value="<?= htmlspecialchars($saved_guru_pin) ?>" placeholder="••••••" maxlength="6" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-[#000080]/20 focus:border-[#000080] text-center tracking-[0.5em] text-lg font-bold transition-all">
                    </div>
                    <div class="flex items-center space-x-2 pt-1">
                        <input type="checkbox" name="remember_me" id="rem_guru" class="w-4 h-4 rounded border-slate-300 text-[#000080]" <?= $saved_guru_id ? 'checked' : '' ?>>
                        <label for="rem_guru" class="text-xs text-slate-500 font-medium cursor-pointer">Ingat nama & PIN saya</label>
                    </div>
                    <button type="submit" class="w-full py-3.5 mt-2 bg-[#000080] text-white rounded-xl font-bold text-sm shadow-lg hover:bg-blue-900 transition-all flex justify-center items-center">
                        Masuk ke Portal <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                    </button>
                </form>

            </div>
        </div>

    </div>

    <div class="w-full max-w-md text-center relative z-10">
        <a href="ortu/login.php" class="inline-flex items-center justify-center px-6 py-2.5 bg-white border border-slate-200 text-slate-600 hover:text-[#000080] hover:border-[#000080] rounded-full text-sm font-bold shadow-sm transition-all group">
            <svg class="w-4 h-4 mr-2 text-slate-400 group-hover:text-[#000080]" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            Masuk sebagai Wali Murid
        </a>
    </div>

    <script>
        function switchTab(tab) {
            document.getElementById('form-admin').classList.add('hidden');
            document.getElementById('form-guru').classList.add('hidden');
            document.getElementById('tab-admin').classList.remove('text-[#000080]', 'border-b-2', 'border-[#000080]');
            document.getElementById('tab-guru').classList.remove('text-[#000080]', 'border-b-2', 'border-[#000080]');

            document.getElementById('form-' + tab).classList.remove('hidden');
            document.getElementById('tab-' + tab).classList.add('text-[#000080]', 'border-b-2', 'border-[#000080]');
        }
    </script>
</body>
</html>