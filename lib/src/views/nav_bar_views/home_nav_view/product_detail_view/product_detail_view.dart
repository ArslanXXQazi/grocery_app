import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Column(children: [
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.white,
          child: Image(image: AssetImage(AppImages.peach)),
        ),
        const SizedBox(height: 20),
        

      ],),
    );
  }
}
