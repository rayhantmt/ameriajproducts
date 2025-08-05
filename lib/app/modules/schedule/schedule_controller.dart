import 'package:ameriajproducts/app/modules/schedule/schedule_model.dart';
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
      await fetchAppointments();
                        
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
  final isLoadinggetappointment = false.obs;
  final appointments = <ScheduleModel>[].obs;

  Future<void> fetchAppointments() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "No auth token found");
      return;
    }

    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.getAppointmentEndpoint, // <-- your endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final List<dynamic> data = response['data']['appointment'];
      appointments.value = data.map((e) => ScheduleModel.fromJson(e)).toList();
    } on AppException catch (e) {
      Get.snackbar(
        'Fetch Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


 final RxBool isDeletingAppointment = false.obs;

Future<void> deleteAppointment(String id) async {
  isDeletingAppointment.value = true;

  final token = GetStorage().read('token');
  if (token == null) {
    Get.snackbar("Error", "Token not found");
    isDeletingAppointment.value = false;
    return;
  }

  try {
    final response = await ApiService.delete(
      endpoint: '/Appointment/$id',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("Appointment deleted: $response");
    Get.snackbar("Success", "Appointment deleted");

    // Optionally refresh appointment list
    await fetchAppointments();
  } on AppException catch (e) {
    Get.snackbar("Delete Failed", e.message,
        backgroundColor: Colors.redAccent, colorText: Colors.white);
  } finally {
    isDeletingAppointment.value = false;
  }
}


}
