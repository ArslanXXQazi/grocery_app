import 'package:grocery_app/src/controller/constant/linker.dart';


class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

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
            text: "Order Success",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(AppImages.gear), color: Colors.black),
            ),
          ],
        ),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(image: AssetImage(AppImages.bag)),
          const SizedBox(height: 20),
          BlackNormalText(
            text: "Your order was\nsuccessful !",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          BlackNormalText(
            text: "You will get a response within\na few minutes.",
            fontSize: 15,
            fontWeight: FontWeight.w500,
            textColor: Colors.grey,
          ),


      ],),),
    );
  }
}
