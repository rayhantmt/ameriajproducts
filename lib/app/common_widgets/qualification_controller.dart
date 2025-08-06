import 'package:get/get.dart';

class QualificationController extends GetxController {
  final RxMap<String, bool> qualifications = {
    'marksman': false,
    'sharpshooter': false,
    'expert': false,
  }.obs;

  void toggleQualification(String title, bool? value) {
    qualifications.updateAll((key, _) => false);
    qualifications[title] = value ?? true;
    
  }

  /// ✅ Method to get selected qualification
  String? get selectedQualification {
    try {
      return qualifications.entries
          .firstWhere((entry) => entry.value == true)
          .key;
    } 
    
    catch (_) {
      return null; // In case nothing is selected
    }
  }
  
}
