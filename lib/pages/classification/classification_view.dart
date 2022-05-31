import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/widgets/appBar.dart';

import '../../common/widgets/red_dot_page.dart';
import '../application/application_logic.dart';
import 'classification_logic.dart';

class ClassificationPage extends GetView<ClassificationLogic> {
  final logic = Get.find<ClassificationLogic>();
  final state = Get.find<ClassificationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context , child) => Scaffold(
        appBar: buildAppBar(),
        body: Row(
          children: [
            _leftCategoryNav(),
            Expanded(
                child: Container(
              color: Colors.white,
              child: rightCatePageView(),
            )),
          ],
        ),
      ),
    );
  }
}

Widget rightCatePageView() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  print("点击了TextButton");
                },
                child: Text("综合")),
            TextButton(
                onPressed: () {
                  print("点击了TextButton");
                },
                child: Text("销量")),
            TextButton(
                onPressed: () {
                  print("点击了TextButton");
                },
                child: Text("库存量")),
            TextButton(
                onPressed: () {
                  print("点击了TextButton");
                },
                child: Text("筛选")),
          ],
        ),
      ),
      _buildConsumables()
    ],
  );
}

Widget _buildConsumables() {
  final appLogic = Get.find<ApplicationLogic>();

  //listView.builder
  return Flexible(
    child:
    ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => GestureDetector(
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/mock/88a1.png",
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("标题"),
                      Text("描述"),
                      Row(
                        children: [
                          Text("数量"),
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
                  )),
                ],
              ),
              onTap: () {
                Get.toNamed("/consumables_detail");
              },
            )),
  );
}

Widget _leftCategoryNav() {
  final state = Get.find<ClassificationLogic>().state;

  return Container(
    width: ScreenUtil().setWidth(60),
    child: ListView.builder(
        itemCount: state.navButtonCount,
        itemBuilder: (context, index) => _leftInkWell(index)),
  );
}

Widget _leftInkWell(int index) {
  final state = Get.find<ClassificationLogic>().state;
  final logic = Get.find<ClassificationLogic>();

  return InkWell(
    child: Obx(() {
      return Container(
          decoration: BoxDecoration(
            color: state.navActive[index] ? Colors.white : Colors.grey,
          ),
          height: ScreenUtil().setHeight(60),
          child: Container(
            alignment: Alignment.center,
            child: const Text("222"),
            height: ScreenUtil().setHeight(40),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 5.0,
                        color: state.navActive[index]
                            ? Colors.black
                            : Colors.grey)),
                color: Colors.blueAccent),
          ));
    }),
    onTap: () {
      print("点击了种类");
      logic.clearNavActive();
      state.navActive[index] = true;
    },
  );
}
