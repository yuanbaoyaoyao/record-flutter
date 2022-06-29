import 'package:get/get.dart';

class NotificationMessageState {
  final _announcement = [].obs;

  set announcement(value) => _announcement.value = value;

  get announcement => _announcement;
}
