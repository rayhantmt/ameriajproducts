import 'package:flutter/material.dart';

class ChangePasswordProfileView extends StatelessWidget {
  const ChangePasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Change Password',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff2A2A2A)
        ),
        
        ),
      ),
    );
  }
}