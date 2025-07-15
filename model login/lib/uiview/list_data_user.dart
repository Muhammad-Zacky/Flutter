import 'dart:convert';

import 'package:client_server/uiview/detail_user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_users.dart';

class ListDataUser extends StatefulWidget {
  const ListDataUser({super.key});

  @override
  State<ListDataUser> createState() => _ListDataUserState();
}

class _ListDataUserState extends State<ListDataUser> {
  bool isLoading = false;

  List<ModelUser> listUsers = [];

  Future getUser() async {
    try {
      //kondisi sukses
      setState(() {
        isLoading = true;
      });

      //proses akses url
      http.Response res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      var data = res.body;
      setState(() {
        var decodedData = json.decode(data);
        for (var i in decodedData) {
          listUsers.add(ModelUser.fromJson(i));
        }
      });
    } catch (e) {
      //kondisi gagal
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List User')),

      body: ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailUserPage(user: listUsers[index]),
                    ),
                  );
                },
                title: Text(
                  listUsers[index].name ?? "",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listUsers[index].username ?? ""),
                    Text(listUsers[index].email ?? ""),
                    Text(listUsers[index].address.city ?? ""),
                    Text(listUsers[index].phone ?? ""),
                    Text(listUsers[index].website ?? ""),
                    Text(listUsers[index].company.name ?? ""),

                    //cara panggil string di dalam string
                    // Text(" Username : " + listUsers[index].username ?? ""),
                    // Text(" Email : ${listUsers[index].email}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
