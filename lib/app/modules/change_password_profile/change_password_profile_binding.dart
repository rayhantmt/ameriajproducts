
import 'package:ameriajproducts/app/modules/change_password_profile/change_password_profile_controller.dart';
import 'package:get/get.dart';

class ChangePasswordProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ChangePasswordProfileController());
  }
}