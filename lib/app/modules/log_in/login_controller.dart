import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  RxBool isObscured = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
}
