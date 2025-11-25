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
class MedProModel {
  final String id;           // MedPro entry ID
  final String userId;       // User ID
  final List<MedProTestModel> tests;  // List of tests (MedProTestModel)
  final bool isDeleted;      // Whether the entry is deleted
  final String createdAt;    // Date when the entry was created
  final String updatedAt;    // Date when the entry was last updated

  MedProModel({
    required this.id,
    required this.userId,
    required this.tests,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedProModel.fromJson(Map<String, dynamic> json) {
    // Extract the tests array
    final testsData = json['tests'] as List<dynamic>? ?? [];
    return MedProModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      tests: testsData.map((e) => MedProTestModel.fromJson(e)).toList(),
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
