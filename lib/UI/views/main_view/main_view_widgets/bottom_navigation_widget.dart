import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/core/enums/bottom_navigation.dart';
import 'package:food/core/translation/app_translation.dart';

import '../../landing_view/landing_view.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;
  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth(7)),
          child: InkWell(
            //splashColor: Colors.transparent,
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              radius: screenWidth(10),
              backgroundColor:
                  widget.bottomNavigation == BottomNavigationEnum.HOME
                      ? AppColors.mainOrangeColor
                      : AppColors.mainGreyColor,
              child: SvgPicture.asset(
                "assets/images/ic_home.svg",
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
        // SvgPicture.asset(
        //   "images/bg_bottom_navigation.svg",
        //   fit: BoxFit.fitWidth,
        // ),
        CustomPaint(
          painter: ClipShadowShadowPainter(
            shadow: Shadow(
              blurRadius: 12,
              offset: Offset(0, 1),
              color: AppColors.mainGreyColor,
            ),
            clipper: BottomClip(),
          ),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: screenWidth(1),
              height: screenWidth(4),
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        Positioned(
          bottom: screenWidth(15),
          left: screenWidth(15),
          right: screenWidth(15),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.MENU, 0);
                        },
                        imageName: "ic_menu",
                        text: tr("key_menu"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.MENU),
                    SizedBox(
                      width: screenWidth(10),
                    ),
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.OFFERS, 1);
                        },
                        imageName: "ic_shopping",
                        text: tr("key_offers"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.OFFERS),
                  ],
                ),
                Row(
                  children: [
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.PROFILE, 3);
                        },
                        imageName: "ic_user",
                        text: tr("key_profile"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.PROFILE),
                    SizedBox(
                      width: screenWidth(10),
                    ),
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.MORE, 4);
                        },
                        imageName: "ic_more",
                        text: tr("key_more"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.MORE),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/$imageName.svg",
            width: screenWidth(20),
            color: isSelected
                ? AppColors.mainOrangeColor
                : AppColors.mainGreyColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainOrangeColor
                  : AppColors.mainGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
