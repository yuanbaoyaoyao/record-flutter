import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'user_info_logic.dart';

class UserInfoPage extends StatelessWidget {
  final logic = Get.find<UserInfoLogic>();
  final state = Get.find<UserInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true,
      ),
      body: ScreenUtilInit(
        builder: (context , child) {
          return Container(
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text("头像"),
                        Expanded(child: Text("")),
                        Container(
                          margin: EdgeInsets.only(right: 15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/dingding.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了头像");
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text("用户名"),
                        Expanded(child: Text("")),
                        Container(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("元宝尧尧"),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了用户名");
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
