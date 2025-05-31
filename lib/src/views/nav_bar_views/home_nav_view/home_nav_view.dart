import  'package:grocery_app/src/controller/constant/linker.dart';


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
                    image: AppImages.oil,
                    color: Colors.blueAccent,
                  ),
                  CategoriesRow(
                    onTap: (){},
                    name: "House Hold",
                    image: AppImages.house,
                    color: Colors.pinkAccent,
                  ),
                  CategoriesRow(
                    onTap: (){},
                    name: "Baby care",
                    image: AppImages.babyCare,
                    color: Colors.blueAccent,
                  ),
                ],),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             AddCartWidget(addChartOnTap: (){},
                 image: AppImages.pineapple,
                 name: "Pine Apple",
                 price: "212",
                 quantity: "kg"),
             AddCartWidget(
                 addChartOnTap: (){},
                 image: AppImages.fruits,
                 name: "Apple",
                 price: "22",
                 quantity: "kg34"),
           ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                    onTap:  (){},
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
                              child: Image(image: AssetImage(AppImages.grapes)),
                            ),
                            // Image(image: AssetImage(image),width: 60,),
                            BlackNormalText(
                              text: "\$23",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              textColor: Colors.green,
                            ),
                            BlackNormalText(
                              text: "Grapes",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            BlackNormalText(
                              text: "20 KG",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            const SizedBox(height: 10),
                            Divider(),
                            const SizedBox(height: 10),
                            Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.remove,color: AppColors.greenColor,)),
                                BlackNormalText(text: "1",),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.add,color: AppColors.greenColor,))
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
                ),
                AddCartWidget(addChartOnTap: (){},
                    image: AppImages.pineapple,
                    name: "Pine Apple",
                    price: "212",
                    quantity: "kg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddCartWidget(addChartOnTap: (){},
                    image: AppImages.pineapple,
                    name: "Pine Apple",
                    price: "212",
                    quantity: "kg"),
                AddCartWidget(
                    addChartOnTap: (){},
                    image: AppImages.fruits,
                    name: "Apple",
                    price: "22",
                    quantity: "kg34"),
              ],),

          ],),
        ),
      ),
    );
  }
}
