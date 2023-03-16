import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    List menus = [
                      {
                        "icon": Icons.people,
                        "label": "Data\nSiswa",
                        "onTap": () {
                          Get.to(() => const SiswaView());
                        },
                      },
                      {
                        "icon": Icons.checklist_rtl,
                        "label": "Presensi\nSiswa",
                        "onTap": () {
                          Get.snackbar(
                            "Maaf",
                            "Halaman ini masih dalam pengembangan",
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                          );
                        },
                      },
                      {
                        "icon": Icons.face,
                        "label": "Face\nDetection",
                        "onTap": () {
                          Get.snackbar(
                            "Maaf",
                            "Halaman ini masih dalam pengembangan",
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                          );
                        },
                      },
                      {
                        "icon": Icons.location_pin,
                        "label": "Location\n",
                        "onTap": () {
                          controller.getCurrentPosition();
                          Get.to(() => const LocationPageView());
                        },
                      },
                      {
                        "icon": Icons.info,
                        "label": "About\n",
                        "onTap": () {
                          Get.snackbar(
                            "Maaf",
                            "Halaman ini masih dalam pengembangan",
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                          );
                        },
                      },
                      {
                        "icon": Icons.logout,
                        "label": "Logout\n",
                        "onTap": () {
                          Get.to(() => const LoginView());
                        },
                      },
                    ];

                    return Wrap(
                      children: List.generate(
                        menus.length,
                        (index) {
                          var item = menus[index];

                          var size = constraint.biggest.width / 3;

                          return SizedBox(
                            width: size,
                            height: size,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blueGrey,
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                backgroundColor: Colors.transparent,
                                splashFactory: InkSplash.splashFactory,
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                              ),
                              onPressed: () => item["onTap"](),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item["icon"],
                                    color: Colors.blueGrey,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    "${item["label"]}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.blue[100],
                child: GoogleMap(
                  onMapCreated: controller.onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-6.1753924,
                        106.8271528), // lokasi Jakarta sebagai lokasi default
                    zoom: 11.0,
                  ),
                  markers: Set<Marker>.of(controller.markers),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
