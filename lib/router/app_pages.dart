import 'package:get/get.dart';
import 'package:record_flutter/pages/application/application_binding.dart';
import 'package:record_flutter/pages/application/application_view.dart';
import 'package:record_flutter/pages/cart/cart_binding.dart';
import 'package:record_flutter/pages/cart/cart_view.dart';
import 'package:record_flutter/pages/classification/classification_binding.dart';
import 'package:record_flutter/pages/classification/classification_view.dart';
import 'package:record_flutter/pages/consumables_detail/consumables_detail_binding.dart';
import 'package:record_flutter/pages/consumables_detail/consumables_detail_view.dart';
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
import 'package:record_flutter/pages/search/search_details/search_details_binding.dart';
import 'package:record_flutter/pages/search/search_details/search_details_view.dart';
import 'package:record_flutter/pages/search/search_view.dart';
import 'package:record_flutter/pages/setting/setting_binding.dart';
import 'package:record_flutter/pages/setting/setting_details/about_me/about_me_binding.dart';
import 'package:record_flutter/pages/setting/setting_details/about_me/about_me_view.dart';
import 'package:record_flutter/pages/setting/setting_details/address_management/address_management_binding.dart';
import 'package:record_flutter/pages/setting/setting_details/address_management/address_management_view.dart';
import 'package:record_flutter/pages/setting/setting_details/password_management/password_management_binding.dart';
import 'package:record_flutter/pages/setting/setting_details/password_management/password_management_view.dart';
import 'package:record_flutter/pages/setting/setting_details/user_info/user_info_binding.dart';
import 'package:record_flutter/pages/setting/setting_details/user_info/user_info_view.dart';
import 'package:record_flutter/pages/setting/setting_view.dart';

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
        name: AppRoutes.Cart,
        page: () => CartPage(),
        binding: CartBinding()),
    GetPage(
        name: AppRoutes.Search,
        page: () => SearchPage(),
        binding: SearchBinding()),
    GetPage(
        name: AppRoutes.SearchDetails,
        page: () => SearchDetailsPage(),
        binding: SearchDetailsBinding()),
    GetPage(
        name: AppRoutes.Register,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.MessageBox,
        page: () => MessageBoxPage(),
        binding: MessageBoxBinding()),
    GetPage(
        name: AppRoutes.OrderMessage,
        page: () => OrderMessagePage(),
        binding: OrderMessageBinding()),
    GetPage(
        name: AppRoutes.FeedbackMessage,
        page: () => FeedbackMessagePage(),
        binding: FeedbackMessageBinding()),
    GetPage(
        name: AppRoutes.NotificationMessage,
        page: () => NotificationMessagePage(),
        binding: NotificationMessageBinding()),
    GetPage(
        name: AppRoutes.Application,
        page: () => ApplicationPage(),
        binding: ApplicationBinding()),
    GetPage(
        name: AppRoutes.NewConsumables,
        page: () => NewConsumablesPage(),
        binding: NewConsumablesBinding()),
    GetPage(
        name: AppRoutes.OldConsumables,
        page: () => OldConsumablesPage(),
        binding: OldConsumablesBinding()),
    GetPage(
        name: AppRoutes.ConsumablesDetail,
        page: () => ConsumablesDetailPage(),
        binding: ConsumablesDetailBinding()),
    GetPage(
        name: AppRoutes.Setting,
        page: () => SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: AppRoutes.UserInfo,
        page: () => UserInfoPage(),
        binding: UserInfoBinding()),
    GetPage(
        name: AppRoutes.AddressManagement,
        page: () => AddressManagementPage(),
        binding: AddressManagementBinding()),
    GetPage(
        name: AppRoutes.PasswordManagement,
        page: () => PasswordManagementPage(),
        binding: PasswordManagementBinding()),
    GetPage(
        name: AppRoutes.AboutMe,
        page: () => AboutMePage(),
        binding: AboutMeBinding()),
  ];
}
