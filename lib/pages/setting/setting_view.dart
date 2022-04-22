import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        centerTitle: true,
      ),
      body:
      ScreenUtilInit(
        builder: () {
          return Container(
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.person),
                        ),
                        Text("个人信息"),
                        Expanded(child: Text("")),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了个人信息");
                    Get.toNamed("/user_info");
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.edit_location),
                        ),
                        Text("收货地址管理"),
                        Expanded(child: Text("")),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了收货地址管理");
                    Get.toNamed("/address_management");
                  },
                ),
                InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.password_rounded),
                        ),
                        Text("密码修改"),
                        Expanded(child: Text("")),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了密码修改");
                    Get.toNamed("/password_management");
                  },
                ),
                InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.info_outline),
                        ),
                        Text("关于我们"),
                        Expanded(child: Text("")),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    print("点击了关于我们");
                    Get.toNamed("/about_me");
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          print("点击了退出登录");
        },
        child: Text("退出登录"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            elevation: MaterialStateProperty.all(0.0)),
      ),
    );
  }
// Widget _buildBottomButton(){
//   return
// }
}
