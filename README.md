**1. Penjelasan Kode — registrasi_page.dart**

Import Library

import 'package:flutter/material.dart';


Memanggil library Flutter standar untuk membangun UI berbasis Material Design.

Deklarasi Stateful Widget
class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}


Membuat halaman yang dapat berubah tampilan (stateful).

createState() menghubungkan widget dengan kelas state-nya.

Kelas State
class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  ...
}


Menyimpan logika dan variabel untuk pengelolaan state halaman.

_formKey digunakan untuk memvalidasi form.

Controller Input
final _namaTextboxController = TextEditingController();
final _emailTextboxController = TextEditingController();
final _passwordTextboxController = TextEditingController();


Mengelola teks masukan pada form.

Membaca, mengubah, dan menghapus isi textfield.

Struktur UI Utama
return Scaffold(
  appBar: AppBar(
    title: const Text("Registrasi"),
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _namaTextField(),
            _emailTextField(),
            _passwordTextField(),
            _passwordKonfirmasiTextField(),
            _buttonRegistrasi()
          ],
        ),
      ),
    ),
  ),
);


Penjelasan:

Scaffold → struktur UI dasar.

AppBar → header halaman.

SingleChildScrollView → memastikan form dapat di-scroll.

Form → wadah elemen input.

Column → menyusun widget secara vertikal.

Field Nama
Widget _namaTextField() {
  return TextFormField(
    decoration: const InputDecoration(labelText: "Nama"),
    controller: _namaTextboxController,
    validator: (value) { ... },
  );
}


TextFormField dengan label dan validasi.

Validasi: minimal 3 karakter.

Field Email
Widget _emailTextField() { ... }


Input email dengan regex validasi format email.

Field Password
obscureText: true


Menyembunyikan karakter masukan.

Tombol Registrasi
Widget _buttonRegistrasi() {
  return ElevatedButton(
    child: const Text("Registrasi"),
    onPressed: () {
      var validate = _formKey.currentState!.validate();
    });
}


Memvalidasi seluruh form ketika ditekan.



**2. Penjelasan Kode — login_page.dart**

Struktur mirip registrasi, berikut bagian pentingnya:

Import

import 'package:flutter/material.dart';

import 'package:tokokita/ui/registrasi_page.dart';


Mengimpor halaman registrasi agar bisa dinavigasi dari login.

Form Login
TextFormField(
  decoration: const InputDecoration(labelText: "Email"),
  controller: _emailTextboxController,
)


Input email tanpa validasi regex (hanya cek isi).

Tombol Login
ElevatedButton(
  child: const Text("Login"),
  onPressed: () {
    var validate = _formKey.currentState!.validate();
  },
)


Menjalankan validasi ketika ditekan.

Navigasi ke Registrasi
InkWell(
  child: const Text("Registrasi"),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrasiPage()));
  },
)


InkWell memberikan efek klik.

Navigator.push() membuka halaman baru.



**3. Penjelasan Kode — produk_form.dart**
Modus Tambah / Ubah
Produk? produk;


Jika produk bernilai null → sedang menambah.

Jika tidak null → sedang mengubah data.

Inisialisasi Mode
isUpdate() {
  if (widget.produk != null) {
    judul = "UBAH PRODUK";
    tombolSubmit = "UBAH";
    ...
  }
}


Mengubah judul dan tombol sesuai konteks.

Input Data Produk

Terdiri dari kode produk, nama produk, dan harga.

Struktur mirip:

TextFormField(
  decoration: const InputDecoration(labelText: "Kode Produk"),
  controller: _kodeProdukTextboxController,
)

Tombol Submit
OutlinedButton(
  child: Text(tombolSubmit),
  onPressed: () {
    var validate = _formKey.currentState!.validate();
  },
)


Label tombol menyesuaikan mode tambah/ubah.



**4. Penjelasan Kode — produk_detail.dart**
Menampilkan Informasi Produk
Text("Kode : ${widget.produk!.kodeProduk}")


Menampilkan data produk dari parameter.

Tombol Edit
OutlinedButton(
  child: const Text("EDIT"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProdukForm(produk: widget.produk!),
      ),
    );
  },
)


Membuka form produk sambil membawa data produk untuk diedit.

Tombol Delete
onPressed: () => confirmHapus()


Memunculkan dialog konfirmasi penghapusan.



**5. Penjelasan Kode — produk_page.dart**
Dummy Data
final dummy = const [
  Produk(id: "1", kodeProduk: "A001", namaProduk: "Kamera", hargaProduk: 5000000),
  ...
];


Data sementara yang ditampilkan sebelum API dihubungkan.

List Produk
ListView(
  children: dummy.map((p) => ItemProduk(produk: p)).toList(),
)

ItemProduk (kartu produk)
Card(
  child: ListTile(
    title: Text(produk.namaProduk!),
    subtitle: Text(produk.hargaProduk.toString()),
  ),
)


Menampilkan nama dan harga dalam bentuk card.

Navigasi ke detail
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (c) => ProdukDetail(produk: produk)),
  );
}
