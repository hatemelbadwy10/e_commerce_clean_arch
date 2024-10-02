import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_cleac_arch/constants.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        contentType:
        "multipart/form-data; boundary=<calculated when request is sent>",
        headers: {"Accept": "application/json"}),
  );

  DioHelper() {
    addInterceptors();
  }

  void addInterceptors() {
    dio.interceptors.add(CustomApiInterceptor());
  }

  Future<CustomResponse> sendToServer({required String url,
    String? token,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    String? lang,
    void Function(int, int)? onSendProgress}) async {
    if (body != null) {
      body.removeWhere(
            (key, value) => body[key] == null || body[key] == "",
      );
    }
    try {
      if (url.isNotEmpty) {
        final response = await dio.post(
          url,
          options: Options(
            headers: {
              "Accept": "application/json",
            },
          ),
          queryParameters: params,
          onSendProgress: onSendProgress,
          data: FormData.fromMap(body ?? {}),
        );
        if (response.data["status"] != "fail") {
          return CustomResponse(
            success: true,
            statusCode: 200,
            msg: response.data["message"] ??
                "Your request completed successfully",
            response: response,
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          return CustomResponse(
              success: false, statusCode: 422, msg: response.data["message"]);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        return CustomResponse(
          success: true,
          statusCode: 200,
        );
      }
    } on DioException catch (err) {
      return handleServerError(err);
    }
  }

  Future<dynamic> getFromServer({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    if (params != null) {
      params.removeWhere(
              (key, value) => params[key] == null || params[key] == "");
    }

    Response response = await dio.get(
      url,
      queryParameters: params,
    );
    return response.data;
  }

  Future<CustomResponse> putToServer({required String url,
    String? token,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    String? lang,
    void Function(int, int)? onSendProgress}) async {
    if (body != null) {
      body.removeWhere(
            (key, value) => body[key] == null || body[key] == "",
      );
    }
    try {
      if (url.isNotEmpty) {
        final response = await dio.put(
          url,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Accept-Language": "ar",
              "lang": "ar",
            },
          ),
          queryParameters: params,
          onSendProgress: onSendProgress,
          data: FormData.fromMap(body ?? {}),
        );
        if (response.data["status"] != "fail") {
          return CustomResponse(
            success: true,
            statusCode: 200,
            msg: response.data["message"] ??
                "Your request completed successfully",
            response: response,
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          return CustomResponse(
              success: false, statusCode: 422, msg: response.data["message"]);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        return CustomResponse(
          success: true,
          statusCode: 200,
        );
      }
    } on DioException catch (err) {
      return handleServerError(err);
    }
  }

  Future<CustomResponse> removeFromServer({required String url,
    String? token,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    String? lang,
    void Function(int, int)? onSendProgress}) async {
    if (body != null) {
      body.removeWhere(
            (key, value) => body[key] == null || body[key] == "",
      );
    }
    try {
      if (url.isNotEmpty) {
        final response = await dio.delete(
          url,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Accept-Language": "ar",
              "lang": "ar",
            },
          ),
          queryParameters: params,
          data: FormData.fromMap(body ?? {}),
        );
        if (response.data["status"] != "fail") {
          return CustomResponse(
            success: true,
            statusCode: 200,
            msg: response.data["message"] ??
                "Your request completed successfully",
            response: response,
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          return CustomResponse(
              success: false, statusCode: 422, msg: response.data["message"]);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        return CustomResponse(
          success: true,
          statusCode: 200,
        );
      }
    } on DioException catch (err) {
      return handleServerError(err);
    }
  }

}

CustomResponse handleServerError(DioException err) {
  if (err.type == DioExceptionType.badResponse) {
    if (err.response!.data.toString().contains("DOCTYPE") ||
        err.response!.data.toString().contains("<script>") ||
        err.response!.data["exception"] != null) {
      return CustomResponse(
        errType: 2,
        statusCode: err.response!.statusCode ?? 500,
        msg: "Server Error",
      );
    }
    if (err.response!.statusCode == 401) {
      // showToast(err.response!.data["message"], duration: 3);
      // navigateTo(page: const SplashView(), leaveHistory: false);
    }
    try {
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 1,
        msg: (err.response!.data["errors"] as Map).values.first.first,
        response: err.response,
      );
    } catch (e) {
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 1,
        msg: err.response?.data["message"],
        response: err.response,
      );
    }
  } else if (err.type == DioExceptionType.receiveTimeout ||
      err.type == DioExceptionType.sendTimeout) {
    return CustomResponse(
      statusCode: err.response?.statusCode ?? 500,
      errType: 0,
      msg: "Time out error",
    );
  } else {
    if (err.response == null) {
      // print(err.stackTrace);
      // print(err.response);

      return CustomResponse(
        statusCode: 402,
        errType: 0,
        msg: "No Connection",
      );
    }

    return CustomResponse(
      statusCode: 402,
      errType: 2,
      success: false,
      msg: "Server Error",
    );
  }
}

class CustomApiInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(err.stackTrace);
    }
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(Response response,
      ResponseInterceptorHandler handler) async {
    if (kDebugMode && Platform.isAndroid) {}
    return super.onResponse(response, handler);
  }
}

class CustomResponse {
  bool success;
  int? errType;
  String msg;
  int statusCode;
  Response? response;
  dynamic error;

  CustomResponse({
    this.success = false,
    this.errType = 0,
    this.msg = "",
    this.statusCode = 0,
    this.response,
    this.error,
  });
}

