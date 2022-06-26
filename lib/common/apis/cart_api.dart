import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class CartAPI {
  static String request = '/cartClient/';

  static Future listCartAPI({
    required int? userId,
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
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: cartEntity.toJson());

    return CartEntity.fromJson(response);
  }

  static Future updateCartAPI(
      {required CartUpdateEntity cartUpdateEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: cartUpdateEntity);

    return response;
  }

  static Future updateCartListAPI(
      {required List<CartUpdateEntity> cartUpdateEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateList',
        data: cartUpdateEntity);

    return response;
  }

  static Future updateCartCheckedDefaultAPI(
      {required CartUpdateEntity cartUpdateEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateCheckedDefault',
        data: cartUpdateEntity);

    return response;
  }

  static Future deleteCartAPI(
      {required CartDeleteEntity cartDeleteEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: cartDeleteEntity);

    return response;
  }

  static Future deleteCartListAPI(
      {required List<CartDeleteEntity> cartDeleteEntityList}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'deleteList',
        data: cartDeleteEntityList);

    return response;
  }
}
