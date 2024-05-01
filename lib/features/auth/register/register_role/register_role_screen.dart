import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'register_role_controller.dart';

class RegisterRoleScreen extends GetView<RegisterRoleController> {
  const RegisterRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Instansi',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 80),
            child: Text(
              'Silakan Pilih Akun Anda',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.neutral90,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.goToRegisterForm(role: 'lecture');
            },
            child: KdCardItemWidget(
              image: KdAssetsImagesPath.registerLecture,
              title: 'Dosen',
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              controller.goToRegisterForm(role: 'student');
            },
            child: KdCardItemWidget(
              image: KdAssetsImagesPath.registerGraduate,
              title: 'Mahasiswa',
              color: const Color(0xffEB8C10),
            ),
          ),
        ],
      ),
    );
  }
}
