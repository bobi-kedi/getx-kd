import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/helpers/services/authentication_service.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

class OtherController extends GetxController {
  void onTappedLogout(BuildContext context) {
    KdDialog.dialogButton(
      context,
      title: 'Logout',
      body: 'Apakah anda yakin ingin keluar dari aplikasi?',
      textBtn: 'Ya',
      textSecondBtn: 'Tidak',
      onPressed: () {
        logout();
      },
    ).then((value) => KdDialog.loading(context));
  }

  void logout() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
    AuthenticationService.to.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
