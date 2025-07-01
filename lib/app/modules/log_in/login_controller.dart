import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  RxBool isObscured = true.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
}
