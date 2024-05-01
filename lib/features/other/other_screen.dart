import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/features/other/widget/other_item.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';

import 'other_controller.dart';

class OtherScreen extends GetView<OtherController> {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Lainnya',
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
            OtherItem(
              text: 'Ubah Kata Sandi',
              leadingIcon: Icons.lock_outlined,
              onTapped: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),
            OtherItem(
              text: 'Mode Gelap',
              leadingIcon: Icons.bedtime_outlined,
              trailingIcon: Icons.toggle_off_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: AppTranslateString.language.tr,
              leadingIcon: Icons.translate,
              onTapped: () {
                Get.toNamed(Routes.CHANGE_LANGUAGE);
              },
            ),
            OtherItem(
              text: 'Pengaturan',
              leadingIcon: Icons.settings_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Simpan',
              leadingIcon: Icons.bookmark_outline,
              onTapped: () {
                Get.toNamed(Routes.SAVED_FEED);
              },
            ),
            OtherItem(
              text: 'Kontak yang diblokir',
              leadingIcon: Icons.do_disturb,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Kelas Digital Versi Website',
              leadingIcon: Icons.language_rounded,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Bantuan',
              leadingIcon: Icons.contact_support_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Hubungi Kami',
              leadingIcon: Icons.support_agent_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Tentang Kami',
              leadingIcon: Icons.info_outline_rounded,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Kebijakan Privasi',
              leadingIcon: Icons.admin_panel_settings_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Syarat dan Ketentuan',
              leadingIcon: Icons.assignment_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Kebijakan Pengembalian Barang',
              leadingIcon: Icons.local_shipping_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Hapus Akun',
              leadingIcon: Icons.person_remove_alt_1_outlined,
              onTapped: () {},
            ),
            OtherItem(
              text: 'Keluar',
              leadingIcon: Icons.logout,
              isCustomItem: true,
              onTapped: () {
                controller.onTappedLogout(context);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
