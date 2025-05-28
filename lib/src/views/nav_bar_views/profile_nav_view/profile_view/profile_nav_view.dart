
import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/about_me/about_me.dart';
class ProfileNavView extends StatelessWidget {
   ProfileNavView({super.key});

  @override
  AuthController authController =Get.put(AuthController());
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      body: Stack(children: [
        Container(
          height: screenHeight*.2,
          width: double.infinity,
          color: Colors.white,
        ),
        Padding(
          padding:  EdgeInsets.only(top: screenHeight*.12,left: screenWidth*.04,right: screenWidth*.04),
          child: Column(children: [
            Container(
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                    ),
                  ),
                  Positioned(
                    left: screenWidth*.54,top: screenHeight*.095,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xff28B446),
                      child: Center(child: IconButton(
                        onPressed: (){},
                        icon: ImageIcon(AssetImage(AppImages.camera,),color: Colors.white,),
                    ),
                  )))
                ],
              ),
            ),
            SizedBox(height: screenHeight*.01),
            BlackNormalText(
              text: "Olivia Austin",
              fontSize: 15,
              fontWeight: FontWeight.w600 ,
            ),
            SizedBox(height: screenHeight*.01),
            BlackNormalText(
              text: "oliviaaustin@gmail.com",
              fontSize: 12,
              fontWeight: FontWeight.w400 ,
              textColor: Colors.grey,
            ),
            SizedBox(height: screenHeight*.01),
            ProfileButton(
                onTap: (){
                  Get.to(AboutMe());
                },
                text: "About Me",
                image: AppImages.aboutMe
            ),
            ProfileButton(
                onTap: (){},
                text: "My Orders",
                image: AppImages.orders
            ),
            ProfileButton(
                onTap: (){},
                text: "My Favorites",
                image: AppImages.favorites
            ),
            ProfileButton(
                onTap: (){
                  Get.toNamed(AppRoutes.myAddressView);
                },
                text: "My Address",
                image: AppImages.location
            ),
            ProfileButton(
                onTap: (){},
                text: "Credit Cards",
                image: AppImages.credit
            ),
            ProfileButton(
                onTap: (){},
                text: "Transactions",
                image: AppImages.transactions
            ),
            ProfileButton(
                onTap: (){},
                text: "Notifications",
                image: AppImages.notification
            ),
            ProfileButton(
                onTap: (){
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: AppColors.greyColor,
                        title: BlackNormalText(
                          text: "Logout?",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          textColor: Colors.red,
                        ),
                        content: BlackNormalText(
                          text: "Are you sure you want to logout?",
                          fontSize: 16,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: RedButton(
                                  onTap: ()
                                  {
                                    //authController.logout();
                                  },
                                  text: "Logout",
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: GreenButton(
                                  onTap: () {
                                 Get.back();
                                  },
                                  text: "Go Back",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                text: "Sign out",
                image: AppImages.signOut
            ),


          ],),
        )
      ],),
    );
  }
}
