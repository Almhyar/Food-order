import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/new_password_view/new_password_controller.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/translation/app_translation.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  NewPasswordController controller = NewPasswordController();

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
                content: tr("key_newpass"),
                colorText: AppColors.mainBlackColor,
                fontSize: screenWidth(12),
                fontWeight: FontWeight.w500,
              ),
            ),
            (screenWidth(20)).ph,
            Center(
              child: CustomText(content: tr("key_link")),
            ),
            (screenWidth(10)).ph,
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: CustomTextField(
                hintText: tr("key_newpass"),
                controller: controller.passwordController,
                contentPaddingLeft: screenWidth(10),
                Obscure: true,
                validator: (value) {
                  return value!.isEmpty || !isPassword(value)
                      ? tr("check_password")
                      : null;
                },
              ),
            ),
            (screenWidth(15)).ph,
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: CustomTextField(
                hintText: tr("hint_confirm"),
                controller: controller.confirmPasswordController,
                contentPaddingLeft: screenWidth(10),
                Obscure: true,
                validator: (value) {
                  return value!.isEmpty ||
                          controller.passwordController.text !=
                              controller.confirmPasswordController.text
                      ? tr("check_confirm")
                      : null;
                },
              ),
            ),
            (screenWidth(15)).ph,
            Center(
                child: CustomButtonNew(
                    text: tr("key_next"),
                    onPressed: () {
                      controller.check();
                    })),
            (screenWidth(1.5)).ph,
            VirticalDivider(),
          ],
        ),
      ),
    ));
  }
}
