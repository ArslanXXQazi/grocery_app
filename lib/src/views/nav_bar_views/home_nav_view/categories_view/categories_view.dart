import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Categories",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: ImageIcon(AssetImage(AppImages.gear),color: Colors.black,))
          ],
        ),
      ),
      body: Column(children: [
        SizedBox(height: 20),

      ],),
    );
  }
}
