<?php
include '../../connect.php';

session_start();
$username = $_SESSION["username"];
$user_id = null;
$stmt = $conn->prepare("SELECT id FROM user_data WHERE username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $user_id = $row["id"];
}

$sql = "SELECT * FROM history_all WHERE id_user = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$data = array();

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);

$conn->close();
?>
