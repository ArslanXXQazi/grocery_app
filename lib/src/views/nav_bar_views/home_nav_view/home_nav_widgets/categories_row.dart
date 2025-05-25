import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:grocery_app/src/routs/app_routs.dart';

import '../../../../controller/components/black_text.dart';
import '../../../../controller/constant/images.dart';

class CategoriesRow extends StatelessWidget {

  String name;
  String image;
  VoidCallback onTap;
  Color color;

   CategoriesRow({super.key,
     required this.onTap,
     required this.name,
     required this.image,
     required this.color
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(children: [
          CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(.1),
              child: ImageIcon(AssetImage(image),color: color)
          ),
          const SizedBox(height: 5),
          BlackNormalText(
              text: name,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              textColor: Color(0xff868889)
          ),
        ],),
      ),
    );
  }
}
