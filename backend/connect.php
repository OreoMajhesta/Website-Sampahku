<?php
$localEnvironment = true; // Ganti menjadi false saat pindah ke server publik

if ($localEnvironment) {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "sampahku";
} else {
    $servername = "";
    $username = "";
    $password = "";
    $dbname = "";
}

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
