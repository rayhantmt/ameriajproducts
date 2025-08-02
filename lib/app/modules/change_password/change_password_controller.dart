import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxBool isObscured = true.obs;
  final String userId = Get.arguments['userId'];
  TextEditingController passwordController = TextEditingController();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  RxBool isObscured1 = true.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

  Future<void> resetPassword() async {
    final body = {
      "data": {
        "userId": userId, // Already available in your controller
        "newPassword": passwordController.text.trim(), // From form field
      },
    };

    try {
      final response = await ApiService.put(
        endpoint:
            ApiConfig.restpasswordendpoint, // Update with your actual endpoint
        body: body,
      );

      // print("Password Reset Success: $response");

      Get.toNamed(Approutes.otpsuccess);
    } on AppException catch (e) {
      Get.snackbar(
        'Reset Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}
