import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminDetailsController extends GetxController{

  var isPassed = true.obs;
  RxBool isLoading=false.obs;

  void togglePass(bool value) {
    isPassed.value = value;
  }
  final vehicleregistrationcontroller=TextEditingController();
  final vehicleinsurancecontroller=TextEditingController();
  final edicationmilitarycontroller=TextEditingController();
  final educationcivilian=TextEditingController();
  final volunteerhourcontroller=TextEditingController();
Future<void> submitadmininfo () async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      isLoading.value = false;
      return;
    }
   
    
    final body={
    "data": {
        "lesCorrect": isPassed.value,
        "vehicleRegistration":vehicleregistrationcontroller.text,
        "vehicleInsurance": vehicleinsurancecontroller.text,
        "educationMilitary": edicationmilitarycontroller.text,
        "educationCivilian": educationcivilian.text,
        "volunteerHour": volunteerhourcontroller.text
    }
};

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.admin, // Replace with actual endpoint
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