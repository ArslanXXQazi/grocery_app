
import 'package:get/get.dart';
import 'package:grocery_app/src/views/auth_views/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/src/views/auth_views/sign_in_view/sign_in_view.dart';

import '../views/auth_views/sign_up_view/sign_up_view.dart';

class AppRoutes{


  static String signInView='/signIn';
  static String signUpView='/signUp';
  static String forgotPasswordView='/forgotPasswordView';


  static final routes=
  [

    GetPage(
        name: signInView,
        page: ()=>SignInView()
    ),

    GetPage(
        name: signUpView,
        page: ()=>SignUpView(),
    ),

    GetPage(
        name: forgotPasswordView,
        page: ()=>ForgotPasswordView(),
    )

  ];


}