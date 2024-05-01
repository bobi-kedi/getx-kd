import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Lupa Kata Sandi',
        //   style: KdTextStyles.heading5SemiBold.copyWith(fontWeight: FontWeight.w600),
        // ),
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
          Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30, top: 80, left: 16, right: 16),
                  child: Text(
                    'Setel Ulang Kata Sandi',
                    style: KdTextStyles.heading5SemiBold.copyWith(
                      color: KdColor.primary70,
                    ),
                  ),
                ),
                KdFormInputWidget(
                  label: 'Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showPassword.value,
                  onShowPassword: () => controller.showPassword.toggle(),
                ),
                KdFormInputWidget(
                  label: 'Ulangi Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showRetypePassword.value,
                  onShowPassword: () => controller.showRetypePassword.toggle(),
                ),
              ],
            ),
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
                    text: 'Perbaharui Kata Sandi',
                    buttonSizeType: ButtonSizeType.large,
                    onTapped: () {
                      controller.sendResetPassword(context: context);
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
