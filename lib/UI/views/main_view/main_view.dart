import 'package:flutter/material.dart';
import 'package:food/UI/shared/custom_widgets/custom_drawer.dart';
import 'package:food/UI/views/main_view/home_view/home_view.dart';
import 'package:food/UI/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:food/UI/views/main_view/menu_view/menu_view.dart';
import 'package:food/UI/views/main_view/more_view/more_view.dart';
import 'package:food/UI/views/main_view/offers_view/offers_view.dart';
import 'package:food/UI/views/main_view/profile_view/profile_view.dart';
import 'package:food/core/enums/bottom_navigation.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 2);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: key,
      drawer: CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomNavigationWidget(
          bottomNavigation: selected,
          onTap: (select, pageNumber) {
            setState(() {
              selected = select;
            });
            controller.jumpToPage(pageNumber);
          }),
      //extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          MenuView(),
          OffersView(),
          HomeView(onPressed: () {
            key.currentState!.openDrawer();
          }),
          ProfileView(),
          MoreView(),
        ],
      ),
    ));
  }
}
