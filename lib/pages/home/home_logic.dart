import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/application_state.dart';
import 'home_state.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final HomeState state = HomeState();
  final ApplicationState appState = ApplicationState();

  late final ScrollController scrollController;

  late final ScrollController tabsScrollController;

  late final PageController pageController;

  late TabController tabController;

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
    tabsScrollController = ScrollController();
    scrollerAddListener();
    tabsScrollerAddListener();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      state.sliderMaxValue = scrollController.position.maxScrollExtent;
      state.tabsSliderMaxValue = tabsScrollController.position.maxScrollExtent;
      subInitState();
      print("123");
      print("tabs初始化位置为：${state.tabsSliderValue}");
    });
    pageController = PageController();
    tabController = TabController(length: state.tabs.length, vsync: this);
  }

  void subInitState() {
    state.tabsSliderValue = getY(state.tabsKey.currentContext);
  }

  double? getY(BuildContext? buildContext) {
    RenderObject? evaluationRenderObject = buildContext?.findRenderObject();
    return evaluationRenderObject?.getTransformTo(null).getTranslation().y;
  }

  void scrollerAddListener() {
    scrollController.addListener(() {
      state.sliderValue = scrollController.position.pixels;
      print(
          "_scrollController.position.pixels:${scrollController.position.pixels}");
    });
  }

  void tabsScrollerAddListener() {
    tabsScrollController.addListener(() {
      //此处50 待处理
      var of = tabsScrollController.position.pixels +
          MediaQuery.of(Get.context!).padding.top +
          50.0;
      print("of:::::" + of.toString());
      print("state.tabsSliderValue");
      print(state.tabsSliderValue);

      if (of > state.tabsSliderValue) {
        state.showTab = true;
      } else {
        state.showTab = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    tabsScrollController.dispose();
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
