import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_colors.dart';

class AppDefaults {
  static const double padding8 = 8.0;
  static const double padding16 = 16.0;
  static const double padding24 = 24.0;

  static const double borderRadius = 24.0;

  static const double inputFieldRadius = 16.0;
  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDefaults.borderRadius),
      ),
      borderSide: BorderSide.none);
  static OutlineInputBorder focusedOutlineInputBorder =
      outlineInputBorder.copyWith(
    borderSide: const BorderSide(width: 2, color: AppColors.primaryClr),
  );

  static const elevation = 4.0;
}