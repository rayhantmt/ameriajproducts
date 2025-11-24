import 'package:ameriajproducts/app/modules/admin_details/admin_details_controller.dart';
import 'package:ameriajproducts/app/modules/admin_history/admin_history_controller.dart';
import 'package:get/get.dart';

class AdminDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdminDetailsController>(
      () => AdminDetailsController(),
    );
    Get.lazyPut<AdminHistoryController>(() => AdminHistoryController(),);
  }
}