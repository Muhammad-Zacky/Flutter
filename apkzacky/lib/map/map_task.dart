import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTask extends StatefulWidget {
  const MapTask({super.key});

  @override
  State<MapTask> createState() => _MapTaskState();
}

class _MapTaskState extends State<MapTask> {
  final LatLng _lokasiRumah = const LatLng(-0.9334124860275567, 100.40264632864712);
  Set<Marker> _markers = {};

  void _setMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId("rumah_saya"),
        position: _lokasiRumah,
        infoWindow: const InfoWindow(
          title: "Kota Padang, Sumbar",
          snippet: "3C83+J3J Pasar Ambacang, Padang City, West Sumatra",
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peta Lokasi Rumah"),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _lokasiRumah,
                zoom: 16,
              ),
              markers: _markers,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              compassEnabled: true,
              mapToolbarEnabled: false,
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            left: 16,
            child: Card(
              color: Colors.amber[700]?.withOpacity(0.95),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.home, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Lokasi Rumah Zacky\nPadang, Sumatera Barat",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
