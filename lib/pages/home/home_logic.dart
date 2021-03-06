import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:record_flutter/common/apis/cart_api.dart';
import 'package:record_flutter/common/apis/front_show_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/cart_entity.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/apis/product_api.dart';
import '../../common/apis/product_skus_api.dart';
import '../application/application_state.dart';
import '../cart/cart_logic.dart';
import 'home_state.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final HomeState state = HomeState();
  final ApplicationState appState = ApplicationState();
  final cartLogic = Get.find<CartLogic>();

  late final ScrollController scrollController;

  late final ScrollController tabsScrollController;

  late final PageController pageController;

  late final RefreshController refreshController;

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
    log("home_logic");
    tabsScrollController = ScrollController();
    scrollController = ScrollController();
    refreshController = RefreshController();
    scrollerAddListener();
    tabsScrollerAddListener();
    tabController = TabController(length: state.tabs.length, vsync: this);
    tabsAddListener();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      state.tabsSliderMaxValue = tabsScrollController.position.maxScrollExtent;
      //无法获得数据
      state.sliderMaxValue = scrollController.position.maxScrollExtent;
      subInitState();
      log("tabs初始化位置为：${state.tabsSliderValue}");
      log("sliderMaxValue：${state.sliderMaxValue}");
    });
    pageController = PageController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadData();
  }

  void subInitState() {
    state.tabsSliderValue = getY(state.tabsKey.currentContext);
  }

  double? getY(BuildContext? buildContext) {
    RenderObject? evaluationRenderObject = buildContext?.findRenderObject();
    return evaluationRenderObject?.getTransformTo(null).getTranslation().y;
  }

  void loadData() async {
    getRotationList();
    getOld();
    getNew();
    getClassification();
    getListByType();
  }

  void scrollerAddListener() {
    scrollController.addListener(() {
      if (state.sliderMaxValue == 0) {
        state.sliderMaxValue = scrollController.position.maxScrollExtent;
      }
      state.sliderValue = scrollController.position.pixels;
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

  void tabsAddListener() {
    tabController.addListener(() {
      // log("当前菜单index:" + (tabController.index + 1).toString());
      state.listPage = tabController.index;
    });
  }

  void handleAddIntoCart(int productSkusId, int productSkusNumber) async {
    await CartAPI.createCartAPI(
            createEntity: CartCreateEntity(
                userId: SpUtil.getInt(UserConstant.userId),
                productSkusId: productSkusId,
                productSkusNumber: productSkusNumber))
        .then((value) {
      EasyLoading.showToast("加入购物车成功");
      cartLogic.onRefresh();
    });
  }

  void getRotationList() async {
    await FrontShowAPI.listFrontShowRotationAPI().then((value) {
      state.rotations = value.data;
    });
  }

  //
  void getClassification() async {
    await ProductAPI.listProductAllAPI(productName: '').then((value) {
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

  void getListByType() async {
    await ProductSkusAPI.listProductSkusByTypeIPageAPI(
            pageNum: 1, type: state.listPage + 1, pageSize: state.pageSize)
        .then((value) {
      state.productSkus = value.data.records;
      log("value.toJson().toString" + value.toJson().toString());
    });
  }

  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    log("刷新完成");
    state.pageSize = 8;
    loadData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    state.pageSize += 8;
    log("加載完成");
    getListByType();
    refreshController.loadComplete();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    tabsScrollController.dispose();
    tabController.dispose();
    pageController.dispose();
    refreshController.dispose();
    super.dispose();
  }
}
