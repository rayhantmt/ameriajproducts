import 'package:ameriajproducts/app/modules/counseling_details/counseling_details_controller.dart';
import 'package:get/get.dart';

class CounselingDetailsBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<CounselingDetailsController>(() => CounselingDetailsController(),);
  }
}