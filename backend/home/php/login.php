<?php
session_start();
include '../../connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = htmlspecialchars($_POST["username"]);
    $password = htmlspecialchars($_POST["password"]);

    if ($username === "admin" && $password === "pass") {
        $response = ["admin" => true, "message" => "Login admin"];
    } else {
        $query = "SELECT * FROM user_data WHERE username = ?";
        $stmt = $conn->prepare($query);

        if ($stmt) {
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows === 1) {
                $row = $result->fetch_assoc();
                if ($password === $row['password']) {
                    $_SESSION["username"] = $username;
                    $response = ["client" => true, "user_id" => $row['id']];
                } else {
                    $response = ["success" => false, "message" => "Password salah."];
                }
            } else {
                $response = ["success" => false, "message" => "Username tidak ditemukan."];
            }

            $stmt->close();
        } else {
            $response = ["success" => false, "message" => "Error in prepared statement: " . $conn->error];
        }
    }
} else {
    $response = ["success" => false, "message" => "Metode tidak diizinkan."];
}

$conn->close();

header('Content-Type: application/json');
echo json_encode($response);
?>
