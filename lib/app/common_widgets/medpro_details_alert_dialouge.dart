import 'package:ameriajproducts/app/modules/medpro_details/medpro_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproDetailsAlertDialouge extends StatefulWidget {
  final String type;
  MedproDetailsAlertDialouge({super.key, required this.type});

  @override
  State<MedproDetailsAlertDialouge> createState() =>
      _MedproDetailsAlertDialougeState();
}

class _MedproDetailsAlertDialougeState
    extends State<MedproDetailsAlertDialouge> {
  late TextEditingController nameController;
  late TextEditingController dateController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,

      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: Get.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fill Form',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff4B5563),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),

                  border: Border.all(width: 1, color: Color(0xff4B5563)),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Date',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff4B5563),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Color(0xff4B5563)),
                ),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select'),
                        Icon(Icons.calendar_month_outlined),
                      ],
                    ),

                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 35,
                      width: Get.width * 0.30,
                      decoration: BoxDecoration(color: Color(0xffF3F4F6)),
                      child: Center(child: Text("Cancel")),
                    ),
                  ),
                  GestureDetector(
                    //onTap: () => Navigator.pop(context),
                    onTap: () {
                      final controller = Get.find<MedproDetailsController>();
                      controller.addItem(
                        widget.type,
                        nameController.text.trim(),
                        dateController.text.trim(),
                      );
                      Navigator.pop(context);
                    },

                    child: Container(
                      height: 35,
                      width: Get.width * 0.30,
                      decoration: BoxDecoration(color: Color(0xff08692C)),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
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
