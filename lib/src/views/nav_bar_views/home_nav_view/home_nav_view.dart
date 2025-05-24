import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/constant/App_colors.dart';
import 'package:grocery_app/src/controller/constant/images.dart';

class HomeNavView extends StatelessWidget {
   HomeNavView({super.key});
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Column(children: [
          TextFieldWidget(
              controller: searchController,
              hintText: "Search keywords..",
              prefixIcon: ImageIcon(AssetImage(AppImages.search)),
              suffixIcon: ImageIcon( AssetImage(AppImages.gear)),
          ),
        ],),
      ),
    );
  }
}
