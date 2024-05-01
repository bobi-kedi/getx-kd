import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Kata Sandi',
          style: KdTextStyles.heading5SemiBold
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KdColor.primary10,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: KdColor.primary70,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 80, left: 16, right: 16),
                child: Text(
                  'Silakan isi kolom dibawah dengan Email atau No. Hp Anda yang terdaftar di Kelas Digital',
                  style: KdTextStyles.body1Medium.copyWith(
                    color: KdColor.neutral90,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Kita akan kirimkan Anda link untuk atur ulang kata sandi',
                  style: KdTextStyles.body1Regular.copyWith(
                    color: KdColor.neutral70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const KdFormInputWidget(
                label: 'Email/No. Hp',
                hintText: 'ketik disini',
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: KdButtonWidget(
                    text: 'Kirim',
                    onTapped: () {
                      controller.sendForgotPassword(context: context);
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
