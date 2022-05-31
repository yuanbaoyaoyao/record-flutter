import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'address_management_logic.dart';

class AddressManagementPage extends StatelessWidget {
  final logic = Get.find<AddressManagementLogic>();
  final state = Get.find<AddressManagementLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地址管理"),
        centerTitle: true,
      ),
      body: ScreenUtilInit(
        builder: (context , child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "元宝尧尧",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("    "),
                                Text(
                                  "180****9340",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            Text("这是地区"),
                            Text("这是详细地址")
                          ],
                        ),
                        Expanded(child: Text("")),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了个人信息");
                    Get.toNamed("/address_management_details");
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          print("点击了新增地址");
          //使用address_management_details一样的模板
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 15,
            ),
            Text("新建收货地址"),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            elevation: MaterialStateProperty.all(0.0)),
      ),
    );
  }
}
