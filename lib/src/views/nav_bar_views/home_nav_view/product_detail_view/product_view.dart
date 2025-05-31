
import  'package:grocery_app/src/controller/constant/linker.dart';

class ProductView extends StatelessWidget {

  String name;

  ProductView({super.key, required this.name });

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
            text: name,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
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
