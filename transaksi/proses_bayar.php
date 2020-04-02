<?php
session_start();
ini_set('date.timezone', 'Asia/Jakarta');
$bayar = preg_replace('/\D/', '', $_POST['bayar']);
$total = preg_replace('/\D/', '', $_POST['totalbayar']);

include 'nomer_invoice.php';
$no_invoice = "$kodeBarang$date";

$tanggal = date('Y-m-d');
$kembalian = $bayar - $total;
$id_kasir = $_POST['idkasir'];

//proses insert ke tabel transaksi
mysqli_query($koneksi,"INSERT INTO transaksi (id_transaksi,no_invoice,tgl_transaksi,total_bayar,jumlah_bayar,kembalian,user_id) values (NULL,'$no_invoice','$tanggal','$total','$bayar','$kembalian','$id_kasir')");

//mendapatkan id baru/ terakhir database
$id_transaksi = mysqli_insert_id($koneksi);

foreach ($_SESSION['keranjang'] as $key => $value) {

    $id_obat = $value['id_obat'];
    $harga = $value['harga_jual'];
    $qty = $value['qty'];
    $tot = $harga*$qty;
    $id_stok = $value['idstok'];

    mysqli_query($koneksi,"INSERT INTO detail_transaksi (id_transaksi,id_obat,id_stok,harga,qty,total) values ('$id_transaksi','$id_obat','$id_stok','$harga','$qty','$tot')");
    $_SESSION['keranjang'] = [];
    echo "<script>location='index.php?page=uangkembali&id=$id_transaksi';</script>";
}


?>