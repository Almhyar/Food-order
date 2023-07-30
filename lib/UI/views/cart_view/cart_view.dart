import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/custom_widgets/custom_button_new.dart';
import 'package:food/UI/shared/custom_widgets/custom_text.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/cart_view/cart_controller.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';

import 'package:get/get.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(47, 61, 74, 0),
            Color.fromRGBO(47, 61, 74, 0),

            Color.fromRGBO(240, 180, 51, 0.467),

            // AppColors.mainOrangeColor,
          ],
        )),
        child: ListView(
          children: [
            (screenWidth(25)).ph,
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                CustomText(
                  content: "My Cart",
                  colorText: AppColors.mainBlackColor,
                  fontSize: screenWidth(15),
                ),
              ],
            ),
            Obx(() {
              return Column(
                children: controller.cartList
                    .map((element) => Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(10), start: screenWidth(30)),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    content: element.mealModel?.name ?? '',
                                    fontSize: screenWidth(18),
                                    colorText: AppColors.mainBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.removeFromCart(element);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: AppColors.mainRedColor,
                                      )),
                                  CustomText(
                                    content:
                                        "Total Price: ${element.totalItem}",
                                    colorText: AppColors.mainOrangeColor,
                                  ),
                                  Container(
                                    width: screenWidth(2),
                                    child: Divider(
                                      color: AppColors.mainGreyColor,
                                      thickness: 1.0,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                      content:
                                          element.mealModel?.price.toString() ??
                                              ""),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: element.count == 1
                                            ? null
                                            : () {
                                                controller.changeCount(
                                                    false, element);
                                              },
                                        child: Text("-"),
                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor:
                                              AppColors.mainOrangeColor,
                                          disabledBackgroundColor:
                                              AppColors.mainGreyColor,
                                        ),
                                      ),
                                      Container(
                                        width: screenWidth(9),
                                        height: screenHeight(18),
                                        decoration: BoxDecoration(
                                            color: AppColors.mainWhiteColor,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth(20)),
                                            border: Border.all(
                                              color: AppColors.mainOrangeColor,
                                            )),
                                        child: Center(
                                            child: CustomText(
                                          content: element.count.toString(),
                                          colorText: AppColors.mainOrangeColor,
                                        )),
                                      ),
                                      CustomButtonNew(
                                        heightButton: 10,
                                        widthButton: 7,
                                        text: '+',
                                        onPressed: () {
                                          controller.changeCount(true, element);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              );
            }),
            (screenHeight(10)).ph,
            Obx(() {
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          content: "SubTotal",
                          colorText: AppColors.mainBlackColor,
                          fontSize: screenWidth(20),
                        ),
                        CustomText(
                          content: cartService.subTotal.toString(),
                          colorText: AppColors.mainOrangeColor,
                        ),
                      ],
                    ),
                    (screenHeight(50)).ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          content: "Tax",
                          colorText: AppColors.mainBlackColor,
                          fontSize: screenWidth(20),
                        ),
                        CustomText(
                          content: cartService.tax.toString(),
                          colorText: AppColors.mainOrangeColor,
                        )
                      ],
                    ),
                    (screenHeight(50)).ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          content: "Delivery Fees",
                          colorText: AppColors.mainBlackColor,
                          fontSize: screenWidth(20),
                        ),
                        CustomText(
                          content: cartService.delivery.toString(),
                          colorText: AppColors.mainOrangeColor,
                        )
                      ],
                    ),
                    (screenHeight(50)).ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          content: "Total",
                          colorText: AppColors.mainBlackColor,
                          fontSize: screenWidth(20),
                        ),
                        CustomText(
                          content: cartService.total.toString(),
                          colorText: AppColors.mainOrangeColor,
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
            CustomButtonNew(
              text: 'Checkout',
              onPressed: () {
                controller.checkout();
              },
            )
          ],
        ),
      ),
      // Obx(() {
      //   return Column(
      //     children: [
      //       ListView.separated(
      //         shrinkWrap: true,
      //         itemCount: controller.cartList.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Row(
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     controller.removeFromCart(controller.cartList[index]);
      //                   },
      //                   icon: Icon(Icons.delete)),
      //               Column(
      //                 children: [
      //                   Text(
      //                     controller.cartList[index].mealModel?.name ?? '',
      //                     style: TextStyle(fontSize: screenWidth(10)),
      //                   ),
      //                   Text(
      //                     controller.cartList[index].mealModel!.price.toString(),
      //                     style: TextStyle(fontSize: screenWidth(10)),
      //                   ),
      //                   Row(
      //                     children: [
      //                       CustomButtonNew(
      //                         widthButton: 7,
      //                         text: '-',
      //                         onPressed: () {
      //                           controller.changeCount(
      //                               false, controller.cartList[index]);
      //                         },
      //                       ),
      //                       Text(
      //                         controller.cartList[index].count.toString(),
      //                         style: TextStyle(fontSize: screenWidth(10)),
      //                       ),
      //                       CustomButtonNew(
      //                         widthButton: 7,
      //                         text: '+',
      //                         onPressed: () {
      //                           controller.changeCount(
      //                               true, controller.cartList[index]);
      //                         },
      //                       ),
      //                     ],
      //                   ),
      //                   Text(
      //                     controller.cartList[index].totalItem.toString(),
      //                     style: TextStyle(fontSize: screenWidth(10)),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           );
      //         },
      //         separatorBuilder: (context, index) {
      //           return Container(
      //             width: screenWidth(1),
      //             height: 2,
      //             color: AppColors.mainOrangeColor,
      //           );
      //         },
      //       ),
      //       Text("SubTotal ${controller.subTotal}"),
      //       Text("Tax ${controller.tax}"),
      //       Text("Delivery Fees ${controller.deliveryFees}"),
      //       Text("Total ${controller.total}"),
      //     ],
      //   );
      // })
    ));
  }
}
