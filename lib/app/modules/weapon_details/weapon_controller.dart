import 'package:ameriajproducts/app/common_widgets/qualification_controller.dart';
import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WeaponController extends GetxController {
  var isPassed = true.obs;
final qualificationController = Get.find<QualificationController>();
//late final selectedLevel;
  void togglePass(bool value) {
    isPassed.value = value;
  
  
  }


  final isLoading = false.obs;

  // Controllers for form fields
  final nameController = TextEditingController();
  final scoreController = TextEditingController();
  final dateController = TextEditingController();
  final levelController = TextEditingController();
  

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
        "pass":isPassed.value,
        "date": dateController.text.trim(),
        "weaponName": nameController.text.trim(),
        "score": scoreController.text.trim(),
        "qualificationLevel": qualificationController.selectedQualification.value.toLowerCase()
    }
};

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.weaponqualification, // Replace with actual endpoint
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



  @override
  void onClose() {
    nameController.dispose();
    scoreController.dispose();
    dateController.dispose();
    
    super.onClose();
  }
}
