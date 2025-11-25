import 'package:ameriajproducts/app/modules/admin_history/admin_history_controller.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdminHistoryView extends GetView<AdminHistoryController> {
  const AdminHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.adminhistorydata;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Admin',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                SvgPicture.asset(Appimages.admin),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Admin'),
                    Text(data[index].displayDate.toString()),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(
                    Approutes.adminhistorydetails,
                    arguments: {
                      'les': data[index].lesCorrect,
                      'vehicleerg': data[index].vehicleRegistration,
                      'vehicleinsurance': data[index].vehicleInsurance,
                      'edumilitary': data[index].educationMilitary,
                      'educivilian': data[index].educationCivilian,
                      'voluenteerhour': data[index].volunteerHour,
                    },
                  ),
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff1893F8),
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward, color: Color(0xff1893F8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
