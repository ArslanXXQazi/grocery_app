
import  'package:grocery_app/src/controller/constant/linker.dart';

class ProductView extends StatelessWidget {

  String name;

  ProductView({super.key, required this.name });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Product View",
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
    );
  }
}
