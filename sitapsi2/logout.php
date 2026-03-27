<?php

session_start();

// 1. Kosongkan semua variabel Sesi
$_SESSION = array();

// 2. Hapus Session Cookie di Browser
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 3600, '/');
}

// 3. Hapus SEMUA Cookie "Ingat Saya" (Remember Me) dari semua modul
$cookies_to_delete = [
    'saved_admin_user', 
    'saved_admin_pass', 
    'saved_guru_id', 
    'saved_guru_pin',
    'remember_token',   // Sisa dari sistem lama
    'remember_user',    // Sisa dari sistem lama
];

foreach ($cookies_to_delete as $cookie_name) {
    if (isset($_COOKIE[$cookie_name])) {
        setcookie($cookie_name, '', time() - 3600, '/');
    }
}

// 4. Hancurkan Sesi Server
session_destroy();

// 5. Kembalikan ke Gerbang Utama (Halaman Login Portal)
header('Location: index.php');
exit;
?>