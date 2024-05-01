import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:kelasdigital/features/onboard/onboard_controller.dart';

class OnboardScreen extends GetView<OnboardController> {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Text(
              'LEARNING',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
            bodyWidget: Text(
              AppTranslateString.onboard1.tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColor.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards1),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'SHARING',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
            bodyWidget: Text(
              AppTranslateString.onboard2.tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColor.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards2),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'COLLABORATE',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.primary70,
              ),
            ),
            bodyWidget: Text(
              AppTranslateString.onboard3.tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColor.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards3),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
        ],
        showSkipButton: true,
        skip: Text(
          AppTranslateString.skip.tr,
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColor.primary70,
          ),
        ),
        next: Text(
          AppTranslateString.next.tr,
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColor.primary70,
          ),
        ),
        done: Text(
          AppTranslateString.next.tr,
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColor.primary70,
          ),
        ),
        onDone: () {
          controller.goToWelcome();
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(8.0),
          activeSize: const Size(20.0, 8.0),
          activeColor: KdColor.primary90,
          color: KdColor.primary30,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
