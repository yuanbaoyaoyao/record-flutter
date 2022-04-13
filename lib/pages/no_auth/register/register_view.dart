import 'package:flutter/material.dart';
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
              "注册页面",
              style: TextStyle(fontSize: 30.0,
              ),
            )
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
                  print("点击了创建账号");
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
    final logic = Get.find<RegisterLogic>();
    final state = Get.find<RegisterLogic>().state;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildLogo(),
              _buildInputBox(),
            ],
          ),
        ));
  }
}
