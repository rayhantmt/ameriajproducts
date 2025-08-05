import 'package:ameriajproducts/app/modules/main_screen/main_screen_controller.dart';
import 'package:ameriajproducts/app/modules/schedule/schedule_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MainScreenController());
     Get.lazyPut<AppointmentController>(() => AppointmentController());
  }
}
