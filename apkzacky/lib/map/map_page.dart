import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng _lokasi = const LatLng(-0.8920444380983791, 100.36612078079717);
  Set<Marker> _markers = {};

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId("lokasi"),
        position: _lokasi,
        infoWindow: const InfoWindow(
          title: "Kota Padang, Sumbar",
          snippet: "Lokasi Pusat Kota Padang",
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peta Kota Padang"),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _lokasi,
              zoom: 16,
            ),
            markers: _markers,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            compassEnabled: true,
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              color: Colors.amber[700]?.withOpacity(0.95),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Pusat Kota Padang\nSumatera Barat",
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
