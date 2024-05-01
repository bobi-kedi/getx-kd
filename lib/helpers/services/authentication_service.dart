import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

import 'local/profile_storage_service.dart';

class AuthenticationService extends GetxService {
  static AuthenticationService get to => Get.find();

  String getLoginToken() {
    bool isValid = checkTokenValidity();

    if (isValid) {
      return CacheService.to.loginToken;
    } else {
      return '';
    }
  }

  bool checkTokenValidity() {
    final token = CacheService.to.loginToken;

    if (token.isNotEmpty) {
      final hasExpired = JwtDecoder.isExpired(token);
      if (kDebugMode) {
        print({'is-token-expired': hasExpired});
      }

      if (hasExpired) {
        logout();
      }

      return !hasExpired;
    } else {
      return false;
    }
  }

  void saveLoginState(bool value) {
    debugPrint('saving login state...');
    CacheService.to.loginState = value;
    debugPrint('login state saved');
  }

  void logout() async {
    debugPrint('logging out...');
    CacheService.to.clearUser();
    await StorageService.to.clearProfile();
    debugPrint('successfully logged out');
  }
}
