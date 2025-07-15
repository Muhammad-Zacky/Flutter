import 'package:flutter/material.dart';

class PageSearchList extends StatefulWidget {
  const PageSearchList({super.key});

  @override
  State<PageSearchList> createState() => _PageSearchListState();
}

class _PageSearchListState extends State<PageSearchList> {
  List<String> listDevice = [
    "Laptop",
    "Ponsel",
    "Tablet",
    "Printer",
    "Kamera",
    "Oppo",
    "Xiaomi",
    "Samsung",
    "Asus",
    "Lenovo"
  ];
  bool isCari = true;
  List<String> filterData = [];
  TextEditingController txtCari = TextEditingController();

  _PageSearchListState() {
    txtCari.addListener(() {
      setState(() {
        isCari = txtCari.text.isEmpty;
        filterData = listDevice
            .where((element) => element.toLowerCase().contains(txtCari.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search List"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtCari,
              decoration: InputDecoration(
                hintText: "Cari Disini",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withOpacity(0.1),
                filled: true,
              ),
            ),
            Expanded(
              child: CreateListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget CreateListView() {
    filterData = listDevice
        .where((item) => item.toLowerCase().contains(txtCari.text.toLowerCase()))
        .toList();
    return HasilSearch();
  }

  Widget HasilSearch() {
    return ListView.builder(
      itemCount: filterData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filterData[index]),
        );
      },
    );
  }
}
