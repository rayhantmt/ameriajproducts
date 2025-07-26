import 'package:flutter/material.dart';

class RangeDetailsView extends StatelessWidget {
  const RangeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  backgroundColor: Colors.white,
  title: Text('Range Qualification',
  style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Color(0xff131123)
  ),
  ),
),
body: Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff08692C)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.history, color: Color(0xff08692C)),
                        Text(
                          'View History',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff08692C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    ),
  ),
),
    );
  }
}