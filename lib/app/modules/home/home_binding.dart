import 'package:ameriajproducts/app/modules/home/home_contorller.dart';
import 'package:ameriajproducts/subscriptions/subscriptions_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<HomeContorller>(() => HomeContorller(),);
   Get.put(SubscriptionController());
  }
}