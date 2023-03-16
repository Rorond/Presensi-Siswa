import 'package:fhe_template/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  @override
  void initState() {
    instance = this;
    getCurrentPosition();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late LatLng _userLocation;
  late GoogleMapController _mapController;
  List<Widget> googleMapping = [];
  List? objectnew;

  final List<Marker> markers = <Marker>[
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
        markers.add(Marker(
            markerId: const MarkerId("2"),
            position:
                LatLng(currentPosition.latitude, currentPosition.longitude),
            infoWindow: const InfoWindow(title: "My current location")));
      });
    }
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
    getCurrentPosition();
  }
}
