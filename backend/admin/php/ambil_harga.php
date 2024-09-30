<?php
include '../../connect.php';
$query = "SELECT * FROM harga_sampah ORDER BY tanggal DESC LIMIT 1";
$result = $conn->query($query);
if ($result) {
    $data = $result->fetch_assoc();
}
$conn->close();
header('Content-Type: application/json');
echo json_encode($data);
?>
