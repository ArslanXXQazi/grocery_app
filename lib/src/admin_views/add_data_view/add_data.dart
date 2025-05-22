import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/admin_views/admin_controller/admin_controller.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';



class AddData extends StatelessWidget {
  String collection;
   AddData({super.key,required this.collection});

  AdminController adminController=Get.put(AdminController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        leading: BackButton(color: Colors.black,),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlackNormalText(
              text: "Enter Your ${collection} Data",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
           Form(
             key: formKey,
               child: Column(children: [
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.nameController,
               hintText: "${collection} Name",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Name";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.priceController,
               hintText: "${collection} Price",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Price";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.quantityController,
               hintText: "${collection} Quantity",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Quantity";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
           ],)),
            Obx((){
              return adminController.isLoading.value==true ? AppLoader() :
                  GreenButton(onTap: (){
                    if(formKey.currentState!.validate()){
                   if (collection=='Fruits')
                     {
                       adminController.addFruit(collection);
                     }
                  else if(collection=='Vegetables')
                    {
                      adminController.addVegetable(collection);
                    }
                    }
                  }, text: "Add Data");
            })
        ],),
      ),
    );
  }
}
