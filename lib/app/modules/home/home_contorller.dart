import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeContorller extends GetxController {
  var isLoading = false.obs;
  var medprostatus = false.obs;
  var weaponstatus = false.obs;
  var physicalstatus = false.obs;
  var counselingstatus = false.obs;
  var adminstatus = false.obs;
  var totalcompleted = 0.obs;
  var completedpercentage = 0.0.obs;

  Future<void> getstatus() async {
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;
    try 
    {
      final response = await ApiService.get(
      endpoint: ApiConfig.status,
      headers: {'Authorization': 'Bearer $token'},
    );
    final data=response['data'];
    medprostatus.value=data['medproCompleted'];
    }
    on AppException catch(e){
      Get.snackbar('Error', e.toString());
    }
  }
}
