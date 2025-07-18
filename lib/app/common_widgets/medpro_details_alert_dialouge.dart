import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproDetailsAlertDialouge extends StatelessWidget {
  const MedproDetailsAlertDialouge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
    backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
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
            SizedBox(height: 10,),
            Text('Name',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xff4B5563)
            ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              
                border: Border.all(
                  width: 1,
                  color: Color(0xff4B5563)
                )
              ),
              child:TextFormField(
                
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter'
                  
                ),
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
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Color(0xff4B5563)
                )
              ),
              child: TextFormField(
                
                decoration: InputDecoration(
                 hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Select'),
                  Icon(Icons.calendar_month_outlined)
                 ],),

                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                   color: Color(0xffF3F4F6)
                  ),
                  child: Center(child: Text("Cancel")),
                ),
                Container(
                  height: 35,
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                   color: Color(0xff08692C)
                  ),
                  child: Center(child: Text("Save")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}