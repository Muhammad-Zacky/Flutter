import 'package:flutter/material.dart';

class PageUrlImage extends StatelessWidget {
  const PageUrlImage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text('Url Images'),
    ),
    
    body: Center(
      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zicR6ExuKdewdhwxZtp98oRIonyNRGRqfA&s'),
    ),
  );
 }
}