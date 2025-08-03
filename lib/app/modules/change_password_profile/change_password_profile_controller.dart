import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordProfileController extends GetxController{
  
RxBool isObscured = true.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = true.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }
final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> changePassword() async {
    final token = GetStorage().read('token');

    final body = {
      "data": {
        "oldPassword": oldPasswordController.text.trim(),
        "newPassword": newPasswordController.text.trim(),
      }
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoading.value = true;

      final response = await ApiService.patch(
        endpoint: ApiConfig.changepasswordendpoint, // e.g., "/user/change-password"
        body: body,
        headers: headers,
      );
Get.back();
      print("✅ Password changed successfully: $response");

      Get.snackbar(
        'Success',
        'Password updated successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on AppException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}