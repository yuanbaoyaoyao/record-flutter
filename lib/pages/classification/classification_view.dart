import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/widgets/appBar.dart';

import 'classification_logic.dart';

class ClassificationPage extends GetView<ClassificationLogic> {
  final logic = Get.find<ClassificationLogic>();
  final state = Get.find<ClassificationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: buildAppBar(),
        body: Row(
          children: [
            _leftCategoryNav(),
            Expanded(
                child: Container(
              color: Colors.white,
              child: _rightCatePageView(),
            )),
          ],
        ),
      ),
    );
  }
}

Widget _rightCatePageView() {
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
  //listView.builder
  return Flexible(
    child: ListView.builder(
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
                          IconButton(
                              onPressed: () {
                                print("点击了iconButton");
                              },
                              icon: Icon(Icons.add_circle_outline_outlined)),
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
          // border: Border.all(color: Colors.grey, width: 1),
          // borderRadius: const BorderRadius.only(
          //     topRight: Radius.circular(5.0),
          //     bottomRight: Radius.circular(5.0))
        ),
        height: ScreenUtil().setHeight(60),
        padding: const EdgeInsets.only(left: 15, top: 20),
        child: const Text("123"),
      );
    }),
    onTap: () {
      print("点击了种类");
      logic.clearNavActive();
      state.navActive[index] = true;
    },
  );
}
