import  'package:grocery_app/src/controller/constant/linker.dart';



class AdminController extends GetxController
{

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  var isLoading= false.obs;



  //===========================>> Fruit Data Insert
  void addFruit( String collection) async
  {
    try
    {
      isLoading.value=true;
      String id=DateTime.now().microsecond.toString();
      await FirebaseFirestore.instance.collection(collection).doc(id).set({
        'id':id,
        'name':nameController.text,
        'quantity':quantityController.text,
        'price':priceController.text,
        'enable':'1',
        'url':''
      });
      isLoading.value=false;
      Get.back();
      clear();
      NotificationMessage.show(
        title: "Success",
        description: "Data Added Successfully",
      );
    }
    catch(e)
    {
      isLoading.value=false;
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  //===========================>> Vegetables Data Insert
  void addVegetable(String collection) async
  {
    try
    {
      isLoading.value=true;
      String id=DateTime.now().microsecond.toString();
      await FirebaseFirestore.instance.collection(collection).doc(id).set({
        'id':id,
        'name':nameController.text,
        'quantity':quantityController.text,
        'price':priceController.text,
        'enable':'1',
        'url':''
      });
      isLoading.value=false;
      Get.back();
      clear();
      NotificationMessage.show(
        title: "Success",
        description: "Data Added Successfully",
      );
    }
    catch(e)
    {
      isLoading.value=false;
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }




  void updateData(String id, String collection) async {
    try {
      isLoading.value = true;
      Map<String, dynamic> updateData = {
        'name':nameController.text,
        'quantity': quantityController.text,
        'price': priceController.text,
      };
      await FirebaseFirestore.instance.collection(collection).doc(id).update(updateData);
      isLoading.value = false;
      Get.back();
      clear();
      NotificationMessage.show(
        title: "Success",
        description: "Data Updated Successfully",
      );
    } catch (e) {
      isLoading.value = false;
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }






  //===========================>> Delete Data

  void deleteData( String id,String collection ) async
  {
    Get.back();
   await FirebaseFirestore.instance.collection(collection).doc(id).delete();
  }


//===========================>> Clear Fields

void clear()
{
  nameController.clear();
  priceController.clear();
  quantityController.clear();
}


}