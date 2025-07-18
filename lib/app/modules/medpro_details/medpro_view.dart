import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/medpro_card.dart';
import 'package:ameriajproducts/app/common_widgets/medpro_details_alert_dialouge.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MedproView extends StatelessWidget {
  const MedproView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.008),
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
                          Icon(Icons.history, color: Color(0xff08692C)),
                          Text(
                            'View History',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff08692C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(
                      tittle: 'Vision',
                      color: Color(0xff4279F5),
                      icon: Icons.remove_red_eye_outlined,
                    ),
                  ),
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(
                      tittle: 'Immunization',
                      color: Color(0xffEF4444),
                      icon: FontAwesomeIcons.syringe,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(
                      tittle: 'Hearing',
                      color: Color(0xff6642F5),
                      icon: Icons.hearing,
                    ),
                  ),
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(
                      tittle: 'Dental',
                      color: Color(0xff22C55E),
                      icon: FontAwesomeIcons.tooth,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(tittle: 'DLC', color: Color(0xffE58B2F), icon: Icons.cookie)),
                  GestureDetector(
                   onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(tittle: 'HIV', color: Color(0xffEF44B9), icon: FontAwesomeIcons.ribbon))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(tittle: 'PHA', color: Color(0xff6642F5), icon: Icons.water_drop_outlined)),
                  GestureDetector(
                     onTap: () => showDialog(
                      context: context,
                      builder: (context) => MedproDetailsAlertDialouge()
                    ),
                    child: MedproCard(tittle: 'DNA', color: Color(0xff22C5A4), icon: FontAwesomeIcons.dna))
                ],
              ),
             SizedBox(height: 20,),
              GestureDetector(
                onTap: () => Get.toNamed(Approutes.mainscreen),
                child: CommonButton(tittle: 'Save')),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
