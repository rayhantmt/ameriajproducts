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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
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
            )
          ],
        ),
      )
      
    );
  }
}