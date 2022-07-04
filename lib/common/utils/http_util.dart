import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData;
import 'package:record_flutter/common/constant/cache_constant.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/store/user_store/user_store_state.dart';
import 'package:record_flutter/res/constant.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:sp_util/sp_util.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  // final UserStoreState userStoreState = UserStoreState();

  factory HttpUtil() => _instance;

  late Dio dio;

  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    dio = Dio(BaseOptions(
      // baseUrl: Constant.baseURL,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      headers: {},
      contentType: 'application/json;charset=utf-8',
      responseType: ResponseType.json,
    ));

    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // const String headerName = 'Authorization';
    // const String schema = 'Bearer ';
    // 拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // if (isTokenNeed(options.path)) {
      //   if (SpUtil.getString(UserConstant.userTokenKey) == null) {
      //     Get.toNamed("/login");
      //     EasyLoading.showToast("登录过期");
      //   } else {
      //     options.headers[headerName] =
      //         schema + SpUtil.getString(UserConstant.userTokenKey)!;
      //   }
      // }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      ErrorEntity errorEntity = createErrorEntity(e);
      handleError(errorEntity);
      return handler.next(e);
    }));
  }

  void handleError(ErrorEntity errorEntity) {
    if (errorEntity.code == 401) {
      EasyLoading.showToast("未授权，请重新登录", duration: const Duration(seconds: 2));
      // userStoreState.isLogin = false;
      SpUtil.putBool(UserConstant.isLogin, false);
      SpUtil.remove(UserConstant.userTokenKey);
      Get.offAllNamed("/login");
    } else {
      EasyLoading.showToast(errorEntity.message,
          duration: const Duration(seconds: 3));
    }
  }

  // bool isTokenNeed(String url) {
  //   return !url.startsWith("/login") &&
  //       !url.startsWith("/register") &&
  //       !url.startsWith("/splash");
  // }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioErrorType.response:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: "请求错误");
              case 401:
                return ErrorEntity(code: errCode, message: "没授权，请重新登录");
              case 403:
                return ErrorEntity(code: errCode, message: "拒绝访问");
              case 404:
                return ErrorEntity(code: errCode, message: "请求地址出错");
              case 405:
                return ErrorEntity(code: errCode, message: "请求方法未允许");
              case 408:
                return ErrorEntity(code: errCode, message: "请求超时");
              case 500:
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              case 501:
                return ErrorEntity(code: errCode, message: "服务未实现");
              case 502:
                return ErrorEntity(code: errCode, message: "网络错误");
              case 503:
                return ErrorEntity(code: errCode, message: "服务不可用");
              case 504:
                return ErrorEntity(code: errCode, message: "请网络超时求错误");
              case 505:
                return ErrorEntity(code: errCode, message: "HTTP版本不受支持");
              default:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response != null
                        ? error.response!.statusMessage!
                        : "请求失败",
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "服务器响应超时，请刷新当前页");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  void cancelRequest(CancelToken cancelToken) {
    cancelToken.cancel("requests cancelled");
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    // if (Get.isRegistered<UserStoreState>() &&
    //     UserStoreState().token.isNotEmpty) {
    //   headers['Authorization'] = 'Bearer ${UserStoreState().token}';
    // } else
    if (SpUtil.containsKey(UserConstant.userTokenKey) == true) {
      headers['Authorization'] =
          'Bearer ${SpUtil.getString(UserConstant.userTokenKey)}';
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !CacheConstant.cacheEnable,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
    data,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream 流数据
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});
}
