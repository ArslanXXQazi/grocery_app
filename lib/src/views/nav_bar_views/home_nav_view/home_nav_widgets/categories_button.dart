import 'package:flutter/material.dart';

import '../../../../controller/components/black_text.dart';
import '../../../../controller/constant/App_colors.dart' show AppColors;
import '../../../../controller/constant/images.dart';

class CategoriesButton extends StatelessWidget {

  String image;
  String name;
  Color color;

   CategoriesButton({super.key,
     required this.image,
     required this.name,
     required this.color,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: 120,
      color: Color(0xffFFFBFB),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: color.withOpacity(0.1),
            child: ImageIcon(AssetImage(image),size: 40,color: color,),
          ),
          SizedBox(height: 10),
          BlackNormalText(
            text: name,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textColor: Colors.grey,
          )
        ],),
    );
  }
}
