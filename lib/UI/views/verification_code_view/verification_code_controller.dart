import 'package:flutter/material.dart';
import 'package:food/UI/views/new_password_view/new_password_view.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class VerificationCodeController extends BaseController {
  TextEditingController number1Controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void verification() {
    if (formKey.currentState!.validate()) {
      Get.to(() => NewPasswordView());
    }
  }
}
