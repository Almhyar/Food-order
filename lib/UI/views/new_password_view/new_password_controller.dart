import 'package:flutter/material.dart';
import 'package:food/UI/views/main_view/main_view.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class NewPasswordController extends BaseController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void check() {
    if (formKey.currentState!.validate()) {
      Get.off(MainView());
    }
  }
}
