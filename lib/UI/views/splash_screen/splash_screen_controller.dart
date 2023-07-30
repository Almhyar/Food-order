import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/intro_view/intro_view.dart';
import 'package:food/UI/views/landing_view/landing_view.dart';
import 'package:food/UI/views/login_view/login_view.dart';
import 'package:food/UI/views/main_view/main_view.dart';
import 'package:food/UI/views/new_password_view/new_password_view.dart';
import 'package:food/UI/views/reset_password_view/reset_password_view.dart';
import 'package:food/UI/views/signup_view/signup_view.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/data/repositories/shared_preference_repository.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLanuch()) {
        Get.off(() => IntroView());
      } else {
        storage.getTokenInfo() != null
            ? Get.off(() => MainView())
            : Get.off(() => MainView());
      }
      storage.setFirstLanuch(false);
      // Get.back()
      //Get.to(page)
    });

    super.onInit();
  }
}
