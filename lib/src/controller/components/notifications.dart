import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationMessage {
  static void show({
    required String title,
    required String description,
    Color? backGroundColor,
    Color? textColor,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backGroundColor ?? Colors.green,
      colorText: textColor ?? Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }
}