import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_reminder_entity.dart';

class MessageBoxState {
  final _messages = [].obs;

  final _onTapMessage = UserReminderUpdateEntity(id: null).obs;

  final _announcement = [].obs;

  set message(value) => _messages.value = value;

  get message => _messages;

  set onTapMessage(value) => _onTapMessage.value = value;

  get onTapMessage => _onTapMessage.value;

  set announcement(value) => _announcement.value = value;

  get announcement => _announcement;
}
