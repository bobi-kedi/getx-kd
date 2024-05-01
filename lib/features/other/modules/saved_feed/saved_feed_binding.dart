import 'package:get/get.dart';

import 'saved_feed_controller.dart';

class SavedFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedFeedController>(() => SavedFeedController());
  }
}
