import 'package:ameriajproducts/app/common_widgets/task_container.dart';
import 'package:ameriajproducts/app/modules/task/task_model.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = TaskData().taskdata;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                'The Readiness Track',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xff131123),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              GestureDetector(
                onTap: () =>Get.toNamed(Approutes.medpro),
                child: TaskContainer(name: data[0].name, img: data[0].img),
              ),
              SizedBox(height: Get.height * 0.006),
              GestureDetector(
                onTap: () => Get.toNamed(Approutes.weapon),
                child: TaskContainer(name: data[1].name, img: data[1].img),
              ),
              SizedBox(height: Get.height * 0.006),

              GestureDetector(
                onTap: () => Get.toNamed(Approutes.range),
                child: TaskContainer(name: data[2].name, img: data[2].img),
              ),
              SizedBox(height: Get.height * 0.006),

              GestureDetector(
                onTap: () =>Get.toNamed(Approutes.fitnessdetails),
                child: TaskContainer(name: data[3].name, img: data[3].img),
              ),

              SizedBox(height: Get.height * 0.006),
              GestureDetector(
                onTap: () => Get.toNamed(Approutes.counseling),
                child: TaskContainer(name: data[4].name, img: data[4].img),
              ),

              SizedBox(height: Get.height * 0.006),
              GestureDetector(
                onTap: () => Get.toNamed(Approutes.admindetails),
                child: TaskContainer(name: data[5].name, img: data[5].img),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
