import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bottom_nav_bar.dart';

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
        }, child: Obx(() {
          return Stack(
            children: [
              ListView(
                shrinkWrap: true,
                controller: logic.scrollController,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          key: state.headerWKey,
                          // height: ScreenUtil().setHeight(850),
                          height: ScreenUtil().setHeight(560),
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
                                      "${state.productSkusInfo.code != null ? state.productSkusInfo.data.records[0].productName + " " + state.productSkusInfo.data.records[0].title : ""}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        "${state.productSkusInfo.code != null ? state.productSkusInfo.data.records[0].description : ""}"),
                                    Text(
                                      "剩余${state.productSkusInfo.code != null ? state.productSkusInfo.data.records[0].stock : ""}个",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
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
                                                    logic.handleReduceNumber();
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
                                        Text(state.defaultAddress.length > 10
                                            ? "${state.defaultAddress.substring(0, 10)}...."
                                            : state.defaultAddress),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                        height: ScreenUtil()
                                                            .setHeight(300.0),
                                                        color: Colors.amber,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: const Text(
                                                                "选择地址",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.0),
                                                              ),
                                                              color: Colors
                                                                  .pinkAccent,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          50.0),
                                                            ),
                                                            Flexible(
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: state
                                                                          .addressList
                                                                          .data
                                                                          .length,
                                                                      itemBuilder: (context,
                                                                              index) =>
                                                                          InkWell(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                                                                              child: Row(
                                                                                children: [
                                                                                  Container(
                                                                                    margin: EdgeInsets.only(right: ScreenUtil().setHeight(5.0)),
                                                                                    child: state.addressList.data[index].addressDetail == state.defaultAddress ? Icon(Icons.check) : Icon(Icons.location_on),
                                                                                  ),
                                                                                  Text(state.addressList.data[index].addressDetail)
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                              state.defaultAddress = state.addressList.data[index].addressDetail;
                                                                            },
                                                                          )),
                                                            )
                                                          ],
                                                        ));
                                                  });
                                            },
                                            child: Text(
                                                state.defaultAddress == ""
                                                    ? "选择地址"
                                                    : "更改地址"))
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(
                                  //       ScreenUtil().setWidth(5.0)),
                                  //   width: ScreenUtil().screenWidth,
                                  //   child: const Text(
                                  //     "为你推荐",
                                  //     style: TextStyle(
                                  //       fontSize: 16.0,
                                  //     ),
                                  //   ),
                                  //   color: Colors.pinkAccent,
                                  // ),
                                  // SizedBox(
                                  //   height: ScreenUtil().setHeight(240.0),
                                  //   child: GridView.count(
                                  //     crossAxisCount: 3,
                                  //     children: List.generate(
                                  //         state.recommendList.length, (index) {
                                  //       return InkWell(
                                  //         onTap: () {
                                  //           logic.onDelete;
                                  //           Get.offAndToNamed("/consumables_detail",
                                  //               arguments: state
                                  //                   .recommendList[index].id);
                                  //           log("arguments: state.recommendList[index].id:" +
                                  //               state.recommendList[index].id
                                  //                   .toString());
                                  //         },
                                  //         child: Container(
                                  //           padding: const EdgeInsets.only(
                                  //               left: 5.0),
                                  //           child: Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               SizedBox(
                                  //                 width:
                                  //                     ScreenUtil().screenWidth /
                                  //                             3 -
                                  //                         ScreenUtil()
                                  //                             .setWidth(10.0),
                                  //                 height: ScreenUtil()
                                  //                     .setHeight(80.0),
                                  //                 child: Image.network(state
                                  //                     .recommendList[index]
                                  //                     .avatar),
                                  //               ),
                                  //               Text(state.recommendList[index]
                                  //                       .productName +
                                  //                   " " +
                                  //                   state.recommendList[index]
                                  //                       .title),
                                  //               Text(
                                  //                 "剩余${state.recommendList[index].stock.toString()}个",
                                  //                 style: const TextStyle(
                                  //                     fontSize: 15.0),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }),
                                  //   ),
                                  // )
                                ],
                              )
                            ],
                          )),
                      Container(
                        key: state.evaluateWKey,
                        color: Colors.green,
                        height: ScreenUtil().setHeight(200),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("  评价"),
                                Expanded(child: Text("")),
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed("/consumables_evaluation",
                                          arguments: state.productSkusInfo.data
                                              .records[0].id);
                                    },
                                    child: Text("评价详情"))
                              ],
                            ),
                            Visibility(
                                visible: state.evaluation.length > 0,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5.0),
                                        bottom: ScreenUtil().setHeight(5.0)),
                                    width: ScreenUtil().screenWidth,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  ScreenUtil().setHeight(10.0)),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(
                                                    ScreenUtil()
                                                        .setHeight(5.0)),
                                                child: ClipOval(
                                                    child: Column(
                                                  children: [
                                                    Visibility(
                                                      visible: state
                                                              .evaluationAvatar ==
                                                          "",
                                                      child: Image.asset(
                                                        "assets/images/cat.png",
                                                        height: ScreenUtil()
                                                            .setHeight(30.0),
                                                        width: ScreenUtil()
                                                            .setHeight(30.0),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: state
                                                              .evaluationAvatar !=
                                                          "",
                                                      child: Image.network(
                                                        state.evaluationAvatar,
                                                        height: ScreenUtil()
                                                            .setHeight(30.0),
                                                        width: ScreenUtil()
                                                            .setHeight(30.0),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    )
                                                  ],
                                                )),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(state.evaluationName),
                                                  Text(
                                                      state.evaluationCreatedAt)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenUtil().setHeight(40.0),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10.0)),
                                              width: ScreenUtil().screenWidth -
                                                  ScreenUtil().setWidth(50.0),
                                              child: Text(
                                                  state.evaluation.length > 80
                                                      ? state.evaluation
                                                              .substring(
                                                                  0, 80) +
                                                          "......"
                                                      : state.evaluation),
                                            )
                                          ],
                                        )
                                      ],
                                    )))
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10.0)),
          child: Text("图文详情"),
        ),
        Visibility(
            visible: state.productSkusDetails.length == 0,
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(1000.0),
            )),
        Visibility(
            visible: state.productSkusDetails.length != 0,
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.productSkusDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                        state.productSkusDetails[index].avatar);
                  }),
            ))
      ],
    );
  }
}
