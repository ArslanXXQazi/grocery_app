import 'package:grocery_app/src/controller/components/dismissible_widget.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';
class CartNavView extends StatelessWidget {
  const CartNavView({super.key});

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
            text: "Shopping Cart",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          const SizedBox(height: 20),
         DismissibleWidget(
             addOnTap: (){},
             removeOnTap: (){},
             image: AppImages.pineapple,
             name: "Pine Apple",
             price: "\$43",
             quantity: "50 KG"),
          DismissibleWidget(
              addOnTap: (){},
              removeOnTap: (){},
              image: AppImages.pineapple,
              name: "Pine Apple",
              price: "\$43",
              quantity: "50 KG"),
          DismissibleWidget(
              addOnTap: (){},
              removeOnTap: (){},
              image: AppImages.pineapple,
              name: "Pine Apple",
              price: "\$43",
              quantity: "50 KG"),
          DismissibleWidget(
              addOnTap: (){},
              removeOnTap: (){},
              image: AppImages.pineapple,
              name: "Pine Apple",
              price: "\$43",
              quantity: "50 KG"),

        ],),
      ),
    );
  }
}
