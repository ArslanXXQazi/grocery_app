import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/routs/app_routs.dart';
import 'package:grocery_app/src/views/auth_views/auth_controller/auth_controller.dart';


class SignInView extends StatelessWidget {
   SignInView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthController authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //=======================>> first container for image
                Stack(
                  children: [
                    Container(
                      height: screenHeight * .5,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(AppImages.signIn),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: screenHeight*.05,
                      child: Row(children: [
                        BackButton(color: Colors.white,),
                        SizedBox(width: screenWidth*.25,),
                        BlackNormalText(
                          text: "Welcome",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white,
                        ),
                      ],),
                    )
                  ],
                ),
                //=======================>> 2nd container for body
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * .47),
                  child: Container(
                    height: screenHeight * .53,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F5F9),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlackNormalText(
                            text: "Welcome back !",
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          BlackNormalText(
                            text: "Sign in to your account",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            textColor: Colors.grey,
                          ),
                         SizedBox(height: screenHeight*.025),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  controller: authController.emailController,
                                  hintText: "Email",
                                  prefixIcon: Image(
                                    image: AssetImage("assets/icons/email.png"),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a email";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight*.01),
                                Obx((){
                                  return  TextFieldWidget(
                                    controller:authController.passwordController,
                                    hintText: "Password",
                                    prefixIcon: Image(
                                      image: AssetImage(AppImages.lock),
                                    ),
                                    isPassword: passwordFieldController.isPasswordVisible.value,
                                    suffixIcon:  IconButton(onPressed: (){
                                      passwordFieldController.togglePasswordVisibility();},
                                      icon: Icon(
                                        passwordFieldController.isPasswordVisible.value
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter a password";
                                      }
                                      if (value.length < 6) {
                                        return "Password must be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  );
                                }),
                                SizedBox(height: screenHeight*.005),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlackNormalText(
                                      text: "Remember me",
                                      fontSize: 15,
                                      textColor: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  BlackNormalText(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.forgotPasswordView);
                                    },
                                    text: "Forgot password",
                                    fontSize: 15,
                                    textColor: Colors.blueAccent,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],)
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*.02),

                        Obx((){
                          return authController.isLoading.value ? AppLoader():
                          GreenButton(
                            text: "Sign In",
                            onTap: () {
                              if (formKey.currentState!.validate())
                              {
                            if (authController.emailController.text.trim()=="admin@gmail.com" && authController.passwordController.text.trim()=="123456")
                            {
                              Get.offAndToNamed(AppRoutes.profileNavView);
                            }
                            else
                            {
                             authController.signIn();
                            }

                              }
                            },
                          );
                        }),

                          SizedBox(height: screenHeight*.025),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlackNormalText(
                                text: "Don’t have an account ?  ",
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                              BlackNormalText(
                                onTap: () {
                                  Get.toNamed(AppRoutes.signUpView);
                                },
                                text: "Sign Up",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}