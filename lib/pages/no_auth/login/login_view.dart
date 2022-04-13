import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLogo() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: (60)),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: 160.0,
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: (5.0)),
            //   child: const Text(
            //     '耗材管理系统',
            //     style: TextStyle(
            //       fontSize: 50.0,
            //     ),
            //   ),
            // ),
          ],
        ));
  }

  Widget _buildInputBox() {
    return Form(
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
                        hintText: '请输入邮箱',
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
                    }
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '请输入密码';
                    //   } else {
                    //     return null;
                    //   }
                    // }
                    ),
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
                              controller.textPasswordEditingController.clear();
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
                  // validator: (String? value) {
                  //   if (value == null || value.isEmpty) {
                  //     return '请输入密码';
                  //   } else {
                  //     return null;
                  //   }
                  // }
                ),
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
                // Get.offNamed("/application");
                if (_formKey.currentState!.validate()) {
                  print("点击了登录");
                }
              },
              child: const Text('登录'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: TextButton(
              onPressed: () {
                print("点击了'忘记密码'");
              },
              child: const Text('忘记了密码?'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginBottom() {
    return Container(
        margin: const EdgeInsets.only(top: 200.0),
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
                      print("点击了QQ");
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50.0),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.weixin),
                    onPressed: () {
                      print("点击了微信");
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
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      body: GestureDetector(
        // onTap: () => Get.offAndToNamed(AppRoutes.Application),

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildLogo(),
              _buildInputBox(),
              _buildLoginBottom()
            ],
          ),
        ),
      ),
    );
  }
}
