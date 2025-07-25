import 'package:get/get.dart';

class QualificationController extends GetxController {
  RxBool isChecked = false.obs;

  void toggleCheck(bool? value) {
    isChecked.value = value ?? !isChecked.value;
  }
}