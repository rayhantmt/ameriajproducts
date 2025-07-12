import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproCard extends StatelessWidget {
  const MedproCard({super.key, required this.tittle, required this.color, required this.icon});
  final String tittle;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: Get.height * 0.13,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(
            color: color, width: 4,
          ),
        ),
        boxShadow: [
          BoxShadow(
           color: Color(0xff2C78DC).withOpacity(.08),
             offset: const Offset(0, 3),
            blurRadius: 12
          )
        ]
      ),
    
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Icon(icon, color: color),
            Text(tittle,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff1F2937)
            ),),
            Text('Tap to add',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xff6B7280)
            ),)
          ],
        ),
      ),
    );
  }
}
