import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class OtpSuccessfulView extends StatelessWidget {
  const OtpSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SvgPicture.asset(Appimages.otpsuccess)
        ],
      )
    );
  }
}