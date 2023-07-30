import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/new_password_view/new_password_view.dart';
import 'package:food/UI/views/verification_code_view/verification_code_controller.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  VerificationCodeController controller = VerificationCodeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            (screenWidth(8)).ph,
            Center(
              child: CustomText(
                content: tr("sent_otp"),
                textAlign: TextAlign.center,
                colorText: AppColors.mainBlackColor,
                fontSize: screenWidth(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            (screenWidth(25)).ph,
            Center(
              child: CustomText(
                content: tr("check_number"),
                textAlign: TextAlign.center,
              ),
            ),
            (screenWidth(5)).ph,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: screenWidth(16)),
                  child: PinCodeTextField(
                    appContext: context,
                    hintCharacter: "*",
                    controller: controller.number1Controller,
                    animationType: AnimationType.fade,
                    length: 4,
                    cursorHeight: 18,
                    enableActiveFill: true,
                    textStyle: TextStyle(fontSize: screenWidth(20)),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: screenWidth(6),
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.lightBlue,
                      activeColor: Colors.blue,
                      selectedFillColor: Colors.blue,
                      inactiveFillColor: Colors.grey.shade100,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    validator: (value) {
                      return value!.isEmpty || value.length < 4
                          ? "Please Enter Your Verification Number"
                          : null;
                    },
                    onChanged: ((value) {}),
                    onCompleted: (v) {},
                  ),
                ),
              ],
            ),
            (screenWidth(10)).ph,
            Center(
                child: CustomButtonNew(
                    text: tr("key_next"),
                    onPressed: () {
                      controller.verification();
                    })),
            (screenWidth(10)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(content: tr("key_receive")),
                CustomText(
                  content: tr("key_click"),
                  colorText: AppColors.mainOrangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (screenWidth(1.3)).ph,
            VirticalDivider(),
          ],
        ),
      ),
    ));
  }
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
