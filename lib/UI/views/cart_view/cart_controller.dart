import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/checkout_view/checkout_view.dart';
import 'package:food/core/data/models/cart_model.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CartController extends BaseController {
  List<CartModel> get cartList => cartService.cartList;

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(CheckoutView());
    }));
  }
}
