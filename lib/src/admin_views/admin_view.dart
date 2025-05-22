import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/admin_views/admin_views_widgets/catagory_button.dart';

import 'package:grocery_app/src/admin_views/add_data_view/add_data.dart';
import 'package:grocery_app/src/admin_views/fetchdata.dart';
import 'package:grocery_app/src/admin_views/fruits_view/show_fruit.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/routs/app_routs.dart';

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
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            children:[
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                     Get.toNamed(AppRoutes.fetchDataView,
                         arguments: {
                      'category':"Fruits"
                     });
                    },
                     image: AppImages.fruits, name: "Fruits"),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments: {
                            'category':"Vegetables"
                          });
                      //Get.toNamed(AppRoutes.vegetableView);
                    },
                     image: AppImages.vegetables, name: "Vegetables"),
               ),
             ],),
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments: {
                            'category':"Beverages"
                          });
                    },
                     image: AppImages.beverages, name: "Beverages"),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                    },
                     image: AppImages.grocery, name: "Grocery"),
               ),
             ],),
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                    },
                     image: AppImages.edibleOil, name: "Edible Oil"),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                    },
                     image: AppImages.household, name: "household"),
               ),
             ],),
            ]
          ),
        ),
      )
    );
  }
}
