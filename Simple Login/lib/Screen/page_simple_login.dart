import 'package:flutter/material.dart';
import 'page_welcome.dart';

class PageSimpleLogin extends StatefulWidget {
  const PageSimpleLogin({super.key});

  @override
  State<PageSimpleLogin> createState() => _PageSimpleLoginState();
}

class _PageSimpleLoginState extends State<PageSimpleLogin> {
  TextEditingController etUsername = TextEditingController();
  TextEditingController etPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Form Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Login User',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: etUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Username',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: etPassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Password',
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                String username = etUsername.text;
                String password = etPassword.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageWelcome(
                      username: username,
                      password: password,
                    ),
                  ),
                );
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              child: Text('Login & Pindah Halaman'),
            ),
          ],
        ),
      ),
    );
  }
}
