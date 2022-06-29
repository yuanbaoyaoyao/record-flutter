import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        builder: (context, child) {
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
                        Obx(() {
                          return Container(
                            margin: EdgeInsets.only(right: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey),
                            child: ClipOval(
                              child: Image.network(
                                state.avatar == ""
                                    ? "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.616pic.com%2Fys_bnew_img%2F00%2F10%2F83%2F54xXAJVRIn.jpg&refer=http%3A%2F%2Fpic.616pic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658843958&t=e3c3bd7f7ece9b1b061098f435ffcd1f"
                                    : state.avatar,
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        }),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: ScreenUtil().setHeight(200.0),
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: TextButton(
                                              onPressed: () {
                                                print("点击了选择图片");
                                                state.isGallery = true;
                                                logic.handleGetImage(context);
                                              },
                                              child: Text("选择图片")),
                                          width: ScreenUtil().screenWidth / 3,
                                          height: ScreenUtil().setHeight(100.0),
                                          color: Colors.green,
                                        ),
                                        Container(
                                          child: TextButton(
                                            onPressed: () {
                                              print("点击了使用相机");
                                              state.isCamera = true;
                                              logic.handleGetImage(context);
                                            },
                                            child: Text("使用相机"),
                                          ),
                                          width: ScreenUtil().screenWidth / 3,
                                          height: ScreenUtil().setHeight(100.0),
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Text("")),
                                  Container(
                                    width: ScreenUtil().screenWidth,
                                    color: Colors.green,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("取消")),
                                  ),
                                ],
                              ));
                        });
                  },
                ),
                InkWell(
                  child: Obx(() {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Text("用户名"),
                          Expanded(child: Text("")),
                          Container(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Text(
                              state.userName,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  }),
                  onTap: () {
                    EasyLoading.showToast("请联系管理员修改用户名");
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
