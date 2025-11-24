import 'package:get/get.dart';

class AdminDetailsController extends GetxController{

  var isPassed = true.obs;
  RxBool isLoading=false.obs;

  void togglePass(bool value) {
    isPassed.value = value;
  }
}