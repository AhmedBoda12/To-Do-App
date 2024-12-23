import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/theme/app_colors.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: AppColors.primaryClr,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: AppColors.darkGreyClr,
    brightness: Brightness.dark,
  );

  TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? AppColors.white : Colors.black,
    ));
  }

  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? AppColors.white : Colors.black,
    ));
  }

  TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? AppColors.white : Colors.black,
    ));
  }

  TextStyle get subTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? AppColors.white : Colors.black,
    ));
  }

  TextStyle get bodyStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? AppColors.white : Colors.black,
    ));
  }

  TextStyle get body2Style {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
    ));
  }
}
