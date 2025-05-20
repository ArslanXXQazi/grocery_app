import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';

import '../../controller/components/black_text.dart';
import '../../controller/constant/App_colors.dart' show AppColors;

class VegetablesView extends StatelessWidget {
  const VegetablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        centerTitle: true,
        title: BlackNormalText(
          text: "Vegetables",
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Vegetable').snapshots(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting)
              {
                return AppLoader();
              }
          else if (snapshot.hasError)
              {
                return Center(child: BlackNormalText(text: "Error ${snapshot.hasError}",));
              }
            else if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
            {
              return Center(child: BlackNormalText(text: "No Fruits Found",fontWeight: FontWeight.w700,fontSize: 25,));
            }
            else
              {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: .7
                    ),
                    itemCount:  snapshot.data!.docs.length,
                    itemBuilder: (context, index)
                    {
                      var vegetables= snapshot.data!.docs[index];
                      return
                    }
                );
              }
          }
      ),
    );
  }
}
