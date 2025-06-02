import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/firebase_options.dart';
import 'package:grocery_app/src/routs/app_routs.dart';
import 'package:grocery_app/src/views/auth_views/sign_in_view/sign_in_view.dart';
import 'package:grocery_app/src/views/auth_views/sign_up_view/sign_up_view.dart';
import 'package:grocery_app/src/views/reviews_view/review_view.dart';
import 'package:grocery_app/src/views/starting_views/on_boarding_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // initialRoute: AppRoutes.splash,
      // getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
     home: OnBoardingView()
      //ReviewView(),
      //SignUpView()
    );
  }
}


