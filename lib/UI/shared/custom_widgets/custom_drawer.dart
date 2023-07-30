import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/login_view/login_view.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth(0.1)),
      width: screenWidth(0.65),
      color: AppColors.mainWhiteColor,
      child: Column(
        children: [
          CustomButtonNew(
              text: "on",
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ));
              })
        ],
      ),
    );
  }
}
