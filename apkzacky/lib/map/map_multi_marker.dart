import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMultiMarker extends StatefulWidget {
  const MapMultiMarker({super.key});

  @override
  State<MapMultiMarker> createState() => _MapMultiMarkerState();
}

class _MapMultiMarkerState extends State<MapMultiMarker> {
  Set<Marker> _multiMakers() {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("Ibis Padang"),
        position: LatLng(-0.9279365924180278, 100.36308449805901),
        infoWindow: InfoWindow(
          title: "Ibis Padang",
          snippet: "Hotem Ibis Padang",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Hotel Santika Premiere Padang"),
        position: LatLng(-0.9412385790221065, 100.35836381044697),
        infoWindow: InfoWindow(
          title: "Hotel Santika",
          snippet: "Hotel Santika Premiere Padang",
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Truntum Padang Hotel"),
        position: LatLng(-0.9565212530813421, 100.35664285874172),
        infoWindow: InfoWindow(
          title: "Hotel Truntum",
          snippet: "Truntum Padang Hotel",
        ),
      ),
    );

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Markers")),
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
