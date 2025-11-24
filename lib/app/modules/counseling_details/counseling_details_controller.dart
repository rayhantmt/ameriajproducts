import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounselingDetailsController extends GetxController{
  final namecontroller=TextEditingController();
  final datecontroller=TextEditingController();
  final nextdatecontroller=TextEditingController();
  final counseledbycontroller=TextEditingController();
  final notescontroller=TextEditingController();
  RxBool isLoading=false.obs;

  Future<void> submitQualification() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      isLoading.value = false;
      return;
    }
   
    // final body = {
    //   "data": {
    //     "trackType": "weaponQualification",
    //     "weaponQualification": {
    //       "name": nameController.text.trim(),
    //       "pass": isPassed.value,
    //       "score": scoreController.text.trim(),
    //       "date":dateController.text.trim(),
    //       "qualificationLevel": qualificationController.selectedQualification.value.toLowerCase(),
    //     }
    //   }
    // };
    final body={
    "data": {
        "name": namecontroller.text,
        "date": datecontroller.text,
        "nextDate": nextdatecontroller.text,
        "counseledBy": counseledbycontroller.text,
        "notes": notescontroller.text,
    }
};

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.counseling, // Replace with actual endpoint
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print("Submitted successfully: $response");
      Get.snackbar("Success", "Qualification data submitted");
      Get.back();
    } on AppException catch (e) {
      Get.snackbar("Submission Failed", e.message,
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

}