import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/modules/medpro_details/medpo_item.dart';
import 'package:ameriajproducts/app/modules/medpro_details/medpro_model.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
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
      Get.snackbar(
        'Successful',
        'Successfully submitted the medpro status data',
      );
    } on AppException catch (e) {
      print("Error: $e");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  var feteching = false.obs;
  var medProList = <MedProModel>[].obs;
  Future<void> fetchMedProData() async {
    feteching.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar(
        'Error',
        'No authentication token found',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      feteching.value = false;
      return;
    }

    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.medpro, // Replace with your endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response['data'] != null && response['data']['medpro'] != null) {
        final List<dynamic> data = response['data']['medpro'];

        // Map the data to MedProModel
        medProList.value = data.map((e) => MedProModel.fromJson(e)).toList();

        // Flattening tests into a single list for easier access if needed
        var allTests = <MedProTestModel>[];
        for (var medPro in medProList) {
          allTests.addAll(medPro.tests); // Flatten tests into a single list
        }
        Get.snackbar('Success', 'Successfully got data');
        // You can now use medProList to pass the whole dataset to the next screen
        // Example: Get.toNamed("/nextScreen", arguments: allTests);
        Get.toNamed(Approutes.medprohistory);
      } else {
        Get.snackbar(
          'No Data',
          'No MedPro data found',
          backgroundColor: Colors.orangeAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      feteching.value = false;
    }
  }
}
