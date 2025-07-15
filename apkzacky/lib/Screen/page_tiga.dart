import 'package:flutter/material.dart';

class PageTiga extends StatelessWidget {
  const PageTiga({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page tiga'),
      backgroundColor: Colors.cyanAccent,
    ),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(  
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.h_mobiledata,
                size: 50,
                color: Colors.green,
              ),
              Text('Mobile')
            ],
          ),

          Column(  
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                size: 50,
                color: Colors.green,
              ),
              Text('Phone')
            ],
          ),

          Column(  
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.spa,
                size: 50,
                color: Colors.green,
              ),
              Text('Spa')
            ],
          ),
        ],
      ),
    ),
  );
  }
}