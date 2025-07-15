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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  Widget tombol(String label, Widget Function() page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(builder: (context) => page()),
          );
        },
        elevation: 18.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        child: Text(label, style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi Pertama',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Muhammad Dzaki Aryavega 2301093018 MI2B"),
              tombol("Nav dan Input", () => const PageTabBar()),
              tombol("Form Dosen", () => const PageDosen()),
              tombol("Tab Dosen", () => const PageDataDosen()),
              tombol("Yum Quick", () => const SplashScreen()),
              tombol("Search", () => const PageSearchList()),
              tombol("Map", () => const MapPage()),
              tombol("Map Tugas", () => const MapTask()),
              tombol("Map Hospital", () => const MapHospital()),
              tombol("Map Multi Marker", () => const MapMultiMarker()),
              tombol("Tombol 2", () => const PageDua()),
              tombol("Tombol 3", () => const PageTiga()),
              tombol("Tombol 4", () => const PageEmpat()),
              tombol("Tombol 5", () => const PageGambar()),
              tombol("Tombol 6", () => const PageUrlImage()),
              tombol("Tombol 7", () => const PageCache()),
              tombol("Tombol 8", () => const PageNotification()),
              tombol("Tombol 9", () => const PageGetData()),
              tombol("Tombol 10", () => const PageListData()),
              tombol("Tombol 11", () => const PageSimpleLogin()),
              tombol("Tombol 12", () => const PageRegister()),
            ],
          ),
        ),
      ),
    );
  }
}
