import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/UI/views/landing_view/landing_view.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    tr("food_love"),
    tr("Fast_Delivery"),
    tr("Live_Tracking"),
  ];
  List<String> descriptionList = [
    tr("intro0"),
    tr("intro1"),
    tr("intro2"),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenWidth(10),
        ),
        child: Column(
          children: [
            (screenWidth(5)).ph,
            SvgPicture.asset('images/intro$currentIndex.svg'),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(10), bottom: screenWidth(10)),
              child: DotsIndicator(
                dotsCount: 3,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  size: Size(10.0, 10.0),
                  color: AppColors.mainGreyColor,
                  activeColor: AppColors.mainOrangeColor,
                  activeSize: Size(screenWidth(20), screenWidth(20)),
                ),
              ),
            ),
            (screenWidth(50)).ph,
            CustomText(
              content: titleList[currentIndex],
              fontWeight: FontWeight.bold,
              colorText: AppColors.mainBlackColor,
              fontSize: screenWidth(12),
            ),
            Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
                child: CustomText(
                  content: descriptionList[currentIndex],
                  textAlign: TextAlign.center,
                )),
            (screenWidth(10)).ph,
            CustomButtonNew(
                text: currentIndex != 2 ? tr("key_next") : tr("key_finish"),
                onPressed: () {
                  if (currentIndex != 2)
                    setState(() {
                      currentIndex = currentIndex + 1;
                    });
                  else
                    Get.off(Landing_View());
                }),
          ],
        ),
      ),
    ));
  }
}
