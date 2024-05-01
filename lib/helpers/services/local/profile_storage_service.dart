import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kelasdigital/helpers/models/entity_profile.dart';

const String profileDb = 'profile_db';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  Box<EntityProfile> _getProfileBox() => Hive.box(profileDb);

  void saveToDb(EntityProfile profile) {
    final box = _getProfileBox();
    if (box.containsKey(profile.id)) {
      return;
    } else {
      box.put(profile.id, profile);
      if (kDebugMode) {
        debugPrint('Profile Added');
      }
    }
  }

  void removeFromDb(EntityProfile profile) {
    final box = _getProfileBox();
    if (box.containsKey(profile.id)) {
      box.delete(profile.id);
      if (kDebugMode) {
        debugPrint('Profile deleted');
      }
    } else {
      return;
    }
  }

  void updateFromDb(EntityProfile profile) {
    final box = _getProfileBox();
    if (box.containsKey(profile.id)) {
      box.putAt(0, profile);
      if (kDebugMode) {
        debugPrint('Profile updated');
      }
    } else {
      return;
    }
  }

  Future<List<EntityProfile>> getFromDb() async {
    final box = _getProfileBox();
    List<EntityProfile> profile =
        box.values.isEmpty ? [] : box.values.toList().cast<EntityProfile>();

    return profile;
  }

  Future<void> clearProfile() async {
    final box = _getProfileBox();
    await box.clear();
  }
}
