import 'package:ameriajproducts/app/modules/range_history_details/range_history_details_controller.dart';
import 'package:get/get.dart';

class RangeHistoryDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RangeHistoryDetailsController>(() => RangeHistoryDetailsController(),);
  }
}