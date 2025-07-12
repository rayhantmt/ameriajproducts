import 'package:ameriajproducts/app/common_widgets/medpro_card.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproView extends StatelessWidget {
  const MedproView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medpro Status',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          
          children: [
            SizedBox(height: Get.height*0.008,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Approutes.medprohistory),
                  child: Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff08692C)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.history,
                        color:Color(0xff08692C),
                        ),
                        Text('View History',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff08692C)
                        ),
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MedproCard(tittle: 'Vision', color: Color(0xff4279F5), icon: Icons.remove_red_eye_outlined),
                MedproCard(tittle: 'Immunization', color: Color(0xffEF4444), icon: Icons.sim_card)
              ],
            )
          ],
        ),
      ),
    );
  }
}
