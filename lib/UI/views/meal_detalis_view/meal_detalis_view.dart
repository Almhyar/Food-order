import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/views/cart_view/cart_view.dart';
import 'package:food/UI/views/meal_detalis_view/meal_detalis_controller.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/data/models/apis/meal_model.dart';
import 'package:get/get.dart';

class MealDetalisView extends StatefulWidget {
  final MealModel mealdetalis;
  const MealDetalisView({super.key, required this.mealdetalis});

  @override
  State<MealDetalisView> createState() => _MealDetalisViewState();
}

class _MealDetalisViewState extends State<MealDetalisView> {
  late MealDetalisController controller;
  @override
  void initState() {
    controller = Get.put(MealDetalisController(widget.mealdetalis));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            child: CachedNetworkImage(
                width: screenWidth(1),
                height: screenHeight(3),
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHeight(4)),
            child: Container(
              width: screenWidth(1),
              decoration: BoxDecoration(
                  color: AppColors.mainWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth(5)),
                    topRight: Radius.circular(screenWidth(5)),
                  )),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenHeight(30),
                    start: screenWidth(12),
                    end: screenWidth(12)),
                child: ListView(
                  children: [
                    CustomText(
                      content: "${widget.mealdetalis.categoryName}",
                      fontSize: screenWidth(8),
                      colorText: AppColors.mainBlackColor,
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      //unratedColor: AppColors.mainWhiteColor,
                      glowColor: AppColors.mainOrangeColor,
                      itemSize: screenWidth(20),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsetsDirectional.symmetric(
                          horizontal: screenWidth(90)),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.mainOrangeColor,
                      ),
                      onRatingUpdate: (rating) {
                        controller.rating.value = rating;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return CustomText(
                            content: "${controller.rating} Star Ratings",
                            colorText: AppColors.mainOrangeColor,
                            fontSize: screenWidth(30),
                          );
                        }),
                        CustomText(
                          content: "Rs.${widget.mealdetalis.price}",
                          fontSize: screenWidth(13),
                        ),
                      ],
                    ),
                    (screenWidth(15)).ph,
                    CustomText(
                      content: "Description",
                      colorText: AppColors.mainBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    (screenWidth(25)).ph,
                    CustomText(content: "${widget.mealdetalis.description}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          content: "Number of Portions",
                          colorText: AppColors.mainBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(25),
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              ElevatedButton(
                                onPressed: controller.count.value == 1
                                    ? null
                                    : () {
                                        controller.changeCount(false);
                                      },
                                child: Text("-"),
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: AppColors.mainOrangeColor,
                                  disabledBackgroundColor:
                                      AppColors.mainGreyColor,
                                ),
                              ),
                              Container(
                                width: screenWidth(9),
                                height: screenHeight(18),
                                decoration: BoxDecoration(
                                    color: AppColors.mainWhiteColor,
                                    borderRadius:
                                        BorderRadius.circular(screenWidth(20)),
                                    border: Border.all(
                                      color: AppColors.mainOrangeColor,
                                    )),
                                child: Center(
                                    child: CustomText(
                                  content: "${controller.count}",
                                  colorText: AppColors.mainOrangeColor,
                                )),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.changeCount(true);
                                },
                                child: Text("+"),
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: AppColors.mainOrangeColor,
                                ),
                              )
                            ],
                          );
                        }),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(top: screenHeight(10)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.mainGrey2Color,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenWidth(10)),
                              bottomLeft: Radius.circular(screenWidth(10)),
                            )),
                        child: Column(
                          children: [
                            (screenWidth(20)).ph,
                            CustomText(
                              content: "Total Price",
                              colorText: AppColors.mainBlackColor,
                            ),
                            Obx(() {
                              return CustomText(
                                content: "LKR ${controller.calcTotal()}",
                                colorText: AppColors.mainBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth(15),
                              );
                            }),
                            CustomButtonNew(
                              onPressed: () {
                                controller.addToCart();
                              },
                              text: "Add to Cart",
                              widthButton: 2,
                              heightButton: 10,
                              textFontWight: FontWeight.bold,
                            ),
                            (screenWidth(20)).ph,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
