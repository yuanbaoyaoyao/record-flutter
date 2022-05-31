import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:record_flutter/common/utils/toast_util.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLogo() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: (90)),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: 160.0,
            ),
          ],
        ));
  }

  Widget _buildInputBox() {
    return
      Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Column(
              children: [
                TextFormField(
                    controller: controller.textAccountEditingController,
                    decoration: InputDecoration(
                        hintText: '请输入邮箱/用户名',
                        suffixIcon: Obx(() {
                          return Visibility(
                            visible: controller.state.hasAccountContent,
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.circleXmark,
                                  color: Color.fromRGBO(142, 142, 142, 1.0)),
                              onPressed: () {
                                controller.textAccountEditingController.clear();
                                controller.state.hasAccountContent = false;
                              },
                            ),
                          );
                        })),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        controller.state.hasAccountContent = true;
                      } else {
                        controller.state.hasAccountContent = false;
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '请输入邮箱';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: controller.textPasswordEditingController,
                    obscuringCharacter: "*",
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '请输入密码',
                        suffixIcon: Obx(() {
                          return Visibility(
                            visible: controller.state.hasPassWordContent,
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.circleXmark,
                                  color: Color.fromRGBO(142, 142, 142, 1.0)),
                              onPressed: () {
                                controller.textPasswordEditingController
                                    .clear();
                                controller.state.hasPassWordContent = false;
                              },
                            ),
                          );
                        })),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        controller.state.hasPassWordContent = true;
                      } else {
                        controller.state.hasPassWordContent = false;
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '请输入密码';
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 40.0)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.handleLogin();
                }
              },
              child: const Text('登录'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 100.0),
                child: TextButton(
                  onPressed: () {
                    print("点击了'忘记密码'");
                  },
                  child: const Text('忘记了密码?'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 100.0),
                child: TextButton(
                  onPressed: () {
                    print("点击了'注册'");
                    Get.toNamed("/register");
                  },
                  child: const Text('注册'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBottom() {
    return Container(
        margin: const EdgeInsets.only(top: 160.0),
        child: Column(
          children: [
            Text("其他登录方式"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child: IconButton(
                    icon: Image.asset("assets/images/dingding.png"),
                    onPressed: () {
                      print("点击了钉钉");
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.qq),
                    onPressed: () {
                      ToastUtil().showToast("暂不支持QQ登录");
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50.0),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.weixin),
                    onPressed: () {
                      ToastUtil().showToast("暂不支持微信登录");
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context , child) => Scaffold(
                body: SizedBox(
              height: ScreenUtil().screenHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: ScreenUtil().setHeight(30.0),
                    width: ScreenUtil().screenWidth,
                    child: GestureDetector(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            _buildLogo(),
                            _buildInputBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: _buildLoginBottom(),
                    bottom: ScreenUtil().setHeight(60.0),
                  )
                ],
              ),
            )));
  }
}
