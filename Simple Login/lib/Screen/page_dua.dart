import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page dua'),
      backgroundColor: Colors.cyanAccent,
    ),

    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(  
            Icons.home,
            size: 50,
            color: Colors.black,
          ),

          Icon(
            Icons.settings,
            size: 50,
            color: Colors.black,
          ),

          Icon(
            Icons.info,
            size: 50,
            color: Colors.black,
          ),
        ]
    ),
    )
  );
  }
}