import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/components/black_text.dart' show BlackNormalText;
import '../../../controller/components/green_button.dart';
import '../../../controller/constant/images.dart';

class UpdateDataButton extends StatelessWidget {

  String image;
  String price;
  String name;
  String kg;
  VoidCallback upDateOnTap;
  VoidCallback deleteOnTap;

   UpdateDataButton({super.key,
     required this.upDateOnTap,
     required this.deleteOnTap,
     required this.image,
     required this.price,
     required this.name,
     required this.kg,
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: ()
      {
        Get.dialog(
            Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Expanded(child: GreenButton(onTap: upDateOnTap, text: "Update")),
                      SizedBox(width: 20),
                      Expanded(child: GreenButton(onTap: deleteOnTap, text: "Delete")),
                    ],),
                  ],
                ),
              ),
            )
        );
      },
      child: Container(
       height: 180,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            BlackNormalText(
              text: "\$$price",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              textColor: Colors.green,
            ),
            BlackNormalText(
              text: name,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            BlackNormalText(
              text: kg,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ],),

      ),
    );
  }
}
