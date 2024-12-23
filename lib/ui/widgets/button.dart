import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label, required this.tap});
  final String label;
  final void Function() tap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: tap,
      style: FilledButton.styleFrom(
        minimumSize: Size(150, 50),
        backgroundColor: AppColors.primaryClr,
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
