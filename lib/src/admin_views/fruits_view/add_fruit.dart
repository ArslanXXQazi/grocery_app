import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/admin_views/admin_controller/admin_controller.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';

import '../../controller/components/notifications.dart';


class AddFruit extends StatelessWidget {
   AddFruit({super.key});

  AdminController adminController=Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlackNormalText(
              text: "Enter Your Fruit Data",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            SizedBox(height: 20),
            TextFieldWidget(controller: adminController.nameController, hintText: "Fruit Name"),
            SizedBox(height: 20),
            TextFieldWidget(controller: adminController.priceController, hintText: "Fruit Price",keyboardType: TextInputType.number,),
            SizedBox(height: 20),
            TextFieldWidget(controller: adminController.quantityController, hintText: "Fruit Quantity"),
            SizedBox(height: 20),
            Obx((){
              return adminController.isLoading.value==true ? AppLoader() :
                  GreenButton(onTap: (){
                    adminController.addData();
                  }, text: "Add Data");
            })
        ],),
      ),
    );
  }
}
