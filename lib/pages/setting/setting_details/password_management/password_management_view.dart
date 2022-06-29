import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'password_management_logic.dart';

class PasswordManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PasswordManagementLogic>();
    final state = Get.find<PasswordManagementLogic>().state;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("修改密码"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (context, child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              controller: logic.emailEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入本账号电子邮件',
                                  icon: Icon(Icons.email),
                                  suffixIcon: Obx(() {
                                    return Visibility(
                                        visible: logic.state.hasEmailContent,
                                        child: SizedBox(
                                          width: ScreenUtil().screenWidth / 2.8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Visibility(
                                                visible:
                                                    logic.state.countDown == 0,
                                                child: TextButton(
                                                    onPressed: () {
                                                      logic
                                                          .handleSendEmailCode();
                                                    },
                                                    child: const Text("发送验证码")),
                                              ),
                                              Visibility(
                                                  visible:
                                                      logic.state.countDown > 0,
                                                  child: Text(
                                                      "剩余${logic.state.countDown}秒重发")),
                                              IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () {
                                                  logic.emailEditingController
                                                      .clear();
                                                  state.hasEmailContent = false;
                                                },
                                              )
                                            ],
                                          ),
                                        ));
                                  })),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  logic.state.hasEmailContent = true;
                                } else {
                                  logic.state.hasEmailContent = false;
                                }
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入本账号电子邮件';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              controller: logic.emailCodeEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入验证码',
                                  icon: Icon(Icons.qr_code_sharp),
                                  suffixIcon: Obx(() {
                                    return Visibility(
                                        visible: state.hasEmailCodeContent,
                                        child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            logic.emailCodeEditingController
                                                .clear();
                                            state.hasEmailCodeContent = false;
                                          },
                                        ));
                                  })),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  state.hasEmailCodeContent = true;
                                } else {
                                  state.hasEmailCodeContent = false;
                                }
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入验证码';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              obscuringCharacter: "*",
                              obscureText: true,
                              controller: logic.passwordEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入新密码',
                                  icon: Icon(Icons.password),
                                  suffixIcon: Obx(() {
                                    return Visibility(
                                        visible: state.hasPasswordContent,
                                        child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            logic.passwordEditingController
                                                .clear();
                                            state.hasPasswordContent = false;
                                          },
                                        ));
                                  })),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  state.hasPasswordContent = true;
                                } else {
                                  state.hasPasswordContent = false;
                                }
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入新密码';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              obscuringCharacter: "*",
                              obscureText: true,
                              controller:
                                  logic.passwordConfirmEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请确认密码',
                                  icon: Icon(Icons.repeat_outlined),
                                  suffixIcon: Obx(() {
                                    return Visibility(
                                        visible:
                                            state.hasPasswordConfirmContent,
                                        child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            logic
                                                .passwordConfirmEditingController
                                                .clear();
                                            state.hasPasswordConfirmContent =
                                                false;
                                          },
                                        ));
                                  })),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  state.hasPasswordConfirmContent = true;
                                } else {
                                  state.hasPasswordConfirmContent = false;
                                }
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请确认密码';
                                } else if (value !=
                                    logic.passwordEditingController.text) {
                                  return '两次密码不一致';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(5.0)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            logic.handleUpdatePassword();
                          }
                        },
                        child: Container(
                          width: ScreenUtil().screenWidth,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0)),
                          child: Text("修改密码"),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepOrange),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                            elevation: MaterialStateProperty.all(0.0)),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
