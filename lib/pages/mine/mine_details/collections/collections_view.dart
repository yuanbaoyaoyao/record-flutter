import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/collections/collections_logic.dart';
import 'package:record_flutter/pages/mine/mine_details/collections/widgets/custom_appbar.dart';

import '../../../../common/widgets/red_dot_page.dart';

class CollectionsPage extends StatelessWidget {
  final logic = Get.find<CollectionsLogic>();
  final state = Get.find<CollectionsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
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
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "我的收藏",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                            children: _buildListRecommendOldConsumables(),
                          );
                        })
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
                      ],
                    )),
              ],
            ),
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            print("点击了购物车");
            Get.toNamed("/cart");
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.shopping_cart,
            key: state.oldNewCartKey,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildListRecommendOldConsumables() =>
      List.generate(state.productSkus.length, (index) {
        return InkWell(
            onTap: () {
              Get.toNamed("/consumables_detail",
                  arguments: state.productSkus[index].productSkusId);
            },
            child: Container(
                height: ScreenUtil().setHeight(180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(5.0),
                    vertical: ScreenUtil().setHeight(5.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Image.network(
                        state.productSkus[index].avatar,
                        width: ScreenUtil().setWidth(160),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.productSkus[index].productName +
                            ' ' +
                            state.productSkus[index].title),
                        Text(state.productSkus[index].description),
                        Container(
                            width: ScreenUtil().setWidth(170),
                            color: Colors.red,
                            child: Row(
                              children: [
                                Text("剩余${state.productSkus[index].stock}个"),
                                Expanded(child: Text("")),
                                Builder(
                                  builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          print("点击了添加按钮");
                                          OverlayEntry? _overlayEntry =
                                              OverlayEntry(builder: (_) {
                                            RenderBox? box =
                                                context.findRenderObject()
                                                    as RenderBox?;
                                            var offset =
                                                box!.localToGlobal(Offset.zero);
                                            return RedDotPage(
                                                startPosition: offset,
                                                endPosition: logic.endOffset);
                                          });
                                          Overlay.of(context)
                                              ?.insert(_overlayEntry);
                                          Future.delayed(
                                              Duration(milliseconds: 800), () {
                                            _overlayEntry?.remove();
                                            _overlayEntry = null;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                        ));
                                  },
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                )));
      });
}
