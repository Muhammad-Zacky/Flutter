import 'package:flutter/material.dart';
import '../model/model_users.dart';

class DetailUserPage extends StatelessWidget {
  final ModelUser user;

  const DetailUserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name ?? 'Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${user.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text("Username: ${user.username}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("City: ${user.address.city}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Phone: ${user.phone}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Website: ${user.website}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              "Company: ${user.company.name}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
