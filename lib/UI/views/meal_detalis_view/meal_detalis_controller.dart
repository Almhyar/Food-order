import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/cart_view/cart_view.dart';
import 'package:food/core/data/models/apis/meal_model.dart';
import 'package:food/core/data/models/cart_model.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class MealDetalisController extends BaseController {
  MealDetalisController(MealModel mealModel) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;
  RxDouble rating = 0.0.obs;

  void changeCount(bool incress) {
    if (incress)
      count++;
    else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => CartView());
        });
  }
}
