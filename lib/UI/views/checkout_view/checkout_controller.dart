import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/main_view/main_view.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class CheckoutController extends BaseController {
  @override
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}
