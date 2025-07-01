import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SvgPicture.asset(Appimages.mainlogo),
            SvgPicture.asset(Appimages.helicopter),
            SvgPicture.asset(Appimages.bottomlogo),
          ],
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff133D24), Color(0xff396E4E)],
          ),
        ),
      ),
    );
  }
}
