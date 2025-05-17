import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class AuthController extends GetxController
 {

   var isLoading = false.obs;
   final TextEditingController emailController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

   void signUp () async
   {
     try{
       isLoading.value=true;

       String email = emailController.text.trim();
       String password = passwordController.text.trim();

       await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email, password:password);
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
       isLoading.value=false;
       print(e.toString());
     }
   }

   void userData() async
   {
     try
     {
       String userId=FirebaseAuth.instance.currentUser!.uid;
       await FirebaseFirestore.instance.collection("userData").doc().set({



       });
     }
     catch(e)
     {

     }
   }


 }
