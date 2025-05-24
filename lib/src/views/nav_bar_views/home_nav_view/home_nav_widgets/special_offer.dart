import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controller/components/black_text.dart';
import '../../../../controller/constant/images.dart';

class SpecialOffer extends StatelessWidget {
  String image;
  String text;
   SpecialOffer({super.key,
     required this.image,
     required this.text
   });



  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Image(image: AssetImage(image),fit: BoxFit.cover,),
        ),
        Positioned(
          top: 150,left: 40,
          child: BlackNormalText(
            text: text,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
