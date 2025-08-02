import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  
RxBool isObscured = true.obs;
 final String userId = Get.arguments['userId'];

  void toggleObscureText() {
    print(userId);
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = true.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

}