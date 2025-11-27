import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final countryCode = '+880'.obs;
  final phonecontroller=TextEditingController();
  Rxn<XFile> profileImage = Rxn<XFile>();
  Rxn<XFile> pickedImage = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        profileImage.value = picked;
        print('Profile picked: ${picked.path}');
        Get.snackbar('Profile image', picked.path);
      } else {
        print('Profile pick cancelled');
      }
    } catch (e) {
      print('Error picking profile image: $e');
      Get.snackbar('Error', 'Failed to pick profile image: $e');
    }
  }
}
