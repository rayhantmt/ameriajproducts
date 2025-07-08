import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.name, required this.img});
  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFEFDFB),
        boxShadow: [
          BoxShadow(
            color: Color(0xff2C78DC).withOpacity(0.08), // shadow color
            blurRadius: 10, // blur effect
            offset: Offset(4, 4), // X, Y offset
            spreadRadius: 1, // how far the shadow spreads
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(img),
          SizedBox(width: 5),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff2A2A2A),
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            'View Details',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff1893F8),
            ),
          ),
          Icon(Icons.arrow_forward_outlined, color: Color(0xff1893F8)),
        ],
      ),
    );
  }
}
