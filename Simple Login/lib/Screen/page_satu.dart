import 'package:flutter/material.dart';

class PageSatu extends StatelessWidget {
  const PageSatu({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page Satu'),
      backgroundColor: Colors.cyanAccent,
    ),
    body: const Center(
      child: Text('ini page pertama'),
    ),
  );
  }
}