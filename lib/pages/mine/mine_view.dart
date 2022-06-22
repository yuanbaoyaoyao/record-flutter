import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/widgets/red_dot_page.dart';
import '../application/application_logic.dart';
import 'mine_logic.dart';
import 'widgets/order_widget.dart';
import 'widgets/service_widget.dart';

class MinePage extends StatelessWidget {
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("点击了搜索按钮");
                  Get.toNamed("/search");
                },
                icon: Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {
                  print("点击了设置按钮");
                  Get.toNamed("/setting");
                },
                icon: Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  print("点击了消息盒子");
                  Get.toNamed("/message_box");
                },
                icon: Icon(Icons.mail_outline)),
          ],
        ),
        body: SmartRefresher(
            controller: logic.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            child: ScreenUtilInit(
              builder: (context, child) {
                return SingleChildScrollView(
                    child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/user_info");
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/dingding.png",
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const Text("这是名称")
                              ],
                            ),
                          )),
                      orderWidget(),
                      serviceWidget(),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.music_note),
                                  Text("为你推荐"),
                                  Icon(Icons.music_note),
                                ],
                              ),
                              width: 180.0,
                            ),
                            Column(
                              children: _buildRecommendList(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
              },
            )));
  }

  List<Widget> _buildRecommendList() => List.generate(8, (index) {
        final appLogic = Get.find<ApplicationLogic>();
        return Row(
          children: [
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
                        Expanded(child: Text("")),
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
                        Text(
                          "这是剩余数量",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Expanded(child: Text("")),
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
}
