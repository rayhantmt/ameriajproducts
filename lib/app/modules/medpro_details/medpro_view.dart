import 'package:flutter/material.dart';

class MedproView extends StatelessWidget {
  const MedproView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medpro Status',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff131123)
        ),),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
        Container(
          height: 28,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
        width: 1,
        color: Color(0xff08692C)
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        )
              ],
            )
          ],
        ),
      ),
    );
  }
}