import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/admin_views/admin_controller/admin_controller.dart';
import 'package:grocery_app/src/admin_views/admin_views_widgets/update_data_button.dart';
import 'package:grocery_app/src/controller/components/apploader.dart';

import '../../controller/components/black_text.dart';
import '../../controller/constant/App_colors.dart' show AppColors;
import '../../routs/app_routs.dart';

class VegetablesView extends StatelessWidget {
  VegetablesView({super.key});

  AdminController adminController = Get.put(AdminController());

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.toNamed(AppRoutes.addData, arguments: {'collection':'Vegetables'});
        },
        child: BlackNormalText(
          text: "Add Data",
          textColor: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Vegetables').snapshots(),
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
                return Center(child: BlackNormalText(text: "No Vegetable Found",fontWeight: FontWeight.w700,fontSize: 25,));
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
                        return UpdateDataButton(

                          //================================>>> Update OnTap
                            upDateOnTap: (){
                              Get.back();
                              Get.toNamed(
                                AppRoutes.updateDataView,
                                arguments: {
                                  'id': vegetables.id,
                                  'name': vegetables['vegetableName'] ?? 'N/A',
                                  'price': vegetables['price'] ?? 'N/A',
                                  'quantity': vegetables['quantity'] ?? 'N/A',
                                  'collection': 'Vegetables',
                                },
                              );
                            },

                            //================================>>> Delete OnTap
                            deleteOnTap: (){
                              Get.back();
                              adminController.deleteData(vegetables.id,'Vegetables');
                            },

                            price: vegetables["price"]??"N/A",
                            name:  vegetables["vegetableName"]??"N/A",
                            kg:  vegetables["quantity"]??"N/A",
                            itemCount: (index+1).toString()
                        );
                      }
                  );
                }
            }
        ),
      ),
    );
  }
}
