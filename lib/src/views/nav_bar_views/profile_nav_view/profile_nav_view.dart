
import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';

import '../../../controller/constant/images.dart';
class ProfileNavView extends StatelessWidget {
  const ProfileNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      body: Stack(children: [
        Container(
          height: screenHeight*.2,
          width: double.infinity,
          color: Colors.white,
        ),
        Padding(
          padding:  EdgeInsets.only(top: screenHeight*.12),
          child: Column(children: [
            Container(
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                    ),
                  ),
                  Positioned(
                    left: screenWidth*.57,top: screenHeight*.095,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: Center(child: IconButton(
                        onPressed: (){},
                        icon: ImageIcon(AssetImage(AppImages.camera,),color: Colors.white,),
                    ),
                  )))
                ],
              ),
            ),
            SizedBox(height: screenHeight*.01),
            BlackNormalText(
              text: "Olivia Austin",
              fontSize: 15,
              fontWeight: FontWeight.w600 ,
            ),
            SizedBox(height: screenHeight*.01),
            BlackNormalText(
              text: "oliviaaustin@gmail.com",
              fontSize: 12,
              fontWeight: FontWeight.w400 ,
              textColor: Colors.grey,
            ),
            SizedBox(height: screenHeight*.01),
            Container(
              child: Row(children: [
                ImageIcon(AssetImage(AppImages.lock),color: Colors.green,),
                SizedBox(height: screenHeight*.01),
                
              ],),
            )

          ],),
        )
      ],),
    );
  }
}
