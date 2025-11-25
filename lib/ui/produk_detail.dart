import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatelessWidget {
  final Produk produk;
  const ProdukDetail({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode: ${produk.kodeProduk}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Nama: ${produk.namaProduk}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Harga: ${produk.hargaProduk}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => ProdukForm(produk: produk)),
                );
              },
              child: const Text("EDIT"),
            ),
          ],
        ),
      ),
    );
  }
}
