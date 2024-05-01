import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_countdown/slide_countdown.dart';

import 'register_otp_controller.dart';

class RegisterOtpScreen extends GetView<RegisterOtpController> {
  const RegisterOtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 55, top: 80, left: 16, right: 16),
                child: Text(
                  'Silahkan masukan kode Verifikasi yang sudah kami kirim ke ${controller.selectedOtp}',
                  textAlign: TextAlign.center,
                  style: KdTextStyles.body1Medium.copyWith(
                    color: KdColor.neutral90,
                  ),
                ),
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle: KdTextStyles.heading1Bold.copyWith(
                  fontSize: 15,
                ),
                textCapitalization: TextCapitalization.characters,
                mainAxisAlignment: MainAxisAlignment.center,
                cursorColor: KdColor.primary90,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 47,
                    fieldWidth: 47,
                    activeColor: KdColor.primary10,
                    activeFillColor: KdColor.primary10,
                    inactiveColor: KdColor.primary10,
                    selectedColor: KdColor.primary10,
                    selectedFillColor: KdColor.primary10,
                    inactiveFillColor: KdColor.primary10,
                    fieldOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 5)),
                animationDuration: const Duration(milliseconds: 100),
                enableActiveFill: true,
                // controller: otpController,
                onCompleted: (v) {
                  //print("Completed");
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  //print("Allowing to paste $text");
                  return true;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Jika kamu belum menerima kode?',
                      style: KdTextStyles.caption2Medium.copyWith(
                        color: KdColor.neutral90,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 15),
                    ),
                    // TextSpan(
                    //   text: 'Kirim Ulang',
                    //   style: KdTextStyles.caption2Medium.copyWith(
                    //     color: KdColor.error70,
                    //   ),
                    // ),
                    WidgetSpan(
                      child: SlideCountdown(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        duration: const Duration(minutes: 2),
                        style: KdTextStyles.caption2Regular.copyWith(
                          color: Colors.white,
                        ),
                        onDone: () {},
                      ),
                    )
                  ],
                ),
              )
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
                    text: 'Verifikasi',
                    onTapped: () {},
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
