import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application_state.dart';

class ApplicationLogic extends GetxController {
  final ApplicationState state = ApplicationState();

  late final List<String> tabTitles;

  late final List<BottomNavigationBarItem> bottomTabs;

  late final PageController pageController;

  void handleBottomNavBarTap(int index) {
    // print(index);
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  void handlePageChanged(int page) {
    // print(page);
    state.page = page;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabTitles = ['首页', '分类', '购物车', '我的'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.home_filled,
            color: Colors.lightBlueAccent,
          ),
          label: '首页'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.category,
            color: Colors.lightBlueAccent,
          ),
          label: '分类'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.shopping_cart,
            color: Colors.lightBlueAccent,
          ),
          label: '购物车'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.person,
            color: Colors.lightBlueAccent,
          ),
          label: '我的'),
    ];
    pageController = PageController();
  }
}
