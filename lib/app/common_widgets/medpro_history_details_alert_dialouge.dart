import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproHistoryDetailsAlertDialouge extends StatelessWidget {
  // final String name;
  // final String date;
  const MedproHistoryDetailsAlertDialouge({super.key, });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
        child: SizedBox(
          height: Get.height*0.3,
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
              Text('',
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
              Text('',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffADAEBC)
              ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff08692C),
                  ),
                  child: Center(
                    child: Text('Okay',
                    style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white
                    ),
                    ),
                  ),
                ),
              )
            ],

          ),
        ),
      )
    );
  }
}