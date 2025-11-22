import 'package:ameriajproducts/app/modules/range_history/range_history_controller.dart';
import 'package:get/instance_manager.dart';

class RangeHistoryBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<RangeHistoryController>(() => RangeHistoryController(),);
  }
}