import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/views/auth_views/user_data_controller/user_data_controller.dart';

 class AuthController extends GetxController
 {

   var isLoading = false.obs;
   final TextEditingController emailController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
    UserDataController userDataController=Get.put(UserDataController());

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
     }
     catch(e){
       isLoading.value=false;
       print(e.toString());
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


 }
