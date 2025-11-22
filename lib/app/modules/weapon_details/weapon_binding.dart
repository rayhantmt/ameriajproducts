import 'package:ameriajproducts/app/common_widgets/qualification_controller.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon_controller.dart';
import 'package:ameriajproducts/app/modules/weapon_history/weapon_history_controller.dart';
import 'package:get/get.dart';

class WeaponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponController>(() => WeaponController());
     Get.lazyPut<QualificationController>(() => QualificationController());
     Get.lazyPut<WeaponHistoryController>(() => WeaponHistoryController(),);
  }
}