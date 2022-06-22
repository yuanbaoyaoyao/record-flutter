import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home_logic.dart';

final logic = Get.find<HomeLogic>();
final state = Get.find<HomeLogic>().state;

Widget buildNewOld({
  required textTitle,
  required testDescription,
}) {
  return Card(child: Obx(() {
    return Container(
        width: ScreenUtil().screenWidth * (0.47),
        child: GestureDetector(
          onTap: () {
            print("点击了旧耗材");
            Get.toNamed("/old_consumables");
          },
          child: Column(
            children: [
              Text(textTitle),
              Text(testDescription),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: textTitle == "旧耗材" && state.oldProducts.length > 0,
                    child: Column(
                      children: [
                        Image.network(
                          state.oldProducts.length > 0
                              ? state.oldProducts[0].avatar
                              : "",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            "剩余${state.oldProducts.length > 0 ? state.oldProducts[0].stock : ""}个")
                      ],
                    ),
                  ),
                  Visibility(
                    visible: textTitle == "旧耗材" && state.oldProducts.length > 1,
                    child: Column(
                      children: [
                        Image.network(
                          state.oldProducts.length > 0
                              ? state.oldProducts[1].avatar
                              : "",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            "剩余${state.oldProducts.length > 0 ? state.oldProducts[1].stock : ""}个")
                      ],
                    ),
                  ),
                  Visibility(
                    visible: textTitle == "新耗材" && state.newProducts.length > 0,
                    child: Column(
                      children: [
                        Image.network(
                          state.newProducts.length > 0
                              ? state.newProducts[0].avatar
                              : "",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            "剩余${state.newProducts.length > 0 ? state.newProducts[0].stock : ""}个")
                      ],
                    ),
                  ),
                  Visibility(
                    visible: textTitle == "新耗材" && state.newProducts.length > 1,
                    child: Column(
                      children: [
                        Image.network(
                          state.newProducts.length > 0
                              ? state.newProducts[1].avatar
                              : "",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            "剩余${state.newProducts.length > 0 ? state.newProducts[1].stock : ""}个")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }));
}
