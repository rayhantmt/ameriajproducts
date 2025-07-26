import 'package:ameriajproducts/app/modules/weapon_details/weapon_controller.dart';
import 'package:get/get.dart';

class FitnessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponController>(() => WeaponController());
  }
}