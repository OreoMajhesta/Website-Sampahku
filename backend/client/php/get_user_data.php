<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    include '../../connect.php';

    $username = $_SESSION["username"];

    $query = "SELECT username, saldo FROM user_data WHERE username = ?";
    $stmt = $conn->prepare($query);

    if ($stmt) {
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $userData = $result->fetch_assoc();
            $response = [
                "success" => true,
                "user" => $userData
            ];
        } else {
            $response = [
                "success" => false,
                "message" => "Data pengguna tidak ditemukan."
            ];
        }

        $stmt->close();
    } else {
        $response = [
            "success" => false,
            "message" => "Error in prepared statement: " . $conn->error
        ];
    }

    $conn->close();
} else {
    $response = [
        "success" => false,
        "message" => "Metode tidak diizinkan."
    ];
}

header('Content-Type: application/json');
echo json_encode($response);
?>
