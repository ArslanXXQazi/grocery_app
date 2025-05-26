

class PasswordFieldController extends GetxController {
  // Reactive boolean for password visibility
  var isPasswordVisible = false.obs;

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}