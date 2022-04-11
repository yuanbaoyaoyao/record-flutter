import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/router/app_pages.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  Widget _buildLogo() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: (60)),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/logo_no_fonts.png",
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: (5.0)),
              child: const Text(
                '耗材管理系统',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildInputBox() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                hintText: '请输入邮箱',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '请输入邮箱';
                } else {
                  return null;
                }
              }),
          TextFormField(
              decoration: const InputDecoration(
                hintText: '请输入密码',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '请输入密码';
                } else {
                  return null;
                }
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                print("点击了登录");
              },
              child: const Text('登录'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoutes.Application),
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputBox(),
          ],
        ),
      ),
    );
  }
}
