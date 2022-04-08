import 'package:get/get.dart';
import 'package:record_flutter/pages/index/binding.dart';
import 'package:record_flutter/pages/index/view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(name: AppRoutes.Index, page: () => IndexPage(),binding: IndexBinding()),
  ];
}
