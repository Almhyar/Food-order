import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food/app/my_app_controller.dart';
import 'package:food/core/data/repositories/shared_preference_repository.dart';
import 'package:food/core/enums/connectivity_status.dart';
import 'package:food/core/enums/message_type.dart';
import 'package:food/core/services/cart_services.dart';
import 'package:food/core/services/connectivity_service.dart';
import 'package:food/core/services/location_service.dart';
import 'package:food/core/services/notification_service.dart';
import 'package:get/get.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  RegExp regExp = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.length < 10) {
    print("Must be more than 9 character");
    return false;
  } else
    return regExp.hasMatch(value);
}

bool isMobileNumber(String value) {
  RegExp regExp = new RegExp(r'^\d{10}$');

  return regExp.hasMatch(value);
}

bool isName(String value) {
  RegExp regExp = new RegExp(r'^[a-zA-Z]+$');

  return regExp.hasMatch(value);
}

double screenWidth(double perecent) {
  return Get.size.width / perecent;
}

double screenHeight(double perecent) {
  return Get.size.height / perecent;
}

SharedPreferenceRepository get storage =>
    Get.find<SharedPreferenceRepository>();

CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();
bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

// void fadeInTransition(Widget view) {
//   Get.to(view, transition: Transition.fadeIn);
// }

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}
