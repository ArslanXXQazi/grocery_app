import 'package:grocery_app/src/controller/constant/linker.dart';

class ProfileNavController extends GetxController
{

  UserDataController userDataController = Get.put(UserDataController());
  var isLoading=false.obs;
  var groupValue=''.obs;
  var selectedCountry = RxString('');
  var isDefault = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController userBankAccountController = TextEditingController();
  final TextEditingController userBankAccountNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipController = TextEditingController();


  // update data function
  updateData()async
  {
    try {
      isLoading.value = true;
      userDataController.getUserId();
      await FirebaseFirestore.instance.collection("userData").doc(
          userDataController.userId.value).update({
        'userId':userDataController.userId.value,
        'userName':nameController.text,
        'userEmail':emailController.text.trim(),
        'userAge': ageController.text,
        'userPhone': phoneController.text,
        'userImage': "",
        'userBankAccount':userBankAccountController.text,
        'userAccountName': userBankAccountNameController.text,
        'userGender': groupValue.value,
      });
      userDataController.getUserData();
      NotificationMessage.show(
        title: "Success",
        description: "Data Updated Successfully",
      );
      isLoading.value = false;

    }
    catch (e) {
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red
      );
      isLoading.value = false;
     print('${e.toString()} EEEEEEEEEEEEEERRRRRRRRRRRTTTTTTTTTTTTTTT____________');

    }
    userDataController.getUserData();
  }

  // add address function

 void addUserAddress () async
 {

   String id=DateTime.now().microsecondsSinceEpoch.milliseconds.toString();

   try
   {
     isLoading.value=true;
     await FirebaseFirestore.instance.collection('userAddress').doc(id).set({
       'userId':userDataController.userId.value,
       'userCountry': selectedCountry.value,
       'userName': nameController.text,
       'userCity': cityController.text,
       'zipCode': zipController.text,
       'userPhone': phoneController.text,
       'userAddress':addressController.text,
       'userEmail':emailController.text,
     });

     NotificationMessage.show(
       title: "Success",
       description: "Address Added Successfully",
     );
     isLoading.value = false;


   }
   catch(e)
   {
     NotificationMessage.show(
         title: "Error",
         description: e.toString(),
         backGroundColor: Colors.red
     );
     isLoading.value = false;
     print('${e.toString()} EEEEEEEEEEEEEERRRRRRRRRRRTTTTTTTTTTTTTTT____________');
   }

 }


}
