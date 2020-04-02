<?php
$qty = $_POST['qty'];

foreach($_SESSION['keranjang'] as $key => $value){
    $_SESSION['keranjang'][$key]['qty'] = $qty[$key];
}
krsort($_SESSION['keranjang']);
echo "<script>location='index.php?page=transaksi';</script>";
?>