import 'package:ameriajproducts/app/modules/otp_verification/otp_verification_controller.dart';
import 'package:get/get.dart';


class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
