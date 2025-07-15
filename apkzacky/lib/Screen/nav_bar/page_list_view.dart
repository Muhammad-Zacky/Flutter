import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_detail_berita.dart';

class PageListView extends StatefulWidget {
  const PageListView({super.key});

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  // Data List Berita
  List<Map<String, dynamic>> listBerita = [
    {
      "judul": "Judul Berita Satu",
      "isi": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr...",
      "tanggal": "16 Maret 2025",
      "gambar": "gambar/berita1.jpeg",
      "rating": 5,
    },
    {
      "judul": "Judul Berita Dua",
      "isi": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr...",
      "tanggal": "17 Maret 2025",
      "gambar": "gambar/berita2.jpeg",
      "rating": 4,
    },
    {
      "judul": "Judul Berita Tiga",
      "isi": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr...",
      "tanggal": "18 Maret 2025",
      "gambar": "gambar/berita3.jpeg",
      "rating": 3,
    },
    {
      "judul": "Judul Berita Empat",
      "isi": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr...",
      "tanggal": "19 Maret 2025",
      "gambar": "gambar/berita4.jpg",
      "rating": 5,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail berita
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(berita: listBerita[index]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          listBerita[index]['gambar'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listBerita[index]['judul'],
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(listBerita[index]['tanggal']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RatingBarIndicator(
                                rating: listBerita[index]['rating'].toDouble(),
                                itemBuilder: (context, index) =>
                                    Icon(Icons.star, color: Colors.yellow),
                                itemCount: 5,
                                itemSize: 15,
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
