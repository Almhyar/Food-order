import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/Background icons.svg',
              fit: BoxFit.cover,
            ),
            Center(
              child: SvgPicture.asset('assets/images/Logo.svg'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(1)),
              child: SpinKitThreeBounce(
                color: AppColors.mainOrangeColor,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
