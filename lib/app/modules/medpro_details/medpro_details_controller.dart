import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/modules/medpro_details/medpo_item.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MedproDetailsController extends GetxController {
  var items = <MedproItem>[].obs;

  void addItem(String type, String name, String date) {
    items.add(MedproItem(type: type, name: name, date: date));
  }

  RxBool isLoading = false.obs;
  Future<void> submitAll() async {
    final token = GetStorage().read('token');
    isLoading.value = true;
    try {
      final body = {
        "data": {"tests": items.map((e) => e.toJson()).toList()},
      };

      print("FINAL BODY ---> $body");

      // TODO: call API here
      final response = await ApiService.post(
        body: body,
        endpoint: ApiConfig.medpro,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Medpro Status Sbumitted successfully $response');
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //    Future<void> submitQualification() async {
  //     isLoading.value = true;

  //     final token = GetStorage().read('token');
  //     if (token == null) {
  //       Get.snackbar("Error", "Token not found");
  //       isLoading.value = false;
  //       return;
  //     }
  //     final body={
  //     "data": {
  //         "pass":isPassed.value,
  //         "date": dateController.text.trim(),
  //         "weaponName": nameController.text.trim(),
  //         "score": scoreController.text.trim(),
  //         "qualificationLevel": qualificationController.selectedQualification.value.toLowerCase()
  //     }
  // };

  //     try {
  //       final response = await ApiService.post(
  //         endpoint: ApiConfig.weaponqualification, // Replace with actual endpoint
  //         body: body,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         },
  //       );
  // Get.back();
  //       print("Submitted successfully: $response");
  //       Get.snackbar("Success", "Qualification data submitted");
  //     } on AppException catch (e) {
  //       Get.snackbar("Submission Failed", e.message,
  //           backgroundColor: Colors.redAccent, colorText: Colors.white);
  //     } finally {
  //       isLoading.value = false;
  //     }
  //   }
}
