<?php
include '../../connect.php';
$sql = "SELECT * FROM history_all";
$result = $conn->query($sql);
$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}
echo json_encode($data);
$conn->close();
?>
