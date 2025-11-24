import 'package:ameriajproducts/app/modules/admin_details/admin_details_controller.dart';
import 'package:get/get.dart';

class AdminDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdminDetailsController>(
      () => AdminDetailsController(),
    );
  }
}