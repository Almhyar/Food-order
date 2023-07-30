import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/reset_password_view/reset_password_controller.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordController controller = ResetPasswordController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (screenWidth(10)).ph,
            Center(
              child: CustomText(
                content: tr("key_Repassword"),
                colorText: AppColors.mainBlackColor,
                fontSize: screenWidth(12),
                fontWeight: FontWeight.w500,
              ),
            ),
            (screenWidth(20)).ph,
            Center(
              child: CustomText(
                content: tr("key_link"),
              ),
            ),
            (screenHeight(15)).ph,
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: CustomTextField(
                hintText: tr("key_email"),
                controller: controller.emailcontroller,
                contentPaddingLeft: screenWidth(10),
                validator: (value) {
                  return value!.isEmpty || !value.isEmail
                      ? tr("check_confirm")
                      : null;
                },
              ),
            ),
            (screenHeight(20)).ph,
            Center(
                child: CustomButtonNew(
                    text: tr("key_send"),
                    onPressed: () {
                      controller.checkEmail();
                    })),
            (screenHeight(2.5)).ph,
            VirticalDivider(),
          ],
        ),
      ),
    ));
  }
}
