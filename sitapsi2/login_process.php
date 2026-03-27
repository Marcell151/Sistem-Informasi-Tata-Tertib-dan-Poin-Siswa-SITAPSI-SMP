<?php

session_start();
require_once 'config/database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login_type = $_POST['login_type'] ?? '';
    $remember_me = isset($_POST['remember_me']);

    try {
        if ($login_type === 'admin') {
            // PROSES LOGIN ADMIN
            $username = trim($_POST['username']);
            
            // HAPUS md5() KARENA DI DATABASE DISIMPAN SEBAGAI TEKS BIASA ('admin123')
            $password = $_POST['password']; 

            $admin = fetchOne("SELECT * FROM tb_admin WHERE username = :user AND password = :pass", [
                'user' => $username,
                'pass' => $password
            ]);

            if ($admin) {
                // 1. Session untuk Portal Utama
                $_SESSION['user_id'] = $admin['id_admin'];
                $_SESSION['nama_lengkap'] = $admin['nama_lengkap']; // Di DB namanya nama_lengkap
                $_SESSION['role'] = 'Admin';
                
                // 2. Session "Jembatan" agar SITAPSI lama tidak error
                $_SESSION['username'] = $admin['username'];
                $_SESSION['login_type'] = 'admin';

                if ($remember_me) {
                    setcookie('saved_admin_user', $username, time() + (86400 * 30), "/");
                    setcookie('saved_admin_pass', $password, time() + (86400 * 30), "/");
                } else {
                    setcookie('saved_admin_user', '', time() - 3600, "/");
                    setcookie('saved_admin_pass', '', time() - 3600, "/");
                }

                header("Location: launchpad.php");
                exit;
            } else {
                throw new Exception("Username atau Password Admin salah!");
            }

        } elseif ($login_type === 'guru') {
            // PROSES LOGIN GURU (Dropdown + PIN)
            $id_guru = $_POST['id_guru'];
            $pin = $_POST['pin_validasi'];

            $guru = fetchOne("SELECT * FROM tb_guru WHERE id_guru = :id AND pin_validasi = :pin AND status = 'Aktif'", [
                'id' => $id_guru,
                'pin' => $pin
            ]);

            if ($guru) {
                // 1. Session untuk Portal Utama
                $_SESSION['user_id'] = $guru['id_guru'];
                $_SESSION['nama_lengkap'] = $guru['nama_guru'];
                $_SESSION['role'] = 'Guru';
                
                // 2. Session "Jembatan" agar SITAPSI lama tidak error
                $_SESSION['username'] = $guru['nama_guru'];
                $_SESSION['login_type'] = 'guru';

                if ($remember_me) {
                    setcookie('saved_guru_id', $id_guru, time() + (86400 * 30), "/");
                    setcookie('saved_guru_pin', $pin, time() + (86400 * 30), "/");
                } else {
                    setcookie('saved_guru_id', '', time() - 3600, "/");
                    setcookie('saved_guru_pin', '', time() - 3600, "/");
                }

                header("Location: launchpad.php");
                exit;
            } else {
                throw new Exception("PIN yang Anda masukkan salah!");
            }
        }
    } catch (Exception $e) {
        $_SESSION['error_message'] = $e->getMessage();
        header("Location: index.php");
        exit;
    }
}
header("Location: index.php");
exit;