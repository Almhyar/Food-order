import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/shared/utils.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';
import 'package:shimmer/shimmer.dart';

class PopularRestaurentsShimmer extends StatefulWidget {
  const PopularRestaurentsShimmer({
    super.key,
  });

  @override
  State<PopularRestaurentsShimmer> createState() =>
      _PopularRestaurentsShimmerState();
}

class _PopularRestaurentsShimmerState extends State<PopularRestaurentsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.mainGrey2Color,
      highlightColor: AppColors.mainGreyColor,
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth(1),
                height: screenWidth(2.3),
                color: AppColors.mainOrangeColor,
              ),
              (screenWidth(50)).ph,
              Container(
                width: screenWidth(2),
                height: screenWidth(15),
                color: AppColors.mainOrangeColor,
              ),
              (screenWidth(10)).ph,
            ],
          );
        },
      ),
    );
  }
}
