import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  RxBool isObscured = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
   final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final body = {
  "data": {
    "email": emailController.text.trim(),
    "password": passwordController.text.trim(),
  }
};
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.loginEndpoint, // Change if your endpoint differs
        body: body,
      );
 Get.offAllNamed('/mainscreen');
      // Handle success (e.g., token saving, navigating)
      print("Login success: $response");
   

    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
