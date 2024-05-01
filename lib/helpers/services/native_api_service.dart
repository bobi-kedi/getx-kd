import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NativeApiService extends GetxService {
  static NativeApiService get to => Get.find();

  ImagePicker picker = ImagePicker();

  Future<XFile?> imagePicker(ImageSource source) async {
    XFile? data = await picker.pickImage(source: source);
    return data;
  }

  Future<XFile?> videoPicker(ImageSource source) async {
    XFile? data = await picker.pickVideo(source: source);
    return data;
  }
}
