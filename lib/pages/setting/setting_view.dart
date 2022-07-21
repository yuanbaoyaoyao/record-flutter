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
      body: ScreenUtilInit(
        builder: (context, child) {
          return Container(
            color: Colors.grey,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    color: Colors.white,
                    margin:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(0.5)),
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
                    color: Colors.white,
                    margin:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(0.5)),
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
                    Get.toNamed("/address_management");
                  },
                ),
                InkWell(
                  child: Container(
                    color: Colors.white,
                    margin:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(0.5)),
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
                    Get.toNamed("/password_management");
                  },
                ),
                InkWell(
                  child: Container(
                    color: Colors.white,
                    margin:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(0.5)),
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
                    Get.toNamed("/about_me");
                  },
                ),
                InkWell(
                  child: Container(
                      width: ScreenUtil().screenWidth,
                      alignment: Alignment.topCenter,
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: const Text(
                        "退出登录",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      )),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertDialog(
                              title: Text("提示"),
                              content: Text("是否退出登录"),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancle'),
                                    child: Text("取消")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancle');
                                      logic.handleLogOut();
                                    },
                                    child: Text("确定")),
                              ],
                            ));
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
