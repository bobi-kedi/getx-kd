import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'change_language_controller.dart';

class ChangeLanguageScreen extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppTranslateString.language.tr,
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
          Obx(
            () => Column(
              children: [
                const SizedBox(height: 30),
                Column(
                  children: controller.languages
                      .map(
                        (element) => Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              if (element.id !=
                                  controller.selectedIndex.value) {
                                controller.updateLanguage(element);
                              }
                            },
                            child: KdCardItemWidget(
                              image: element.imageFlag,
                              title: element.languageName,
                              selectedIndex: (controller.selectedIndex.value ==
                                  element.id),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
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
                    text: 'OK',
                    onTapped: () {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
