import 'package:flutter/material.dart';

import '../constant/images.dart';
import 'black_text.dart';
class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight*.015),
        child: Row(children: [
          ImageIcon(AssetImage(AppImages.lock),color: Colors.green,),
          SizedBox(width: screenWidth*.02),
          BlackNormalText(
            text: "About Me",
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
