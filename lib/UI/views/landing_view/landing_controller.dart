import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/core/enums/notification_type.dart';
import 'package:food/core/services/base_controller.dart';

import 'package:get/state_manager.dart';

class LandingController extends BaseController {
  Rx<Color> color = AppColors.mainOrangeColor.obs;

  @override
  void onInit() {
    notificationService.notificationStream.stream.listen((event) {
      if (event.notificatioNType == NotificationType.CHANGECOLOR.name) {
        color.value = AppColors.mainBlueColor;
      }
    });
    super.onInit();
  }
}
