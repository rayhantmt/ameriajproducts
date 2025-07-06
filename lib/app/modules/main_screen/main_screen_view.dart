import 'package:ameriajproducts/app/modules/home/home_view.dart';
import 'package:ameriajproducts/app/modules/main_screen/main_screen_controller.dart';
import 'package:ameriajproducts/app/modules/profile/profile_view.dart';
import 'package:ameriajproducts/app/modules/schedule/schedule_view.dart';
import 'package:ameriajproducts/app/modules/task/task_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
final mainscreencontroller= Get.find<MainScreenController>();
 final List<Widget> screens = [
    HomeView(),
   TaskView(),
   ScheduleView(),
   ProfileView()
  ];

    return Scaffold(
      backgroundColor: Colors.white,
      body:Obx(()=>screens[mainscreencontroller.currentIndex.value] ),
      bottomNavigationBar: BottomNavigationBar(items:[ BottomNavigationBarItem(icon: Icon(Icons.home))]),
    );
  }
}