import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController

{

  var userId=''.obs;

 void getUserId () async
 {
   try
   {
     final  userId= await FirebaseAuth.instance.currentUser!.uid;
   }
   catch(e)
   {
     print(e.toString());
   }
 }

}
