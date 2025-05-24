import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.white,
          child: Image(image: AssetImage(AppImages.peach)),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            
          ),
        ),


      ],),
    );
  }
}
