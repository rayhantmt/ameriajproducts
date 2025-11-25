import 'package:ameriajproducts/app/common_widgets/medpro_card.dart';
import 'package:ameriajproducts/app/common_widgets/medpro_history_details_alert_dialouge.dart';
import 'package:ameriajproducts/app/modules/medpro_details/medpro_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class MedproHistoryDetailsView extends StatelessWidget {
  const MedproHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;

// Initialize your list with the received data
var tests = <MedProTestModel>[];
tests = arguments['data'];

// Now you can filter the data for 'vision' and other sets
var visionTests = tests.where((test) => test.type == 'vision').toList();
var immunization = tests.where((test) => test.type == 'immunization').toList();
var hearingTests = tests.where((test) => test.type == 'hearing').toList();
var dentalTests = tests.where((test) => test.type == 'dental').toList();
var dlcTests = tests.where((test) => test.type == 'dlc').toList();
var hivTests = tests.where((test) => test.type == 'hiv').toList();
var phaTests = tests.where((test) => test.type == 'pha').toList();
var dnaTests = tests.where((test) => test.type == 'dna').toList();


   print(visionTests[0].displayDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Medpro Status - June 21, 2025',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff131123)
        ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xffE5E7EB)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('04 April,2025'),
                  Icon(Icons.calendar_month_outlined)
                ],
              )
            ),
            SizedBox(height: 10,),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
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
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
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
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
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
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
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
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
                      ),
                      child: MedproCard(tittle: 'DLC', color: Color(0xffE58B2F), icon: Icons.cookie)),
                    GestureDetector(
                     onTap: () => showDialog(
                        context: context,
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
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
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
                      ),
                      child: MedproCard(tittle: 'PHA', color: Color(0xff6642F5), icon: Icons.water_drop_outlined)),
                    GestureDetector(
                       onTap: () => showDialog(
                        context: context,
                        builder: (context) => MedproHistoryDetailsAlertDialouge()
                      ),
                      child: MedproCard(tittle: 'DNA', color: Color(0xff22C5A4), icon: FontAwesomeIcons.dna))
                  ],
                ),
          ],
        ),
      ),
    );
  }
}