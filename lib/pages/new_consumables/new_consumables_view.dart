import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/new_consumables/widgets/custom_appbar.dart';

import '../../common/widgets/red_dot_page.dart';
import 'new_consumables_logic.dart';

class NewConsumablesPage extends StatelessWidget {
  final logic = Get.find<NewConsumablesLogic>();
  final state = Get.find<NewConsumablesLogic>().state;

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
                          width: ScreenUtil().screenWidth,
                          child: Image.asset(
                            "assets/images/mock/88a1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.solidHeart),
                              Text(
                                "本期推荐",
                                style: TextStyle(fontSize: 20),
                              ),
                              FaIcon(FontAwesomeIcons.solidHeart),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                            children: _buildListRecommendNewConsumables(),
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

  List<Widget> _buildListRecommendNewConsumables() =>
      List.generate(state.productSkus.data.length, (index) {
        final logic = Get.find<NewConsumablesLogic>();
        return InkWell(
            onTap: () {
              Get.toNamed("/consumables_detail",
                  arguments: state.productSkus.data[index].productSkusId);
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
                        state.productSkus.data[index].avatar,
                        width: ScreenUtil().setWidth(160),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.productSkus.data[index].productName +
                            ' ' +
                            state.productSkus.data[index].productSkusName),
                        Text(state.productSkus.data[index].description),
                        Container(
                            width: ScreenUtil().setWidth(170),
                            color: Colors.red,
                            child: Row(
                              children: [
                                Text(
                                    "剩余${state.productSkus.data[index].stock}个"),
                                Expanded(child: Text("")),
                                Builder(
                                  builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          logic.handleAddIntoCart(
                                              state.productSkus.data[index].id, 1);
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
