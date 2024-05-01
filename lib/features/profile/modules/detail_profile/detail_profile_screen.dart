import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'detail_profile_controller.dart';

class DetailProfileScreen extends GetView<DetailProfileController> {
  const DetailProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Detail Profile',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            KdFormInputWidget(
              controller: controller.usernameC,
              label: 'Username',
              hintText: 'deffa',
              isReadOnly: true,
            ),
            KdFormInputWidget(
              controller: controller.nameC,
              label: 'Nama',
              hintText: 'Defa Radithio',
              isReadOnly: true,
            ),
            KdFormInputWidget(
              controller: controller.emailC,
              formInputType: FormInputType.email,
              label: 'Email',
              hintText: 'defaradithio@gmail.com',
              isEnabled: false,
              showErrorText: false,
              validator: (value) {
                String regEx =
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                return RegExp(regEx).hasMatch(value!)
                    ? null
                    : 'Enter a valid value';
              },
            ),
            KdFormInputWidget(
              controller: controller.phoneC,
              formInputType: FormInputType.phone,
              label: 'No. Hp',
              hintText: '81200808545',
              isEnabled: false,
            ),
            const KdFormInputWidget(
              label: 'Perguruan Tinggi',
              hintText: 'Universitas Indonesia',
              isReadOnly: true,
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: KdButtonWidget(
                  text: 'Ubah Profile',
                  onTapped: () {
                    controller.goToEditProfile();
                  },
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: KdButtonWidget(
                  text: 'Rekening Bank',
                  buttonType: ButtonType.secondary,
                  onTapped: () {
                    controller.goToBankAccount();
                  },
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: KdButtonWidget(
                  text: 'Hapus Akun',
                  color: KdColor.error70,
                  onTapped: () {
                    debugPrint('HAPUS AKUN');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Obx(
                () => Text(
                  'Versi ${controller.version.value}',
                  style:
                      KdTextStyles.body2Bold.copyWith(color: KdColor.primary70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
