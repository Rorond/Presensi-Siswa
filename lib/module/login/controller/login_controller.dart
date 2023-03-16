import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? email = "admin@gmail.com";
  String? password = "admin";

  doLogin() {
    if (email == "admin@gmail.com" && password == "admin") {
      Get.offAll(() => const HomeView());
      Get.snackbar(
        "Welcome",
        "Selamat datang",
        backgroundColor: Colors.white,
        colorText: Colors.blue[400],
      );
    } else {
      Get.snackbar(
        "Sorry",
        "Please type correctly email/password",
        backgroundColor: Colors.white,
        colorText: Colors.red[400],
      );
    }
  }
}
