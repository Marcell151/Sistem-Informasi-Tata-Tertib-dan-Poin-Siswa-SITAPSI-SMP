<?php


session_start();

// Hapus semua session variables
$_SESSION = array();

// Hapus session cookie
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 3600, '/');
}

// Hapus remember me cookie (SITAPSI lama) jika ada
if (isset($_COOKIE['remember_token'])) {
    setcookie('remember_token', '', time() - 3600, '/');
    setcookie('remember_user', '', time() - 3600, '/');
}

// [BARU] Hapus cookie "Ingat Saya" dari Portal SSO (Admin & Guru)
setcookie('saved_admin_user', '', time() - 3600, '/');
setcookie('saved_admin_pass', '', time() - 3600, '/');
setcookie('saved_guru_id', '', time() - 3600, '/');
setcookie('saved_guru_pin', '', time() - 3600, '/');

// Hancurkan session
session_destroy();

// Redirect ke halaman login Portal Terpadu (naik 2 folder)
header('Location: ../../index.php');
exit;
?>