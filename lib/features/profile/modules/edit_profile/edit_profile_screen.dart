import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: KdTextStyles.heading5SemiBold
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            height: 24,
            width: 24,
            child: Center(
              child: Icon(
                Icons.cancel,
                color: KdColor.error70,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              debugPrint('SAVE PROFILE');
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              height: 24,
              width: 24,
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  color: KdColor.success70,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: KdPictureWidget(
                size: 65,
                radius: 15,
                imageUrl:
                    'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
              ),
            ),
            Text(
              'Ganti Foto Profile',
              style: KdTextStyles.body2Regular.copyWith(
                color: KdColor.primary70,
              ),
            ),
            const SizedBox(height: 40),
            KdFormInputWidget(
              controller: controller.usernameC,
              label: 'Username',
              hintText: 'deffa',
            ),
            KdFormInputWidget(
              controller: controller.nameC,
              label: 'Nama',
              hintText: 'Defa Radithio',
            ),
            KdFormInputWidget(
              controller: controller.emailC,
              formInputType: FormInputType.email,
              label: 'Email',
              hintText: 'defaradithio@gmail.com',
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
            ),
            const KdFormInputWidget(
              label: 'Perguruan Tinggi',
              hintText: 'Universitas Indonesia',
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
