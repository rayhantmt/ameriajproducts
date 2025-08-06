import 'package:get/get.dart';
import 'package:collection/collection.dart';


class QualificationController extends GetxController {
  final RxMap<String, bool> qualifications = {
    'marksman': false,
    'sharpshooter': false,
    'expert': false,
  }.obs;

  /// This string will always hold the current selected qualification
  final RxString selectedQualification = ''.obs;

  @override
  void onInit() {
    super.onInit();

    /// Listen to any changes in the qualifications map
    ever(qualifications, (_) {
      final selected = qualifications.entries
          .firstWhereOrNull((entry) => entry.value == true)
          ?.key;

      selectedQualification.value = selected ?? '';
    });
  }

  void toggleQualification(String title, bool? value) {
    qualifications.updateAll((key, _) => false);
    qualifications[title] = value ?? true;
    // selectedQualification will update automatically via `ever` listener
  }
}
