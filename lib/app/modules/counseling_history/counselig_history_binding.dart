import 'package:ameriajproducts/app/modules/counseling_history/counselig_history_controller.dart';
import 'package:get/get.dart';

class CounseligHistoryBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<CounseligHistoryController>(() => CounseligHistoryController(),);
  }
}