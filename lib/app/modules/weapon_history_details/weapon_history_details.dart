import 'package:flutter/material.dart';

class WeaponHistoryDetails extends StatelessWidget {
  const WeaponHistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Weapon Qualification - June 21, 2025',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xff131123)
        ),
        ),
      ),
    );
  }
}