import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/admin_views/admin_views_widgets/update_data_button/update_data_button.dart';
import 'package:grocery_app/src/admin_views/fruits_view/add_data.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

import '../../controller/constant/App_colors.dart';
import '../../routs/app_routs.dart';
class ShowAllFruits extends StatelessWidget {
  const ShowAllFruits({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          Get.toNamed(AppRoutes.addData);
        },
        child: BlackNormalText(text: "Add Data",textColor: Colors.white,fontSize: 13,fontWeight: FontWeight.w700,),
      ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.peach,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.grapes,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),

              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.avacoda,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.peach,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),

              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.pineapple,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: UpdateDataButton(
                      upDateOnTap: (){},
                      deleteOnTap: (){},
                      image: AppImages.grapes,
                      price: "89",
                      name: "Fresh Peach",
                      kg: "23 kg"
                  ),
                ),

              ],),



          ],),
        ),
      ),
    );
  }
}
