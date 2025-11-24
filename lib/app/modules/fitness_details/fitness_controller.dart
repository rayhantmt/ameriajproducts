import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FitnessController extends GetxController {
  var isPassed = true.obs;
  RxBool isLoading=false.obs;

  void togglePass(bool value) {
    isPassed.value = value;
  }
final datecontroller=TextEditingController();
final namecontroller=TextEditingController();

Future<void> submitQualification() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      isLoading.value = false;
      return;
    }
   
    
    final body={
    "data": {
        "name": namecontroller,
        "pass": isPassed.value,
        "date": datecontroller
    }
};

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.physical_fitness, // Replace with actual endpoint
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
Get.back();
      print("Submitted successfully: $response");
      Get.snackbar("Success", "Qualification data submitted");
    } on AppException catch (e) {
      Get.snackbar("Submission Failed", e.message,
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

}
