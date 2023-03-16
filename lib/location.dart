import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late LatLng _userLocation;
  late GoogleMapController _mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
  }

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(-6.1753924, 106.8271528),
        infoWindow: InfoWindow(title: "Default location"))
  ];
  getCurrentPosition() async {
    //Permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        _userLocation =
            LatLng(currentPosition.latitude, currentPosition.longitude);
        _mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: _userLocation, zoom: 15.0)));
        _markers.add(Marker(
            markerId: const MarkerId("2"),
            position:
                LatLng(currentPosition.latitude, currentPosition.longitude),
            infoWindow: const InfoWindow(title: "My current location")));
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
              -6.1753924, 106.8271528), // lokasi Jakarta sebagai lokasi default
          zoom: 11.0,
        ),
        markers: Set<Marker>.of(_markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.location_on),
        onPressed: () async {
          getCurrentPosition();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
