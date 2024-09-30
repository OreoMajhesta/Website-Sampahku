<?php
include '../../connect.php';

if (isset($_GET['selectedItem'])) {
    $selectedItem = mysqli_real_escape_string($conn, $_GET['selectedItem']);
    $query = "SELECT " . $selectedItem . " AS harga FROM harga_sampah ORDER BY tanggal DESC LIMIT 1";

    $result = $conn->query($query);
    if ($result) {
        $row = $result->fetch_assoc();
        $harga = $row['harga'];

        echo json_encode(['harga' => $harga]);
    } else {
        echo json_encode(['harga' => 0]);
    }
} else {
    echo json_encode(['harga' => 0]);
}
$conn->close();
?>
