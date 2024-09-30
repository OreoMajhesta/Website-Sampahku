<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include '../../connect.php';
    $username = $_SESSION["username"];
    $stmt = $conn->prepare("SELECT id FROM user_data WHERE username = ?");
    $stmt->bind_param("s", $username);
    
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $user_id = $row['id'];

        $data = json_decode(file_get_contents('php://input'), true);

        if (isset($data['flow']) && isset($data['source']) && isset($data['address'])) {
            $flow = intval($data['flow']);
            $source = $data['source'];
            $address = $data['address'];

            if ($source === 'jual') {
                $status = "Jual Sampah";
                $sql = "SELECT MAX(id_jual) FROM history_jual";
                $id_column = "id_jual";
            } elseif ($source === 'jemput') {
                $status = "Jemput Sampah";
                $sql = "SELECT MAX(id_jemput) FROM history_jemput";
                $id_column = "id_jemput";
            }

            $stmt = $conn->prepare($sql);
            if ($stmt->execute()) {
                $stmt->bind_result($lastId);
                $stmt->fetch();
                $stmt->close();

                $date = date("Y-m-d");

                $sql = "INSERT INTO history_all (id_user, status, date, flow, $id_column, address) VALUES (?, ?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("isssis", $user_id, $status, $date, $flow, $lastId, $address);

                if ($stmt->execute()) {
                    echo "sukses"; 
                } else {
                    echo "gagal: " . $stmt->error; 
                }
                $stmt->close();
            } else {
                echo "Gagal mengambil ID " . $source . ": " . $stmt->error;
            }
        } else {
            echo "Data yang diterima tidak valid.";
        }
    } else {
        echo "Gagal mengambil ID user: " . $stmt->error;
    }

    $conn->close();
} else {
    echo "Permintaan tidak valid.";
}
?>
