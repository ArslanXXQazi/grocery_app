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
        Padding(
          padding: const EdgeInsets.only(top: 380),
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Column(children: [
              
            ],),
          ),
        ),


      ],),
    );
  }
}
