import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Colors.green,));
  }
}

class Apploader2 extends StatelessWidget {
  const Apploader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.green,
        size: 60,

      ),
    );
  }
}

