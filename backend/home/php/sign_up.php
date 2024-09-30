<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    include '../../connect.php';

    $username = htmlspecialchars($_POST["username"]);
    $password = htmlspecialchars($_POST["password"]);
    $email = htmlspecialchars($_POST["email"]);
    $address = htmlspecialchars($_POST["address"]);

    $checkQuery = "SELECT * FROM user_data WHERE username = '$username' OR email = '$email'";
    $checkResult = $conn->query($checkQuery);

    if ($checkResult->num_rows > 0) {
        $row = $checkResult->fetch_assoc();
        $existingUsername = $row['username'];
        $existingEmail = $row['email'];

        if ($existingUsername == $username && $existingEmail == $email) {
            $response = [
                "duplicate" => true,
                "message" => "Username dan Email sudah digunakan."
            ];
        } else {
            if ($existingUsername == $username) {
                $response = [
                    "duplicate_username" => true,
                    "message" => "Username sudah digunakan."
                ];
            }
            if ($existingEmail == $email) {
                $response = [
                    "duplicate_email" => true,
                    "message" => "Email sudah digunakan."
                ];
            }
        }
    } else {
        $insertQuery = "INSERT INTO user_data (username, password, email, address) VALUES ('$username', '$password', '$email', '$address')";

        if ($conn->query($insertQuery) === true) {
            $response = [
                "success" => true,
                "message" => "Data berhasil disimpan."
            ];
        } else {
            $response["message"] = "Error: " . $insertQuery . "<br>" . $conn->error;
        }
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
