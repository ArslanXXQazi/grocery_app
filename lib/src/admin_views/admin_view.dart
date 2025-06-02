import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery_app/src/controller/constant/linker.dart';
class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Admin Controls",
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.greenColor,
          onPressed: (){Get.toNamed(AppRoutes.signInView);},
        child: Icon(Icons.logout,color: Colors.white,),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            children:[
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                     Get.toNamed(AppRoutes.fetchDataView,
                         arguments: {
                      'category':"Fruits"
                     });
                    },
                     image: AppImages.fruits, name: "Fruits").animate().fadeIn().slide(),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments: {
                            'category':"Vegetables"
                          });
                      //Get.toNamed(AppRoutes.vegetableView);
                    },
                     image: AppImages.vegetables, name: "Vegetables").animate().fadeIn().slide(),
               ),
             ],),
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments: {
                            'category':"Beverages"
                          });
                    },
                     image: AppImages.beverages, name: "Beverages").animate().fadeIn().slide(),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments: {
                            'category':"Grocery"
                          });
                    },
                     image: AppImages.grocery, name: "Grocery").animate().fadeIn().slide(),
               ),
             ],),
             Row(
               children: [
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                        arguments:
                        {
                          'category':"EdibleOil"
                        }
                      );
                    },
                     image: AppImages.edibleOil, name: "Edible Oil").animate().fadeIn().saturate(),
               ),
               const SizedBox(width: 20),
               Expanded(
                 child: CatagoryButton(
                    ontap: ()
                    {
                      Get.toNamed(AppRoutes.fetchDataView,
                          arguments:
                          {
                            'category':"Household"
                          }
                      );
                    },
                     image: AppImages.household, name: "House hold").animate().fadeIn().slide(),
               ),
             ],),
            ]
          ),
        ),
      )
    );
  }
}
