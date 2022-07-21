import 'package:get/get.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_order_entity.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/entities/product_skus_entity.dart';
import '../../common/entities/user_address_entity.dart';
import '../cart/cart_state.dart';

class ConfirmOrderState {
  final _addressList =
      UserAddressEntity(code: null, message: null, data: null).obs;

  final _userOrder = UserOrderCreateEntity(
          userId: SpUtil.getInt(UserConstant.userId),
          userAddressId: null,
          receiver: "",
          user: "",
          addressDetail: "",
          orderRemarks: "")
      .obs;

  set userOrder(value) => _userOrder.value = value;

  get userOrder => _userOrder.value;

  final _addressDetail = "".obs;
  final _receiver = "".obs;
  final _phone = "".obs;
  final _defaultAddressTemp = "".obs;
  final _orderRemarks = "".obs;

  final _number = 0.obs;
  final _productSkusId = 0.obs;

  final _orderId = 0.obs;

  final _productSkusInfo =
      ProductSkusEntity(code: null, message: null, data: null).obs;

  set productSkusInfo(value) => _productSkusInfo.value = value;

  get productSkusInfo => _productSkusInfo.value;

  set addressList(value) => _addressList.value = value;

  get addressList => _addressList.value;

  set number(value) => _number.value = value;

  get number => _number.value;

  set productSkusId(value) => _productSkusId.value = value;

  get productSkusId => _productSkusId.value;

  set addressDetail(value) => _addressDetail.value = value;

  get addressDetail => _addressDetail.value;

  set orderId(value) => _orderId.value = value;

  get orderId => _orderId.value;

  set defaultAddressTemp(value) => _defaultAddressTemp.value = value;

  get defaultAddressTemp => _defaultAddressTemp.value;

  set receiver(value) => _receiver.value = value;

  get receiver => _receiver.value;

  set phone(value) => _phone.value = value;

  get phone => _phone.value;

  set orderRemarks(value) => _orderRemarks.value = value;

  get orderRemarks => _orderRemarks.value;
}
