import 'package:get/get.dart';

class ApplicationState {
  ///Initialize variables
  final _page = 0.obs;

  set page(value) => _page.value = value;

  get page => _page.value;
}
