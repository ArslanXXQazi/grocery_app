import 'package:flutter/material.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/controller/components/custom_text_field.dart';
import 'package:grocery_app/src/controller/components/green_button.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
              controller: _nameController,
              hintText: 'Russell Austin',
              prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: _emailController,
              hintText: 'russell.partner@gmail.com',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: _phoneController,
              hintText: '+1 202 555 0142',
              prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),
            BlackNormalText(
              text: 'Change Password',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: _currentPasswordController,
              hintText: 'Current password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
              isPassword: true,
            ),
            const SizedBox(height: 15),
            TextFieldWidget(
              controller: _newPasswordController,
              hintText: 'Enter new password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
              isPassword: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
             const SizedBox(height: 15),
            TextFieldWidget(
              controller: _confirmPasswordController,
              hintText: 'Confirm password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
              isPassword: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                   _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                 onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            GreenButton(
              onTap: () {
                // TODO: Implement save settings logic
              },
              text: 'Save settings',
            ),
          ],
        ),
      ),
    );
  }
}
