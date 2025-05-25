
import 'package:get/get.dart';
import 'package:grocery_app/src/admin_views/admin_view.dart';
import 'package:grocery_app/src/admin_views/add_data_view/add_data.dart';
import 'package:grocery_app/src/admin_views/fetchdata.dart';
import 'package:grocery_app/src/admin_views/update_data_view/update_data_view.dart';
import 'package:grocery_app/src/views/auth_views/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/src/views/auth_views/sign_in_view/sign_in_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/product_detail_view/product_detail_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/nav_bar_view/nav_bar_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/my_address_view/my_address_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view/profile_nav_view.dart';
import 'package:grocery_app/src/views/starting_views/splash_view.dart';

import '../views/auth_views/sign_up_view/sign_up_view.dart';

class AppRoutes{

static String   splash ='/';
  static String signInView='/signIn';
  static String signUpView='/signUp';
  static String forgotPasswordView='/forgotPasswordView';
  static String navBarView='/navBarView';
  static String profileNavView='/profileNavView';
  static String myAddressView='/myAddressView';
  static String adminView='/adminView';
  static String addData='/addData';
  static String updateDataView='/updateData';
  static String fetchDataView='/fetchData';
  static String homeNavView='/homeNav';
  static String productDetailView='/product';


  static final routes=
  [

 GetPage(
        name: splash,
        page: ()=>SplashView(),
    ),

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

    GetPage(
        name: adminView,
        page: ()=>AdminView(),
    ),

    GetPage(
      name: addData,
     page: (){
       final arguments = Get.arguments as Map<String, dynamic>?;
       return AddData(collection: arguments?['collection']);
     }
    ),

    GetPage(
      name: fetchDataView,
      page: (){
        final arguments= Get.arguments as Map<String,dynamic>?;
        return FetchData(
            category: arguments?['category']??'');

      }),

    GetPage(
      name: updateDataView,
      page: () {
        // Retrieve parameters from Get.arguments
        final arguments = Get.arguments as Map<String, dynamic>?;
        return
          UpdateDataView(
            itemId: arguments?['id'] ?? '',
            itemName: arguments?['name'] ?? '',
            itemPrice: arguments?['price'] ?? '',
            itemQuantity: arguments?['quantity'] ?? '',
            collection: arguments?['collection'] ?? '',
          );
      },),

    GetPage(
       name: homeNavView,
       page: ()=>HomeNavView()
   ),

    GetPage(
        name: productDetailView,
        page: (){
          final arguments = Get.arguments as Map<String,dynamic>?;
          return ProductDetailView(
              image: arguments?['image'],
              name: arguments?['name']??"",
              price: arguments?['price']??"",
              quantity: arguments?['quantity'],
          );
        }
    )
  ];
}