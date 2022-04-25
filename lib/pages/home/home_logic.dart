import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../application/application_state.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final ApplicationState appState = ApplicationState();

  late final ScrollController scrollController;

  late final PageController pageController;


  void handleHomeListNavBarTap(int index) {
    // print(index);
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  void handlePageChanged(int listPage) {
    // print(page);
    state.listPage = listPage;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
    scrollerAddListener();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      state.sliderMaxValue = scrollController.position.maxScrollExtent;
    });
    pageController = PageController();
  }

  void scrollerAddListener() {
    scrollController.addListener(() {
      state.sliderValue = scrollController.position.pixels;
      print(
          "_scrollController.position.pixels:${scrollController.position.pixels}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}
