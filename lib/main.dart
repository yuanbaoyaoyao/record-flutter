import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/global.dart';
import 'package:record_flutter/pages/index/index_binding.dart';
import 'package:record_flutter/router/app_pages.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async => {
      //确保初始化完成
      WidgetsFlutterBinding.ensureInitialized(),
      //等待SpUtil初始化
      await SpUtil.getInstance(),
      Global.init().then((value) => runApp(MyApp()))
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '耗材管理系统',
      // home: IndexPage(),
      initialBinding: IndexBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
