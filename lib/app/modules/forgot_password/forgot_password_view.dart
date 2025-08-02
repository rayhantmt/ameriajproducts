import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    
  final controller = Get.find<EmailOnlyController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('')),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff232F30),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
          
              Text(
                'We’ll send a verification code to your mail ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff75838D),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Formfield(
                controller: controller.emailController,
                tittle: 'rayhantmt@gmail.com',
                obsecuretext: false,
                keyboardtype: TextInputType.emailAddress,
              ),
              SizedBox(height: Get.height * 0.02),
              GestureDetector(
                onTap: controller.submitEmail,
                child: Obx(() => controller.isLoading.value? Center(child: CircularProgressIndicator(
                  color: Color(0xff02411B),
                ),):CommonButton(tittle: 'Send Verification Code'),)),
            ],
          ),
        ),
      ),
    );
  }
}
