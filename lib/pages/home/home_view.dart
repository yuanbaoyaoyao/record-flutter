import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:record_flutter/common/widgets/appBar.dart';
import 'package:record_flutter/common/widgets/red_dot_page.dart';
import 'package:record_flutter/pages/application/application_logic.dart';
import 'package:record_flutter/pages/home/home_state.dart';
import 'package:record_flutter/pages/home/widgets/home_appbar.dart';
import 'package:record_flutter/pages/home/widgets/home_classification.dart';
import 'package:record_flutter/pages/home/widgets/home_new_old.dart';
import 'package:record_flutter/pages/home/widgets/home_swiper.dart';

import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  final appLogic = Get.find<ApplicationLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: state.showTab ? buildHomeAppBar() : buildAppBar(),
          body: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) =>
                SmartRefresher(
                controller: logic.refreshController,
                onRefresh: logic.onRefresh,
                onLoading: logic.onLoading,
                enablePullDown: true,
                enablePullUp: true,
                // scrollController: logic.tabsScrollController,
                child: Container(
                    color: Colors.grey,
                    child: MediaQuery.removePadding(
                      context: context,
                      child: ListView(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        controller: logic.tabsScrollController,
                        children: [
                          SizedBox(
                              height: ScreenUtil().setHeight(200),
                              child: buildHomeSwiper()),
                          Container(
                            margin:
                                EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                            child: buildHomeClassification(context: context),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(8)),
                              height: ScreenUtil().setHeight(140.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildNewOld(
                                    isOld: true,
                                    textTitle: "旧耗材",
                                    testDescription: "可能有宝藏哦ヽ(✿ﾟ▽ﾟ)ノ",
                                  ),
                                  buildNewOld(
                                    isOld: false,
                                    textTitle: "新耗材",
                                    testDescription: "我要的终于来了o(￣▽￣)ｄ",
                                  ),
                                ],
                              )),
                          Visibility(
                            key: state.tabsKey,
                            visible: !state.showTab,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(8)),
                              child: Row(
                                //获得这个组件的位置，到达最高点是，让顶部导航栏显示
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: _buildListTextButton(),
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: Obx(() {
                                return GridView.count(
                                    childAspectRatio: 9 / 10,
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: List.generate(
                                        state.productSkus.length, (index) {
                                      return Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed("/consumables_detail",
                                                  arguments: state
                                                      .productSkus[index].id);
                                            },
                                            child: Card(
                                                child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              width: ScreenUtil().screenWidth /
                                                  2.1,
                                              //     width:0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Image.network(
                                                      state.productSkus[index]
                                                          .avatar,
                                                      fit: BoxFit.cover,
                                                      height: ScreenUtil()
                                                          .setHeight(110.0),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                  Text(state.productSkus[index]
                                                          .productName +
                                                      ' ' +
                                                      state.productSkus[index]
                                                          .title),
                                                  Text(state.productSkus[index]
                                                      .description),
                                                  Flexible(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "剩余${state.productSkus[index].stock.toString()}个",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      20.0),
                                                        ),
                                                        Builder(
                                                            builder: (context) {
                                                          return IconButton(
                                                              onPressed: () {
                                                                logic.handleAddIntoCart(
                                                                    state
                                                                        .productSkus[
                                                                            index]
                                                                        .id,
                                                                    1);
                                                                OverlayEntry?
                                                                    _overlayEntry =
                                                                    OverlayEntry(
                                                                        builder:
                                                                            (_) {
                                                                  RenderBox?
                                                                      box =
                                                                      context.findRenderObject()
                                                                          as RenderBox?;
                                                                  var offset = box!
                                                                      .localToGlobal(
                                                                          Offset
                                                                              .zero);
                                                                  return RedDotPage(
                                                                      startPosition:
                                                                          offset,
                                                                      endPosition:
                                                                          appLogic
                                                                              .endOffset);
                                                                });
                                                                Overlay.of(
                                                                        context)
                                                                    ?.insert(
                                                                        _overlayEntry);
                                                                Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            800),
                                                                    () {
                                                                  _overlayEntry
                                                                      ?.remove();
                                                                  _overlayEntry =
                                                                      null;
                                                                });
                                                              },
                                                              icon: const Icon(Icons
                                                                  .add_circle_outline));
                                                          // );
                                                        })
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                          ),
                                        ],
                                      );
                                    }));
                              }))
                        ],
                      ),
                      removeTop: true,
                    ))),
          ));
    });
  }

  List<Widget> _buildListTextButton() =>
      List.generate(state.buttonNames.length, (index) {
        return InkWell(onTap: () {
          print("点击了图标$index");
          state.listPage = index;
          logic.tabController.index = index;
          logic.getListByType();
        }, child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: ScreenUtil().screenWidth / 4,
                child: Text(
                  state.buttonNames[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          state.listPage == index ? Colors.blue : Colors.black),
                ),
              ),
              Visibility(
                  visible: state.buttonNames[index] == "打印机相关",
                  child: Icon(
                    Icons.print,
                    size: 20.0,
                    color: state.listPage == index ? Colors.blue : Colors.black,
                  )),
              Visibility(
                  visible: state.buttonNames[index] == "显示器电脑",
                  child: Icon(
                    Icons.computer,
                    size: 20.0,
                    color: state.listPage == index ? Colors.blue : Colors.black,
                  )),
              Visibility(
                  visible: state.buttonNames[index] == "电脑周边",
                  child: Icon(
                    Icons.usb,
                    size: 20.0,
                    color: state.listPage == index ? Colors.blue : Colors.black,
                  )),
              Visibility(
                  visible: state.buttonNames[index] == "其他",
                  child: Icon(
                    Icons.color_lens,
                    size: 20.0,
                    color: state.listPage == index ? Colors.blue : Colors.black,
                  ))
            ],
          );
        }));
      });
}
