import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocery_app/src/controller/components/black_text.dart';
import 'package:grocery_app/src/controller/constant/images.dart';
import 'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/routs/app_routs.dart';

class SplashView extends StatefulWidget {
  const SplashView
({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override

  UserDataController userDataController =UserDataController();

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      loginCheck();
    });
  }

  void loginCheck () async
  {
    User? user = await FirebaseAuth.instance.currentUser;
  print('======curreny manullay id fetching:${user!.uid}');
    print('-------spalsh screen ${user}');
    if (user!=null)
      {
        userDataController.getUserId();
        print('Curret id:${userDataController.userId}');
        userDataController.getUserData();
        Get.toNamed(AppRoutes.navBarView);
      }
    else
      {
        Get.offAndToNamed(AppRoutes.signInView);
      }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
          height: double.infinity,
          width: double.infinity,
          child: Image(image: AssetImage(AppImages.splash)),
         ),
         Center(
           child: Padding(
             padding: const EdgeInsets.only(top: 90),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
              BlackNormalText(
                text: "Welcome to",
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              Image(image: AssetImage('assets/images/bigcart.png')),
              BlackNormalText(
                text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textColor: Colors.grey,
              )
             ],),
           ),
         )
        ],
      ),
    );
  }
}