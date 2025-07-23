import 'package:ameriajproducts/app/common_widgets/profile_container.dart';

import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff232F30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff2C78DC).withOpacity(.08),
                    offset: const Offset(0, 3),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
              children: [
               Image.asset(Appimages.profile),
               SizedBox(
                width: 10,
               ),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Alex Richards',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff000000)
                  ),
                  ),
                  Text('alex.Richards@**90.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff667085)
                  ),
                  )
                ],
               ),
               Spacer(),
               GestureDetector(
                onTap: () => Get.toNamed(Approutes.editprofile),
                child: Icon(Icons.edit_square)),
               SizedBox(width: 10,)
              ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: Get.height*0.4,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
               boxShadow: [
                  BoxShadow(
                    color: Color(0xff2C78DC).withOpacity(.08),
                    offset: const Offset(0, 3),
                    blurRadius: 12,
                  ),
                ],
             ),
             child: Padding(
               padding: const EdgeInsets.only(left: 20,right: 20),
               child: Column(
                children: [
                  ProfileContainer(tittle: 'Edit Profile', details: 'Change profile picture,number,email',icon: Appimages.profileicon,
                  ),
                  SizedBox(height: Get.height*0.015,),
                  ProfileContainer(tittle: 'Change Password ', details: 'Update and strengthen account security',icon: Appimages.password,),
                  SizedBox(height: Get.height*0.015,),
                  ProfileContainer(tittle: 'Subscription', details: 'Manage your plan, renew or upgrade ', icon: Appimages.subscription,),
                   SizedBox(height: Get.height*0.015,),
                  ProfileContainer(tittle: 'Terms and conditions', details: 'Understand the rules and responsibilities ', icon: Appimages.terms),
              SizedBox(height: Get.height*0.015,),
                  ProfileContainer(tittle: 'Privacy and Policy', details: 'Learn how your data is collected', icon: Appimages.privacy),
                  SizedBox(height: Get.height*0.015,),
                  ProfileContainer(tittle: 'Log Out', details: 'Securely log out Account', icon: Appimages.logout)
                ],
               ),
             ),
            )
          ],
        ),
      ),
    );
  }
}
