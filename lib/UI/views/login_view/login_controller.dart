import 'package:flutter/material.dart';
import 'package:food/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/main_view/main_view.dart';
import 'package:food/core/data/repositories/shared_preference_repository.dart';
import 'package:food/core/data/repositories/user_repository.dart';
import 'package:food/core/enums/message_type.dart';
import 'package:food/core/services/base_controller.dart';

import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    //if (formKey.currentState!.validate()) {
    runFullLoadingFutureFunction(
        function: UserRepository()
            .login(
                email: emailController.text, password: passwordController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        storage.setIsLoggedIN(true);
        storage.setTokenInfo(r);
        Get.off(MainView());
      });
    }));

    //} else {}
  }
}
