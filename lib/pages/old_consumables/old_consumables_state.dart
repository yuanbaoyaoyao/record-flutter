import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/entities/front_show_entity.dart';

class OldConsumablesState {
  final _productSkus = FrontShowEntity(data: [], message: '', code: null).obs;

  final _length = 0.obs;

  GlobalKey oldNewCartKey = GlobalKey();

  set productSkus(value) => _productSkus.value = value;

  get productSkus => _productSkus.value;

  set length(value) => _length.value = value;

  get length => _length.value;

  final _appBarT = 0.0.obs;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;
}
