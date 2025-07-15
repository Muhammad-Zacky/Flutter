import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageCache extends StatelessWidget {
  const PageCache({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Chache Images'),
      backgroundColor: Colors.blueAccent,
    ),
    body: Center(
      child: CachedNetworkImage(
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi7rPjVS1cyEQiuDeAzRS3yKlCg0Epnn6rsw&s',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
     ),
   );
 }
}