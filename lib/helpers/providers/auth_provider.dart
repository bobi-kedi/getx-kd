import 'package:kelasdigital/configs/constant/api_config.dart';
import 'package:kelasdigital/helpers/models/auth/login_model.dart';
import 'package:kelasdigital/helpers/services/api_service.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

class AuthProvider {
  static Future<BaseResponse> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };
    return await ApiService.to.post(ApiConfig.LOGIN, body, (res) {
      if (res['data'] != null) {
        var data = LoginModel.fromJson(res);
        CacheService.to.loginToken = data.dataLogin.accessToken;
        return BaseResponse(
          ResponseStatus.success,
          'Login Success',
          code: res['meta']['status_code'].toString(),
        );
      } else {
        return BaseResponse(ResponseStatus.failed, res['meta']['message']);
      }
    });
  }

  static Future<BaseResponse> loginWithGoogle(String token) async {
    final body = {'accessToken': token};
    return await ApiService.to.post(ApiConfig.GOOGLE_VERIFY, body, (res) {
      if (res['data'] != null) {
        var data = LoginModel.fromJson(res);
        CacheService.to.loginToken = data.dataLogin.accessToken;
        CacheService.to.userName = data.dataLogin.username;
        return BaseResponse(
          ResponseStatus.success,
          'Login Success',
          code: res['meta']['status_code'].toString(),
        );
      } else {
        return BaseResponse(ResponseStatus.failed, res['meta']['message']);
      }
    });
  }
}
