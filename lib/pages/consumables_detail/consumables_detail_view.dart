import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consumables_detail_logic.dart';

class ConsumablesDetailPage extends GetView<ConsumablesDetailLogic> {
  final logic = Get.find<ConsumablesDetailLogic>();
  final state = Get.find<ConsumablesDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 1,
      // ),
      body: NestedScrollView(

        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              ScrollMetrics metrics = notification.metrics;
              print(metrics.pixels);
              logic.onScroll(notification.metrics.pixels);
            }
            return false;
          },
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                controller: logic.scrollController,
                children: [
                  Column(
                    children: [
                      Container(
                        key: state.headerWKey,
                        color: Colors.red,
                        height: 300,
                      ),
                      Container(
                        key: state.evaluateWKey,
                        color: Colors.green,
                        height: 400,
                      ),
                      Container(
                        key: state.detailWKey,
                        child: webViewsWidget(),
                      )
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: tabBar(context),
              )
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
      ),
    );
  }

  Widget tabBar(context) {
    return Obx(() {
      return Opacity(
        opacity: state.appBarT,
        child: Container(
          color: Colors.white,
          child: TabBar(
            controller: logic.tabController,
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.green,
            labelStyle: const TextStyle(fontSize: 16),
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            tabs: state.tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
            onTap: (int index) {
              switch (index) {
                case 0:
                  logic.scrollController.jumpTo(0);
                  logic.tabController.animateTo(0);
                  break;
                case 1:
                  logic.scrollController.jumpTo(state.twoY -
                      state.oneY -
                      MediaQuery.of(context).padding.top);
                  logic.tabController.animateTo(1);
                  break;
                case 2:
                  logic.scrollController.jumpTo(state.threeY -
                      state.oneY -
                      MediaQuery.of(context).padding.top);
                  logic.tabController.animateTo(2);
                  break;
              }
            },
          ),
        ),
      );
    });
  }

  Widget webViewsWidget() {
    return const Text(
        "阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法文字详情阿萨德发萨达是的发送到发送到发送到阿斯顿发的说法是的发送到发送到发送到阿斯顿发的说法");
  }
}
