import 'dart:convert';
import 'package:ameriajproducts/data/api_services/dio_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

// ✅ Keep ONLY Dio versions of FormData + MultipartFile
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class EditProfileController extends GetxController {
  final countryCode = '+880'.obs;
  final phonecontroller = TextEditingController();
  final namecontroller=TextEditingController();
  final uiccontroller=TextEditingController();
  final rankcontroller=TextEditingController();

  Rxn<XFile> profileImage = Rxn<XFile>();
  Rxn<XFile> pickedImage = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();

  final DioClient _client = DioClient();

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
var isLoading=false.obs;
  Future<void> updateprofile() async {
    isLoading.value=true;
    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      //isLoading.value = false;
      return;
    }
    try {
      final formData = FormData.fromMap({
  "data": jsonEncode({
    "userName": namecontroller.text,
    "countryCode": countryCode.value,
    "mobile": phonecontroller.text,
    "uic": uiccontroller.text,
    "rank": rankcontroller.text,
  }),

  if (profileImage.value != null)
    "photo": await MultipartFile.fromFile(
      profileImage.value!.path,
      filename: profileImage.value!.name,
      contentType: MediaType("image", "png"),
    ),
});

      final response = await _client.postFormData(
        url: 'https://readiness-track-server.onrender.com/api/v1/user',
        data: formData,
        token: token
        
      );

      print('✅ User Created: ${response.data}');
      Get.snackbar('Success', '✅ User Created: ${response.data}');
    } on DioError catch (e) {
      if (e.response != null) {
        print(
          '❌ DioError Response: Status Code ${e.response?.statusCode}, Data: ${e.response?.data}',
        );
        Get.snackbar(
          'Error',
          'Status: ${e.response?.statusCode}, ${e.response?.data}',
        );
      } else {
        print('❌ DioError (No Response): ${e.message}');
        Get.snackbar('Error', 'Network Error: ${e.message}');
      }
    } catch (e) {
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', '❌ Unexpected Error: $e');
    }
    finally{
      isLoading.value=false;
    }
  }
}
