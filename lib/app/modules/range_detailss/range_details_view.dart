import 'package:ameriajproducts/app/common_widgets/qualification_container.dart';
import 'package:ameriajproducts/app/modules/range_history/range_history_controller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RangeDetailsView extends StatelessWidget {
  const RangeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
   final controller=Get.find<RangeHistoryController>();
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  backgroundColor: Colors.white,
  title: Text('Range Qualification',
  style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Color(0xff131123)
  ),
  ),
),
body: Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                  //  onTap: () => Get.toNamed(Approutes.rangehistory),
                  onTap: () => controller.fetchRangeQualifications(),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xff08692C)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
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
                children: [
                  Icon(Icons.calendar_month_outlined, color: Color(0xff1893F8)),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '23-06-2015',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        Icon(Icons.calendar_month_outlined),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(FontAwesomeIcons.gun, 
                  size: 20,
                  color: Color(0xff22C55E)),
                  Text(
                    'Weapon',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Text(
                      'Enter Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ),
                ),
              ),
           
             
             
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.speed, color: Color(0xffEF8E44)),
                  Text(
                    'Score',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Text(
                      'Enter your score',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Qualification Level',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff1F2937)
              ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  QualificationContainer(title: 'Marksman', img: Appimages.marksman),
                  SizedBox(height: 10,),
                  QualificationContainer(title: 'Sharpshooter', img: Appimages.sharpshooter),
                  SizedBox(height: 10,),
                  QualificationContainer(title: 'Expert', img: Appimages.expert)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 45,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF3F4F6)
                      ),
                      child: Center(
                        child: Text('Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff727272)
                        ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 45,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff08692C)
                      ),
                      child: Center(
                        child: Text('Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xffFDFDFD)
                        ),
                        ),
                      ),
                    ),
                  )
                ],
              )
      ],
    ),
  ),
),
    );
  }
}