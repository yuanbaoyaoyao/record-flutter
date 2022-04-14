import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/constant.dart';
import 'application_logic.dart';

class ApplicationPage extends GetView<ApplicationLogic> {
  AppBar _buildAppBar() {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      title: TextFormField(
        autofocus: true,
        readOnly: true,
        decoration: InputDecoration(
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: -3),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
            fillColor: Colors.white,
            filled: true,
            hintText: '请输入搜索内容',
            suffix: ElevatedButton.icon(
              onPressed: () {
                print("点击了搜索");
                Get.toNamed("/Search");
              },
              icon: const Icon(Icons.search_outlined),
              label: const Text("搜索"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
                  elevation: MaterialStateProperty.all(0.0)),
            )),
        onTap: () {
          print("点击了title");
          Get.toNamed("/Search");
        },
      ),
      actions: [
        Container(
          child: IconButton(
            onPressed: () {
              print("${SpUtil.getStringList(Constant.searchHistory)!}");
            },
            icon: const Icon(
              Icons.mail_outline,
              size: 30.0,
            ),
          ),
          // const Icon(
          //   Icons.message,
          //   size: 30.0,
          // ),
          margin: const EdgeInsets.only(right: 8.0),
        )
      ],
      // title: Text("耗材管理系统"),
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: const [
        Text("首页", textAlign: TextAlign.center),
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
