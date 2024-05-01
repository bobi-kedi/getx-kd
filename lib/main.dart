import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kelasdigital/helpers/models/entity_profile.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';
import 'package:kelasdigital/helpers/services/native_api_service.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:kelasdigital/features/splash/splash_binding.dart';
import 'package:kelasdigital/features/splash/splash_screen.dart';
import 'package:kelasdigital/helpers/services/api_service.dart';
import 'package:kelasdigital/helpers/services/authentication_service.dart';

import 'configs/kd_assets/app_assets.dart';
import 'configs/routes/app_pages.dart';
import 'firebase_options.dart';
import 'helpers/services/local/profile_storage_service.dart';

late Uint8List byteData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'kedi-getx-dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initStorage();
  await initServices();

  loadImage().then((value) => runApp(const MyApp()));
}

Future<void> initServices() async {
  debugPrint('starting services...');
  await Get.putAsync(() async => CacheService());
  await Get.putAsync(() async => StorageService());
  await Get.putAsync(() async => GetConnect());
  await Get.putAsync(() async => AuthenticationService());
  await Get.putAsync(() async => ApiService());
  await Get.putAsync(() async => NativeApiService());
  debugPrint('all services started');
}

Future<void> initStorage() async {
  debugPrint('starting storage...');
  await GetStorage.init();
  await GetStorage.init('UserStorage');
  await initHive();
  debugPrint('all storage started');
}

Future<void> initHive() async {
  debugPrint('starting hive local storage ...');
  await Hive.initFlutter();
  Hive.registerAdapter(EntityProfileAdapter());
  await Hive.openBox<EntityProfile>(profileDb);
  debugPrint('all hive local storage started');
}

Future<void> loadImage() async {
  ByteData data = await rootBundle.load(KdAssetsImagesPath.logosFull);
  byteData = data.buffer.asUint8List();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kelas Digital',
      debugShowCheckedModeBanner: false,
      locale: Locale(CacheService.to.languageCode),
      fallbackLocale: const Locale('id'),
      translations: AppTranslation(),
      getPages: AppPages.pages,
      initialBinding: SplashBinding(),
      home: const SplashScreen(),
    );
  }
}
