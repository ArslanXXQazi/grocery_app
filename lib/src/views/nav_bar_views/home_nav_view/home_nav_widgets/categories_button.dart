import 'package:flutter/material.dart';

import '../../../../controller/components/black_text.dart';
import '../../../../controller/constant/App_colors.dart' show AppColors;
import '../../../../controller/constant/images.dart';

class CategoriesButton extends StatelessWidget {

  String image;
  String name;

   CategoriesButton({super.key,
     required this.image,
     required this.name
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
            backgroundColor: AppColors.greenColor.withOpacity(0.1),
            child: ImageIcon(AssetImage(AppImages.vegetables),size: 40,color: AppColors.greenColor,),
          ),
          SizedBox(height: 10),
          BlackNormalText(
            text: "Vegetables ",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textColor: Colors.grey,
          )
        ],),
    );
  }
}
