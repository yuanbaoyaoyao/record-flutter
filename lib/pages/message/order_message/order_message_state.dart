import 'package:get/get.dart';

import '../../../common/entities/user_reminder_entity.dart';

class OrderMessageState {
  final _messages = [].obs;

  final _onTapMessage = UserReminderUpdateEntity(id: null).obs;

  set message(value) => _messages.value = value;

  get message => _messages;

  set onTapMessage(value) => _onTapMessage.value = value;

  get onTapMessage => _onTapMessage.value;
}
