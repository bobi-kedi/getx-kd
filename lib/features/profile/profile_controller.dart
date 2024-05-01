import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/helpers/models/entity_profile.dart';
import 'package:kelasdigital/helpers/providers/account_provider.dart';
import 'package:kelasdigital/helpers/services/api_service.dart';
import 'package:kelasdigital/helpers/services/local/profile_storage_service.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  static ProfileController get to => Get.find();

  late TabController tabController;
  RxInt tabIndex = 0.obs;

  final Rxn<EntityProfile> _currentUser = Rxn();
  final Rxn<String> _imageUrl = Rxn();
  final RxBool _isLoading = false.obs;
  RxList<String> listTabs = [
    "Kelas Aktif",
    "Materi",
    "Tugas",
    "Dokumen",
    "Media",
  ].obs;

  RxInt selectedIndex = 0.obs;

  EntityProfile? get currentUser => _currentUser.value;
  String? get imageUrl => _imageUrl.value;
  bool get isLoading => _isLoading.value;

  set currentUser(EntityProfile? value) => _currentUser.value = value;
  set imageUrl(String? value) => _imageUrl.value = value;

  getAccountInfo() async {
    _isLoading.value = true;

    var db = await StorageService.to.getFromDb();
    if (db.isEmpty) {
      var result = await AccountProvider.profile();
      if (result.status == ResponseStatus.success) {
        currentUser = EntityProfile.fromJson(result.data);
        imageUrl = currentUser?.photo;
      } else {
        Fluttertoast.showToast(msg: 'Gagal mengambil data profile');
      }
    } else {
      currentUser = db.first;
      imageUrl = db.first.photo;
    }

    _isLoading.value = false;
  }

  void goToDetailProfile() {
    Get.toNamed(Routes.DETAIL_PROFILE);
  }

  void goToOther() {
    Get.toNamed(Routes.OTHER);
  }

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 3, initialIndex: 0);

    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });

    getAccountInfo();
  }
}
