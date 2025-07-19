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
      body:ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,
        bottom: 10
        ),
        child: Container(
          height: 70,
          width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          boxShadow: [
          BoxShadow(
            color: Color(0xff2C78DC).withOpacity(.08),
            offset: const Offset(0, 2),
            blurRadius: 12,
          ),
        ],
        ),
        
        ),
      ),),
      
    );
  }
}