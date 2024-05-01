import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

class ChangePasswordController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool showRetypePassword = false.obs;

  void sendChangePassword({required BuildContext context}) {
    KdDialog.dialogButton(
      context,
      title: 'Kata Sandi Berhasil di Ubah',
      body: 'Silakan Anda login kembali',
      textBtn: 'OK',
      onPressed: () {},
    );
  }
}
