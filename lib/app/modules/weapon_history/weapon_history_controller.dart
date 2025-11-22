import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:get_storage/get_storage.dart';
import 'weapon_history_model.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';

class WeaponHistoryController extends GetxController {
//   var isLoading = false.obs;
//   var weaponHistoryList = <WeaponHistoryModel>[].obs;

//   // API endpoint
// final String endpoint = "${ApiConfig.trackhistory}weaponQualification";


//   @override
//   void onInit() {
//     super.onInit();
//     fetchWeaponHistory();
//   }

//   Future<void> fetchWeaponHistory() async {
//     try {
//       isLoading.value = true;

//       // Call ApiService GET
//       final response = await ApiService.get(endpoint: endpoint);

//       // Extract track list safely
//       final List trackList = response["data"]["track"] ?? [];

//       // Map API response to WeaponHistoryModel using "weaponQualification"
//       weaponHistoryList.value = trackList
//           .map((item) => WeaponHistoryModel.fromJson(item["weaponQualification"]))
//           .toList();
//     } on BadRequestException catch (e) {
//       Get.snackbar("Bad Request", e.toString());
//     } on UnauthorizedException catch (e) {
//       Get.snackbar("Unauthorized", e.toString());
//     } on NotFoundException catch (e) {
//       Get.snackbar("Not Found", e.toString());
//     } on InternalServerException catch (e) {
//       Get.snackbar("Server Error", e.toString());
//     } on FetchDataException catch (e) {
//       Get.snackbar("Network Error", e.toString());
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
RxBool isLoadingRangeQual=false.obs;
var weaponQualifications = <WeaponHistoryModel>[].obs;

Future<void> fetchWeaponQualifications() async {
  isLoadingRangeQual.value = true;

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
    isLoadingRangeQual.value = false;
    return;
  }

  try {
    // Make the GET request using your custom ApiService
    final response = await ApiService.get(
      endpoint: ApiConfig.weaponqualification,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // Check if response contains the required data
    if (response['data'] != null && response['data']['weaponqualification'] != null) {
      final List<dynamic> data = response['data']['weaponqualification'];

      // Map the API response to the WeaponHistoryModel
      weaponQualifications.value = data
          .map((e) => WeaponHistoryModel.fromJson(e))
          .toList();
      
      // Optionally navigate to another page (uncomment if needed)
      Get.toNamed(Approutes.weaponhistory);
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
    isLoadingRangeQual.value = false;
  }
}

}
