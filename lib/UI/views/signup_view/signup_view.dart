import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_button.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food/UI/shared/custom_widgets/virtical_divider.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/UI/views/login_view/login_view.dart';
import 'package:food/core/data/repositories/user_repository.dart';
import 'package:food/core/enums/message_type.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emaillController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final ImagePicker picker = ImagePicker();
  late XFile? image = null;
  late XFile? photo = null;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
          child: ListView(
            children: [
              (screenWidth(10)).ph,
              Center(
                child: CustomText(
                  content: tr("key_signup"),
                  colorText: AppColors.mainBlackColor,
                  fontSize: screenWidth(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
              (screenWidth(20)).ph,
              Center(
                child: CustomText(
                  content: tr("signup_details"),
                ),
              ),
              (screenWidth(15)).ph,
              GestureDetector(
                onTap: image == null && photo == null && result == null
                    ? () {
                        setState(() {
                          showAlertDialog(context);
                        });
                      }
                    : null,
                child: Center(
                  child: CircleAvatar(
                      foregroundColor: AppColors.mainBlackColor,
                      backgroundImage: result != null
                          ? null
                          : image != null
                              ? Image.file(
                                  File(image!.path),
                                ).image
                              : photo != null
                                  ? Image.file(
                                      File(photo!.path),
                                    ).image
                                  : null,
                      radius: 50,
                      child: result != null
                          ? Icon(
                              Icons.file_copy_outlined,
                              size: screenWidth(10),
                            )
                          : image == null && photo == null
                              ? SvgPicture.asset(
                                  "assets/images/Logo.svg",
                                  width: screenWidth(5),
                                )
                              : null),
                ),
              ),
              Visibility(
                visible: image != null || photo != null || result != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      onPressed: () {
                        setState(() {
                          showAlertDialog(context);
                        });
                      },
                      text: tr("key_edit"),
                      colorText: AppColors.mainOrangeColor,
                    ),
                    Icon(
                      Icons.edit,
                      size: screenWidth(20),
                    )
                  ],
                ),
              ),
              (screenWidth(10)).ph,
              CustomTextField(
                hintText: tr("hint_name"),
                controller: nameController,
                contentPaddingLeft: screenWidth(10),
                validator: (value) {
                  return value!.isEmpty || !isName(value)
                      ? tr("check_name")
                      : null;
                },
              ),
              (screenWidth(15)).ph,
              CustomTextField(
                hintText: tr("key_email"),
                controller: emaillController,
                contentPaddingLeft: screenWidth(10),
                validator: (value) {
                  return value!.isEmpty || !isEmail(value)
                      ? tr("check_email")
                      : null;
                },
              ),
              (screenWidth(15)).ph,
              CustomTextField(
                typeInput: TextInputType.number,
                hintText: tr("key_mobile"),
                controller: mobileController,
                contentPaddingLeft: screenWidth(10),
                validator: (value) {
                  return value!.isEmpty || !isMobileNumber(value)
                      ? tr("check_mobile")
                      : null;
                },
              ),
              (screenWidth(15)).ph,
              CustomTextField(
                hintText: tr("hint_address"),
                controller: addressController,
                contentPaddingLeft: screenWidth(10),
                validator: (value) {
                  return value!.isEmpty ? tr("check_address") : null;
                },
              ),
              (screenWidth(15)).ph,
              CustomTextField(
                hintText: tr("hint_password"),
                controller: passController,
                contentPaddingLeft: screenWidth(10),
                Obscure: true,
                validator: (value) {
                  return value!.isEmpty || !isPassword(value)
                      ? tr("check_password")
                      : null;
                },
              ),
              (screenWidth(15)).ph,
              CustomTextField(
                hintText: tr("hint_confirm"),
                controller: passConfirmController,
                contentPaddingLeft: screenWidth(10),
                Obscure: true,
                validator: (value) {
                  return value!.isEmpty || value != passController.text
                      ? tr("check_confirm")
                      : null;
                },
              ),
              (screenWidth(15)).ph,
              isLoading
                  ? SpinKitCircle(
                      color: AppColors.mainOrangeColor,
                    )
                  : CustomButtonNew(
                      text: tr("key_signup"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("ok");
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 3)).then((value) => {
                                setState(() {
                                  isLoading = false;
                                })
                              });
                        } else
                          print(" :( ");
                      }),
              (screenWidth(15)).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    content: tr("q_account"),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Get.off(LoginView());
                    },
                    text: tr("key_login"),
                    colorText: AppColors.mainOrangeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              CustomButtonNew(
                  text: 'open link',
                  onPressed: () async {
                    final Uri _url = Uri.parse('https://flutter.dev');
                    if (!await launchUrl(_url,
                        mode: LaunchMode.externalApplication)) ;

                    // String? encodeQueryParameters(Map<String, String> params) {
                    //   return params.entries
                    //       .map((MapEntry<String, String> e) =>
                    //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    //       .join('&');
                    // }

                    // final Uri smsLaunchUri = Uri(
                    //   scheme: 'sms',
                    //   path: '0996131104',
                    //   queryParameters: <String, String>{
                    //     'body': Uri.encodeComponent(
                    //         'Example Subject & Symbols are allowed!'),
                    //   },
                    // );

                    // final Uri emailLaunchUri = Uri(
                    //   scheme: 'mailto',
                    //   path: 'smith@example.com',
                    //   query: encodeQueryParameters(<String, String>{
                    //     'subject': 'Example Subject & Symbols are allowed!',
                    //   }),
                    // );

                    // launchUrl(emailLaunchUri,
                    //     mode: LaunchMode.externalApplication);
                    // final Uri smsLaunchUri = Uri(
                    //   scheme: 'sms',
                    //   path: '0118 999 881 999 119 7253',
                    //   queryParameters: <String, String>{
                    //     'body': Uri.encodeComponent(
                    //         'Example Subject & Symbols are allowed!'),
                    //   },
                    // );
                  }),
              (screenWidth(20)).ph,
              VirticalDivider(),
            ],
          ),
        ),
      ),
    ));
  }

  showAlertDialog(BuildContext context) {
    Widget cameraButton = ElevatedButton(
      child: Text(tr("key_camera")),
      style:
          ElevatedButton.styleFrom(backgroundColor: AppColors.mainOrangeColor),
      onPressed: () async {
        image = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          photo = null;
          result = null;
          if (image != null) Get.back();
        });
      },
    );
    Widget galleryButton = ElevatedButton(
      child: Text(tr("key_gallery")),
      style:
          ElevatedButton.styleFrom(backgroundColor: AppColors.mainOrangeColor),
      onPressed: () async {
        photo = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          image = null;
          result = null;
          if (photo != null) Get.back();
        });
      },
    );
    Widget fileButton = ElevatedButton(
      child: Text(tr("key_file")),
      style:
          ElevatedButton.styleFrom(backgroundColor: AppColors.mainOrangeColor),
      onPressed: () async {
        result = await FilePicker.platform.pickFiles();
        setState(() {
          image = null;
          photo = null;
          if (result != null) Get.back();
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("key_hi")),
              Icon(
                Icons.emoji_people,
                color: AppColors.mainOrangeColor,
              ),
            ],
          ),
          Divider(
            color: AppColors.mainGrey2Color,
          )
        ],
      ),
      content: Text(tr("p_check")),
      actions: [
        cameraButton,
        galleryButton,
        fileButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
