import 'package:ameriajproducts/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:get/get.dart';


class EmailOnlyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailOnlyController>(() => EmailOnlyController());
  }
}
