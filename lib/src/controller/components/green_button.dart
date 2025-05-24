import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';

class GreenButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  double? height;
  double? width;
  double? fontSize;
  double? borderRadius;
  String? image;
  Color? color;
  Color borderColor;
  Color textColor;
  FontWeight fontWeight;

  GreenButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.color ,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.image,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ??60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffAEDC81),
              Color(0xff6CC51D),
            ]
          ),
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10), // 20 on 400 width ≈ 5%
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ImageIcon(AssetImage(image!),color: Colors.white,),
                ),
              BlackNormalText(
                text: text,
                textColor: Colors.white,
                fontSize: fontSize ?? 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RedButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  double? height;
  double? width;
  double? fontSize;
  double? borderRadius;
  String? image;
  Color? color;
  Color borderColor;
  Color textColor;
  FontWeight fontWeight;

  RedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.color ,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.image,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ??60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
              Color(0xffff8695),
              Color(0xffff001f),

              ]
          ),
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10), // 20 on 400 width ≈ 5%
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ImageIcon(AssetImage(image!),color: Colors.white,),
                ),
              BlackNormalText(
                text: text,
                textColor: Colors.white,
                fontSize: fontSize ?? 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}