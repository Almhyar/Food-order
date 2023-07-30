import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/landing_view/landing_controller.dart';
import 'package:food/UI/views/map_view/map_view.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/UI/views/login_view/login_view.dart';
import 'package:food/UI/views/signup_view/signup_view.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class Landing_View extends StatefulWidget {
  const Landing_View({super.key});

  @override
  State<Landing_View> createState() => _Landing_ViewState();
}

class _Landing_ViewState extends State<Landing_View> {
  LandingController controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(children: [
              CustomPaint(
                painter: ClipShadowShadowPainter(
                  clipper: CustomClipPath(),
                  shadow: Shadow(blurRadius: 12),
                ),
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: screenWidth(1),
                    height: screenHeight(2.1),
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'assets/images/Background objects.svg',
                      fit: BoxFit.fitWidth,
                      width: screenWidth(1),
                      height: screenHeight(1),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(252, 96, 17, 1)),
                  ),
                ),
              ),
              // ClipPath(
              //   clipper: CustomClipPath(),
              //   child: Container(
              //     width: size.width,
              //     height: size.height * 0.41,
              //     color: Colors.black.withOpacity(0.1),
              //   ),
              // ),
              // ClipPath(
              //   clipper: CustomClipPath(),
              //   child: Container(
              //     width: size.width,
              //     height: size.height * 0.4,
              //     color: AppColors.mainOrangeColor,
              //   ),
              // ),
              // SvgPicture.asset(
              //   'images/Background objects.svg',
              //   fit: BoxFit.cover,
              // ),
              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: screenHeight(2.7)),
                  child: SvgPicture.asset('assets/images/Logo.svg'),
                ),
              )
            ]),
            (screenWidth(10)).ph,
            CustomText(
              content: tr("text1"),
            ),
            CustomText(
              content: tr("text2"),
            ),
            (screenWidth(10)).ph,
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: Obx(() {
                return CustomButtonNew(
                    text: tr("key_login"),
                    backgroundColor: controller.color.value,
                    onPressed: () async {
                      //print(locationService.getCurrentLocationInfo());
                      LocationData? currentlocation =
                          await locationService.getCurrentLocation();
                      if (currentlocation != null)
                        Get.to(MapView(currentLocation: currentlocation));
                    });
              }),
            ),
            (screenWidth(20)).ph,
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: CustomButtonNew(
                text: tr("key_create"),
                onPressed: () {
                  Get.to(SignUpView());
                },
                textColor: AppColors.mainOrangeColor,
                backgroundColor: AppColors.mainWhiteColor,
                borderColor: AppColors.mainOrangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0014286);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6964286, size.width,
        size.height * 0.9285714);
    path0.quadraticBezierTo(size.width * 0.9968083, size.height * 1.0063571,
        size.width * 0.9591667, size.height);
    path0.lineTo(size.width * 0.6664500, size.height);
    path0.quadraticBezierTo(size.width * 0.6596000, size.height * 0.7251000,
        size.width * 0.5001750, size.height * 0.7281714);
    path0.quadraticBezierTo(size.width * 0.3309417, size.height * 0.7312429,
        size.width * 0.3327583, size.height);
    path0.lineTo(size.width * 0.0460500, size.height);
    path0.quadraticBezierTo(size.width * 0.0006667, size.height * 1.0078714, 0,
        size.height * 0.9271429);
    path0.quadraticBezierTo(size.width * 0.0002083, size.height * 0.6957143,
        size.width * 0.0008333, size.height * 0.0014286);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
