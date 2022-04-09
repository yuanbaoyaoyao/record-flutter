import 'package:get/get.dart';

class SplashState {
  late int _status;

  SplashState() {
    ///Initialize variables
    _status = 0;
  }

  set status(value) => _status = value;

  get status => _status;
}
