import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class GoogleMapAPITest extends StatefulWidget {
  const GoogleMapAPITest({super.key});

  @override
  State<StatefulWidget> createState() => _GoogleMapAPITestState();

}

class _GoogleMapAPITestState extends State<GoogleMapAPITest> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.501991357571875, -73.57074107102315);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0
        ),
      ),
    );
  }
}