import 'package:flutter/material.dart';

import '../../controller/components/black_text.dart';
import '../../controller/constant/images.dart';

class CatagoryButton extends StatelessWidget {

  String image;
  String name;
  VoidCallback ontap;

   CatagoryButton({super.key,
     required this.ontap,
     required this.image,
     required this.name,


   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:Center(child:Column(children:[
            Image(image: AssetImage(image),width: 80,),
            SizedBox(height: 15),
            BlackNormalText(
              text: name,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )
          ]))
      ),
    );
  }
}
