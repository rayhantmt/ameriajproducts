

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounselingHistoryDetails extends StatelessWidget {
  const CounselingHistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments=Get.arguments;
    final name=arguments['name'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Counseling - June 21, 2025 ',
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
              height: 310,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        name,
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
                      Icon(Icons.calendar_month, color: Color(0xff1893F8)),
                      Text(
                        'Next Date :',
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
                        'Counseled by :',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  Text('Notes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff4B5563)
                  ),
                  ),
                  Text('Discussed PFT results from June 20, 2025. Soldier passed with a score of 85 but needs improvement in push-ups. Agreed to focus on upper body strength training.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff4B5563)

                  ),
                  )
                 
                  
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
