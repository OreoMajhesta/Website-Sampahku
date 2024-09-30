<?php
include '../../connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $user = "SELECT user_data.username FROM user_data
              JOIN history_all ON user_data.id = history_all.id_user
              WHERE history_all.id = $id";

    $result = $conn->query($user);

    if ($result && $result->num_rows > 0) {
        $userData = $result->fetch_assoc();

        header('Content-Type: application/json');
        echo json_encode($userData);
    } else {
        echo json_encode(array('error' => 'Data tidak ditemukan.'));
    }
} else {
    echo json_encode(array('error' => 'ID tidak valid.'));
}

$conn->close();
?>
