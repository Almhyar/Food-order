import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_button.dart';
import 'package:food/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/main_view/home_view/home_controller.dart';
import 'package:food/UI/views/main_view/home_view/home_view_widgets/food_type_shimmer.dart';
import 'package:food/UI/views/main_view/home_view/home_view_widgets/popular_restaurents_shimmer.dart';
import 'package:food/UI/views/meal_detalis_view/meal_detalis_view.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:food/core/translation/app_translation.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;
  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Container(
        color: AppColors.mainRedColor,
      ),
      body: ListView(
        children: [
          (screenWidth(20)).ph,
          InkWell(
            onTap: () {
              controller.counter.value = 0;
            },
            child: Align(
              child: Container(
                width: screenWidth(10),
                height: screenWidth(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                child: Obx(() {
                  return Center(
                      child: Text(
                    '${controller.counter.value}',
                    style: TextStyle(color: Colors.white),
                  ));
                }),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      content: tr("key_morning"),
                      fontSize: screenWidth(17),
                      colorText: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w300,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('images/shopping_cart.svg')),
                  ],
                ),
                (screenWidth(20)).ph,
                CustomText(
                  content: tr("key_delivery"),
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(30),
                  colorText: AppColors.mainGrey2Color,
                ),
                Row(
                  children: [
                    CustomText(
                      content: tr("key_location"),
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.bold,
                    ),
                    (screenWidth(10)).pw,
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.mainOrangeColor,
                        )),
                  ],
                ),
                (screenWidth(15)).ph,
                CustomTextField(
                  hintText: tr("key_food"),
                  controller: searchController,
                  prefixIcon: Icons.search,
                ),
              ],
            ),
          ),
          (screenWidth(15)).ph,
          Obx(() {
            return controller.isCategoryLoading
                ? FoodTypeShimmer()
                : Container(
                    height: screenWidth(3),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            (screenWidth(15)).pw,
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(screenWidth(50)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'http://via.placeholder.com/350x150',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    width: screenWidth(4.5),
                                    height: screenWidth(4.5),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                (screenHeight(100)).ph,
                                Text(
                                  controller.categoryList[index].name ?? '',
                                  style: TextStyle(fontSize: screenWidth(20)),
                                ),
                              ],
                            ),
                            (screenWidth(150)).pw,
                          ],
                        );
                      },
                    ),
                  );
          }),
          (screenHeight(50)).ph,
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: tr("key_popular"),
                  colorText: AppColors.mainBlackColor,
                  fontSize: screenWidth(17),
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: tr("key_view"),
                  colorText: AppColors.mainOrangeColor,
                  fontSize: screenWidth(30),
                ),
              ],
            ),
          ),
          Obx(() {
            return Column(
                children: controller.isMealLoading
                    ? [PopularRestaurentsShimmer()]
                    : controller.mealList
                        .map((element) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(MealDetalisView(
                                      mealdetalis: element,
                                    ));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'http://via.placeholder.com/350x150',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: screenWidth(20)),
                                  child: Row(
                                    children: [
                                      Text(
                                        element.name ?? "",
                                        style: TextStyle(
                                            fontSize: screenWidth(20)),
                                      ),
                                      CustomButtonNew(
                                        text: '+',
                                        onPressed: () {
                                          controller.addToCart(element);
                                        },
                                        widthButton: 7,
                                      ),
                                      CustomButtonNew(
                                        text: '${cartService.cartCount}',
                                        textSize: screenWidth(10),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                                (screenWidth(10)).ph,
                              ],
                            ))
                        .toList());
          }),
        ],
      ),
    ));
  }
}
