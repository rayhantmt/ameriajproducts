import 'package:ameriajproducts/app/modules/weapon_history/weapon_history_controller.dart';
import 'package:get/get.dart';

class WeaponHistoryBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<WeaponHistoryController>(() => WeaponHistoryController(),);

  }
}