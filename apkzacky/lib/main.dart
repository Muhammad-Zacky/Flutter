import 'package:flutter/material.dart';
import 'package:pertemuan_pertama/Screen/list_data.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_tab_bar.dart';
import 'package:pertemuan_pertama/Screen/latihan_form/page_dosen.dart';
import 'package:pertemuan_pertama/Screen/page_get_data.dart';
import 'package:pertemuan_pertama/Screen/page_notification.dart';
import 'package:pertemuan_pertama/Screen/page_satu.dart';
import 'package:pertemuan_pertama/Screen/page_dua.dart';
import 'package:pertemuan_pertama/Screen/page_simple_login.dart';
import 'package:pertemuan_pertama/Screen/page_tiga.dart';
import 'package:pertemuan_pertama/Screen/page_empat.dart';
import 'package:pertemuan_pertama/Screen/page_gambar.dart';
import 'package:pertemuan_pertama/Screen/page_url_image.dart';
import 'package:pertemuan_pertama/Screen/page_cache.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_register.dart';
import 'package:pertemuan_pertama/Screen/latihan_form/page_data_dosen.dart';
import 'package:pertemuan_pertama/Screen/latihan_yum/splashscreen.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_search_list.dart';
import 'package:pertemuan_pertama/map/map_hospital.dart';
import 'package:pertemuan_pertama/map/map_multi_marker.dart';
import 'package:pertemuan_pertama/map/map_page.dart';
import 'package:pertemuan_pertama/map/map_task.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  Widget tombol(String label, Widget Function() page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
      ),
      onPressed: () {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => page()),
        );
      },
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {"label": "Nav dan Input", "page": () => const PageTabBar()},
      {"label": "Form Dosen", "page": () => const PageDosen()},
      {"label": "Tab Dosen", "page": () => const PageDataDosen()},
      {"label": "Yum Quick", "page": () => const SplashScreen()},
      {"label": "Search", "page": () => const PageSearchList()},
      {"label": "Map", "page": () => const MapPage()},
      {"label": "Map Tugas", "page": () => const MapTask()},
      {"label": "Map Hospital", "page": () => const MapHospital()},
      {"label": "Multi Marker", "page": () => const MapMultiMarker()},
      {"label": "Tombol 2", "page": () => const PageDua()},
      {"label": "Tombol 3", "page": () => const PageTiga()},
      {"label": "Tombol 4", "page": () => const PageEmpat()},
      {"label": "Tombol 5", "page": () => const PageGambar()},
      {"label": "Tombol 6", "page": () => const PageUrlImage()},
      {"label": "Tombol 7", "page": () => const PageCache()},
      {"label": "Tombol 8", "page": () => const PageNotification()},
      {"label": "Tombol 9", "page": () => const PageGetData()},
      {"label": "Tombol 10", "page": () => const PageListData()},
      {"label": "Tombol 11", "page": () => const PageSimpleLogin()},
      {"label": "Tombol 12", "page": () => const PageRegister()},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text(
          'Muhammad Zacky 2301093019',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: pages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.2,
          ),
          itemBuilder: (context, index) {
            return tombol(pages[index]["label"], pages[index]["page"]);
          },
        ),
      ),
    );
  }
}
