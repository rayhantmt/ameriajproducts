import 'package:ameriajproducts/app/modules/fitness_history/fitness_historry_controller.dart';
import 'package:get/get.dart';

class FitnessHistoryBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<FitnessHistorryController>(() => FitnessHistorryController(),);
  }
}