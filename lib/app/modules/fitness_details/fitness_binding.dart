import 'package:ameriajproducts/app/common_widgets/qualification_controller.dart';
import 'package:ameriajproducts/app/modules/fitness_details/fitness_controller.dart';
import 'package:ameriajproducts/app/modules/fitness_history/fitness_historry_controller.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon_controller.dart';
import 'package:get/get.dart';

class FitnessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponController>(() => WeaponController());
     Get.lazyPut<QualificationController>(() => QualificationController());
     Get.lazyPut<FitnessController>(() => FitnessController(),);
     Get.lazyPut<FitnessHistorryController>(()=>FitnessHistorryController());
  }
}