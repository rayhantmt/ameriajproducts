import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
        ],
      ),
    );
  }
}
