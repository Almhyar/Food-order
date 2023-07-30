import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.Obscure,
    this.contentPaddingLeft,
    this.contentPaddingRight,
    this.contentPaddingTop,
    this.contentPaddingBottom,
    this.textAlign,
    this.textSize,
    this.circularSize,
    this.typeInput,
    this.validator,
    this.prefixIcon,
  });
  final String hintText;
  final TextEditingController controller;
  final bool? Obscure;
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? contentPaddingTop;
  final double? contentPaddingBottom;
  final TextAlign? textAlign;
  final double? textSize;
  final double? circularSize;
  final TextInputType? typeInput;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      keyboardType: widget.typeInput ?? TextInputType.text,
      textAlign: widget.textAlign ?? TextAlign.start,
      obscureText: widget.Obscure ?? false,
      controller: widget.controller,
      style: TextStyle(
        fontSize: widget.textSize ?? screenWidth(25),
        color: AppColors.mainBlackColor,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          errorStyle: TextStyle(color: AppColors.mainOrangeColor),
          fillColor: AppColors.mainGrey2Color,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.mainGreyColor,
          ),
          contentPadding: EdgeInsetsDirectional.only(
              start: widget.contentPaddingLeft ?? 0,
              end: widget.contentPaddingRight ?? 0,
              top: widget.contentPaddingTop ?? 0,
              bottom: widget.contentPaddingBottom ?? 0),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.circularSize ?? screenWidth(10))))),
    );
  }
}
