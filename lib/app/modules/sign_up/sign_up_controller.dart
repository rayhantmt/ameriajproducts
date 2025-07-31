import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/data/api_services/api_services.dart';
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

 

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Country code and role can be default or selected from dropdown
  
  final role = 'User'.obs;

  // Loading state
  final isLoading = false.obs;

  // Sign Up API call
  Future<void> signUp() async {
    isLoading.value = true;

    final body = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "role": role.value,
      "countryCode": countryCode.value,
      "mobile": mobileController.text.trim(),
      "password": passwordController.text.trim(),
      "confirmedPassword": confirmPasswordController.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: '/auth/register', // Update endpoint as per your API
        body: body,
      );
print(response);
      // Handle success (navigate, toast, etc.)
      Get.snackbar('Success', 'Account created successfully');
       Get.offAllNamed(Approutes.login);
    } on AppException catch (e) {
      Get.snackbar('Error', e.message, backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}