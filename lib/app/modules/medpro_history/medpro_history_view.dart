import 'package:ameriajproducts/app/modules/medpro_history/medpro_history_model.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ensure MedproHistoryData is defined in medpro_history_model.dart or import its correct file.

class MedproHistoryView extends StatelessWidget {
  const MedproHistoryView({super.key});

  @override
  Widget build(BuildContext context) {

final data = medprohistorydata().medprohistory;

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
      body:ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,
        bottom: 20
        ),
        child: Container(
          height: 70,
          width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
          BoxShadow(
            color: Color(0xff2C78DC).withOpacity(.08),
            offset: const Offset(0, 3),
            blurRadius: 12,
          ),
        ],
        ),
        child: Row(
          children: [
            Icon(Icons.medical_services,
            color: Color(0xff1893F8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(data[index].tittle),
                Text(data[index].date)
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Get.toNamed(Approutes.medprohistorydetails),
              child: Text('View Details',style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff1893F8)
              ),),
            ),
            Icon(Icons.arrow_forward,
            color: Color(0xff1893F8),
            )
            
          ],
        ),
        ),
      ),),
      
    );
  }
}