import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/front_show_api.dart';

import '../../common/apis/product_api.dart';
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

    tabsScrollController = ScrollController();
    scrollController = ScrollController();
    scrollerAddListener();
    tabsScrollerAddListener();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      state.tabsSliderMaxValue = tabsScrollController.position.maxScrollExtent;
      //无法获得数据
      state.sliderMaxValue = scrollController.position.maxScrollExtent;
      subInitState();
      log("tabs初始化位置为：${state.tabsSliderValue}");
      log("sliderMaxValue：${state.sliderMaxValue}");
    });
    pageController = PageController();
    tabController = TabController(length: state.tabs.length, vsync: this);
    getRotationList();
    getOld();
    getNew();
    getClassification();
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
      if (state.sliderMaxValue == 0) {
        state.sliderMaxValue = scrollController.position.maxScrollExtent;
      }
      state.sliderValue = scrollController.position.pixels;
      // log("_scrollController.position.pixels:${scrollController.position.pixels}");
      // log("_scrollController.position.maxScrollExtent:${scrollController.position.maxScrollExtent}");
      // log("sliderMaxValue：${state.sliderMaxValue}");
    });
  }

  void tabsScrollerAddListener() {
    tabsScrollController.addListener(() {
      //此处50 待处理
      var of = tabsScrollController.position.pixels +
          MediaQuery.of(Get.context!).padding.top +
          50.0;

      if (of > state.tabsSliderValue) {
        state.showTab = true;
      } else {
        state.showTab = false;
      }
    });
  }

  void getRotationList() async {
    await FrontShowAPI.listFrontShowRotationAPI().then((value) {
      // log(value.data.length.toString());
      // for (var data in value.data) {
      //   log("productSkusId:" + data.productSkusId.toString());
      //   log("productSkusName:" + data.productSkusName);
      //   log("productName:" + data.productName);
      //   log("avatar:" + data.avatar);
      // }
      state.rotations = value.data;
    });
  }

  void getClassification() async {
    await ProductAPI.listProductAllAPI(productName: '').then((value) {
      // log(value.data[0].toString());
      state.products = value.data;
    });
  }

  void getOld() async {
    await FrontShowAPI.listOldAPI().then((value) {
      state.oldProducts = value.data;
    });
  }

  void getNew() async {
    await FrontShowAPI.listNewAPI().then((value) {
      state.newProducts = value.data;
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
