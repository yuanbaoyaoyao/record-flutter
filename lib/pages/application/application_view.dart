import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application_logic.dart';

class ApplicationPage extends GetView<ApplicationLogic> {
  AppBar _buildAppBar() {
    return AppBar(
      title: Text("耗材管理系统"),
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: const [
        Text("首页",textAlign: TextAlign.center),
        Text("分类"),
        Text("购物车"),
        Text("我的"),
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
    // return BottomNavigationBar(
    //       items: controller.bottomTabs,
    //     );
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ApplicationLogic>();
    final state = Get.find<ApplicationLogic>().state;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
