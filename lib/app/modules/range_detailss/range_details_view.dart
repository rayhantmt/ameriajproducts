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
    );
  }
}