import 'package:flutter/material.dart';
import 'package:to_do_app/constants/defaults.dart';
import 'package:to_do_app/constants/ghaps.dart';
import 'package:to_do_app/theme/theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.hint,
      required this.label,
      this.controller,
      this.widget});
  final String hint;
  final String label;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDefaults.padding24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Themes().titleStyle,
          ),
          gapH4,
          TextFormField(
            controller: controller,
            readOnly: widget == null ? false : true,
            decoration: InputDecoration(
              // labelText: label,
              // labelStyle: Themes().titleStyle,
              hintText: hint,
              hintStyle: Themes().subTitleStyle,
              suffixIcon: widget,
              border: AppDefaults.outlineInputBorder,
              focusedBorder: AppDefaults.focusedOutlineInputBorder,
              
            ),
          ),
        ],
      ),
    );
  }
}
