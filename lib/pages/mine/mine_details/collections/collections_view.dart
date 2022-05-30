import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/red_dot_page.dart';
import 'collections_logic.dart';

class CollectionsPage extends StatelessWidget {
  final logic = Get.find<CollectionsLogic>();
  final state = Get.find<CollectionsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("收藏夹"),
          centerTitle: true,
          actions: [
            Obx(() {
              return TextButton(
                onPressed: () {
                  print("点击了编辑");
                  state.isEditing = !state.isEditing;
                },
                child: Text(
                  !state.isEditing ? "编辑" : "完成",
                  style: TextStyle(color: Colors.white),
                ),
              );
            })
          ],
        ),
        body: ScreenUtilInit(
          builder: () {
            return SingleChildScrollView(
                child: Column(
              children: _buildListRecommendNewConsumables(),
            ));
          },
        ),
        floatingActionButton: Obx(() {
          return Visibility(
            visible: !state.isEditing,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                print("点击了购物车");
                Get.toNamed("/cart");
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.shopping_cart,
                key: state.collectionKey,
                color: Colors.black,
              ),
            ),
          );
        }));
  }
}

List<Widget> _buildListRecommendNewConsumables() => List.generate(10, (index) {
      final collectionLogic = Get.find<CollectionsLogic>();
      final state = Get.find<CollectionsLogic>().state;
      return InkWell(
          onTap: () {
            print("点击了图标$index");
            Get.toNamed("/consumables_detail");
          },
          child: Container(
              height: ScreenUtil().setHeight(180),
              width: ScreenUtil().screenWidth,
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
                  Obx(() {
                    return Visibility(
                      visible: state.isEditing,
                      child: Container(
                        alignment: Alignment.center,
                        child: Radio(
                          value: null,
                          groupValue: null,
                          onChanged: (Null? value) {},
                        ),
                      ),
                    );
                  }),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/images/mock/88a1.png",
                      width: ScreenUtil().setWidth(160),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("这是标题"),
                        Text("这是描述"),
                        Row(
                          children: [
                            Text("这是剩余数量"),
                            Expanded(child: Text("")),
                            Builder(
                              builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                      print("点击了添加按钮");
                                      OverlayEntry? _overlayEntry =
                                          OverlayEntry(builder: (_) {
                                        RenderBox? box = context
                                            .findRenderObject() as RenderBox?;
                                        var offset =
                                            box!.localToGlobal(Offset.zero);
                                        return RedDotPage(
                                            startPosition: offset,
                                            endPosition:
                                                collectionLogic.endOffset);
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
                        )
                      ],
                    ),
                  )
                ],
              )));
    });
