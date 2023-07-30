import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.colorText,
      this.fontSize,
      this.fontWeight,
      this.decoration,
      this.decorationThickness});
  final VoidCallback onPressed;
  final String text;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? decorationThickness;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: colorText ?? AppColors.mainGreyColor,
            fontSize: fontSize ?? screenWidth(27),
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: decoration ?? TextDecoration.none,
            decorationThickness: decorationThickness ?? 0,
          ),
        ));
  }
}
