import 'package:flutter/material.dart';

import '../../controller/components/black_text.dart';
import '../../controller/constant/App_colors.dart' show AppColors;

class VegetablesView extends StatelessWidget {
  const VegetablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        centerTitle: true,
        title: BlackNormalText(
          text: "Vegetables",
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
