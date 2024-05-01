import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

class ResetPasswordController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool showRetypePassword = false.obs;

  void sendResetPassword({required BuildContext context}) {
    KdDialog.dialogButton(
      context,
      title: 'Kata Sandi Berhasil di Atur Ulang',
      body: 'Silakan Anda login kembali',
      textBtn: 'OK',
      onPressed: () {},
    );
  }
}
