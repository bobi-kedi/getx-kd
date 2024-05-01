import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

class ForgotPasswordController extends GetxController {
  void sendForgotPassword({required BuildContext context}) {
    KdDialog.dialogButton(
      context,
      title: 'Link sudah kami kirim ke email Anda',
      body: 'Silakan cek email Anda',
      textBtn: 'OK',
      onPressed: () {},
    );
  }
}
