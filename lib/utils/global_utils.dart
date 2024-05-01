import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalUtils {
  static Future<String> getDeviceId() async {
    debugPrint('getDeviceId started');
    String uniqueDeviceId = '';

    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId =
          '${iosDeviceInfo.name}:${iosDeviceInfo.identifierForVendor}';
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uniqueDeviceId =
          '${androidDeviceInfo.brand} - ${androidDeviceInfo.model}:${androidDeviceInfo.id}';
    }

    if (kDebugMode) {
      print({'get UniqueDeviceID': uniqueDeviceId});
    }

    return uniqueDeviceId;
  }

  static String getDeviceType() {
    String deviceType = '';
    if (Platform.isIOS) {
      deviceType = 'IOS';
    }
    if (Platform.isAndroid) {
      deviceType = 'Android';
    }
    if (kDebugMode) {
      print({'get-device-type': deviceType});
    }
    return deviceType;
  }

  static Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (kDebugMode) {
      print({'get-app-version': info.version});
    }
    return info.version;
  }
}
