import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  Produk? produk;
  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kode = TextEditingController();
  final _nama = TextEditingController();
  final _harga = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produk == null ? "Tambah Produk" : "Ubah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Kode Produk"),
              controller: _kode,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nama Produk"),
              controller: _nama,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Harga"),
              controller: _harga,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(widget.produk == null ? "Simpan" : "Ubah"),
            ),
          ],
        ),
      ),
    );
  }
}
