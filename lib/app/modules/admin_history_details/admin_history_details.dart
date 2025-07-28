import 'package:flutter/material.dart';

class AdminHistoryDetails extends StatelessWidget {
  const AdminHistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Admin',
        
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff131123)
        ),
        ),
      ),
    );
  }
}