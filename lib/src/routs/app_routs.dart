
import 'package:get/get.dart';
import 'package:grocery_app/src/views/auth_views/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/src/views/auth_views/sign_in_view/sign_in_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/nav_bar_view/nav_bar_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/my_address_view/my_address_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view/profile_nav_view.dart';

import '../views/auth_views/sign_up_view/sign_up_view.dart';

class AppRoutes{


  static String signInView='/signIn';
  static String signUpView='/signUp';
  static String forgotPasswordView='/forgotPasswordView';
  static String navBarView='/navBarView';
  static String profileNavView='/profileNavView';
  static String myAddressView='/myAddressView';


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
    ),

    GetPage(
        name: navBarView,
        page: ()=>NavBarView(),
    ),

    GetPage(
        name: profileNavView,
        page: ()=>ProfileNavView(),
    ),

    GetPage(
        name: myAddressView,
        page: ()=>MyAddressView(),
    ),



  ];


}