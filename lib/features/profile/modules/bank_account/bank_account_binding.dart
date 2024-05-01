import 'package:get/get.dart';

import 'bank_account_controller.dart';

class BankAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankAccountController>(() => BankAccountController());
  }
}
