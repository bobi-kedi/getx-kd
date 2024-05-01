import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'select_language_controller.dart';

class SelectLanguageScreen extends GetView<SelectLanguageController> {
  const SelectLanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  AppTranslateString.selectLanguage.tr,
                  style: KdTextStyles.heading4Bold.copyWith(
                    color: KdColor.primary70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                children: controller.languages
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: GestureDetector(
                          onTap: () {
                            if (element.id != controller.selectedIndex.value) {
                              controller.updateLanguage(element);
                            }
                          },
                          child: KdCardItemWidget(
                            image: element.imageFlag,
                            title: element.languageName,
                            paddingHorizontal: 45,
                            selectedIndex:
                                (controller.selectedIndex.value == element.id),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: KdButtonWidget(
                  text: 'OK',
                  onTapped: () {
                    controller.goToOnboard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
