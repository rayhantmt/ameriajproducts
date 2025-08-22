import 'package:ameriajproducts/data/api_services/api_services.dart';
import 'package:get/get.dart';

import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'weapon_history_model.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';

class WeaponHistoryController extends GetxController {
  var isLoading = false.obs;
  var weaponHistoryList = <WeaponHistoryModel>[].obs;

  // API endpoint
final String endpoint = "${ApiConfig.trackhistory}weaponQualification";


  @override
  void onInit() {
    super.onInit();
    fetchWeaponHistory();
  }

  Future<void> fetchWeaponHistory() async {
    try {
      isLoading.value = true;

      // Call ApiService GET
      final response = await ApiService.get(endpoint: endpoint);

      // Extract track list safely
      final List trackList = response["data"]["track"] ?? [];

      // Map API response to WeaponHistoryModel using "weaponQualification"
      weaponHistoryList.value = trackList
          .map((item) => WeaponHistoryModel.fromJson(item["weaponQualification"]))
          .toList();
    } on BadRequestException catch (e) {
      Get.snackbar("Bad Request", e.toString());
    } on UnauthorizedException catch (e) {
      Get.snackbar("Unauthorized", e.toString());
    } on NotFoundException catch (e) {
      Get.snackbar("Not Found", e.toString());
    } on InternalServerException catch (e) {
      Get.snackbar("Server Error", e.toString());
    } on FetchDataException catch (e) {
      Get.snackbar("Network Error", e.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
