import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/constant.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: null,
    automaticallyImplyLeading: false,
    title: TextFormField(
      autofocus: true,
      readOnly: true,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: -3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        fillColor: Colors.white,
        filled: true,
        hintText: '请输入搜索内容',
        suffix: Container(
            child: ElevatedButton.icon(
          onPressed: () {
            print("点击了搜索");
            Get.toNamed("/search");
          },
          icon: const Icon(
            Icons.search_outlined,
          ),
          label: const Text(
            "搜索",
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
              elevation: MaterialStateProperty.all(0.0)),
        )),
      ),
    ),
    actions: [
      Container(
        child: IconButton(
          onPressed: () {
            print("${SpUtil.getStringList(Constant.searchHistory)!}");
            Get.toNamed("/message_box");
          },
          icon: const Icon(
            Icons.mail_outline,
            size: 30.0,
          ),
        ),
        margin: const EdgeInsets.only(right: 8.0),
      )
    ],
    // title: Text("耗材管理系统"),
  );
}
