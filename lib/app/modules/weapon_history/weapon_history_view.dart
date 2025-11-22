
import 'package:ameriajproducts/app/modules/weapon_history/weapon_history_controller.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WeaponHistoryView extends StatelessWidget {
  const WeaponHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
final controller=Get.find<WeaponHistoryController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weapon Qualification History',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      body: Obx(() {
  if (controller.weaponQualifications.isEmpty) {
    return const Center(
      child: Text("No history found"),
    );
  } else {
    return ListView.builder(
        itemCount: controller.weaponQualifications.length,
        itemBuilder: (context, index)
        
         => Padding(
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
                SvgPicture.asset(Appimages.weapon),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text(controller.weaponQualifications[index].title), Text(controller.weaponQualifications[index].displayDate)],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(Approutes.weaponhistorydetails),
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
      ); 
  }
})

    );
  }
}
