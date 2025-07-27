
import 'package:flutter/material.dart';


class FitnessHistoryDetails extends StatelessWidget {
  const FitnessHistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Physical Fitness Test History \n- June 21, 2025',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff2C78DC).withOpacity(.08),
                    offset: const Offset(0, 3),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Color(0xff1893F8)),
                      Text(
                        'Date :',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                      Text(
                        '23-06-2015',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.group, color: Color(0xff22C55E)),
                      Text(
                        'Name :',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                      Text(
                        'Height Test',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.insert_drive_file, color: Color(0xff6642F5)),
                      Text(
                        'Pass/Fail :',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                      Icon(Icons.check, color: Color(0xff22C55E)),
                      Text(
                        'Pass',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 30),
           
          ],
        ),
      ),
    );
  }
}
