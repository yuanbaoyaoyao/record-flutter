
import 'package:get/get.dart';

import '../../../../common/entities/user_address_entity.dart';

class AddressManagementState {
  final _addressList =
      UserAddressEntity(code: null, message: null, data: null).obs;

  final _isLimit = false.obs;

  set addressList(value) => _addressList.value = value;

  get addressList => _addressList.value;

  set isLimit(value) => _isLimit.value = value;

  get isLimit => _isLimit.value;

}
