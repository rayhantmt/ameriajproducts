import 'package:get/get.dart';

class ChangePasswordProfileController extends GetxController{
  
RxBool isObscured = true.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = true.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

}