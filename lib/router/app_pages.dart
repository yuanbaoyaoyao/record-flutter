import 'package:get/get.dart';
import 'package:record_flutter/pages/application/application_binding.dart';
import 'package:record_flutter/pages/application/application_view.dart';
import 'package:record_flutter/pages/index/index_binding.dart';
import 'package:record_flutter/pages/index/index_view.dart';
import 'package:record_flutter/pages/no_auth/login/login_binding.dart';
import 'package:record_flutter/pages/no_auth/login/login_view.dart';
import 'package:record_flutter/pages/no_auth/register/register_binding.dart';
import 'package:record_flutter/pages/no_auth/register/register_view.dart';
import 'package:record_flutter/pages/no_auth/splash/splash_binding.dart';
import 'package:record_flutter/pages/no_auth/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  // static final routes = [
  //   GetPage(name: AppRoutes.Index, page: () => IndexPage(),binding: IndexBinding()),
  // ];

  static final routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.Register,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.Application,
        page: () => ApplicationPage(),
        binding: ApplicationBinding()),
  ];
}
