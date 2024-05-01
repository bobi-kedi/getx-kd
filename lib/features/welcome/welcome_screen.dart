import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/features/welcome/welcome_controller.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 67,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(KdAssetsImagesPath.logosText),
                ),
              ),
            ),
            const SizedBox(height: 90),
            SizedBox(
              width: 250,
              child: KdButtonWidget(
                text: 'Masuk',
                onTapped: () {
                  controller.goToLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: KdButtonWidget(
                text: 'Daftar',
                buttonType: ButtonType.secondary,
                onTapped: () {
                  controller.goToRegister();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
