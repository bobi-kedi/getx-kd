import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';

class RegisterFormController extends GetxController {
  var dataArg = Get.arguments;

  RxString title = 'title'.obs;
  RxString selectedValue = 'WNI'.obs;
  RxBool showPassword = false.obs;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: "WNI",
        child: Text("Warga Negara Indonesia"),
      ),
      const DropdownMenuItem(
        value: "WNA",
        child: Text("Warga Negara Asing"),
      ),
    ];
    return menuItems;
  }

  @override
  void onInit() {
    title.value = dataArg['role'].toString();
    super.onInit();
  }

  void selectedItem({required String selected}) {
    selectedValue.value = selected;
  }

  void goToVerify() {
    var data = {'email': 'defana*****@gmail.com', 'phone': '+62 8120070****'};
    Get.toNamed(Routes.REGISTER_VERIFY, arguments: data);
  }
}
