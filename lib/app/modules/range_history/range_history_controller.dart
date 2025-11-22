import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/modules/range_history/range_history_model.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// TODO: Ensure you import the file where RangeHistoryModel is defined
// import 'package:ameriajproducts/path/to/range_history_model.dart'; 

class RangeHistoryController extends GetxController {

  // --- State Variables ---
  // Updated to use RangeHistoryModel
  var rangeQualifications = <RangeHistoryModel>[].obs;
  var isLoadingRangeQual = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Optional: Uncomment if you want to fetch automatically when screen loads
    // fetchRangeQualifications();
  }

  // --- API Function ---
  Future<void> fetchRangeQualifications() async {
    isLoadingRangeQual.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      // Get.snackbar("Error", "No auth token found");
      isLoadingRangeQual.value = false;
      return;
    }

    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.getRangeQualificationEndpoint, 
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // 1. Access the nested data object
      // 2. Access the 'rangequalification' list array
      if (response['data'] != null && response['data']['rangequalification'] != null) {
        final List<dynamic> data = response['data']['rangequalification'];
        
        // Map the JSON data to your RangeHistoryModel
        rangeQualifications.value = data
            .map((e) => RangeHistoryModel.fromJson(e))
            .toList();
      }
      
    } on AppException catch (e) {
      Get.snackbar(
        'Fetch Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
       Get.snackbar(
        'Error', 
        'Something went wrong: $e',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      // Ensure loading stops regardless of success or failure
      isLoadingRangeQual.value = false;
    }
  }
}