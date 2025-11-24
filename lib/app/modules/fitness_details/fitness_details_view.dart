import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/modules/fitness_details/fitness_controller.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon_controller.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FitnessDetailsView extends StatelessWidget {
  const FitnessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
        final controller = Get.find<WeaponController>();
        final maincontroller=Get.find<FitnessController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Physical Fitness Test',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xff131123)
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Approutes.fitnesshistory),
                    child: Container(
                      height: 30,
                      width: 110,
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
                  controller: maincontroller.datecontroller,
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
                  Icon(Icons.group, color: Color(0xff22C55E)),
                  Text(
                    'Name',
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
                  controller: maincontroller.namecontroller,
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
                  Icon(Icons.insert_drive_file, color: Color(0xff6642F5)),
                  Text(
                    "Pass/Fail",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: ChoiceChip(
                        label: const Text("Pass"),
                        selected: controller.isPassed.value,
                        onSelected: (_) => controller.togglePass(true),
                        selectedColor: Colors.green,
                      ),
                    ),
                    SizedBox(width: Get.width * 0.1),
                    Transform.scale(
                      scale: 1.2,
                      child: ChoiceChip(
                        label: const Text("Fail"),
                        selected: !controller.isPassed.value,
                        onSelected: (_) => controller.togglePass(false),
                        selectedColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       height: 50,
              //       width: Get.width*0.3,
              //       decoration: BoxDecoration(

              //       ),
              //     ),
              //     SizedBox(width: Get.width*0.2,),
              //     Container(
              //       width: Get.width*0.3,
              //       height: 50,
              //       color: Colors.blue,
              //     )
              //   ],
              // ),

GestureDetector(
  onTap: () => Get.back(),
  child: CommonButton(tittle: 'Submit')),
SizedBox(height: 10,),
GestureDetector(
  onTap: () => Get.back(),
  child: Container(
    height: 45,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xffF3F4F6),
      borderRadius: BorderRadius.circular(12),
  
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
)
            ],
          ),
        ),
      ),
    )
    ;
  }
}