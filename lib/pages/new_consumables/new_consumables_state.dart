import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/entities/front_show_entity.dart';

class NewConsumablesState {
  GlobalKey oldNewCartKey = GlobalKey();

  final _length = 0.obs;

  final _productSkus = FrontShowEntity(data: [], message: '', code: null).obs;

  set productSkus(value) => _productSkus.value = value;

  get productSkus => _productSkus.value;

  set length(value) => _length.value = value;

  get length => _length.value;

  final _appBarT = 0.0.obs;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;
}
