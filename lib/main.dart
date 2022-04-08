import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/global.dart';
import 'package:record_flutter/pages/index/binding.dart';
import 'package:record_flutter/pages/index/view.dart';
import 'package:record_flutter/router/app_pages.dart';

void main()=>Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '耗材管理系统',
      home: IndexPage(),
      initialBinding: IndexBinding(),
      initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    );
  }
}