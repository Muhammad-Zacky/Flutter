import 'package:flutter/material.dart';

class PageListData extends StatelessWidget {
  const PageListData({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page List Data'),
    ),
    body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text('Judul Berita $index'),
          subtitle: Text('Detail Berita $index'),
          onTap: (){

          },
        );
      }
    ),
  );
  }
}