<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['totalPendapatan'])) {
        $totalPendapatan = floatval($_POST['totalPendapatan']);
        include '../../connect.php';

        $username = $_SESSION["username"];
        $user_id = null;
        $stmt = $conn->prepare("SELECT id FROM user_data WHERE username = ?");
        $stmt->bind_param("s", $username);
        if ($stmt->execute()) {
            $stmt->store_result();

            if ($stmt->num_rows == 1) {
                $stmt->bind_result($user_id);
                $stmt->fetch();

                $query = "SELECT saldo FROM user_data WHERE id = ?";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("i", $user_id);

                if ($stmt->execute()) {
                    $result = $stmt->get_result();
                    if ($result->num_rows == 1) {
                        $row = $result->fetch_assoc();
                        $current_balance = $row['saldo'];
                        $new_balance = $current_balance + $totalPendapatan;

                        $update_query = "UPDATE user_data SET saldo = ? WHERE id = ?";
                        $stmt = $conn->prepare($update_query);
                        $stmt->bind_param("di", $new_balance, $user_id);

                        if ($stmt->execute()) {
                            echo "sukses"; 
                        } else {
                            echo "gagal: " . $stmt->error; 
                        }
                    } else {
                        echo "Pengguna tidak ditemukan dalam database.";
                    }
                } else {
                    echo "Gagal mengambil saldo pengguna: " . $stmt->error;
                }
            } else {
                echo "Pengguna tidak ditemukan dalam database.";
            }
        } else {
            echo "Gagal mencari ID pengguna: " . $stmt->error;
        }

        $conn->close();
    } else {
        echo "Data yang diterima tidak valid.";
    }
} else {
    echo "Permintaan tidak valid.";
}
?>
