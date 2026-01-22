import 'package:ameriajproducts/app/common_widgets/date_picking.dart';
import 'package:ameriajproducts/app/modules/counseling_details/counseling_details_controller.dart';
import 'package:ameriajproducts/app/modules/counseling_history/counselig_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselingDetailsView extends GetView<CounselingDetailsController> {
  const CounselingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final secondcontroller = Get.find<CounseligHistoryController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Counseling',
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
                    // onTap: () => Get.toNamed(Approutes.counselinghistory),
                    onTap: secondcontroller.fetchCounseling,
                    child: Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xff08692C)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Obx(
                        () => secondcontroller.isfeatching.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              )
                            : Row(
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
                  ),
                ],
              ),
              SizedBox(height: 20),

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
                  controller: controller.namecontroller,
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
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Color(0xffE5E7EB)),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: TextFormField(
              //     controller: controller.datecontroller,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hint: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             '23-06-2015',
              //             style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               fontSize: 14,
              //               color: Color(0xff6B7280),
              //             ),
              //           ),
              //           Icon(Icons.calendar_month_outlined),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              DatePickerField(tittle: '', hint: 'Select date',textcontroller: controller.datecontroller,),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, color: Color(0xff1893F8)),
                  Text(
                    'Next Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Color(0xffE5E7EB)),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: TextFormField(
              //     controller: controller.nextdatecontroller,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hint: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             '23-06-2015',
              //             style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               fontSize: 14,
              //               color: Color(0xff6B7280),
              //             ),
              //           ),
              //           Icon(Icons.calendar_month_outlined),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              DatePickerField(tittle: '', hint: 'Select next date',
              textcontroller: controller.nextdatecontroller,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.group, color: Color(0xff22C55E)),
                  Text(
                    'Counseled by',
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
                  controller: controller.counseledbycontroller,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff4B5563),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 85,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Color(0xff1893F8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Text(
                        'Discussed PFT results from June 20, 2025. Soldier passed with a score of 85 but needs improvement in push-ups. Agreed to focus on upper body strength training.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff4B5563),
                        ),
                      ),
                    ),
                  ),
                ),
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
                    child: Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            )
                          : Container(
                              height: 45,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff08692C),
                              ),
                              child: Center(
                                child: Text(
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
