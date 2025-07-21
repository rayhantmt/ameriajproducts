import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproHistoryDetailsAlertDialouge extends StatelessWidget {
  const MedproHistoryDetailsAlertDialouge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
        child: SizedBox(
          height: Get.height*0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fill Form',
              style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.black
              ),
              ),
              SizedBox(height: 20,),
              Text('Name',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff4B5563)
              ),
              ),
              SizedBox(height: 10,),
              Text('Enter',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffADAEBC)
              ),
              ),
              SizedBox(height: 20,),
              Text('Date',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xff4B5563)
            ),
              ),
               SizedBox(height: 10,),
              Text('Enter',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffADAEBC)
              ),
              ),
            ],

          ),
        ),
      )
    );
  }
}