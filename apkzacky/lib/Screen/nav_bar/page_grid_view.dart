import 'package:flutter/material.dart';

class PageGridView extends StatefulWidget {
  const PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  List<Map<String, dynamic>> ListMovie = [
    {"judul": "Ciao Alberto", "gambar": "gambar/movie1.jpg", "harga": 45000},
    {"judul": "The Simpson", "gambar": "gambar/movie2.png", "harga": 50000},
    {"judul": "Jungle Cruise", "gambar": "gambar/movie3.jpg", "harga": 60000},
    {"judul": "Home Alone", "gambar": "gambar/movie4.jpg", "harga": 70000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: ListMovie.length, // Tambahkan itemCount
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Tambahkan borderRadius
                      child: Image.asset(
                        ListMovie[index]['gambar'],
                        fit: BoxFit.cover, // Perbaikan di sini
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text(ListMovie[index]['judul']),
                        Text("Rp. ${ListMovie[index]['harga']}"), // Perbaikan harga
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
