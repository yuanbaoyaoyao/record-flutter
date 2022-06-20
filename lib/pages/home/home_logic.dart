import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/front_show_api.dart';

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
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  void handlePageChanged(int listPage) {
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
      log("123");
      log("tabs初始化位置为：${state.tabsSliderValue}");
    });
    pageController = PageController();
    tabController = TabController(length: state.tabs.length, vsync: this);
    getRotationList();
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
      log("_scrollController.position.pixels:${scrollController.position.pixels}");
    });
  }

  void tabsScrollerAddListener() {
    tabsScrollController.addListener(() {
      //此处50 待处理
      var of = tabsScrollController.position.pixels +
          MediaQuery.of(Get.context!).padding.top +
          50.0;
      log("of:::::" + of.toString());
      log("state.tabsSliderValue");
      log(state.tabsSliderValue);

      if (of > state.tabsSliderValue) {
        state.showTab = true;
      } else {
        state.showTab = false;
      }
    });
  }

  void getRotationList() async {
    await FrontShowAPI.listFrontShowRotationAPI().then((value) {
      log(value.data.length.toString());
      for (var data in value.data) {
        log("productSkusId:" + data.productSkusId.toString());
        log("productSkusName:" + data.productSkusName);
        log("productName:" + data.productName);
        log("avatar:" + data.avatar);
      }
      state.rotations = value.data;
      log("state.rotations.avatar:"+state.rotations[0].avatar);
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
