import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHospital extends StatefulWidget {
  const MapHospital({super.key});

  @override
  State<MapHospital> createState() => _MapHospitalState();
}

class _MapHospitalState extends State<MapHospital> {
  Set<Marker> _multiMarkers() {
    return {
      Marker(
        markerId: const MarkerId("RB Putri Sari Amin"),
        position: const LatLng(-0.9566887692096557, 100.35909622810362),
        infoWindow: const InfoWindow(
          title: "RB Putri Sari Amin",
          snippet: "Hospital RB Putri Sari Amin",
        ),
      ),
      Marker(
        markerId: const MarkerId("RSU Bunda Padang"),
        position: const LatLng(-0.9504239966479261, 100.36763638197678),
        infoWindow: const InfoWindow(
          title: "RSU Bunda Padang",
          snippet: "Hospital RSU Bunda Padang",
        ),
      ),
      Marker(
        markerId: const MarkerId("RSB Restu Ibu"),
        position: const LatLng(-0.9487934375740622, 100.36703556718979),
        infoWindow: const InfoWindow(
          title: "RSB Restu Ibu",
          snippet: "Hospital RSB Restu Ibu",
        ),
      ),
      Marker(
        markerId: const MarkerId("Rumah Sakit Umum Aisyiyah"),
        position: const LatLng(-0.9466426002012998, 100.36373913190138),
        infoWindow: const InfoWindow(
          title: "Rumah Sakit Umum Aisyiyah",
          snippet: "Hospital Aisyiyah",
        ),
      ),
      Marker(
        markerId: const MarkerId("RS NAILI DBS"),
        position: const LatLng(-0.9446687632804052, 100.35923302099899),
        infoWindow: const InfoWindow(
          title: "RS NAILI DBS",
          snippet: "Hospital RS NAILI DBS",
        ),
      ),
      Marker(
        markerId: const MarkerId("RSUP Dr. M. Djamil Padang"),
        position: const LatLng(-0.9427807443068599, 100.36691486720402),
        infoWindow: const InfoWindow(
          title: "RSUP Dr. M. Djamil Padang",
          snippet: "Hospital Dr. M. Djamil",
        ),
      ),
      Marker(
        markerId: const MarkerId("RSU Selaguri"),
        position: const LatLng(-0.9420512821564183, 100.35807430676694),
        infoWindow: const InfoWindow(
          title: "RSU Selaguri",
          snippet: "Hospital RSU Selaguri",
        ),
      ),
      Marker(
        markerId: const MarkerId("Yos Sudarso Hospital"),
        position: const LatLng(-0.9354861159445189, 100.36249458698548),
        infoWindow: const InfoWindow(
          title: "Yos Sudarso Hospital",
          snippet: "Hospital Yos Sudarso",
        ),
      ),
      Marker(
        markerId: const MarkerId("RS Bedah Ropanasur"),
        position: const LatLng(-0.9344562845674379, 100.3593188517337),
        infoWindow: const InfoWindow(
          title: "RS Khusus Bedah Ropanasur",
          snippet: "Hospital Ropanasur",
        ),
      ),
      Marker(
        markerId: const MarkerId("West Sumatra Police Hospital"),
        position: const LatLng(-0.932353711779217, 100.36579906836478),
        infoWindow: const InfoWindow(
          title: "West Sumatra Police Hospital",
          snippet: "Police Hospital",
        ),
      ),
      Marker(
        markerId: const MarkerId("RSKB Kartika Docta"),
        position: const LatLng(-0.9212400917472203, 100.36665737543213),
        infoWindow: const InfoWindow(
          title: "RSKB Kartika Docta",
          snippet: "Hospital Kartika Docta",
        ),
      ),
      Marker(
        markerId: const MarkerId("Hermina Hospital Padang"),
        position: const LatLng(-0.9167774701516898, 100.36064922756226),
        infoWindow: const InfoWindow(
          title: "Hermina Hospital Padang",
          snippet: "Hospital Hermina Padang",
        ),
      ),
      Marker(
        markerId: const MarkerId("Semen Padang Hospital"),
        position: const LatLng(-0.9398603647766828, 100.39932163205422),
        infoWindow: const InfoWindow(
          title: "Semen Padang Hospital",
          snippet: "Hospital Semen Padang",
        ),
      ),
      Marker(
        markerId: const MarkerId("Islamic Hospital Siti Rahmah"),
        position: const LatLng(-0.8702881841839147, 100.38370023835725),
        infoWindow: const InfoWindow(
          title: "Islamic Hospital Siti Rahmah",
          snippet: "Hospital Islamic Hospital Siti Rahmah",
        ),
      ),
      Marker(
        markerId: const MarkerId("Rumkital DR. dr. Tarmizi Taher"),
        position: const LatLng(-0.9881250949168662, 100.38345283166737),
        infoWindow: const InfoWindow(
          title: "Rumkital DR. dr. Tarmizi Taher",
          snippet: "Hospital Rumkital DR. dr. Tarmizi Taher",
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peta Rumah Sakit"),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-0.9412385790221065, 100.35836381044697),
              zoom: 13,
            ),
            markers: _multiMarkers(),
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              color: Colors.amber[700]?.withOpacity(0.95),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.local_hospital, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Peta Rumah Sakit di Kota Padang",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
