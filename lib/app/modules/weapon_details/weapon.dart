import 'package:flutter/material.dart';

class Weapon extends StatelessWidget {
  const Weapon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text('weapon'),),
    );
  }
}