import 'package:get/get.dart';

class QualificationController extends GetxController {
  final RxMap<String, bool> qualifications = {
    'Marksman': false,
    'Sharpshooter': false,
    'Expert': false,
  }.obs;

  void toggleQualification(String title, bool? value) {
    qualifications[title] = value ?? !(qualifications[title] ?? false);
  }
}