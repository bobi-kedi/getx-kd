import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CacheService extends GetxService {
  static CacheService get to => Get.find();

  // COMMON PREFS
  final _box = GetStorage();

  String get languageCode =>
      _box.read(_Keys.languageCode) ?? Get.deviceLocale!.languageCode;

  set languageCode(String value) => _box.write(_Keys.languageCode, value);

  bool get onboardState => _box.read(_Keys.onboardState) ?? false;
  set onboardState(bool value) => _box.write(_Keys.onboardState, value);

  String get appVersion => _box.read(_Keys.appVersion) ?? '';
  set appVersion(String value) => _box.write(_Keys.appVersion, value);

  String get deviceId => _box.read(_Keys.deviceId) ?? '';
  set deviceId(String value) => _box.write(_Keys.deviceId, value);

  String get deviceType => _box.read(_Keys.deviceType) ?? '';
  set deviceType(String value) => _box.write(_Keys.deviceType, value);

  bool get loginState => _box.read(_Keys.loginState) ?? false;
  set loginState(bool value) => _box.write(_Keys.loginState, value);

  String get loginEmail => _box.read(_Keys.loginEmail) ?? '';
  set loginEmail(String value) => _box.write(_Keys.loginEmail, value);

  String get loginPassword => _box.read(_Keys.loginPassword) ?? '';
  set loginPassword(String value) => _box.write(_Keys.loginPassword, value);

  // USER PREFS
  final _userBox = GetStorage('UserStorage');

  String get loginToken => _userBox.read(_Keys.loginToken) ?? '';
  set loginToken(String value) => _userBox.write(_Keys.loginToken, value);

  String get userName => _userBox.read(_Keys.userName) ?? '';
  set userName(String value) => _userBox.write(_Keys.userName, value);

  void clearUser() {
    _userBox.erase();
  }
}

abstract class _Keys {
  // COMMON
  static const String languageCode = 'languageCode';
  static const String deviceId = 'deviceId';
  static const String deviceType = 'deviceType';
  static const String appVersion = 'appVersion';
  static const String loginState = 'loginState';
  static const String loginEmail = 'loginEmail';
  static const String onboardState = 'onboardState';

  // USER
  static const String loginToken = 'loginToken';
  static const String userName = 'userName';
  static const String loginPassword = 'loginPassword';
}
