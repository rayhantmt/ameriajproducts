import 'package:ameriajproducts/app/modules/change_password/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ChangePasswordController(),fenix: false);
  }
}