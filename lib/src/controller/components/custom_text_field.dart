import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/src/views/auth_views/password_field_controller/password_field_controller.dart';

import '../constant/images.dart';


PasswordFieldController passwordFieldController=Get.put(PasswordFieldController());

class TextFieldWidget extends StatelessWidget {



  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? maxLine;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;


  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.maxLength,
    this.maxLine,
    this.textColor,
    this.borderColor,
    this.focusBorderColor,
    this.hintColor,
    this.fillColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: passwordFieldController.isPasswordVisible.value,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          maxLength: maxLength,
          maxLines: maxLine,
          style: TextStyle(
            color: textColor ?? Colors.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor ?? Colors.grey,
            ),
            // contentPadding: EdgeInsets.symmetric(
            //   horizontal: screenWidth * 0.04,
            //   vertical:
            //   isPortrait ? screenHeight * 0.015 : screenHeight * 0.025,
            // ),
            filled: true,
            fillColor: fillColor?? Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor ?? Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor ?? Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: focusBorderColor ?? Colors.white),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            errorStyle: TextStyle(
              color: Colors.red,
              // fontSize: ResponsiveBreakpoints.getResponsiveValue(
              //   context: context,
              //   mobile: 12.0,
              //   tablet: 14.0,
              //   desktop: 16.0,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

// Country select karne ke liye widget bana raha hoon
class CountryFieldWidget extends StatelessWidget {
  final List<String> countries;
  final String? selectedCountry;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;

  const CountryFieldWidget({
    Key? key,
    required this.countries,
    this.selectedCountry,
    this.onChanged,
    this.hintText = 'Country',
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return DropdownButtonFormField<String>(
      value: selectedCountry,
      items: countries.map((country) => DropdownMenuItem(
        value: country,
        child: Text(country),
      )).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: ImageIcon(AssetImage(AppImages.country),color: Colors.grey,size: 20,),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: isPortrait ? screenHeight * 0.015 : screenHeight * 0.025,
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: focusBorderColor ?? Colors.white),
        ),
      ),
    );
  }
}