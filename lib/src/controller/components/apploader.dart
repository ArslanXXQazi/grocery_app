import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.greenColor,));
  }
}

class Apploader2 extends StatelessWidget {
  const Apploader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColors.greenColor,
        size: 60,

      ),
    );
  }
}

class Apploader3 extends StatelessWidget {
  const Apploader3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: AppColors.greenColor,
        size: 80,

      ),
    );
  }
}

