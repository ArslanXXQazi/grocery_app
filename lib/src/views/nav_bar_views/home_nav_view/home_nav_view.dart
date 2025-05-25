import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/routs/app_routs.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_widgets/add_cart_widget.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_widgets/categories_row.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_widgets/special_offer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeNavView extends StatelessWidget {
   HomeNavView({super.key});
TextEditingController searchController=TextEditingController();
   PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFieldWidget(
                controller: searchController,
                hintText: "Search keywords..",
                prefixIcon: ImageIcon(AssetImage(AppImages.search)),
                suffixIcon: ImageIcon( AssetImage(AppImages.gear)),
            ),
            const SizedBox(height: 10),
          Container(
            height: 283,
            width: double.infinity,
            child: Stack(children: [
              PageView(
                controller: pageController,
                children: [
                  SpecialOffer(
                      image: AppImages.specail1,
                      text: "20% off on your \nfirst purchase"
                  ),
                  SpecialOffer(
                      image: AppImages.splash,
                      text: "20% off on your \nfirst purchase"
                  ),
                  SpecialOffer(
                      image: AppImages.splash,
                      text: "20% off on your \nfirst purchase"
                  ),
                  SpecialOffer(
                      image: AppImages.specail1,
                      text: "20% off on your \nfirst purchase"
                  ),
                ],),
              Positioned(
                top: 250,left: 40,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  effect: ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      activeDotColor: Colors.green,
                      dotColor: Colors.white
                  ),
                ),
              ),
            ],),
          ),

          const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              BlackNormalText(
                text: "Categories",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.categoriesView);
                },
                  child: Icon(Icons.arrow_forward_ios_outlined)),
            ],),

            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                CategoriesRow(
                    onTap: (){},
                    name: "Vegetables",
                    image: AppImages.vegetables,
                    color: Colors.green
                ),
                CategoriesRow(
                    onTap: (){},
                    name: "Beverages",
                    image: AppImages.beverages,
                    color: Colors.orange
                ),
                CategoriesRow(
                    onTap: (){},
                    name: "Fruits",
                    image: AppImages.fruits,
                    color: Colors.red
                ),
                CategoriesRow(
                    onTap: (){},
                    name: "Grocery",
                    image: AppImages.grocery,
                    color: Colors.purple
                ),
                CategoriesRow(
                    onTap: (){},
                    name: "Edible oil",
                    image: AppImages.edibleOil,
                    color: Colors.blueAccent,
                ),
                CategoriesRow(
                    onTap: (){},
                    name: "House Hold",
                    image: AppImages.household,
                    color: Colors.pinkAccent,
                ),
              ],),
            ),

            const SizedBox(height: 20),
           Row(children: [
             AddCartWidget(addChartOnTap: (){},
                 image: AppImages.pineapple,
                 name: "Pine Apple",
                 price: "212",
                 quantity: "kg"),
             SizedBox(width: 5,),
             AddCartWidget(
                 addChartOnTap: (){},
                 image: AppImages.fruits,
                 name: "Apple",
                 price: "22",
                 quantity: "kg34"),
           ],)








          ],),
        ),
      ),
    );
  }
}
