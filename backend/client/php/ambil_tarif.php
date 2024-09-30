<?php
include '../../connect.php';
$today = date("Y-m-d");
$stmt = $conn->prepare("SELECT tarif FROM tarif_sampah WHERE tanggal <= ? ORDER BY tanggal DESC LIMIT 1");
$stmt->bind_param("s", $today);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$tarif = $row['tarif'];
$conn->close();
echo json_encode(["success" => true, "tarif" => $tarif]);
?>
