import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/custom_appbar.dart';

import 'consumables_detail_logic.dart';

class ConsumablesDetailPage extends GetView<ConsumablesDetailLogic> {
  final logic = Get.find<ConsumablesDetailLogic>();
  final state = Get.find<ConsumablesDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          height: 700,
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/images/message_box_bg.png",
                                  fit: BoxFit.fill,
                                  height: 350,
                                ),
                              ),
                              Container(
                                color: Colors.red,
                                padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "这是标题",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text("这是描述"),
                                    Text(
                                      "这是剩余数量",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("数量"),
                                          Expanded(child: Text("")),
                                          Container(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      print("点击了减少按钮");
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove_circle)),
                                                Text("1件"),
                                                IconButton(
                                                    onPressed: () {
                                                      print("点击了增加按钮");
                                                    },
                                                    icon: const Icon(
                                                        Icons.add_circle)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("地址"),
                                          Expanded(child: Text("")),
                                          TextButton(
                                              onPressed: () {
                                                print("123");
                                              },
                                              child: Text("选择地址"))
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text("为你推荐"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      Container(
                        key: state.evaluateWKey,
                        color: Colors.green,
                        height: 300,
                        // child: ,
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
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CustomAppBar(),
                          Positioned(
                            left: 0,
                            child: SafeArea(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.white),
                                child: IconButton(
                                  onPressed: () {
                                    print("点击了返回按钮");
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back_outlined),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: SafeArea(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.white),
                                child: IconButton(
                                  onPressed: () {
                                    print("点击了搜索按钮");
                                    Get.toNamed("/Search");
                                  },
                                  icon: const Icon(Icons.search_outlined),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      tabBar(context),
                    ],
                  )),
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
