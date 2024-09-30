<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include '../../connect.php';

    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['sampahOrganik']) && isset($data['sampahAnorganik']) && isset($data['sampahB3']) && isset($data['beratSampah'])) {
        $sampahOrganik = $data['sampahOrganik'];
        $sampahAnorganik = $data['sampahAnorganik'];
        $sampahB3 = $data['sampahB3'];
        $beratSampah = $data['beratSampah'];

        $stmt = $conn->prepare("INSERT INTO history_jemput (sampah_organik, sampah_anorganik, sampah_b3, berat_sampah) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("iiii", $sampahOrganik, $sampahAnorganik, $sampahB3, $beratSampah);

        if ($stmt->execute()) {
            echo json_encode(['success' => true, 'message' => 'Data berhasil disimpan.']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Gagal menyimpan data: ' . $stmt->error]);
        }

        $stmt->close();
    } else {
        echo json_encode(['success' => false, 'message' => 'Data yang diterima tidak valid.']);
    }

    $conn->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Permintaan tidak valid.']);
}
?>
