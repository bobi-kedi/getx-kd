import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'register_form_controller.dart';

class RegisterFormScreen extends GetView<RegisterFormController> {
  const RegisterFormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
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
              Expanded(
                child: Obx(
                  () => Form(
                    child: SingleChildScrollView(
                      child: (controller.title.value.toLowerCase() == 'lecture')
                          ? _buildUILecture()
                          : (controller.title.value.toLowerCase() == 'student')
                              ? _buildUIStudent()
                              : _buildUIGeneral(),
                    ),
                  ),
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
                    text: 'Daftar',
                    onTapped: () {
                      controller.goToVerify();
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

  Widget _buildUIGeneral() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 30),
            child: Text(
              'Daftar Akun Umum',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
          ),
        ),
        const KdFormInputWidget(
          label: 'NIK (Nomor Induk Penduduk)',
          hintText: '1788840809200007',
        ),
        const KdFormInputWidget(
          label: 'Nama Lengkap',
          hintText: 'Defa Radithio',
        ),
        // todo Form Tanggal Belum
        KdSelectFieldWidget(
          label: 'Warga Negara',
          items: controller.dropdownItems,
          value: controller.selectedValue.value,
          validator: (value) => value == null ? "Pilih Warga Negara" : null,
          onChanged: (String? newValue) {
            controller.selectedItem(selected: newValue!);
          },
        ),
        if (controller.selectedValue.value.toUpperCase() == 'WNA')
          const KdFormInputWidget(
            label: 'KITAS',
            requireLabel: 'khusus WNA',
            hintText: '123456789',
          ),
        const KdFormInputWidget(
          formInputType: FormInputType.phone,
          label: 'No. Hp',
          hintText: '81200808545',
        ),
        KdFormInputWidget(
          formInputType: FormInputType.email,
          label: 'Email',
          hintText: 'defaradithio@gmail.com',
          showErrorText: true,
          validator: (value) {
            String regEx =
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
            return RegExp(regEx).hasMatch(value!)
                ? null
                : 'Enter a valid value';
          },
        ),
        KdFormInputWidget(
          label: 'Kata Sandi',
          hintText: '● ● ● ● ● ● ● ●',
          formInputType: FormInputType.password,
          obscureText: !controller.showPassword.value,
          onShowPassword: () => controller.showPassword.toggle(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildUILecture() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 30),
            child: Text(
              'Daftar Akun Dosen',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
          ),
        ),
        const KdFormInputWidget(
          label: 'NIK (Nomor Induk Penduduk)',
          hintText: '1788840809200007',
        ),
        const KdFormInputWidget(
          label: 'Nama Lengkap',
          hintText: 'Defa Radithio',
        ),
        // todo Form Tanggal Belum
        KdSelectFieldWidget(
          label: 'Warga Negara',
          items: controller.dropdownItems,
          value: controller.selectedValue.value,
          validator: (value) => value == null ? "Pilih Warga Negara" : null,
          onChanged: (String? newValue) {
            controller.selectedItem(selected: newValue!);
          },
        ),
        if (controller.selectedValue.value.toUpperCase() == 'WNA')
          const KdFormInputWidget(
            label: 'KITAS',
            requireLabel: 'khusus WNA',
            hintText: '123456789',
          ),
        const KdFormInputWidget(
          formInputType: FormInputType.phone,
          label: 'No. Hp',
          hintText: '81200808545',
        ),
        KdFormInputWidget(
          formInputType: FormInputType.email,
          label: 'Email',
          hintText: 'defaradithio@gmail.com',
          showErrorText: true,
          validator: (value) {
            String regEx =
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
            return RegExp(regEx).hasMatch(value!)
                ? null
                : 'Enter a valid value';
          },
        ),
        KdFormInputWidget(
          label: 'Kata Sandi',
          hintText: '● ● ● ● ● ● ● ●',
          formInputType: FormInputType.password,
          obscureText: controller.showPassword.value,
          onShowPassword: () => controller.showPassword.toggle(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildUIStudent() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 30),
            child: Text(
              'Daftar Akun Mahasiswa',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
          ),
        ),
        const KdFormInputWidget(
          label: 'NIK (Nomor Induk Penduduk)',
          hintText: '1788840809200007',
        ),
        const KdFormInputWidget(
          label: 'Nama Lengkap',
          hintText: 'Defa Radithio',
        ),
        // todo Form Tanggal Belum
        KdSelectFieldWidget(
          label: 'Warga Negara',
          items: controller.dropdownItems,
          value: controller.selectedValue.value,
          validator: (value) => value == null ? "Pilih Warga Negara" : null,
          onChanged: (String? newValue) {
            controller.selectedItem(selected: newValue!);
          },
        ),
        if (controller.selectedValue.value.toUpperCase() == 'WNA')
          const KdFormInputWidget(
            label: 'KITAS',
            requireLabel: 'khusus WNA',
            hintText: '123456789',
          ),
        const KdFormInputWidget(
          formInputType: FormInputType.phone,
          label: 'No. Hp',
          hintText: '81200808545',
        ),
        KdFormInputWidget(
          formInputType: FormInputType.email,
          label: 'Email',
          hintText: 'defaradithio@gmail.com',
          showErrorText: true,
          validator: (value) {
            String regEx =
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
            return RegExp(regEx).hasMatch(value!)
                ? null
                : 'Enter a valid value';
          },
        ),
        KdFormInputWidget(
          label: 'Kata Sandi',
          hintText: '● ● ● ● ● ● ● ●',
          formInputType: FormInputType.password,
          obscureText: controller.showPassword.value,
          onShowPassword: () => controller.showPassword.toggle(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
