import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';
import 'package:food/UI/views/verification_code_view/verification_code_view.dart';

class RecentItem extends StatefulWidget {
  const RecentItem({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<RecentItem> createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  List<String> title = ["Mulberry Pizza by Josh", "Barita", "Pizza Rush Hour"];
  List<String> type = ["Western Food", "Coffee", "Italian Food"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.04),
      child: Row(
        children: [
          Image.asset("images/recentItem${widget.currentIndex}.png"),
          (size.width * 0.05).pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title[widget.currentIndex],
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              ),
              (size.width * 0.02).ph,
              Text(
                "Café     ${type[widget.currentIndex]}",
                style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: size.width * 0.03),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.mainOrangeColor,
                  ),
                  Text(
                    "4.9 ",
                    style: TextStyle(
                        color: AppColors.mainOrangeColor,
                        fontSize: size.width * 0.03),
                  ),
                  Text(
                    "(124 ratings)",
                    style: TextStyle(
                        color: AppColors.mainGreyColor,
                        fontSize: size.width * 0.03),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
