import 'package:flutter/material.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});




  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _isPasswordVisible = false;

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

            // const SizedBox(height: 30),
            // BlackNormalText(
            //   text: 'Change Password',
            //   fontWeight: FontWeight.w600,
            //   fontSize: 16,
            // ),
            // const SizedBox(height: 15),
            // TextFieldWidget(
            //   controller: _currentPasswordController,
            //   hintText: 'Current password',
            //   prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
            //   isPassword: true,
            // ),
            // const SizedBox(height: 15),
            // TextFieldWidget(
            //   controller: _newPasswordController,
            //   hintText: 'Enter new password',
            //   prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
            //   isPassword: !_isPasswordVisible,
            //   suffixIcon: IconButton(
            //     icon: Icon(
            //       _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            //       color: Colors.grey[600],
            //     ),
            //     onPressed: () {
            //       setState(() {
            //         _isPasswordVisible = !_isPasswordVisible;
            //       });
            //     },
            //   ),
            // ),
            //  const SizedBox(height: 15),
            // TextFieldWidget(
            //   controller: _confirmPasswordController,
            //   hintText: 'Confirm password',
            //   prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
            //   isPassword: !_isPasswordVisible,
            //   suffixIcon: IconButton(
            //     icon: Icon(
            //        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            //       color: Colors.grey[600],
            //     ),
            //      onPressed: () {
            //       setState(() {
            //         _isPasswordVisible = !_isPasswordVisible;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
