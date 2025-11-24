import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/modules/counseling_history/counseling_history_model.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounseligHistoryController extends GetxController{
var counselinghistorydata=<CounselingHistoryModel>[].obs;
RxBool isfeatching=false.obs;
Future<void> fetchCounseling() async {
    isfeatching.value = true;

    // Get the token stored in GetStorage
    final token = GetStorage().read('token');
    if (token == null) {
      // Handle case where token is missing
      Get.snackbar(
        'Error',
        'No authentication token found',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      isfeatching.value = false;
      return;
    }

    try {
      // Make the GET request using your custom ApiService
      final response = await ApiService.get(
        endpoint: ApiConfig.counseling,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // Check if response contains the required data
      if (response['data'] != null &&
          response['data']['counseling'] != null) {
        final List<dynamic> data = response['data']['counseling'];

        // Map the API response to the WeaponHistoryModel
        counselinghistorydata.value = data
            .map((e) => CounselingHistoryModel.fromJson(e))
            .toList();

        // Optionally navigate to another page (uncomment if needed)
        Get.toNamed(Approutes.counselinghistory);
      } else {
        // Handle empty response or missing data
        Get.snackbar(
          'No Data Found',
          'No range qualification data available',
          backgroundColor: Colors.orangeAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle any error that occurs (bad request, server error, etc.)
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      // Ensure loading flag is reset
      isfeatching.value = false;
    }
  }

}