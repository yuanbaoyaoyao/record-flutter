import 'package:get/get.dart';
import 'package:record_flutter/pages/application/application_binding.dart';
import 'package:record_flutter/pages/application/application_view.dart';
import 'package:record_flutter/pages/message/feedback_message/feedback_message_binding.dart';
import 'package:record_flutter/pages/message/feedback_message/feedback_message_view.dart';
import 'package:record_flutter/pages/message/message_box/message_box_binding.dart';
import 'package:record_flutter/pages/message/message_box/message_box_view.dart';
import 'package:record_flutter/pages/message/notification_message/notification_message_binding.dart';
import 'package:record_flutter/pages/message/notification_message/notification_message_view.dart';
import 'package:record_flutter/pages/message/order_message/order_message_binding.dart';
import 'package:record_flutter/pages/message/order_message/order_message_view.dart';
import 'package:record_flutter/pages/new_consumables/new_consumables_binding.dart';
import 'package:record_flutter/pages/new_consumables/new_consumables_view.dart';
import 'package:record_flutter/pages/no_auth/login/login_binding.dart';
import 'package:record_flutter/pages/no_auth/login/login_view.dart';
import 'package:record_flutter/pages/no_auth/register/register_binding.dart';
import 'package:record_flutter/pages/no_auth/register/register_view.dart';
import 'package:record_flutter/pages/no_auth/splash/splash_binding.dart';
import 'package:record_flutter/pages/no_auth/splash/splash_view.dart';
import 'package:record_flutter/pages/old_consumables/old_consumables_binding.dart';
import 'package:record_flutter/pages/old_consumables/old_consumables_view.dart';
import 'package:record_flutter/pages/search/search_binding.dart';
import 'package:record_flutter/pages/search/search_view.dart';

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
        name: AppRoutes.Search,
        page: () => SearchPage(),
        binding: SearchBinding()),
    GetPage(
        name: AppRoutes.Register,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.MessageBox,
        page: () => Message_boxPage(),
        binding: Message_boxBinding()),
    GetPage(
        name: AppRoutes.OrderMessage,
        page: () => Order_messagePage(),
        binding: Order_messageBinding()),
    GetPage(
        name: AppRoutes.FeedbackMessage,
        page: () => Feedback_messagePage(),
        binding: Feedback_messageBinding()),
    GetPage(
        name: AppRoutes.NotificationMessage,
        page: () => Notification_messagePage(),
        binding: Notification_messageBinding()),
    GetPage(
        name: AppRoutes.Application,
        page: () => ApplicationPage(),
        binding: ApplicationBinding()),
    GetPage(
        name: AppRoutes.NewConsumables,
        page: () => New_consumablesPage(),
        binding: New_consumablesBinding()),
    GetPage(
        name: AppRoutes.OldConsumables,
        page: () => OldConsumablesPage(),
        binding: OldConsumablesBinding()),
  ];
}
