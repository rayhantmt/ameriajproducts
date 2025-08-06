import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/log_in/login_controller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldviewcontrorller = Get.find<PasswordFieldController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('')),
      
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(Appimages.helicopter, height: 150),
              Image.asset(Appimages.bottomlogo),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Login to Your Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff232F30),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'It is quick and easy to log in. Enter your email and password below.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff75838D),
                  ),
                ),
                Formfield(
                  controller: fieldviewcontrorller.emailController,
                  tittle: 'Enter your email address',
                  keyboardtype: TextInputType.emailAddress,
                  obsecuretext: false,
                ),
                SizedBox(height: 20),
                Obx(
                  () => Formfield(
                    controller: fieldviewcontrorller.passwordController,
                    tittle: 'Enter Password',
                    keyboardtype: TextInputType.text,
                    obsecuretext: fieldviewcontrorller.isObscured.value,
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
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Get.toNamed('/forgotpassword'),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xff1F93FF),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed('/signup'),
                      child: Text(
                        'I don’t have an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff979797),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => fieldviewcontrorller.login(),
                  child: Obx(() => fieldviewcontrorller.isLoading.value?Center(child: const CircularProgressIndicator(
                    color: Color(0xff08692C),
                  )):CommonButton(tittle: 'Login'),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
