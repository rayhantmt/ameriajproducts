import 'package:ameriajproducts/app/modules/home/home_contorller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<HomeContorller>(() => HomeContorller(),);
  }
}