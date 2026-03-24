import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Appimages.secondlogo, height: 85, width: 125),
                Text(
                  'Welcome to Readiness Track',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Stay mission-ready with real-time readiness tracking, trusted appointment scheduling – all in one place. Begin your journey to staying prepared, wherever you serve.',
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Get.toNamed('/signup'),
                  child: CommonButton(tittle: 'Open Account')),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Get.toNamed('/login'),
                  child: Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffB9B3B3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff667085),
                        ),
                      ),
                    ),
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
