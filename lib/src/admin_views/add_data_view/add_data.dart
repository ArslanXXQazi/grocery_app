
import 'package:grocery_app/src/controller/constant/linker.dart';

class AddData extends StatelessWidget {
  String collection;
   AddData({super.key,required this.collection});

  AdminController adminController=Get.put(AdminController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        leading: BackButton(color: Colors.black,),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlackNormalText(
              text: "Enter Your ${collection} Data",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
           Form(
             key: formKey,
               child: Column(children: [
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.nameController,
               hintText: "${collection} Name",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Name";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.priceController,
               keyboardType: TextInputType.number,
               hintText: "${collection} Price",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Price";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
             TextFieldWidget(
               controller: adminController.quantityController,
               hintText: "${collection} Quantity",
               validator: (value){
                 if (value == null || value== "")
                 {
                   return "Enter ${collection} Quantity";
                 }
                 return null;
               },
             ),
             SizedBox(height: 20),
           ],)),
            Obx((){
              return adminController.isLoading.value==true ? Apploader2() :
                  GreenButton(onTap: (){
                    if(formKey.currentState!.validate()){
                 adminController.addVegetable(collection);
                    }
                  }, text: "Add Data");
            })
        ],),
      ),
    );
  }
}
