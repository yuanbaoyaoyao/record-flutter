import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buildNewOld({
  required textTitle,
  required testDescription,
  required onTapInfo,
}) {
  return Card(
    child: Container(
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
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/mock/88a1.png",
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.contain,
                      ),
                      Text(onTapInfo)
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/mock/88a1.png",
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.contain,
                      ),
                      Text(onTapInfo)
                    ],
                  )
                ],
              )
            ],
          ),
        )),
  );
}
