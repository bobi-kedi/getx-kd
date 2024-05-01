import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';

import 'widget/alert_info_bank.dart';

class BankAccountController extends GetxController {
  RxString selectedValue = 'bri'.obs;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: "bri",
        child: Text("BRI"),
      ),
      const DropdownMenuItem(
        value: "bca",
        child: Text("BCA"),
      ),
      const DropdownMenuItem(
        value: "bni",
        child: Text("BNI"),
      ),
      const DropdownMenuItem(
        value: "mandiri",
        child: Text("Mandiri"),
      ),
    ];
    return menuItems;
  }

  void selectedItem({required String selected}) {
    selectedValue.value = selected;
  }

  void alertDialog(BuildContext context) {
    KdDialog.dialog(context: context, content: const AlertInfoBank());
  }
}
