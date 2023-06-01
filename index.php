<?php

// Koneksi ke database
$koneksi = mysqli_connect("localhost", "root", "", "sembako");

// Ambil data dari tabel
$result = mysqli_query($koneksi, "SELECT id_transaksi, pembeli.nama_pembeli, produk.nama_produk, jumlah, produk.harga_produk, deskripsi FROM pembeli, produk, transaksi WHERE pembeli_id = pembeli.id_pembeli AND produk_id = produk.id_produk");

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>latihan Connect Database</title>

    <!-- {{-- Data Tables --}} -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>

    <div class="container-fluid">
        <h1 class="text-center mt-4">Daftar Pembeli Sembako Murah</h1>
        <div class="thumbnail d-flex justify-content-center">
            <img src="img/skanida.png" width="80px" class="img-thumbnail border-0 ">
        </div>

        <div class="row justify-content-center">
            <div class="col-md-11 my-2">
                <table class="table table-light table-hover mt-4" id="tableTransaksi">
                    <thead>
                        <tr>
                            <th>ID Transaksi</th>
                            <th>Nama Pembeli</th>
                            <th>Produk</th>
                            <th>Info</th>
                            <th>Jumlah</th>
                            <th>Harga</th>
                            <th>Total</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                            <tr>
                                <td><?php echo $row["id_transaksi"]; ?></td>
                                <td><?php echo $row["nama_pembeli"]; ?></td>
                                <td><?php echo $row["nama_produk"]; ?></td>
                                <td><?php echo $row["deskripsi"] ?></td>
                                <td><?php echo $row["jumlah"]; ?></td>
                                <td><?php echo $row["harga_produk"] ?></td>
                                <td><?php echo $row["harga_produk"] * $row["jumlah"]; ?></td>
                            </tr>
                        <?php endwhile ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>





    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- {{-- Data Table JS --}} -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#tableTransaksi').DataTable();
        });
    </script>
</body>

</html>