import 'package:flutter/material.dart';

class PageDetailMovie extends StatelessWidget {
  final Map<String, dynamic> itemMovie;
  const PageDetailMovie(this.itemMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemMovie['judul'])),
      body: Padding(
        padding: EdgeInsets.all(15), // Perbaikan di sini
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Opsional
                child: Image.asset(
                  itemMovie['gambar'],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20), // Tambahkan const
              Text(itemMovie['judul']),
              Text(
                "Rp. ${itemMovie['harga']}",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
