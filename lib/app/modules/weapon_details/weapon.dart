import 'package:ameriajproducts/app/common_widgets/qualification_container.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon_controller.dart';
import 'package:ameriajproducts/app/modules/weapon_history/weapon_history_controller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Weapon extends StatelessWidget {
  const Weapon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WeaponController>();
    final secondcontroller = Get.find<WeaponHistoryController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weapon Qualification',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => secondcontroller.fetchWeaponQualifications(),
                    child: Obx(() => secondcontroller.isLoadingRangeQual.value?Center(child: CircularProgressIndicator(
                      color: Colors.green,
                    ),):Container(
                      height: 30,
                      width: 120,
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
                    ),)
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
                  controller: controller.dateController,
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
                  controller: controller.nameController,
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
              Row(
                children: [
                  Icon(Icons.speed, color: Color(0xff22C55E)),
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
                  controller: controller.scoreController,
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
              Text(
                'Qualification Level',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff1F2937),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  QualificationContainer(
                    title: 'Marksman',
                    img: Appimages.marksman,
                  ),
                  SizedBox(height: 10),
                  QualificationContainer(
                    title: 'Sharpshooter',
                    img: Appimages.sharpshooter,
                  ),
                  SizedBox(height: 10),
                  QualificationContainer(
                    title: 'Expert',
                    img: Appimages.expert,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 45,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF3F4F6),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff727272),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.submitQualification,
                    child: Container(
                      height: 45,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff08692C),
                      ),
                      child: Center(
                        child: Obx(
                          () => controller.isLoading.value
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xffFDFDFD),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
