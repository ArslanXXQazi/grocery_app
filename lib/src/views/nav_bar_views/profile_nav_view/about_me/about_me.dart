import 'package:flutter/material.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';

class AboutMe extends StatelessWidget {
   AboutMe({super.key});
  AuthController authController= Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BlackNormalText(
          text: 'About Me',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textColor: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackNormalText(
              text: 'Personal Details',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.nameController,
              hintText: 'Name',
              prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.emailController,
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.phoneController,
              hintText: 'Phone',
              prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.ageController,
              hintText: 'user age',
              prefixIcon: Icon(Icons.person_2_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.userBankAccountController,
              hintText: 'userBankAccount',
              prefixIcon: Icon(Icons.account_balance, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.userBankAccountNameController,
              hintText: 'userBankAccountName',
              prefixIcon: Icon(Icons.apartment_outlined, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: authController.genderController,
              hintText: 'gender',
              prefixIcon: Icon(Icons.transgender, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            Obx((){
             return authController.isLoading.value ? Apploader2():
             GreenButton(
               onTap: () {
                 authController.userData();
               },
               text: 'Save settings',
             );
           })
          ],
        ),
      ),
    );
  }
}
