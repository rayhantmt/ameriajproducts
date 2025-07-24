import 'package:get/get.dart';

class WeaponController extends GetxController {
  var isPassed = true.obs;

  void togglePass(bool value) {
    isPassed.value = value;
  }
}
