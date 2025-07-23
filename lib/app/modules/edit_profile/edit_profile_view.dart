import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Edit profile',
  style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Color(0xff2A2A2A)
  ),
  ),
),
    );
  }
}