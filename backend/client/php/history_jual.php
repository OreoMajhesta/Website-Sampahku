<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));
    include '../../connect.php';

    $selectedItems = [
        'handphone', 'monitor', 'kulkas', 'televisi', 'baterai_aki', 'botol_mineral',
        'jerigen', 'plastik_campur', 'kardus', 'kertas_arsip', 'duplex', 'kertas_buram',
        'sak_semen', 'kaleng_alumunium', 'besi', 'baja', 'tembaga', 'alumunium',
        'botol_sirup', 'botol_campur'
    ];

    $values = [];
    foreach ($selectedItems as $item) {
        if (isset($data->items->$item)) {
            $values[] = $data->items->$item;
        } else {
            $values[] = 0; 
        }
    }

    $placeholders = implode(", ", array_fill(0, count($selectedItems), "?"));

    $sql = "INSERT INTO history_jual (".implode(", ", $selectedItems).") VALUES ($placeholders)";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param(str_repeat("i", count($selectedItems)), ...$values);

        if ($stmt->execute()) {
            echo "sukses"; 
        } else {
            echo "gagal: " . $stmt->error; 
        }

        $stmt->close();
    } else {
        echo "Gagal menyiapkan pernyataan SQL: " . $conn->error;
    }

    $conn->close();
} else {
    echo "Metode request tidak valid.";
}
?>
