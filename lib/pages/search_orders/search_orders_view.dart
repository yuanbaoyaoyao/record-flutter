import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'search_orders_logic.dart';

class SearchOrdersPage extends GetView<SearchOrdersLogic> {
  final logic = Get.find<SearchOrdersLogic>();
  final state = Get
      .find<SearchOrdersLogic>()
      .state;

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 30.0,
      title: TextFormField(
        controller: controller.textSearchOrdersEditingController,
        decoration: InputDecoration(
            isCollapsed: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: -3),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
            fillColor: Colors.white,
            filled: true,
            hintText: '商品名称/订单编号',
            suffix: ElevatedButton.icon(
              onPressed: () {
                if (controller.textSearchOrdersEditingController.text != "") {
                  Get.offNamed("/search_orders_details",
                      arguments:
                      controller.textSearchOrdersEditingController.text);
                  controller.putSearchOrdersHistory(
                      controller.textSearchOrdersEditingController.text);
                } else {
                  EasyLoading.showToast("请输入搜索内容");
                }
              },
              icon: const Icon(Icons.search_outlined),
              label: const Text("搜索"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
                  elevation: MaterialStateProperty.all(0.0)),
            )),
        onTap: () {},
      ),
    );
  }

  //再加一个探索发现，后端直接来个接口
  Widget _buildBodyView() {
    return Column(
      children: [
        Obx(() {
          return Visibility(
            visible: controller.state.hasOrdersHistory,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text("历史记录"),
                      margin: EdgeInsets.only(left: 10.0),
                    ),
                    //撑开
                    const Expanded(child: Text("")),
                    Visibility(
                      visible: !state.onDeleteOrdersHistory,
                      child: IconButton(
                          onPressed: () {
                            state.onDeleteOrdersHistory = true;
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                    Visibility(
                        visible: state.onDeleteOrdersHistory,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    logic.clearSearchOrdersHistory();
                                    state.onDeleteOrdersHistory = false;
                                  },
                                  child: const Text("全部删除",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              28, 28, 28, 1.0)))),
                              const Text("|"),
                              TextButton(
                                  onPressed: () {
                                    state.onDeleteOrdersHistory = false;
                                  },
                                  child: const Text(
                                    "完成",
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: !state.onDeleteOrdersHistory,
                          child: Wrap(
                            children: _buildActionHistoryChip(),
                          ),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: state.onDeleteOrdersHistory,
                          child: Wrap(
                            children: _buildHistoryChip(),
                          ),
                        );
                      }),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.0),
                )
              ],
            ),
          );
        })
      ],
    );
  }

  List<Widget> _buildActionHistoryChip() =>
      List.generate(controller.state.searchOrdersHistory.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          child: ActionChip(
              label: Text("${controller.state.searchOrdersHistory[index]}"),
              onPressed: () {
                Get.toNamed("/search_orders_details",
                    arguments: controller.state.searchOrdersHistory[index]
                        .toString());
              }),
        );
      });

  List<Widget> _buildHistoryChip() =>
      List.generate(controller.state.searchOrdersHistory.length, (index) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            child: Chip(
              label: Text("${controller.state.searchOrdersHistory[index]}"),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () {
                logic.deleteOneSearchOrdersHistory(
                    controller.state.searchOrdersHistory[index]);
              },
            ));
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyView(),
    );
  }
}
