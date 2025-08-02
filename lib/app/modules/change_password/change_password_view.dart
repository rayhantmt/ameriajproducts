import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/change_password/change_password_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordController>();
   

    return Scaffold(
      
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.12,),
              Text(
                'Set New Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff232F30),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enter your new password and make sure you remember it',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff8391A1),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Formfield(
                  tittle: 'Enter Password',
                  obsecuretext: controller.isObscured.value,
                  keyboardtype: TextInputType.text,
                  icon: GestureDetector(
                    onTap: controller.toggleObscureText,
                    child: Icon(
                      controller.isObscured.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => Formfield(
                  controller: controller.passwordController,
                  tittle: 'Confirmed Password',
                  obsecuretext: controller.isObscured1.value,
                  keyboardtype: TextInputType.text,
                  icon: GestureDetector(
                    onTap: controller.toggleObscureText1,
                    child: Icon(
                      controller.isObscured1.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: controller.resetPassword,
                child: CommonButton(tittle: 'Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
