<?php
/**
 * PORTAL SEKOLAH - Sidebar Core Admin (Master Data & Akademik)
 * Lokasi: htdocs/portal_sekolah/core_admin/includes/sidebar_core.php
 */

$current_page = basename($_SERVER['PHP_SELF'], '.php');

// Data user untuk footer sidebar
$user_name = $_SESSION['nama_lengkap'] ?? 'Administrator';
$initial = strtoupper(substr($user_name, 0, 1));

// Helper untuk CSS Class menu aktif
function getNavClass($isActive) {
    $base = "flex items-center justify-between px-4 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 border border-transparent";
    if ($isActive) {
        return "$base bg-[#000080] text-white shadow-md shadow-blue-900/10";
    }
    return "$base text-slate-600 hover:text-[#000080] hover:bg-slate-50 hover:border-slate-200";
}
?>

<button id="mobile-menu-btn" class="lg:hidden fixed top-4 left-4 z-50 p-2 rounded-lg bg-[#000080] text-white shadow-lg">
    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="4" y1="12" x2="20" y2="12"></line>
        <line x1="4" y1="6" x2="20" y2="6"></line>
        <line x1="4" y1="18" x2="20" y2="18"></line>
    </svg>
</button>

<div id="sidebar-overlay" class="lg:hidden fixed inset-0 bg-slate-900/40 backdrop-blur-sm z-40 hidden transition-opacity"></div>

<aside id="sidebar" class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-[#E2E8F0] flex flex-col z-50 transition-transform duration-300 -translate-x-full lg:translate-x-0 shadow-sm">
    
    <div class="p-6 border-b border-[#F1F5F9]">
        <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0 bg-white p-1">
                    <img src="../../sitapsi/assets/img/logo.png" alt="Logo Santa Maria" class="w-full h-full object-contain">
                </div>
                <div>
                    <h1 class="text-sm font-extrabold text-slate-800 tracking-tight">CORE SYSTEM</h1>
                    <p class="text-[10px] font-bold text-slate-500 truncate max-w-[140px]">SMPK SANTA MARIA 2</p>
                </div>
            </div>
            <button id="close-sidebar-btn" class="lg:hidden text-slate-400 hover:text-slate-600">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
            </button>
        </div>
    </div>

    <nav class="flex-1 p-4 space-y-1 overflow-y-auto scrollbar-hide">
        
        <div class="pt-2 pb-1">
            <p class="px-4 text-[10px] font-bold tracking-wider text-slate-400 uppercase">Manajemen Pengguna</p>
        </div>

        <a href="data_siswa.php" class="<?= getNavClass($current_page === 'data_siswa') ?>">
            <div class="flex items-center gap-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                Data Siswa
            </div>
        </a>

        <a href="data_ortu.php" class="<?= getNavClass($current_page === 'data_ortu') ?>">
            <div class="flex items-center gap-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                Data Wali Murid
            </div>
        </a>

        <a href="data_guru.php" class="<?= getNavClass($current_page === 'data_guru') ?>">
            <div class="flex items-center gap-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
                Data Guru
            </div>
        </a>

        <div class="pt-4 pb-1">
            <p class="px-4 text-[10px] font-bold tracking-wider text-slate-400 uppercase">Sistem Akademik</p>
        </div>

        <a href="pengaturan_akademik.php" class="<?= getNavClass(in_array($current_page, ['pengaturan_akademik', 'kenaikan_kelas'])) ?>">
            <div class="flex items-center gap-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect><line x1="8" y1="21" x2="16" y2="21"></line><line x1="12" y1="17" x2="12" y2="21"></line></svg>
                Pengaturan Akademik
            </div>
        </a>

        <div class="pt-4 pb-1">
            <p class="px-4 text-[10px] font-bold tracking-wider text-slate-400 uppercase">Pusat Data Lampau</p>
        </div>

        <a href="arsip_tahun.php" class="<?= getNavClass($current_page === 'arsip_tahun') ?>">
            <div class="flex items-center gap-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M21 8v13H3V8"></path><path d="M1 3h22v5H1z"></path><path d="M10 12h4"></path></svg>
                Arsip Global
            </div>
        </a>

    </nav>

    <div class="p-4 border-t border-[#F1F5F9] bg-slate-50/50 space-y-2">
        <div class="flex items-center gap-3 mb-2 px-2">
            <div class="w-10 h-10 rounded-full bg-slate-800 flex items-center justify-center text-sm font-bold text-white shadow-sm">
                <?= $initial ?>
            </div>
            <div class="flex-1 min-w-0">
                <p class="text-sm font-bold text-slate-800 truncate"><?= htmlspecialchars($user_name) ?></p>
                <p class="text-[10px] font-medium text-slate-500 uppercase">Core Admin</p>
            </div>
        </div>

        <a href="../../launchpad.php" class="flex w-full items-center justify-start text-sm font-bold px-4 py-2.5 rounded-lg text-slate-700 bg-white border border-slate-200 hover:bg-slate-50 transition-colors">
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
            Kembali ke Portal
        </a>

        <a href="../../logout.php" onclick="return confirm('Yakin ingin keluar dari seluruh sistem?')" class="flex w-full items-center justify-start text-sm font-bold px-4 py-2.5 rounded-lg text-red-600 bg-red-50 hover:bg-red-100 transition-colors">
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
            Keluar Sistem
        </a>
    </div>
</aside>

<script>
    const mobileBtn = document.getElementById('mobile-menu-btn');
    const closeBtn = document.getElementById('close-sidebar-btn');
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebar-overlay');

    function toggleSidebar() {
        const isClosed = sidebar.classList.contains('-translate-x-full');
        if (isClosed) {
            sidebar.classList.remove('-translate-x-full');
            overlay.classList.remove('hidden');
        } else {
            sidebar.classList.add('-translate-x-full');
            overlay.classList.add('hidden');
        }
    }

    if (mobileBtn) mobileBtn.addEventListener('click', toggleSidebar);
    if (closeBtn) closeBtn.addEventListener('click', toggleSidebar);
    if (overlay) overlay.addEventListener('click', toggleSidebar);
</script>