import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Profile',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff232F30)
        ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 70,
            color: Colors.blue,
          )
        ],
      )
      
    );
  }
}