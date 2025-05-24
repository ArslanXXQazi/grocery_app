import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_widgets/categories_button.dart';
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

          const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              BlackNormalText(
                text: "Categories",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.grey,),
              )
            ],),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CategoriesButton(
                  onTap: (){},
                  name: "Vegetables",
                  image: AppImages.vegetables,
                  color: Colors.green
              ),
              CategoriesButton(
                  onTap: (){},
                  name: "Beverages",
                  image: AppImages.beverages,
                  color: Colors.orange
              ),
              CategoriesButton(
                  onTap: (){},
                  name: "Fruits",
                  image: AppImages.fruits,
                  color: Colors.red
              ),
              CategoriesButton(
                  onTap: (){},
                  name: "Grocery",
                  image: AppImages.grocery,
                  color: Colors.purple
              ),
              CategoriesButton(
                  onTap: (){},
                  name: "Edible oil",
                  image: AppImages.edibleOil,
                  color: Colors.blueAccent,
              ),
            ],),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: 181,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Image(image: AssetImage(AppImages.pineapple)),
                  BlackNormalText(
                    text: "\$price",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    textColor: Colors.green,
                  ),
                  BlackNormalText(
                    text: "name",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  BlackNormalText(
                    text: "kg",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  const SizedBox(height: 20),
                  Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ImageIcon(AssetImage(AppImages.gear),color: AppColors.greenColor,),
                    const SizedBox(width: 10),
                    BlackNormalText(
                      text: "Add to cart",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )

                  ],)

                ],),

            )






          ],),
        ),
      ),
    );
  }
}
