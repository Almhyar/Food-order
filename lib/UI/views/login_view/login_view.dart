import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_button.dart';
import 'package:food/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/login_view/login_controller.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/UI/views/reset_password_view/reset_password_view.dart';
import 'package:food/UI/views/signup_view/signup_view.dart';
import 'package:food/app/my_app.dart';
import 'package:food/core/data/repositories/shared_preference_repository.dart';
import 'package:food/core/enums/request_status.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
            child: ListView(
              children: [
                (screenWidth(50)).ph,
                IconButton(
                  icon: Icon(
                    Icons.language,
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                        title: tr("Change_Language"),
                        content: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage('en');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('English')),
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage('ar');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('العربية')),
                          ],
                        ));
                  },
                ),
                Center(
                  child: CustomText(
                    content: tr("key_login"),
                    colorText: AppColors.mainBlackColor,
                    fontSize: screenWidth(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                (screenWidth(20)).ph,
                Center(
                  child: CustomText(
                    content: tr("login_details"),
                  ),
                ),
                (screenWidth(15)).ph,
                CustomTextField(
                  hintText: tr("key_email"),
                  controller: controller.emailController,
                  contentPaddingLeft: screenWidth(10),
                  validator: (value) {
                    return value!.isEmpty || !GetUtils.isEmail(value)
                        ? tr("check_email")
                        : null;
                    // if (value!.isEmpty || !isEmail(value)) {
                    //   return "Please Check Your Email";
                    // } else {
                    //   return null;
                    // }
                  },
                ),
                (screenWidth(15)).ph,
                CustomTextField(
                  hintText: tr("hint_password"),
                  controller: controller.passwordController,
                  Obscure: true,
                  contentPaddingLeft: screenWidth(10),
                  validator: (value) {
                    return value!.isEmpty || !isPassword(value)
                        ? tr("check_password")
                        : null;
                    // if (value!.isEmpty || !isPassword(value))
                    //   return "Please Check Your Password";
                    // else
                    //   return null;
                  },
                ),
                (screenWidth(15)).ph,
                // Obx(() {
                //   return controller.requestStatus == RequestStatus.LOADING
                //       ? Lottie.asset("assets/lottie/squer.json", height: 50)
                // :
                CustomButtonNew(
                    text: tr('key_login'),
                    onPressed: () {
                      controller.login();
                    }),
                // }),

                // NetworkUtil.sendRequest(
                //     type: RequestType.POST,
                //     url: UserEndPoints.login,
                //     headers:
                //         NetworkConfig.getHeaders(needAuth: false),
                //     body: {
                //       "userName": "${emailController.text}",
                //       "password": "almhyar.com"
                //     });
                //   if (_formKey.currentState!.validate()) {
                //     if (emailController.text == email &&
                //         passwordController.text == password) {
                //       SharedPreferenceRepository.setIsLoggedIN(true);
                //     }

                //     CustomToast.showMessage(
                //         context: context,
                //         message: "every thing is ok",
                //         messageType: MessageType.WARNING);
                //     setState(() {
                //       isLoading = true;
                //     });
                //     Future.delayed(Duration(seconds: 3))
                //         .then((value) => {
                //               setState(() {
                //                 isLoading = false;
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                       builder: (context) => MainView(),
                //                     ));
                //               })
                //             });
                //   }

                (screenWidth(20)).ph,
                Center(
                  child: CustomTextButton(
                      onPressed: () {
                        Get.to(ResetPasswordView());
                      },
                      text: tr("q_pass")),
                ),
                (screenWidth(10)).ph,
                Center(
                  child: CustomText(
                    content: tr("login_with"),
                  ),
                ),
                (screenWidth(20)).ph,
                CustomButtonNew(
                  text: tr("key_facebook"),
                  onPressed: () {},
                  backgroundColor: AppColors.mainBlueColor,
                  svgName: "ic_facebook",
                ),
                (screenWidth(15)).ph,
                CustomButtonNew(
                  text: tr("key_google"),
                  onPressed: () {},
                  backgroundColor: AppColors.mainRedColor,
                  svgName: "ic_google",
                  colorSvg: AppColors.mainWhiteColor,
                ),
                (screenWidth(5)).ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      content: tr("q1_account"),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Get.off(SignUpView());
                      },
                      text: tr("key_signup"),
                      colorText: AppColors.mainOrangeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                (screenWidth(40)).ph,
                VirticalDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
