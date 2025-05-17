import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/controller/components/notifications.dart';
import 'package:grocery_app/src/routs/app_routs.dart';
import 'package:grocery_app/src/views/auth_views/user_data_controller/user_data_controller.dart';

 class AuthController extends GetxController
 {

   var isLoading = false.obs;
   final TextEditingController emailController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
    UserDataController userDataController=Get.put(UserDataController());





   void signIn() async {

     try
     {
       isLoading.value=true;
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
       isLoading.value=false;
       clear();
       Get.offAndToNamed(AppRoutes.navBarView);

     }
     catch(e)
     {
       isLoading.value=false;
       NotificationMessage.show(
         title: "Error",
         description: e.toString(),
         backGroundColor: Colors.red,
         textColor: Colors.white,
       );
     }


   }

   void signUp () async
   {
     try{
       isLoading.value=true;
       String email = emailController.text.trim();
       String password = passwordController.text.trim();
       String phone = phoneController.text.trim();

       await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email, password:password);
       userData(email, password, phone);
       clear();
       NotificationMessage.show(
         title: "Success",
         description: "Account Created Successfully",
       );
       Get.offAndToNamed(AppRoutes.navBarView);

     }
     catch(e){
       isLoading.value=false;
       NotificationMessage.show(
         title: "Error",
         description: e.toString(),
         backGroundColor: Colors.red,
         textColor: Colors.white,
       );
     }
   }

   void userData(String email, String password, String phone) async
   {
     try
     {
       await FirebaseFirestore.instance.collection("userData").doc(userDataController.userId.value).set({
         'userName':'',
         'userEmail':email,
         'userAge':'',
         'userPhone':phone,
         'userPassword':phone,
         'userImage' : '',
         'userAccount':'',
         'userAccountName':'',
         'userGender':'',
         'userCountry':'',
         'userProvince':'',
         'userCity' : ''
       });
     }
     catch(e)
     {

     }
   }

   void clear()
   {
     emailController.clear();
     phoneController.clear();
     phoneController.clear();
   }


 }
