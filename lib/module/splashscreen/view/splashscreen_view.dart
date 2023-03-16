import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  Widget build(context, SplashscreenController controller) {
    controller.view = this;

    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.blue.shade900,
                    size: 35,
                  ),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  State<SplashscreenView> createState() => SplashscreenController();
}
