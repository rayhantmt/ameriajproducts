import 'package:ameriajproducts/app/modules/range_history/range_history_controller.dart';
import 'package:get/get.dart';

class RangeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RangeHistoryController>(() => RangeHistoryController(),);
  }
}