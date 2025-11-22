import 'package:ameriajproducts/app/common_widgets/qualification_controller.dart';
import 'package:ameriajproducts/app/modules/range_detailss/range_controller.dart';
import 'package:get/get.dart';

class RangeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RangeController>(() => RangeController(),);
    Get.lazyPut<QualificationController>(() => QualificationController(),);
  }
}