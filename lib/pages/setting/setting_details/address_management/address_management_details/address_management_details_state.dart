import 'package:get/get.dart';

import '../../../../../common/entities/user_address_entity.dart';

class AddressManagementDetailsState {
  final _onTapAddress = UserAddressUpdateEntity(
          id: null,
          userId: null,
          addressDetail: null,
          receiver: null,
          user: null,
          phone: null,
          isDefault: null)
      .obs;

  final _isDefault = false.obs;

  final _isCreate = false.obs;

  set onTapAddress(value) => _onTapAddress.value = value;

  get onTapAddress => _onTapAddress.value;

  set isDefault(value) => _isDefault.value = value;

  get isDefault => _isDefault.value;

  set isCreate(value) => _isCreate.value = value;

  get isCreate => _isCreate.value;
}
