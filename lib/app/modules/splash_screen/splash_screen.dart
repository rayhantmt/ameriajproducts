import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/onboarding');
      print('object');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff133D24), Color(0xff396E4E)],
          ),
        ),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            SvgPicture.asset(Appimages.mainlogo),
            Image.asset(Appimages.helicopter, height: 250),
            Image.asset(Appimages.bottomlogo, height: 181),
          ],
        ),
      ),
    );
  }
}
