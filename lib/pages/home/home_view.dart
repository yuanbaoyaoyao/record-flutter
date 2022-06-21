import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/widgets/appBar.dart';
import 'package:record_flutter/common/widgets/red_dot_page.dart';
import 'package:record_flutter/pages/application/application_logic.dart';
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
        body: SingleChildScrollView(
          controller: logic.tabsScrollController,
          child: ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: (context, child) => Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: ScreenUtil().setHeight(200),
                          child: buildHomeSwiper()),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                        child: buildHomeClassification(
                            context: context),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildNewOld(
                              textTitle: "旧耗材",
                              testDescription: "可能有宝藏哦ヽ(✿ﾟ▽ﾟ)ノ",
                            ),
                            buildNewOld(
                              textTitle: "新耗材",
                              testDescription: "我要的终于来了o(￣▽￣)ｄ",
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        key: state.tabsKey,
                        visible: !state.showTab,
                        child: Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: Row(
                            //获得这个组件的位置，到达最高点是，让顶部导航栏显示
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: _buildListTextButton(),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: _buildRecommendList(),
                        ),
                      )
                    ],
                  ))),
        ),
      );
    });
  }

  List<Widget> _buildRecommendList() => List.generate(8, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed("/consumables_detail");
              },
              child: Card(
                  child: Container(
                width: ScreenUtil().screenWidth / 2.1,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/mock/88a1.png"),
                    Text("这是标题"),
                    Text("这是描述"),
                    Row(
                      children: [
                        const Text(
                          "这是剩余数量",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const Expanded(child: Text("")),
                        Builder(
                          builder: (context) {
                            return IconButton(
                                onPressed: () {
                                  print("点击了添加按钮");
                                  OverlayEntry? _overlayEntry =
                                      OverlayEntry(builder: (_) {
                                    RenderBox? box = context.findRenderObject()
                                        as RenderBox?;
                                    var offset =
                                        box!.localToGlobal(Offset.zero);
                                    return RedDotPage(
                                        startPosition: offset,
                                        endPosition: appLogic.endOffset);
                                  });
                                  Overlay.of(context)?.insert(_overlayEntry);
                                  Future.delayed(
                                      const Duration(milliseconds: 800), () {
                                    _overlayEntry?.remove();
                                    _overlayEntry = null;
                                  });
                                },
                                icon: const Icon(Icons.add_circle_outline));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/consumables_detail");
              },
              child: Card(
                  child: Container(
                width: ScreenUtil().screenWidth / 2.1,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/mock/88a1.png"),
                    Text("这是标题"),
                    Text("这是描述"),
                    Row(
                      children: [
                        const Text(
                          "这是剩余数量",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const Expanded(child: Text("")),
                        Builder(
                          builder: (context) {
                            return IconButton(
                                onPressed: () {
                                  print("点击了添加按钮");
                                  OverlayEntry? _overlayEntry =
                                      OverlayEntry(builder: (_) {
                                    RenderBox? box = context.findRenderObject()
                                        as RenderBox?;
                                    var offset =
                                        box!.localToGlobal(Offset.zero);
                                    return RedDotPage(
                                        startPosition: offset,
                                        endPosition: appLogic.endOffset);
                                  });
                                  Overlay.of(context)?.insert(_overlayEntry);
                                  Future.delayed(Duration(milliseconds: 800),
                                      () {
                                    _overlayEntry?.remove();
                                    _overlayEntry = null;
                                  });
                                },
                                icon: Icon(Icons.add_circle_outline));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
            )
          ],
        );
      });

  List<Widget> _buildListTextButton() => List.generate(state.buttonNames.length, (index) {
        return InkWell(onTap: () {
          print("点击了图标$index");
          state.listPage = index;
        }, child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.buttonNames[index],
                style: TextStyle(
                    color:
                        state.listPage == index ? Colors.blue : Colors.black),
              ),
              Text(
                "button简介",
                style: TextStyle(
                    color:
                        state.listPage == index ? Colors.blue : Colors.black),
              ),
            ],
          );
        }));
      });
}
