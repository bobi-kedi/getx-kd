import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  static FirebaseService get to => Get.find();

  static final FirebaseFirestore firebase = FirebaseFirestore.instance;
}
