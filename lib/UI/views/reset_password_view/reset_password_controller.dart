import 'package:flutter/material.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class ResetPasswordController extends BaseController {
  TextEditingController emailcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void checkEmail() {
    if (formKey.currentState!.validate()) {
      Get.to(() => EmailVerificationView());
    }
  }
}
