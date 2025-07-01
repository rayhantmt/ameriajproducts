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
      appBar: AppBar(title: Text('')),
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
                  tittle: 'Enter your email address',
                  keyboardtype: TextInputType.emailAddress,
                  obsecuretext: false,
                ),
                SizedBox(height: 20),
                Obx(
                  () => Formfield(
                    tittle: 'Enter Password',
                    keyboardtype: TextInputType.text,
                    obsecuretext: fieldviewcontrorller.isObscured.value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
