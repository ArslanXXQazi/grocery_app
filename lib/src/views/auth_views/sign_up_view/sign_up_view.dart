import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/routs/app_routs.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
bool isLaoding=false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;



 void signUp () async
 {
   try{
     isLaoding=true;
     setState(() {

     });
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: emailController.text.trim(), password: passwordController.text.trim());
     String userId=await FirebaseAuth.instance.currentUser!.uid;
     await FirebaseFirestore.instance.collection('userData').doc(userId).set({
       'userName':'',
       'userEmail':emailController.text.trim(),
       'userAge':'',
       'userPhone':phoneController.text,
       'userPassword':passwordController.text.trim(),
       'userImage' : '',
       'userAccount':'',
       'userAccountName':'',
       'userGender':'',
       'userCountry':'',
       'userProvince':'',
       'userCity' : ''
     });
     isLaoding=false;
     Get.snackbar("Success", "Account Create Successfully",backgroundColor: Colors.green);
     Get.offAndToNamed(AppRoutes.signInView);
   }
   catch(e){
     isLaoding=false;
     print(e.toString());
   }
 }


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
                //==========================>>1st container for image
                Stack(
                  children: [
                    Container(
                      height: screenHeight * .5,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(AppImages.signUp),
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
                //===========================>>2nd container for body
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
                            text: "Create account",
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          BlackNormalText(
                            text: "Quickly create account",
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
                                  controller: emailController,
                                  hintText: "Email",
                                  prefixIcon: Image(
                                    image: AssetImage(AppImages.email),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a Email";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight*.01),
                                TextFieldWidget(
                                  controller: phoneController,
                                  hintText: "Phone number",
                                  prefixIcon: Image(
                                    image: AssetImage(AppImages.phone),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a phone number";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight*.01),
                                TextFieldWidget(
                                  controller: passwordController,
                                  hintText: "Password",
                                  prefixIcon: Image(
                                    image: AssetImage(AppImages.lock),
                                  ),
                                  isPassword: !_isPasswordVisible,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isPasswordVisible
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*.02),
                         isLaoding?Center(child: AppLoader()): GreenButton(
                            text: "Sign Up",
                            onTap: () async{
                              if (formKey.currentState!.validate())
                              {
                                signUp();
                              }
                            },
                          ),
                          SizedBox(height: screenHeight*.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlackNormalText(
                                text: "Already have an account ?  ",
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                              BlackNormalText(
                                onTap: () {
                                  Get.toNamed(AppRoutes.signInView);
                                },
                                text: "Login",
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