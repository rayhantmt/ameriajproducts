import 'package:ameriajproducts/app/modules/medpro_details/medpro_details_controller.dart';
import 'package:get/get.dart';

class MedproDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MedproDetailsController>(() => MedproDetailsController(),);
  }
}