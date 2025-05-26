import 'package:grocery_app/src/controller/constant/linker.dart';

class UpdateDataView extends StatefulWidget {
  final String itemId;
  final String itemName;
  final String itemPrice;
  final String itemQuantity;
  final String collection;

  UpdateDataView({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.collection
  });

  @override
  State<UpdateDataView> createState() => _UpdateDataViewState();
}

class _UpdateDataViewState extends State<UpdateDataView> {
  AdminController adminController=Get.put(AdminController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adminController.quantityController.text=widget.itemQuantity;
    adminController.priceController.text=widget.itemPrice;
    adminController.nameController.text=widget.itemName;

  }

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
              text: "Update ${widget.collection} Data ",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            Form(
                key: formKey,
                child: Column(children: [
                  SizedBox(height: 20),
                  TextFieldWidget(
                    controller: adminController.nameController,
                    hintText: "Name",
                    validator: (value){
                      if (value == null || value== "")
                      {
                        return "Enter Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFieldWidget(
                    controller: adminController.priceController,
                    hintText: "Price",
                    validator: (value){
                      if (value == null || value== "")
                      {
                        return "Enter Price";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFieldWidget(
                    controller: adminController.quantityController,
                    hintText: "Quantity",
                    validator: (value){
                      if (value == null || value== "")
                      {
                        return "Enter Quantity";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                ],)),
            Obx((){
              return adminController.isLoading.value==true ? AppLoader() :
              GreenButton(onTap: (){
                if(formKey.currentState!.validate()){
                 adminController.updateData(widget.itemId, widget.collection);
                }
              }, text: "Update Data");
            })
          ],),
      ),
    );
  }
}
