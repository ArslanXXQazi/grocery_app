import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/admin_views/admin_views_widgets/catagory_button.dart';
import 'package:grocery_app/src/admin_views/admin_views_widgets/update_data_button/update_data_button.dart';
import 'package:grocery_app/src/admin_views/fruits_view/add_fruit.dart';
import 'package:grocery_app/src/admin_views/fruits_view/show_fruit.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          backgroundColor: AppColors.greyColor,
          centerTitle: true,
          title: BlackNormalText(
            text: "Admin Controls",
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      body:Column(
        children:[
          SizedBox(height: 30,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
           CatagoryButton(
              ontap: ()
              {
                Get.to(ShowAllFruits());
              },
               image: AppImages.peach, name: "Furites"),
           CatagoryButton(
              ontap: ()
              {
              },
               image: AppImages.peach, name: "Furites"),
         ],)
        ]
      )
    );
  }
}
