import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.white,
          child: Image(image: AssetImage(AppImages.peach)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 380),
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlackNormalText(
                      text: "\$2.22",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      textColor: AppColors.greenColor,
                    ),
                    InkWell(
                      onTap: (){},
                        child: Image(image: AssetImage(AppImages.heart)))
                  ],
                ),
                BlackNormalText(
                  text: "Organic Lemons",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                  const SizedBox(height: 5),
                BlackNormalText(
                  text: "1.50 lbs",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                ),
                  const SizedBox(height: 20),
                  Row(children: [
                    BlackNormalText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    BlackNormalText(
                      text: "(89 reviews)",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      textColor: Colors.grey,
                    ),
                  ],),
                  const SizedBox(height: 20),
                  BlackNormalText(
                    text: "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.grey,
                    textAlign: TextAlign.start,
                  )

              ],),
            ),
          ),
        ),


      ],),
    );
  }
}
