import 'package:get/get.dart';
class SplashState {

  final _status = 0.obs;

  set status(value) => _status.value = value;

  get status => _status.value;

}
