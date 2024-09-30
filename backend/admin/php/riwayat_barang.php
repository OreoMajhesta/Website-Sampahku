<?php
include '../../connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $history_id = "SELECT id_jemput, id_jual FROM history_all WHERE id = $id";
    $result_id = $conn->query($history_id);

    if ($result_id->num_rows > 0) {
        $row_id = $result_id->fetch_assoc();
        $id_jemput = $row_id['id_jemput'];
        $id_jual = $row_id['id_jual'];

        $formattedData = [];

        if ($id_jemput === null) {
            $sql = "SELECT * FROM history_jual WHERE id_jual = $id_jual";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $data = $result->fetch_assoc();

                $formattedData = [];
                foreach ($data as $key => $value) {
                    if ($key !== 'id_jual' && $value > 0) {
                        $harga_sql = "SELECT $key FROM harga_sampah";
                        $harga = $conn->query($harga_sql);
                        $harga = $harga->fetch_assoc();

                        $formattedKey = ucwords(str_replace('_', ' ', $key));
                        $formattedData[] = [
                            'nama' => $formattedKey,
                            'berat' => $value,
                            'harga' => $harga[$key]
                        ];
                    }
                }
                header('Content-Type: application/json');
                echo json_encode($formattedData);
            } else {
                echo json_encode(array('error' => 'Data tidak ditemukan'));
            }
        }
        if ($id_jual === null) {
            $sql = "SELECT * FROM history_jemput WHERE id_jemput = $id_jemput";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $data = $result->fetch_assoc();

                $formattedNama = [];
                if ($data['sampah_organik'] == 1) {
                    $formattedNama[] = 'Sampah Organik';
                }
                if ($data['sampah_anorganik'] == 1) {
                    $formattedNama[] = 'Sampah Anorganik';
                }
                if ($data['sampah_b3'] == 1) {
                    $formattedNama[] = 'Sampah B3';
                }
                $formattedKey = implode('  ', $formattedNama);

                $harga_sql = "SELECT tarif FROM tarif_sampah";
                $harga = $conn->query($harga_sql);
                $harga = $harga->fetch_assoc();
                $formattedData[] = [
                    'nama' => $formattedKey,
                    'berat' => $data['berat_sampah'],
                    'harga' => $harga['tarif']
                ];
                header('Content-Type: application/json');
                echo json_encode($formattedData);
            } else {
                echo json_encode(array('error' => 'Data tidak ditemukan'));
            }
        }
    } else {
        echo json_encode(array('error' => 'Data history_all tidak ditemukan'));
    }
} else {
    echo json_encode(array('error' => 'ID tidak ditemukan'));
}
$conn->close();
