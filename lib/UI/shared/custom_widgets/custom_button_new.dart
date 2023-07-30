import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';

class CustomButtonNew extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFontWight;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final String? svgName;
  final Color? colorSvg;
  final double? widthButton;
  final double? heightButton;

  const CustomButtonNew({
    super.key,
    required this.text,
    this.textColor,
    this.textSize,
    this.textFontWight,
    this.borderColor,
    this.backgroundColor,
    required this.onPressed,
    this.svgName,
    this.colorSvg,
    this.widthButton,
    this.heightButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
        shape: StadiumBorder(),
        side: borderColor != null
            ? BorderSide(
                width: 1, color: borderColor ?? AppColors.mainOrangeColor)
            : null,
        fixedSize: Size(
            screenWidth(widthButton ?? 1.2), screenWidth(heightButton ?? 7)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgName != null) ...[
            Container(
                width: screenWidth(10),
                child: SvgPicture.asset(
                  'images/$svgName.svg',
                  color: colorSvg ?? null,
                )),
            SizedBox(
              width: screenWidth(15),
            )
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColors.mainWhiteColor,
              fontSize: textSize ?? screenWidth(22),
              fontWeight: textFontWight ?? FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
