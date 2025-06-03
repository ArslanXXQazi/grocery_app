import 'package:grocery_app/src/controller/constant/linker.dart';

class ProfileNavController extends GetxController
{

  UserDataController userDataController = Get.put(UserDataController());
  var isLoading=false.obs;
  var groupValue=''.obs;

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

  // update
  updateData()async{
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


}
