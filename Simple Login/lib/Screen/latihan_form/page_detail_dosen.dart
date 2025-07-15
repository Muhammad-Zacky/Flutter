import 'package:flutter/material.dart';

class PageDetailDataDosen extends StatelessWidget {
  //item Movie//
  final Map<String, dynamic> itemMovie;

  const PageDetailDataDosen(this.itemMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemMovie['nidn'])),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRect(
                child: Image.asset(
                  itemMovie['gambar'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350,
                ),
              ),
              SizedBox(height: 20),
              Text(
                itemMovie['nidn'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                itemMovie['nama'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                itemMovie['email'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

            ],
          ),
        ),
      ),
    );
  }
}