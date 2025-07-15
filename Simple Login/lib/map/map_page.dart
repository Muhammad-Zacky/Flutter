import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> marker = {};
  void _singleMarker() {
    marker.add(
      Marker(
        markerId: MarkerId("Tempat 1"),
        position: LatLng(-0.8920444380983791, 100.36612078079717),
        infoWindow: InfoWindow(title: "Kota Padang, Sumbar", snippet: "Padang"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _singleMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map Flutter")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.8920444380983791, 100.36612078079717),
          zoom: 16,
        ),
        markers: marker,
      ),
    );
  }
}
