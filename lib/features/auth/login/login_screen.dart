import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 50),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(KdAssetsImagesPath.logosIcon),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 50),
              KdFormInputWidget(
                controller: controller.emailC,
                formInputType: FormInputType.email,
                label: 'Email',
                hintText: 'defaradithio@gmail.com',
                validator: (val) => controller.emailValidation(val!),
              ),
              Obx(
                () => KdFormInputWidget(
                  controller: controller.passwordC,
                  label: 'Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showPassword.value,
                  validator: (val) => controller.passwordValidation(val!),
                  onShowPassword: () => controller.showPassword.toggle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.rememberMe.toggle();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.only(right: 5),
                                child: Checkbox(
                                  value: controller.rememberMe.value,
                                  activeColor: KdColor.primary70,
                                  onChanged: (value) {
                                    controller.rememberMe.toggle();
                                  },
                                ),
                              ),
                              Text(
                                'Ingat saya',
                                style: KdTextStyles.body3Regular.copyWith(
                                  color: KdColor.neutral70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.forgotPassword(context);
                      },
                      child: Text(
                        'Lupa kata sandi?',
                        style: KdTextStyles.body3Regular.copyWith(
                          color: KdColor.primary70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: KdButtonWidget(
                      text: 'Masuk',
                      onTapped: () => controller.onLoginBtnPressed(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: KdButtonWidget(
                      text: 'Masuk dengan Google',
                      icon: KdAssetsImagesPath.google,
                      buttonType: ButtonType.tertiary,
                      onTapped: () {
                        controller.onLoginGoogleBtnPressed(context);
                      },
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Belum punya akun? ',
                      style: KdTextStyles.body3Regular.copyWith(
                        color: KdColor.neutral70,
                      ),
                    ),
                    TextSpan(
                      text: 'Daftar',
                      style: KdTextStyles.body3Regular.copyWith(
                        color: KdColor.primary70,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.navigationRegister();
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'dibuat oleh',
                  style: KdTextStyles.caption2Regular.copyWith(
                    color: KdColor.primary70,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'PT. Kelas Dunia Ekasakti',
                  style: KdTextStyles.caption1Medium.copyWith(
                    color: KdColor.neutral70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Versi ${controller.version.value}',
                    style: KdTextStyles.body3Regular.copyWith(
                      color: KdColor.neutral70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
