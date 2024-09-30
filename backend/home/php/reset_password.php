<?php
include '../../connect.php';

if (isset($_POST['username'], $_POST['verification_code'], $_POST['new_password'], $_POST['confirm_password'])) {
    $username = $_POST['username'];
    $verification_code = $_POST['verification_code'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];
mail($to,$subject,$txt,$headers);
} else {
    echo "Data yang diperlukan tidak disediakan.";
}
?>
