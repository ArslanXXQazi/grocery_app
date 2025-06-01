
import 'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/cart_nav_view/cart_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/favorite_nav_view/favorite_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/product_detail_view/product_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/add_credit_card/add_credit_card.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/credit_card_view/credit_card_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/my_address_view/add_address_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/my_order_view/my_order_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/notification_view/notification_view.dart';

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
  static String categoriesView='/categories';
  static String productView='/productView';
  static String shoppingCart='/shoppingCart';
  static String favoriteNavView='/favoriteNavView';
  static String myCard='/myCard';
  static String addCreditCard='/addCreditCard';
  static String addAddress='/addAddress';
  static String notificationView='/notificationView';
  static String myOrder='/myOrder';


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
    ),

    GetPage(
        name: categoriesView,
        page: ()=>CategoriesView()
    ),

    GetPage(
        name: productView,
        page: (){
          final arguments=Get.arguments as Map<String,dynamic>?;
          return ProductView(name: arguments?['name']??'');
        }
    ),

    GetPage(
        name: shoppingCart,
        page: ()=>CartNavView()
    ),

    GetPage(
        name: favoriteNavView,
        page: ()=>FavoriteNavView()
    ),

    GetPage(
        name: myCard,
        page: ()=>CreditCardView()
    ),

    GetPage(
        name:addCreditCard,
        page: ()=>AddCreditCard()
    ),

    GetPage(
        name:addAddress,
        page: ()=>AddAddressView()
    ),

    GetPage(
        name:notificationView,
        page: ()=>NotificationView()
    ),

    GetPage(
        name:myOrder,
        page: ()=>MyOrderView()
    ),



  ];
}