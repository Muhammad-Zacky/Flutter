import 'package:flutter/material.dart';

class DetailBerita extends StatelessWidget {
  final Map<String, dynamic> berita;
  const DetailBerita({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(berita['judul'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                berita['gambar'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              berita['judul'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              berita['tanggal'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rating: "),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < berita['rating'] ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              berita['isi'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}