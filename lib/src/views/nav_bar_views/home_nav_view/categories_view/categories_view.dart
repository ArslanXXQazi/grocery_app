import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_widgets/categories_button.dart';

class CategoriesView extends StatelessWidget {
   CategoriesView({super.key});

  final List<Map<String,dynamic>> categoriesList =
  [
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
    {"image": AppImages.vegetables,"name":"Vegetables","color": Colors.green,},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Categories",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: ImageIcon(AssetImage(AppImages.gear),color: Colors.black,))
          ],
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: .9,
          ),
          itemCount: categoriesList.length,
          itemBuilder: (context,index){
            return CategoriesButton(
              image: categoriesList[index]['image'],
              name: categoriesList[index]['name'],
              color: categoriesList[index]['color'],
            );
          }
      )
    );
  }
}
