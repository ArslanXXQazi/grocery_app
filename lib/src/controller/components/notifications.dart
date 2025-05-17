import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationMessage extends StatelessWidget {
  final String title;
  final String description;
  final Color?  backGroundColor;
  final Color?  textColor;

  const NotificationMessage({
    super.key,
    required this.title,
    required this.description,
    this.backGroundColor,
    this.textColor,
  });

  void showMessage() {
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

  @override
  Widget build(BuildContext context) {
    // Automatically show snackbar when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showMessage();
    });

    return const SizedBox.shrink(); // No UI, just for showing snackbar
  }
}