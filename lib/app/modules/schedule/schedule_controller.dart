import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';

class AppointmentController extends GetxController {
  final isLoading = false.obs;

  // If using controllers for input
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final detailsController = TextEditingController();
  final locationController = TextEditingController();

  Future<void> bookAppointment() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      return;
    }

    final body = {
      "data": {
        "date": dateController.text.trim(), // e.g. '21/07/2025'
        "time": timeController.text.trim(), // e.g. '12:30 PM'
        "details": detailsController.text.trim(), // Short description
        "location": locationController.text.trim(), // Location info
      }
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.psotappointment, // Replace with your actual endpoint
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Appointment booked: $response');
      Get.snackbar("Success", "Appointment Booked Successfully");
                        
    } on AppException catch (e) {
      Get.snackbar(
        "Failed",
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    dateController.dispose();
    timeController.dispose();
    detailsController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
