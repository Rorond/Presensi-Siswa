import 'package:fhe_template/module/splashscreen/view/splashscreen_view.dart';
import 'package:fhe_template/setup.dart';
// import 'package:fhe_template/state_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await initialize();

  Widget mainView = const SplashscreenView();

  runApp(
    GetMaterialApp(
      title: 'Presensi Siswa',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainView,
      debugShowCheckedModeBanner: false,
    ),
  );
}
