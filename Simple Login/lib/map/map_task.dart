import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTask extends StatefulWidget {
  const MapTask({super.key});

  @override
  State<MapTask> createState() => _MapTaskState();
}

class _MapTaskState extends State<MapTask> {
  Set<Marker> marker = {};
  void _singleMarker() {
    marker.add(
      Marker(
        markerId: MarkerId("Kontrakan saya"),
        position: LatLng(-0.9334124860275567, 100.40264632864712),
        infoWindow: InfoWindow(
          title: "Kota Padang, Sumbar",
          snippet: "3C83+J3J Pasar Ambacang, Padang City, West Sumatra",
        ),
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
      appBar: AppBar(title: Text("Map Kontrakan")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9334124860275567, 100.40264632864712),
          zoom: 16,
        ),
        markers: marker,
      ),
    );
  }
}
