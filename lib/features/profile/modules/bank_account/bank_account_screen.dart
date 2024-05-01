import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'bank_account_controller.dart';

class BankAccountScreen extends GetView<BankAccountController> {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Rekening Bank',
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
        actions: [
          IconButton(
            onPressed: () {
              controller.alertDialog(context);
            },
            icon: Icon(
              Icons.info_outline,
              color: KdColor.secondary70,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            KdSelectFieldWidget(
              label: 'Warga Negara',
              items: controller.dropdownItems,
              value: controller.selectedValue.value,
              validator: (value) => value == null ? "Pilih Bank" : null,
              onChanged: (String? newValue) {
                controller.selectedItem(selected: newValue!);
              },
            ),
            const KdFormInputWidget(
              label: 'Nomor Rekening',
              hintText: '2303123xxxx',
            ),
            const KdFormInputWidget(
              label: 'Nama Pemilik Bank',
              hintText: 'Defa Radithio',
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: KdButtonWidget(
                  text: 'Ubah Profile',
                  onTapped: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
