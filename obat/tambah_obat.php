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
                          <li class="breadcrumb-item active">Obat</li>
                          <li class="breadcrumb-item active">Tambah Obat</li>

                      </ol>
                  </div>
              </div>
          </div><!-- /.container-fluid -->
      </section>
      
<div class="row">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Tambah Data Obat</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" method="POST" action="index.php?page=prosesobat">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id_obat">Id Obat</label>
                                <input type="text" class="form-control" id="id_obat" name="id_obat" 
                                  placeholder="Id Obat">
                            </div>
                            <div class="form-group">
                                <label for="nama_obat">Nama Obat</label>
                                <input type="text" class="form-control" id="nama_obat" name="nama_obat"
                                  placeholder="Nama Obat">
                            </div>
                            <div class="form-group">
                              <label>Kategori</label>
                                <select class="form-control select2" id="kategori" name="id_kategori" style="width: 100%;">
                                  <option value="">-- Pilih Kategori --</option>
                                  <?php $ambil = $koneksi->query("SELECT * FROM kategori ORDER BY nama_kategori ASC");?>
                                  <?php while($data = $ambil->fetch_assoc()){?>
                                  <option value="<?php echo $data['id_kategori']; ?>"><?php echo $data['nama_kategori']; ?></option>
                                  <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="keterangan">Keterangan</label>
                                <textarea class="form-control" rows="2" id="keterangan" name="keterangan"
                                   placeholder="Keterangan Obat"></textarea>
                            </div>   
                            <div class="form-group">
                                <button type="submit" name="simpan" class="btn btn-primary pull-right"><i class="fa fa-save"></i>Submit</button>
                            </div>
                            <!-- /.form-group -->
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </form>
        </div>
        <!-- /.card -->
    </div>
</div>