// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:record_flutter/common/store/user_store/user_store_state.dart';
//
// import '../../router/app_pages.dart';
//
// class RouteMiddlewares extends GetMiddleware {
//   final UserStoreState state = UserStoreState();
//
//   @override
//   int? priority = 0;
//
//   RouteMiddlewares({required this.priority});
//
//   @override
//   RouteSettings? redirect(String? route) {
//     log("RouteMiddlewares");
//     if (state.isLogin || route == AppRoutes.INITIAL ||
//         route == AppRoutes.Login || route == AppRoutes.Register) {
//       return null;
//     } else {
//       Future.delayed(
//           Duration(seconds: 1), () => Get.snackbar("提示", "请重新登录"));
//       return RouteSettings(name: AppRoutes.Login);
//     }
//   }
// }