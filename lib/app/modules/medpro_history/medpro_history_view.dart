import 'package:flutter/material.dart';

class MedproHistoryView extends StatelessWidget {
  const MedproHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Medpro History',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xff131123)
        ),
        ),
      ),
      body: Center(
        child: Text('Medpro history'),
      ),
    );
  }
}