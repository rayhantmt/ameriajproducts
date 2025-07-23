import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/change_password_profile/change_password_profile_controller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePasswordProfileView extends StatelessWidget {
  const ChangePasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordProfileController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff2A2A2A),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.1),
            Center(child: SvgPicture.asset(Appimages.editprofilechangepass)),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Password',

              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff2A2A2A),
              ),
            ),
             SizedBox(height: Get.height*0.01,),
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
            SizedBox(height: Get.height*0.02,),
            Text('Confirm Password'
            ,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xff2A2A2A)
            ),
            ),
             SizedBox(height: Get.height*0.01,),
            Obx(
              () => Formfield(
                tittle: 'Password',
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
             SizedBox(height: Get.height*0.04,),
            GestureDetector(
              
              onTap: () => Get.back(),
              child: CommonButton(tittle: 'Save Changes')),
          ],
        ),
      ),
    );
  }
}
