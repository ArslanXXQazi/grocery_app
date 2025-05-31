import  'package:grocery_app/src/controller/constant/linker.dart';


class AuthController extends GetxController {

  var isLoading = false.obs;
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
  UserDataController userDataController = Get.put(UserDataController());


  void signIn() async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      userDataController.getUserId();
      print('usr id in signin method of auth controlle:====${userDataController.userId}');
      isLoading.value = false;
          clear();
      Get.offAndToNamed(AppRoutes.navBarView);
    }
    catch (e) {
      isLoading.value = false;
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void signUp() async
  {
    try {
      isLoading.value = true;
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
     userData();
      clear();
      isLoading.value = false;
      NotificationMessage.show(
        title: "Success",
        description: "Account Created Successfully",
      );
      Get.offAndToNamed(AppRoutes.navBarView);
    }
    catch (e) {
      isLoading.value = false;
      NotificationMessage.show(
        title: "Error",
        description: e.toString(),
        backGroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void userData() async
  {
    try {
      isLoading.value = true;
      print('----------user data function calling-------------------------:::::34342423423423423423');
      userDataController.getUserId();
      print('----------user id:${userDataController.userId}');
      await FirebaseFirestore.instance.collection("userData").doc(
          userDataController.userId.value).set({
        'userId':userDataController.userId.value,
        'userName': nameController.text,
        'userEmail': emailController.text.trim(),
        'userAge': ageController.text,
        'userPhone': phoneController.text,
        'userImage': "",
        'userBankAccount': userBankAccountController.text,
        'userAccountName': userBankAccountNameController.text,
        'userGender': genderController.text,
      });
      userDataController.getUserData();
      //sadduserAddressData();
      clear();
      NotificationMessage.show(
        title: "Success",
        description: "Data Updated Successfully",
      );
      isLoading.value = false;
    }
    catch (e) {
      print('Error:${e.toString()}');

    }
  }

  // update
  updateData()async{

    userDataController.getUserData();

  }


  void adduserAddressData() async
  {
    try {
      String id = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      await FirebaseFirestore.instance.collection("userAddresses").doc(id).set({
        'userId':userDataController.userId,
        'userCountry': '',
        'userProvince': '',
        'userCity': '',
        'zipCode': '',
        'userPhone': '',
        'userAddress':'',
      });
      clear();
    }
    catch (e) {
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.signInView);
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: $e');
    }
  }

 void clear() {
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    nameController.clear();
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    ageController.clear();
    userBankAccountController.clear();
    userBankAccountNameController.clear();
    genderController.clear();
  }


}