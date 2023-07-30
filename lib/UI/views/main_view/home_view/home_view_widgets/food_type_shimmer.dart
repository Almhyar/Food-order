import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:shimmer/shimmer.dart';

class FoodTypeShimmer extends StatefulWidget {
  const FoodTypeShimmer({
    super.key,
  });

  @override
  State<FoodTypeShimmer> createState() => _FoodTypeShimmerState();
}

class _FoodTypeShimmerState extends State<FoodTypeShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.mainGrey2Color,
      highlightColor: AppColors.mainGreyColor,
      child: SizedBox(
        height: screenWidth(3),
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  children: [
                    (screenWidth(15)).pw,
                    Container(
                      width: screenWidth(4.5),
                      height: screenWidth(4.5),
                      decoration: BoxDecoration(
                          color: AppColors.mainOrangeColor,
                          borderRadius: BorderRadius.circular(screenWidth(50))),
                    ),
                    (screenWidth(150)).pw,
                  ],
                ),
                (screenHeight(100)).ph,
                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(15)),
                  child: Container(
                    width: screenWidth(5),
                    height: screenWidth(20),
                    decoration: BoxDecoration(
                        color: AppColors.mainOrangeColor,
                        borderRadius: BorderRadius.circular(screenWidth(50))),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
