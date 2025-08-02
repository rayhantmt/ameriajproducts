import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/core/api_config/api_config.dart';

class EmailOnlyController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> submitEmail() async {
    isLoading.value = true;

    final body = {
      "data": {
        "email": emailController.text.trim(),
      }
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.forgetpassword, // Replace with your actual endpoint
        body: body,
      );

      // ✅ Handle success
      print("Response: $response");
      Get.snackbar('Success', 'Otp sent to your eamil successfully',
        backgroundColor: Color(0xff02411B), colorText: Colors.white);

       Get.toNamed('/otp',arguments: emailController.text.trim());
      
    } on AppException catch (e) {
      // ❌ Error from API
      Get.snackbar('Error', e.message,
        backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
