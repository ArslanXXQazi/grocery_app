import 'package:flutter/material.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_nav_controller/profile_nav_controller.dart';

class AboutMe extends StatefulWidget {

  String name;
  String email;
  String phone;
  String age;
  String bankAccountName;
  String bankAccountNumber;
  String gender;

   AboutMe({super.key,

     required this.name,
     required this.email,
     required this.phone,
     required this.age,
     required this.bankAccountName,
     required this.bankAccountNumber,
     required this.gender,

   });

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
   ProfileNavController profileNavController=Get.put(ProfileNavController());
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileNavController.nameController.text=widget.name;
    profileNavController.emailController.text=widget.email;
    profileNavController.phoneController.text=widget.phone;
    profileNavController.ageController.text=widget.age;
    profileNavController.userBankAccountNameController.text=widget.bankAccountName;
    profileNavController.userBankAccountController.text=widget.bankAccountNumber;
    profileNavController.genderController.text=widget.gender;
  }
//String groupValue='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BlackNormalText(
          text: 'About Me',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textColor: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackNormalText(
              text: 'Personal Details',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.nameController,
              hintText: 'Name',
              prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.emailController,
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.phoneController,
              hintText: 'Phone',
              prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.ageController,
              hintText: 'user age',
              prefixIcon: Icon(Icons.person_2_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.userBankAccountController,
              hintText: 'userBankAccount',
              prefixIcon: Icon(Icons.account_balance, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: profileNavController.userBankAccountNameController,
              hintText: 'userBankAccountName',
              prefixIcon: Icon(Icons.apartment_outlined, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            BlackNormalText(
              text: 'Select Gender',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          Obx((){
            return  Row(children: [
              Row(children: [
                Text('Male:'),
                Radio(
                    value: 'male',
                    groupValue: profileNavController.groupValue.value,
                    onChanged: (value){
                      profileNavController.groupValue.value =value.toString();
                    }),
              ],),
              Row(children: [
                Text('female:'),
                Radio(
                    value: 'female',
                    groupValue: profileNavController.groupValue.value,
                    onChanged: (value){
                      profileNavController.groupValue.value =value.toString();
                    }),
              ],),
              Row(children: [
                Text('other:'),
                Radio(
                    value: 'other',
                    groupValue: profileNavController.groupValue.value,
                    onChanged: (value){
                      profileNavController.groupValue.value =value.toString();
                    }),
              ],),
            ],);
          }),
            // TextFieldWidget(
            //   controller: profileNavController.genderController,
            //   hintText: 'gender',
            //   prefixIcon: Icon(Icons.transgender, color: Colors.grey[600]),
            // ),
            const SizedBox(height: 30),
            Obx((){
             return profileNavController.isLoading.value ? Apploader2():
             GreenButton(
               onTap: () {
                 profileNavController.updateData();
               },
               text: 'Save settings',
             );
           })
          ],
        ),
      ),
    );
  }
}
