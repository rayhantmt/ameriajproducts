import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldviewcontrorller = Get.find<SignUpPasswordviewController>();
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff232F30),
                ),
              ),

              Text(
                'It is quick and easy to create you account',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff75838D),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Formfield(
                tittle: 'Enter your First Name',
                obsecuretext: false,
                keyboardtype: TextInputType.text,
              ),
              SizedBox(height: Get.height * 0.02),
              Formfield(
                tittle: 'Enter your last name',
                obsecuretext: false,
                keyboardtype: TextInputType.text,
              ),
              SizedBox(height: Get.height * 0.02),
              Formfield(
                tittle: 'Enter you phone number',
                obsecuretext: false,
                keyboardtype: TextInputType.number,
              ),
              SizedBox(height: Get.height * 0.02),
              Formfield(
                tittle: 'Enter your email address',
                obsecuretext: false,
                keyboardtype: TextInputType.emailAddress,
              ),
              SizedBox(height: Get.height * 0.02),
              Obx(
                () => Formfield(
                  tittle: 'Enter Password',
                  obsecuretext: fieldviewcontrorller.isObscured.value,
                  keyboardtype: TextInputType.text,
                  icon: GestureDetector(
                    onTap: fieldviewcontrorller.toggleObscureText,
                    child: Icon(
                      fieldviewcontrorller.isObscured.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
SizedBox(height: Get.height * 0.02),
              Obx(
                () => Formfield(
                  tittle: 'Confirmed Password',
                  obsecuretext: fieldviewcontrorller.isObscured1.value,
                  keyboardtype: TextInputType.text,
                  icon: GestureDetector(
                    onTap: fieldviewcontrorller.toggleObscureText1,
                    child: Icon(
                      fieldviewcontrorller.isObscured1.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              GestureDetector(
                onTap: () => Get.offAllNamed('/onboarding'),
                child: CommonButton(tittle: 'Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
