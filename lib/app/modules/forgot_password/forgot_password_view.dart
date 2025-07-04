import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      title: Text(''),
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [
          Text('Forgot Password',
          style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Color(0xff232F30)
      
          ),
          )
        ],
      ),
    )
    ,);
  }
}