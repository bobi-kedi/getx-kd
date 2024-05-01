import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/helpers/models/language.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

class SelectLanguageController extends GetxController {
  RxInt selectedIndex = 1.obs;
  RxString localeSelected = ''.obs;

  RxList<LanguageModel> languages = [
    LanguageModel(
      id: 1,
      emojiFlag: "🇮🇩",
      languageName: 'Indonesia',
      locale: 'id',
      imageFlag: KdAssetsImagesPath.flagsIndonesia,
    ),
    LanguageModel(
      id: 2,
      emojiFlag: "🇺🇸",
      languageName: 'English',
      locale: 'en',
      imageFlag: KdAssetsImagesPath.flagsEnglish,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  init() {
    String selectedLanguage = CacheService.to.languageCode;
    selectedIndex.value = (selectedLanguage == 'id') ? 1 : 2;
  }

  updateLanguage(LanguageModel language) async {
    selectedIndex.value = language.id;
    CacheService.to.languageCode = language.locale;

    await Get.updateLocale(Locale(CacheService.to.languageCode));

    if (kDebugMode) {
      print({'language set': CacheService.to.languageCode});
    }
  }

  goToOnboard() {
    Get.toNamed(Routes.ONBOARD);
  }
}
