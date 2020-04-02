<?php
$id_stok = $_GET['id_stok'];
$ambil=$koneksi->query("SELECT * FROM stok
WHERE id_stok='$id_stok'");
print_r($_GET);
$data=$ambil->fetch_array(MYSQLI_ASSOC);
print_r($data);
?>
      <!-- Content Header (Page header) -->
      <section class="content-header">
          <div class="container-fluid">
              <div class="row mb-2">
                  <div class="col-sm-6">
                      <h1>Dashboard</h1>
                  </div>
                  <div class="col-sm-6">
                      <ol class="breadcrumb float-sm-right">
                          <li class="breadcrumb-item"><a href="#">Home</a></li>
                          <li class="breadcrumb-item active">Stok</li>
                          <li class="breadcrumb-item active">Edit Stok</li>
                      </ol>
                  </div>
              </div>
          </div><!-- /.container-fluid -->
      </section>
      
<div class="row">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-success">
            <div class="card-header">
                <h3 class="card-title">Edit Data Stok</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" method="POST" action="index.php?page=updatestok">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="stok_masuk">Stok Masuk</label>
                                        <input type="number" class="form-control" id="stok_masuk" name="stok_masuk" value="<?php echo $data['stok_masuk'] ?>">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="stok_sekarang">Stok Sekarang</label>
                                        <input type="number" class="form-control" id="stok_sekarang" name="stok_sekarang" value="<?php echo $data['stok_sekarang'] ?>" >
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="satuan">Satuan</label>
                                        <select class="form-control select2" id="satuan" name="satuan" style="width: 100%;" value="<?php echo $data['satuan'] ?>">
                                            <option selected="selected">Strip</option>
                                            <option>Botol</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="harga_beli">Harga Beli</label>
                                        <input type="number" class="form-control" id="harga_beli" name="harga_beli" value="<?php echo $data['harga_beli'] ?>">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="harga_jual">Harga Jual</label>
                                        <input type="number" class="form-control" id="harga_jual" name="harga_jual" value="<?php echo $data['harga_jual'] ?>">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="profit">Profit</label>
                                        <input type="number" class="form-control" id="profit" name="profit" value="<?php echo $data['profit'] ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                            <div class="form-group">
                                <label for="tgl_masuk">Tanggal Masuk</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="far fa-calendar-alt"></i>
                                        </span>
                                    </div>
                                    <input type="date" class="form-control float-right" id="tgl_masuk" name="tgl_masuk" value="<?php echo $data['tgl_masuk'] ?>">
                                </div>
                            </div>
                            </div>
                            <div class="col-sm-6">
                            <div class="form-group">
                                <label for="tgl_kadaluarsa">Tanggal Kadaluarsa</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="far fa-calendar-alt"></i>
                                        </span>
                                    </div>
                                    <input type="date" class="form-control float-right" id="tgl_kadaluarsa" name="tgl_kadaluarsa" value="<?php echo $data['tgl_kadaluarsa'] ?>">
                                </div>
                            </div>
                            </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="simpan" class="btn btn-success pull-right">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </form>
        </div>
        <!-- /.card -->
    </div>
</div>