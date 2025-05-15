import 'package:flutter/material.dart';

import '../constant/images.dart';
import 'black_text.dart';
class ProfileButton extends StatelessWidget {

   VoidCallback onTap;
   String text;
   String image;

   ProfileButton({super.key,
     required this.onTap,
     required this.text,
     required this.image,
   });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight*.015),
        child: Row(children: [
          ImageIcon(AssetImage(image),color: Color(0xff28B446),),
          SizedBox(width: screenWidth*.02),
          BlackNormalText(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w600 ,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey),

        ],),
      ),
    );
  }
}
