import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/res/constant.dart';
import 'package:sp_util/sp_util.dart';

import 'search_logic.dart';

class SearchPage extends GetView<SearchLogic> {
  final logic = Get.find<SearchLogic>();
  final state = Get.find<SearchLogic>().state;

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 30.0,
      title: TextFormField(
        controller: controller.textSearchEditingController,
        decoration: InputDecoration(
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: -3),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
            fillColor: Colors.white,
            filled: true,
            hintText: '请输入搜索内容',
            suffix: ElevatedButton.icon(
              onPressed: () {
                print("点击了搜索");
                print("搜索内容为:${controller.textSearchEditingController.text}");
                controller.putSearchHistory(
                    controller.textSearchEditingController.text);
                print(
                    "localStorage中存储内容为:${SpUtil.getStringList(Constant.searchHistory)}");
              },
              icon: const Icon(Icons.search_outlined),
              label: const Text("搜索"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
                  elevation: MaterialStateProperty.all(0.0)),
            )),
        onTap: () {
          print("点击了title");
        },
      ),
    );
  }

  Widget _buildBodyView() {
    return Column(
      children: [
        Obx(() {
          return Visibility(
            visible: controller.state.hasHistory,
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
                      visible: !state.onDeleteHistory,
                      child: IconButton(
                          onPressed: () {
                            print("点击了删除");
                            state.onDeleteHistory = true;
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                    Visibility(
                        visible: state.onDeleteHistory,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    logic.clearSearchHistory();
                                    state.onDeleteHistory = false;
                                    print("点击了全部删除");
                                  },
                                  child: const Text("全部删除",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              28, 28, 28, 1.0)))),
                              const Text("|"),
                              TextButton(
                                  onPressed: () {
                                    state.onDeleteHistory = false;
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
                          visible: !state.onDeleteHistory,
                          child: Wrap(
                            children: _buildActionHistoryChip(),
                          ),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: state.onDeleteHistory,
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
      List.generate(controller.state.searchHistory.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          child: ActionChip(
              label: Text("${controller.state.searchHistory[index]}"),
              onPressed: () {
                print("点击了标签");
              }),
        );
      });

  List<Widget> _buildHistoryChip() =>
      List.generate(controller.state.searchHistory.length, (index) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            child: Chip(
              label: Text("${controller.state.searchHistory[index]}"),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () {
                print("点击了标签删除图标");
                print("要删除的标签为${controller.state.searchHistory[index]}");
                logic.deleteOneSearchHistory(
                    controller.state.searchHistory[index]);
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
