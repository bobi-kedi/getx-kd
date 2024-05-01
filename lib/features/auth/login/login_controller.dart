import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:kelasdigital/helpers/providers/auth_provider.dart';
import 'package:kelasdigital/helpers/services/api_service.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

class LoginController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;
  RxString version = ''.obs;
  RxStatus status = RxStatus.loading();

  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailC;
  late TextEditingController passwordC;

  init() {
    emailC = TextEditingController(text: CacheService.to.loginEmail);
    passwordC = TextEditingController(text: CacheService.to.loginPassword);

    if (CacheService.to.loginEmail != '') {
      rememberMe.value = true;
    }

    version.value = CacheService.to.appVersion;
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  String? emailValidation(String val) {
    String regEx =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (val.isEmpty) {
      return AppTranslateString.emptyEmailValidation.tr;
    }
    if (!RegExp(regEx).hasMatch(val)) {
      return 'Enter a valid Email';
    }

    return null;
  }

  String? passwordValidation(String val) {
    if (val.isEmpty) {
      return AppTranslateString.emptyPasswordValidation.tr;
    }
    return null;
  }

  void navigationRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void forgotPassword(BuildContext context) {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void onLoginBtnPressed(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      KdDialog.loading(context);
      await handleLogin(
        email: emailC.text,
        password: passwordC.text,
      );
    }
  }

  Future<void> handleLogin(
      {required String email, required String password}) async {
    var result = await AuthProvider.login(email, password);

    if (result.status == ResponseStatus.success) {
      Get.back();
      CacheService.to.loginEmail = (rememberMe.value) ? email : '';
      CacheService.to.loginPassword = (rememberMe.value) ? password : '';
      Get.offAllNamed(Routes.MAIN);
    } else {
      Get.back();
      Get.snackbar('Login Error', result.message);
    }
  }

  void onLoginGoogleBtnPressed(BuildContext context) async {
    KdDialog.loading(context);
    await handleLoginWithGoogle();
  }

  Future<void> handleLoginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      if (googleSignIn.currentUser != null) {
        await googleSignIn.signOut();
      }

      await InternetAddress.lookup('google.com');

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      var result = await AuthProvider.loginWithGoogle(googleAuth!.accessToken!);

      if (result.status == ResponseStatus.success) {
        Get.back();
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.back();
        Get.snackbar('Login Error', result.message);
      }
    } catch (e) {
      debugPrint('ERROR HANDLE Login Google : $e');
    }
  }
}
