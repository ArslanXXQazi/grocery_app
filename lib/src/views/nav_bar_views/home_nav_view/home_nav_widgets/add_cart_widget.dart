import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/routs/app_routs.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/product_detail_view/product_detail_view.dart';
import '../../../../controller/components/black_text.dart';
import '../../../../controller/constant/App_colors.dart';
import '../../../../controller/constant/images.dart';

class AddCartWidget extends StatelessWidget {
  String image;
  String name;
  String price;
  String quantity;
  VoidCallback addChartOnTap;
   AddCartWidget({super.key,
     required this.addChartOnTap,
     required this.image,
     required this.name,
     required this.price,
     required this.quantity,

   });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        GestureDetector(
         onTap: (){
           Get.toNamed(AppRoutes.productDetailView,arguments: {
             'image': image,
             'name':name,
             'price':price,
             'quantity':quantity,
           });
         },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 181,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Image(image: AssetImage(image),fit: BoxFit.contain,),
                ),
               // Image(image: AssetImage(image),width: 60,),
                BlackNormalText(
                  text: "\$$price",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  textColor: Colors.green,
                ),
                BlackNormalText(
                  text: name,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                BlackNormalText(
                  text: quantity,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                const SizedBox(height: 10),
                Divider(),
                const SizedBox(height: 10),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage(AppImages.shopingBag),color: AppColors.greenColor,),
                      const SizedBox(width: 5),
                      BlackNormalText(
                        onTap: addChartOnTap,
                        text: "Add to cart",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )
                    ],),
                )

              ],),

          ),
        ),
        Positioned(
          left: 130,
          child: IconButton(
              onPressed: (){},
              icon: ImageIcon(AssetImage(AppImages.heart),)),
        )
      ],
    );
  }
}
