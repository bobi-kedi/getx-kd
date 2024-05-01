import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/helpers/services/authentication_service.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

class ApiService extends GetxService {
  static ApiService get to => Get.find();

  final GetConnect _connect = Get.find();

  Future<BaseResponse?> base(Function getResponse, Function processBody,
      {bool? withToken}) async {
    _connect.allowAutoSignedCert = true;

    final Map<String, String> header = {'Content-Type': 'application/json'};

    if (CacheService.to.languageCode != '') {
      header['lang'] = CacheService.to.languageCode;
    }

    if (withToken! && CacheService.to.loginToken != '') {
      header['Authorization'] = 'Bearer ${CacheService.to.loginToken}';
    }

    try {
      Response response = await getResponse(header);

      if (kDebugMode) {
        print({'request': header});
        print({'response-body': response.body});
      }

      if (response.status.hasError) {
        if (response.status.isUnauthorized) {
          AuthenticationService.to.logout();
        }

        var message = response.body['meta']['message'];
        var statusCode = response.body['meta']['status_code'];

        return BaseResponse(
          ResponseStatus.error,
          "$message ($statusCode})",
          code: response.statusCode.toString(),
        );
      } else {
        return await processBody(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return BaseResponse(ResponseStatus.error, e.toString());
    }
  }

  Future get(
    String url,
    Function processData, {
    bool? withToken,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    return await base((header) async {
      if (kDebugMode) {
        print({'request-url': url});
      }
      return await _connect
          .get(url, headers: headers ?? header, query: query)
          .timeout(const Duration(seconds: 5));
    }, processData, withToken: withToken ?? false);
  }

  Future post(
    String url,
    Map<String, dynamic> body,
    Function processData, {
    bool? withToken,
    Map<String, String>? headers,
  }) async {
    return await base((header) async {
      if (kDebugMode) {
        print({'request-url': url});
      }
      return await _connect
          .post(url, body, headers: headers ?? header)
          .timeout(const Duration(seconds: 5));
    }, processData, withToken: withToken ?? false);
  }
}

class BaseResponse {
  final ResponseStatus status;
  final String message;
  final String? code;
  final dynamic data;

  BaseResponse(this.status, this.message, {this.code, this.data});

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data,
      };
}

enum ResponseStatus { success, failed, error }
