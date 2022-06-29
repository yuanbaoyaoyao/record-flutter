import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bottom_nav_bar.dart';

import 'consumables_detail_logic.dart';

class ConsumablesDetailPage extends GetView<ConsumablesDetailLogic> {
  final logic = Get.find<ConsumablesDetailLogic>();
  final state = Get
      .find<ConsumablesDetailLogic>()
      .state;

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
            }, child: Obx(() {
          return Stack(
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
                                child: Image.network(
                                  state.productSkusInfo.code != null
                                      ? state.productSkusInfo.data.records[0]
                                      .avatar
                                      : "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F18%2F20200418035054_wLmeh.thumb.1000_0.gif&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658886566&t=be8a42d75e73cb5186788b9634f4687b",
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
                                  children: [
                                    Text(
                                      "${state.productSkusInfo.code != null
                                          ? state.productSkusInfo.data
                                          .records[0].productName + " " +
                                          state.productSkusInfo.data.records[0]
                                              .title
                                          : ""}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        "${state.productSkusInfo.code != null
                                            ? state.productSkusInfo.data
                                            .records[0].description
                                            : ""}"),
                                    Text(
                                      "剩余${state.productSkusInfo.code != null
                                          ? state.productSkusInfo.data
                                          .records[0].stock
                                          : ""}个",
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
                                                      logic
                                                          .handleReduceNumber();
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove_circle)),
                                                Text(state.number.toString()),
                                                IconButton(
                                                    onPressed: () {
                                                      logic.handleAddNumber();
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
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (
                                                        BuildContext context) {
                                                      return Container(
                                                          height: ScreenUtil()
                                                              .setHeight(300.0),
                                                          color: Colors.amber,
                                                          child: ListView
                                                              .builder(
                                                              itemCount: state
                                                                  .addressList
                                                                  .data.length,
                                                              itemBuilder:(context, index) =>Container(
                                                                child: Text("123"),
                                                              ))
                                                      );
                                                    });
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("评价"),
                                Expanded(child: Text("")),
                                TextButton(
                                    onPressed: () {
                                      print("点击了评价详情页");
                                    },
                                    child: Text("评价详情"))
                              ],
                            ),
                            Container(
                              height: 30.0,
                              child: Text("关键词提取"),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/dingding.png",
                                  width: 20.0,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  width: 20,
                                ),
                                Text("名称")
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Text("这是评价"),
                                    Container(
                                      height: 150,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 10,
                                              child: Image.asset(
                                                "assets/images/dingding.png",
                                                fit: BoxFit.fill,
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
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
                                    print("点击了Get.back()");
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
                                    Get.toNamed("/search");
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
          );
        })),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
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
                .map((e) =>
                Tab(
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
                      MediaQuery
                          .of(context)
                          .padding
                          .top);
                  logic.tabController.animateTo(1);
                  break;
                case 2:
                  logic.scrollController.jumpTo(state.threeY -
                      state.oneY -
                      MediaQuery
                          .of(context)
                          .padding
                          .top);
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
