import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/helpers/services/authentication_service.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';
import 'package:kelasdigital/utils/global_utils.dart';

class SplashController extends GetxController {
  getDeviceInfo() async {
    try {
      CacheService.to.deviceId = await GlobalUtils.getDeviceId();
      CacheService.to.deviceType = GlobalUtils.getDeviceType();
      CacheService.to.appVersion = await GlobalUtils.getAppVersion();
    } catch (e) {
      debugPrint('ERROR getDeviceInfo $e ');
    }
  }

  init() async {
    await getDeviceInfo();

    await Future.delayed(const Duration(seconds: 2));

    if (CacheService.to.onboardState) {
      bool isLogin = AuthenticationService.to.checkTokenValidity();
      AuthenticationService.to.saveLoginState(isLogin);

      if (kDebugMode) {
        print({'login-state': CacheService.to.loginState});
      }

      if (isLogin) {
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.offNamed(Routes.WELCOME);
      }
    } else {
      Get.offNamed(Routes.SELECT_LANGUAGE);
    }
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }
}
