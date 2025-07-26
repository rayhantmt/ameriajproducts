import 'package:get/get.dart';

class FitnessController extends GetxController {
  var isPassed = true.obs;
  var selectedIndex = 0.obs;

  void select(int index) {
    selectedIndex.value = index;
  }

  void togglePass(bool value) {
    isPassed.value = value;
  }
}
