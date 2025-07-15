import 'package:flutter/material.dart';

class PageWelcome extends StatelessWidget {
  final String username;
  final String password;

  // Constructor untuk menerima username dan password
  const PageWelcome({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your password is: $password',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
