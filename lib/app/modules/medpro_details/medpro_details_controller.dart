import 'package:ameriajproducts/app/modules/medpro_details/medpo_item.dart';
import 'package:get/get.dart';

class MedproDetailsController extends GetxController{
  var items = <MedproItem>[].obs;

  void addItem(String type, String name, String date) {
    items.add(MedproItem(
      type: type,
      name: name,
      date: date,
    ));
  }

  Future<void> submitAll() async {
    try {
      final body = {
        "data": {
          "tests": items.map((e) => e.toJson()).toList(),
        }
      };

      print("FINAL BODY ---> $body");

      // TODO: call API here
      // await ApiService.postMedpro(body);

    } catch (e) {
      print("Error: $e");
    }
  }
}