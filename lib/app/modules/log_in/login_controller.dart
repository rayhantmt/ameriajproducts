import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      final storage = GetStorage();
final accessToken = response['data']['accessToken']; // <- from your response

storage.write('token', accessToken);
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
