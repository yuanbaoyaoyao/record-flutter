import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/widgets/appBar.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/widgets/red_dot_page.dart';
import '../application/application_logic.dart';
import 'classification_logic.dart';

final logic = Get.find<ClassificationLogic>();
final state = Get.find<ClassificationLogic>().state;

class ClassificationPage extends GetView<ClassificationLogic> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
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
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      state.onTapType = 1;
                      logic.getList();
                    },
                    style: state.onTapType == 1
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey))
                        : null,
                    child: Text("综合")),
                TextButton(
                    onPressed: () {
                      state.onTapType = 2;
                      logic.getList();
                    },
                    style: state.onTapType == 2
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey))
                        : null,
                    child: Text("销量")),
                TextButton(
                    onPressed: () {
                      state.onTapType = 3;
                      logic.getList();
                    },
                    style: state.onTapType == 3
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey))
                        : null,
                    child: Text("库存量")),
                TextButton(
                    onPressed: () {
                      state.onTapType = 4;
                      logic.getList();
                    },
                    style: state.onTapType == 4
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey))
                        : null,
                    child: Text("我常买")),
              ],
            );
          })),
      _buildConsumables()
    ],
  );
}

Widget _buildConsumables() {
  final appLogic = Get.find<ApplicationLogic>();

  //listView.builder
  return Flexible(
      child: SmartRefresher(
          controller: logic.refreshController,
          onRefresh: logic.onRefresh,
          onLoading: logic.onLoading,
          enablePullDown: true,
          enablePullUp: true,
          child: Obx(() {
            return ListView.builder(
                itemCount: state.productSkus.length,
                itemBuilder: (context, index) => GestureDetector(
                      child: Row(
                        children: [
                          Image.network(
                            state.productSkus[index].avatar,
                            width: 100.0,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.productSkus[index].productName +
                                  ' ' +
                                  state.productSkus[index].title),
                              Text(state.productSkus[index].description),
                              Row(
                                children: [
                                  Text("剩余${state.productSkus[index].stock}个"),
                                  Expanded(child: Text("")),
                                  Builder(
                                    builder: (context) {
                                      return IconButton(
                                          onPressed: () {
                                            logic.handleAddIntoCart(
                                                state.productSkus[index].id, 1);
                                            OverlayEntry? _overlayEntry =
                                                OverlayEntry(builder: (_) {
                                              RenderBox? box =
                                                  context.findRenderObject()
                                                      as RenderBox?;
                                              var offset = box!
                                                  .localToGlobal(Offset.zero);
                                              return RedDotPage(
                                                  startPosition: offset,
                                                  endPosition:
                                                      appLogic.endOffset);
                                            });
                                            Overlay.of(context)
                                                ?.insert(_overlayEntry);
                                            Future.delayed(
                                                Duration(milliseconds: 800),
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
                        // Get.toNamed("/consumables_detail");
                        EasyLoading.showToast("是否已登录:" +
                            SpUtil.getBool(UserConstant.isLogin).toString());
                      },
                    ));
          })));
}

Widget _leftCategoryNav() {
  final state = Get.find<ClassificationLogic>().state;

  return Container(
      width: ScreenUtil().setWidth(60),
      child: Obx(() {
        return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) => _leftInkWell(index));
      }));
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
            child: Text(state.products[index].title),
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
      logic.handleChangeNavButton(index);
    },
  );
}
