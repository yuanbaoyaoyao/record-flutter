import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class CartAPI {
  static String request = '/cartClient/';

  static Future listCartAPI({
    required int userId,
  }) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return CartEntity.fromJson(response);
  }

  static Future listCartCheckedAPI({
    required int userId,
  }) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listChecked',
        queryParameters: map);

    return CartEntity.fromJson(response);
  }

  static Future listOneCartAPI(
      {required int userId, required int productSkusId}) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    map["productSkusId"] = productSkusId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listOne',
        queryParameters: map);

    return CartEntity.fromJson(response);
  }

  static Future createCartAPI({required CartEntity cartEntity}) async {
    var response = await HttpUtil()
        .post(UrlConstant.debugClientIp + request + 'create', data: cartEntity);

    return CartEntity.fromJson(response);
  }

  static Future updateCartAPI({required CartEntity cartEntity}) async {
    var response =
        await HttpUtil().put(UrlConstant.debugClientIp + request + 'update');

    return CartEntity.fromJson(response);
  }

  static Future updateCartListAPI({required List<CartEntity> cartList}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateList',
        data: cartList);

    return CartEntity.fromJson(response);
  }

  static Future updateCartCheckedDefaultAPI(
      {required CartEntity cartEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateCheckedDefault',
        data: cartEntity);

    return CartEntity.fromJson(response);
  }

  static Future deleteCartAPI({required CartEntity cartEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: cartEntity);

    return CartEntity.fromJson(response);
  }
}
