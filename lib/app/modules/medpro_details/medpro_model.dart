import 'package:intl/intl.dart';

class MedProTestModel {
  final String type;   // The type of the test (e.g., hearing, vision)
  final String name;   // The name (e.g., Fuad)
  final String date;   // Date in ISO format
  final String id;     // Test ID

  MedProTestModel({
    required this.type,
    required this.name,
    required this.date,
    required this.id,
  });

  factory MedProTestModel.fromJson(Map<String, dynamic> json) {
    return MedProTestModel(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  // Helper method to format the date for UI display
  String get displayDate {
    if (date.isEmpty) return "N/A";
    try {
      final parsed = DateTime.parse(date);
      return DateFormat('MMM dd, yyyy').format(parsed); // Format to: Mar 22, 4025
    } catch (_) {
      return date; // Return the raw string if parsing fails
    }
  }
}
