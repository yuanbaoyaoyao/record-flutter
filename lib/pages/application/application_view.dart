import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/cart/cart_view.dart';
import 'package:record_flutter/pages/classification/classification_view.dart';
import 'package:record_flutter/pages/home/home_view.dart';
import 'package:record_flutter/pages/mine/mine_view.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/constant.dart';
import 'application_logic.dart';

class ApplicationPage extends GetView<ApplicationLogic> {

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children:  [
        HomePage(),
        ClassificationPage(),
        CartPage(),
        MinePage(),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabs,
          onTap: controller.handleBottomNavBarTap,
          currentIndex: controller.state.page,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ApplicationLogic>();
    final state = Get.find<ApplicationLogic>().state;

    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
