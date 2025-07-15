import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHospital extends StatefulWidget {
  const MapHospital({super.key});

  @override
  State<MapHospital> createState() => _MapHospitalState();
}

class _MapHospitalState extends State<MapHospital> {
  Set<Marker> _multiMakers() {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("RB Putri Sari Amin"),
        position: LatLng(-0.9566887692096557, 100.35909622810362),
        infoWindow: InfoWindow(
          title: "RB Putri Sari Amin",
          snippet: "Hospital RB Putri Sari Amin",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RSU Bunda Padang"),
        position: LatLng(-0.9504239966479261, 100.36763638197678),
        infoWindow: InfoWindow(
          title: "RSU Bunda Padang",
          snippet: "Hospital RSU Bunda Padang",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RSB Restu Ibu"),
        position: LatLng(-0.9487934375740622, 100.36703556718979),
        infoWindow: InfoWindow(
          title: "RSB Restu Ibu",
          snippet: "Hospital RSB Restu Ibu",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Rumah Sakit Umum Aisyiyah"),
        position: LatLng(-0.9466426002012998, 100.36373913190138),
        infoWindow: InfoWindow(
          title: "Rumah Sakit Umum Aisyiyah",
          snippet: "Hospital Aisyiyah",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RS NAILI DBS"),
        position: LatLng(-0.9446687632804052, 100.35923302099899),
        infoWindow: InfoWindow(
          title: "RS NAILI DBS",
          snippet: "Hospital RS NAILI DBS",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RSUP Dr. M. Djamil Padang"),
        position: LatLng(-0.9427807443068599, 100.36691486720402),
        infoWindow: InfoWindow(
          title: "RSUP Dr. M. Djamil Padang",
          snippet: "Hospital Dr. M. Djamil",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RSU Selaguri"),
        position: LatLng(-0.9420512821564183, 100.35807430676694),
        infoWindow: InfoWindow(
          title: "RSU Selaguri",
          snippet: "Hospital RSU Selaguri",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Yos Sudarso Hospital"),
        position: LatLng(-0.9354861159445189, 100.36249458698548),
        infoWindow: InfoWindow(
          title: "Yos Sudarso Hospital",
          snippet: "Hospital Yos Sudarso",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RS Bedah Ropanasur"),
        position: LatLng(-0.9344562845674379, 100.3593188517337),
        infoWindow: InfoWindow(
          title: "RS Khusus Bedah Ropanasur",
          snippet: "Hospital Ropanasur",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("West Sumatra Police Hospital"),
        position: LatLng(-0.932353711779217, 100.36579906836478),
        infoWindow: InfoWindow(
          title: "West Sumatra Police Hospital",
          snippet: "Police Hospital",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("RSKB Kartika Docta"),
        position: LatLng(-0.9212400917472203, 100.36665737543213),
        infoWindow: InfoWindow(
          title: "RSKB Kartika Docta",
          snippet: "Hospital Kartika Docta",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Hermina Hospital Padang"),
        position: LatLng(-0.9167774701516898, 100.36064922756226),
        infoWindow: InfoWindow(
          title: "Hermina Hospital Padang",
          snippet: "Hospital Hermina Padang",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Semen Padang Hospital"),
        position: LatLng(-0.9398603647766828, 100.39932163205422),
        infoWindow: InfoWindow(
          title: "Semen Padang Hospital",
          snippet: "Hospital Semen Padang",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Islamic Hospital Siti Rahmah"),
        position: LatLng(-0.8702881841839147, 100.38370023835725),
        infoWindow: InfoWindow(
          title: "Islamic Hospital Siti Rahmah",
          snippet: "Hospital Islamic Hospital Siti Rahmah",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Rumkital DR. dr. Tarmizi Taher"),
        position: LatLng(-0.9881250949168662, 100.38345283166737),
        infoWindow: InfoWindow(
          title: "Rumkital DR. dr. Tarmizi Taher",
          snippet: "Hospital Rumkital DR. dr. Tarmizi Taher",
        ),
      ),
    );

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hospital Markers")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9412385790221065, 100.35836381044697),
          zoom: 13,
        ),
        markers: _multiMakers(),
      ),
    );
  }
}
