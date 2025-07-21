import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Schedule Appointment',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xff1E293B)
        ),
        ),
      ),
      body: Column(
        children: [
          
        ],
      )
    );
  }
}