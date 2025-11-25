import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
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
      Get.snackbar('Successful', 'Successfully submitted the medpro status data');
    } on AppException catch (e) {
      print("Error: $e");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
