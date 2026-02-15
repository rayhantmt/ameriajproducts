import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeContorller extends GetxController {
  var isLoading = false.obs;
  var medprostatus = false.obs;
  var weaponstatus = false.obs;
  var rangestatus=false.obs;
  var physicalstatus = false.obs;
  var counselingstatus = false.obs;
  var adminstatus = false.obs;
  var totalcompleted = 0.obs;
  var completedpercentage = 0.0.obs;
  @override
  void onInit() {
   getstatus();
    super.onInit();
  }

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
   // print(response);
    final data=response['data'];
    medprostatus.value=data['medproCompleted'];
    physicalstatus.value=data['fitnessCompleted'];
    weaponstatus.value = data['weaponCompleted'];
    rangestatus.value=data['rangeCompleted'];
    counselingstatus.value=data['counselingCompleted'];
    adminstatus.value=data['adminCompleted'];
    totalcompleted.value=data['totalCompleted'];
    completedpercentage.value=data['completionPercentage'];
    isLoading.value=false;
    }
    on AppException catch(e){
      //Get.snackbar('Error', e.toString());
      print(e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }
  //final sub = Get.find<SubscriptionController>();

  // @override
  // void onReady() {
  //   super.onReady();

  //   if (!sub.isPremium.value) {
  //     // Delay ensures UI is mounted
  //     Future.delayed(Duration.zero, () {
  //       Get.to(() => PaywallPage());
  //     });
  //   }
  // }
  // @override
  // void onInit() {
  //   if (sub.isPremium.value == false) {
  // //    // Delay ensures UI is mounted
  //     Future.delayed(Duration.zero, () {
  //       Get.offAll(() => PaywallPage());
  //    });
  //   }
  //   else if (sub.isPremium.value==true){
  //     Get.offAll('/home');
  //   }
  //   super.onInit();
  // }
}
