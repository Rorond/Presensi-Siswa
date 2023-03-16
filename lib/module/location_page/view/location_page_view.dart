import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPageView extends StatefulWidget {
  const LocationPageView({Key? key}) : super(key: key);

  @override
  Widget build(context, LocationPageController controller) {
    late GoogleMapController mapController;
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Location"),
        backgroundColor: Colors.blue[800],
      ),
      body: GoogleMap(
        onMapCreated: controller.onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
              -6.1753924, 106.8271528), // lokasi Jakarta sebagai lokasi default
          zoom: 11.0,
        ),
        markers: Set<Marker>.of(controller.markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }

  @override
  State<LocationPageView> createState() => LocationPageController();
}
