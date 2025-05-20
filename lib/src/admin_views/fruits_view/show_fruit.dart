import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/admin_views/add_data_view/add_data.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

import '../../routs/app_routs.dart';
import '../admin_views_widgets/update_data_button.dart';

class ShowAllFruits extends StatelessWidget {
  const ShowAllFruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        centerTitle: true,
        title: BlackNormalText(
          text: "Fruit Data",
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.toNamed(AppRoutes.addData);
        },
        child: BlackNormalText(
          text: "Add Data",
          textColor: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Fruits').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppLoader();
          } else if (snapshot.hasError) {
            return Center(child: BlackNormalText(text: "Error ${snapshot.hasError}"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: BlackNormalText(text: "No Fruits Found",fontWeight: FontWeight.w700,fontSize: 25,));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // 2 columns for 2 items per row
                crossAxisSpacing: 20,
                // No extra spacing, margin will handle it
                mainAxisSpacing: 0,
                // No extra spacing
                 childAspectRatio: 0.7, // Adjust for your container's size
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var fruit = snapshot.data!.docs[index];
                return UpdateDataButton(
                  upDateOnTap: () {},
                  deleteOnTap: () {
                    Get.back();
                    FirebaseFirestore.instance.collection("Fruits").doc(fruit.id).delete();
                  },
                 itemCount: (index+1).toString(),
                  price: fruit['price'] ?? 'n/a',
                  name: fruit['fruitName'] ?? 'N/A',
                  kg: fruit['quantity'] ?? "N/A",
                );
              },
            );
          }
        },
      ),
    );
  }
}

