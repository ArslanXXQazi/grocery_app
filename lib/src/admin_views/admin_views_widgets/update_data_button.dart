import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/components/black_text.dart' show BlackNormalText;
import '../../controller/components/green_button.dart';
import '../../controller/constant/App_colors.dart';
import '../../controller/constant/images.dart';

class UpdateDataButton extends StatelessWidget {

  String? image;
  String price;
  String name;
  String kg;
  String itemCount;
  VoidCallback upDateOnTap;
  VoidCallback deleteOnTap;

   UpdateDataButton({super.key,
     required this.upDateOnTap,
     required this.deleteOnTap,
     this.image,
     required this.price,
     required this.name,
     required this.kg,
     required this.itemCount
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: ()
      {
        Get.dialog(
            AlertDialog(
              backgroundColor: AppColors.greyColor,
              title: BlackNormalText(
                text: "Changes",
                fontWeight: FontWeight.w700,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GreenButton(
                        onTap: upDateOnTap,
                        text: "Update",
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: RedButton(
                        onTap: deleteOnTap,
                        text: "Delete",
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ],
            )
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 30,
                 decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.only(
                     bottomRight: Radius.circular(10),
                   )
                 ),
                  child: Center(child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlackNormalText(text: itemCount,textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w700,),
                    ],
                  ),),
                )
                // CircleAvatar(
                //   backgroundColor: Colors.green,
                //   radius: 15,
                //   child: BlackNormalText(text: itemCount,textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w700,),
                // ),
              ],
            ),
            Image(image: AssetImage(AppImages.pineapple)),
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
