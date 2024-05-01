import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'register_verify_controller.dart';
import 'widgets/option_item.dart';

class RegisterVerifyScreen extends GetView<RegisterVerifyController> {
  const RegisterVerifyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Akun',
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
                padding: const EdgeInsets.only(bottom: 55, top: 80),
                child: Text(
                  'Kita akan kirimkan Anda kode Verifikasi',
                  style: KdTextStyles.body1Medium.copyWith(
                    color: KdColor.neutral90,
                  ),
                ),
              ),
              Obx(
                () => OptionItem(
                  selectedIndex: controller.selectedIndex.value,
                  isSelected: (controller.selectedIndex.value == 1),
                  value: 1,
                  title: 'Email',
                  description: controller.email.value,
                  onChanged: (value) {
                    controller.selectedIndex.value = value!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => OptionItem(
                  selectedIndex: controller.selectedIndex.value,
                  isSelected: (controller.selectedIndex.value == 2),
                  value: 2,
                  title: 'SMS',
                  description: controller.phone.value,
                  onChanged: (value) {
                    controller.selectedIndex.value = value!;
                  },
                ),
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
                      controller.goToRegisterOtp();
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
