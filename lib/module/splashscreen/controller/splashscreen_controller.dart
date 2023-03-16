import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenController extends State<SplashscreenView>
    implements MvcController {
  static late SplashscreenController instance;
  late SplashscreenView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(() => const LoginView());
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
