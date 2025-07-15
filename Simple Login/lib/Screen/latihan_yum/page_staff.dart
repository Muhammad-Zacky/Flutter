import 'package:flutter/material.dart';

class PageStaff extends StatelessWidget {
  final String category;

  // Tambahkan parameter category ke dalam konstruktor
  PageStaff({super.key, required this.category});

  // Dummy Data Staff
  final List<Map<String, String>> staffList = [
    {'name': 'Henry Itondo', 'role': 'Math Teacher', 'image': 'gambar/user1.png'},
    {'name': 'Courtney Henry', 'role': 'Supervisor', 'image': 'gambar/user2.png'},
    {'name': 'Darika Samak', 'role': 'Admin', 'image': 'gambar/user3.png'},
    {'name': 'Em Assinder', 'role': 'Class Teacher', 'image': 'gambar/user4.png'},
    {'name': 'Darika Samak', 'role': 'Admin', 'image': 'gambar/user5.png'},
    {'name': 'Em Assinder', 'role': 'Class Teacher', 'image': 'gambar/user6.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff for $category"),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available Staff in $category',
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(staffList[index]['image']!),
                  ),
                  title: Text(staffList[index]['name']!),
                  subtitle: Text(staffList[index]['role']!),
                  trailing: const Icon(Icons.phone, color: Colors.blue),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
