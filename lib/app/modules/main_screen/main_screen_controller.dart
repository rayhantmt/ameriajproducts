import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  RxBool isLoading = false.obs;
  Future<void> deleteaccount() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      return;
    }

    try {
      final response = await ApiService.delete(
        endpoint: ApiConfig.user, // Replace with your actual endpoint

        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      Get.offAllNamed(Approutes.login);
      print('Account deleted $response');
      Get.snackbar(
        "Success",
        "Account deleted Successfully",
        backgroundColor: Colors.white38,
      );
    } on AppException catch (e) {
      Get.snackbar(
        "Failed",
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
      Get.offAllNamed(Approutes.login);
    }
  }
}
