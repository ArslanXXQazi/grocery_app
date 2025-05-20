

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/components/notifications.dart';

class AdminController extends GetxController
{

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  var isLoading= false.obs;

  void addData() async
  {
    try
    {
      isLoading.value=true;
      String id=DateTime.now().microsecond.toString();
      await FirebaseFirestore.instance.collection('Fruits').doc(id).set({
        'id':id,
        'fruitName':nameController.text,
        'quantity':quantityController.text,
        'price':priceController.text,
        'enable':'1',
        'url':'d'
      });
      isLoading.value=false;
      Get.back();
      NotificationMessage.show(
        title: "Success",
        description: "Data Added Successfully",
      );
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


  void deleteData( String fruitId ) async
  {
    Get.back();
   await FirebaseFirestore.instance.collection("Fruits").doc(fruitId).delete();
  }


}