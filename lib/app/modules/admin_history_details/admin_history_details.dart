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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 330,
              width: double.infinity,
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
                      Text('LES Correct :',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff4B5563)
                      ),
                      ),
                      Text('Yes',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280)
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Vehicle Registration :',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff4B5563)
                      ),
                      ),
                      Text('23-06-2015',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280)
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Vehicle Insurance :',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff4B5563)
                      ),
                      ),
                      Text('23-06-2015',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280)
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Education Military :',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff4B5563)
                      ),
                      ),
                      Expanded(
                        child: Text('Completed Basic Leadership Course (BLC)',
                        
                        maxLines: 4,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280)
                        ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}