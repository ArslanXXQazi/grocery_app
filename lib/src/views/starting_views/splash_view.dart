import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class SplashView extends StatelessWidget {
  const SplashView
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
          height: double.infinity,
          width: double.infinity,
          child: Image(image: AssetImage(AppImages.splash)),
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
          BlackNormalText(
            text: "Welcome to",
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
         ],)
        ],
      ),
    );
  }
}