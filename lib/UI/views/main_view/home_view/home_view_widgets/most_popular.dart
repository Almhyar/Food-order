import 'package:flutter/material.dart';
import 'package:food/UI/shared/colors.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  List<String> title = ["Café De Bambaa", "Burger by Bella"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/mostpopular${widget.currentIndex}.png"),
          Text(
            title[widget.currentIndex],
            style: TextStyle(
                fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "Café     Western Food     ",
                style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: size.width * 0.03),
              ),
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
            ],
          ),
        ],
      ),
    );
  }
}
