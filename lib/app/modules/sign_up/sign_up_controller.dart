import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPasswordviewController extends GetxController{
  
RxBool isObscured = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = false.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

final phoneController = TextEditingController();
  final countryCode = '+880'.obs; // Default country code

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}