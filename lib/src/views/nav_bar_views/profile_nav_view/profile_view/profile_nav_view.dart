import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/about_me/about_me.dart';
class ProfileNavView extends StatelessWidget {
   ProfileNavView({super.key});

  @override
  AuthController authController =Get.put(AuthController());

  UserDataController userDataController= Get.put(UserDataController());

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
          child: SingleChildScrollView(
            child: Column(children: [
              Obx((){
                return Column(children: [
                  Container(
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(AppImages.emptyImage),
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
                    text: userDataController.userName.value,
                    fontSize: 15,
                    fontWeight: FontWeight.w600 ,
                  ),
                 // SizedBox(height: screenHeight*.01),
                  BlackNormalText(
                    text: userDataController.userEmail.value,
                    fontSize: 12,
                    fontWeight: FontWeight.w400 ,
                    textColor: Colors.grey,
                  ),
                ],);
              }),
              SizedBox(height: screenHeight*.01),
              ProfileButton(
                  onTap: (){
                    String na=userDataController.userName.value;
                   Get.toNamed(AppRoutes.aboutMe,
                       arguments: {
                       "name": userDataController.userName.value,
                       "email": userDataController.userEmail.value,
                       "phone": userDataController.userPhone.value,
                       "age": userDataController.userAge.value,
                       "bankAccountName": userDataController.userAccountName.value,
                       "bankAccountNumber": userDataController.userBankAccount.value,
                       "gender":  userDataController.userGender.value,
                   });
                  },
                  text: "About Me",
                  image: AppImages.aboutMe
              ),
              ProfileButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.myOrder);
                  },
                  text: "My Orders",
                  image: AppImages.orders
              ),
              ProfileButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.favoriteNavView);
                  },
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
                  onTap: (){
                    Get.toNamed(AppRoutes.myCard);
                  },
                  text: "Credit Cards",
                  image: AppImages.credit
              ),
              ProfileButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.transactions);
                  },
                  text: "Transactions",
                  image: AppImages.transactions
              ),
              ProfileButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.notificationView);
                  },
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
                                    async{
                                      Get.delete<UserDataController>();
                                      Get.delete<AuthController>();
                                      authController.logout();
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
          ),
        )
      ],),
    );
  }
}
