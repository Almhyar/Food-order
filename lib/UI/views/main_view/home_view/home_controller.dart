import 'package:food/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/core/data/models/apis/category_model.dart';
import 'package:food/core/data/models/apis/meal_model.dart';
import 'package:food/core/data/repositories/category_repository.dart';
import 'package:food/core/data/repositories/meal_repository.dart';
import 'package:food/core/enums/message_type.dart';
import 'package:food/core/enums/operation_type.dart';
import 'package:food/core/enums/request_status.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;
  RxInt counter = 0.obs;
  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      listType.contains(OperationType.CATEGORY);

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      listType.contains(OperationType.MEAL);

  @override
  void onInit() {
    getAllGategory();

    getAllMeal();
    notificationService.notificationStream.stream.listen((event) {
      counter += 1;
    });
    super.onInit();
  }

  void getAllGategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }

  void getAllMeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCCSESS);
        });
  }
}
