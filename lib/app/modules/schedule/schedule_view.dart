import 'package:ameriajproducts/app/modules/schedule/schedule_model.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final data=scheduledata().sdata;
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
            ),
            Text('Schedule Today',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xff1E293B)
            ),
            ),
            Text('data'),
SizedBox(height: 20,),
ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) => Container(
  decoration: BoxDecoration(

  ),
),)
          ],
        ),
      )
    );
  }
}