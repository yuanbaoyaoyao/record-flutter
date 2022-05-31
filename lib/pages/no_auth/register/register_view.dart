import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'register_logic.dart';

class RegisterPage extends GetView<RegisterLogic> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLogo() {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/logo_no_fonts.png",
              width: 160.0,
            ),
            const Text(
              "注册账号",
              style: TextStyle(
                fontSize: 30.0,
              ),
            )
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
                    controller: controller.textNameEditingController,
                    decoration: InputDecoration(
                        hintText: '请输入名字',
                        suffixIcon: Obx(() {
                          return Visibility(
                            visible: controller.state.hasNameContent,
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.circleXmark,
                                  color: Color.fromRGBO(142, 142, 142, 1.0)),
                              onPressed: () {
                                controller.textNameEditingController.clear();
                                controller.state.hasNameContent = false;
                              },
                            ),
                          );
                        })),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        controller.state.hasNameContent = true;
                      } else {
                        controller.state.hasNameContent = false;
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '请输入名字';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: controller.textEmailEditingController,
                    decoration: InputDecoration(
                        hintText: '请输入邮箱',
                        suffixIcon: Obx(() {
                          return Visibility(
                              visible: controller.state.hasEmailContent,
                              child: SizedBox(
                                width: ScreenUtil().screenWidth / 2.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible: controller.state.countDown == 0,
                                      child: TextButton(
                                          onPressed: () {
                                            controller.handleSendEmailCode();
                                          },
                                          child: const Text("发送验证码")),
                                    ),
                                    Obx(() {
                                      return Visibility(
                                          visible:
                                              controller.state.countDown > 0,
                                          child: Text(
                                              "剩余${controller.state.countDown}秒重发"));
                                    }),
                                    IconButton(
                                      icon: const FaIcon(
                                          FontAwesomeIcons.circleXmark,
                                          color: Color.fromRGBO(
                                              142, 142, 142, 1.0)),
                                      onPressed: () {
                                        controller.textEmailEditingController
                                            .clear();
                                        controller.state.hasEmailContent =
                                            false;
                                      },
                                    )
                                  ],
                                ),
                              ));
                        })),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        controller.state.hasEmailContent = true;
                      } else {
                        controller.state.hasEmailContent = false;
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
                    controller: controller.textEmailCodeEditingController,
                    decoration: InputDecoration(
                        hintText: '请输入邮箱验证码',
                        suffixIcon: Obx(() {
                          return Visibility(
                            visible: controller.state.hasEmailCodeContent,
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.circleXmark,
                                  color: Color.fromRGBO(142, 142, 142, 1.0)),
                              onPressed: () {
                                controller.textEmailCodeEditingController
                                    .clear();
                                controller.state.hasEmailCodeContent = false;
                              },
                            ),
                          );
                        })),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        controller.state.hasEmailCodeContent = true;
                      } else {
                        controller.state.hasEmailCodeContent = false;
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '请输入邮箱验证码';
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
                  controller.handleRegister();
                }
              },
              child: const Text('创建账号'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
          elevation: 0.0,
        ),
        body: ScreenUtilInit(
          builder: (context , child) => SingleChildScrollView(
            child: Column(
              children: [
                _buildLogo(),
                _buildInputBox(),
              ],
            ),
          ),
        ));
  }
}
