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
      // leading: null,
      // automaticallyImplyLeading: false,
      leadingWidth: 30.0,
      title: TextFormField(
        controller: controller.textSearchEditingController,
        decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: -3),
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
                      const Text("历史记录"),
                      //撑开
                      const Expanded(child: Text("")),
                      IconButton(
                          onPressed: () {
                            print("点击了删除");
                            logic.clearSearchHistory();
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                  Container(
                    child: Wrap(
                      children: _buildHistoryChip(),
                    ),
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15.0),
                  )
                ],
              ));
        })
      ],
    );
  }

  List<Widget> _buildHistoryChip() =>
      List.generate(controller.state.searchHistory.length, (index) {
        return ActionChip(
            label: Text("${controller.state.searchHistory[index]}"),
            onPressed: () {
              print("点击了标签");
            });
      });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyView(),
    );
  }
}
