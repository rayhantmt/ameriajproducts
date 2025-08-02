import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class OtpSuccessfulView extends StatelessWidget {
  const OtpSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height*0.2),
            SvgPicture.asset(Appimages.otpsuccess),
            SizedBox(height: 10,),
            Text('Success',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Color(0xff000000)
            ),
            ),
            SizedBox(height: 10,),
            Text('Your password has been successfully reset',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff475569)
            ),
            
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () => Get.offAllNamed(Approutes.login),
              child: CommonButton(tittle: 'Back to Log in'))
          ],
        ),
      )
    );
  }
}