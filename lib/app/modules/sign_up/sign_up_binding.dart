import 'package:ameriajproducts/app/modules/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SignUpPasswordviewController>(() => SignUpPasswordviewController());

  }

  
}