import 'package:get/get.dart';
import 'package:record_flutter/common/entities/cart_entity.dart';

class CartState {
  final _onTapCartItem = CartUpdateEntity(
       id:null ,  productSkusId: null, userId: null, productSkusNumber: null)
      .obs;

  final _checkedCartItemList = [].obs;

  final _checkedCartItemListNumber = 0.obs;

  final _cartList = [].obs;

  final _recommendList = [].obs;

  final _isEditing = false.obs;

  final _pageSize = 8.obs;

  set onTapCartItem(value) => _onTapCartItem.value = value;

  get onTapCartItem => _onTapCartItem.value;

  set isEditing(value) => _isEditing.value = value;

  get isEditing => _isEditing.value;

  set checkedCartItemList(value) => _checkedCartItemList.value = value;

  get checkedCartItemList => _checkedCartItemList;

  set cartList(value) => _cartList.value = value;

  get cartList => _cartList;

  set recommendList(value) => _recommendList.value = value;

  get recommendList => _recommendList;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;

  set checkedCartItemListNumber(value) => _checkedCartItemListNumber.value = value;

  get checkedCartItemListNumber => _checkedCartItemListNumber.value;
}
