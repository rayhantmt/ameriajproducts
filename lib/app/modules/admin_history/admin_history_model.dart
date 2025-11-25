import 'package:intl/intl.dart';

class AdminUserModel {
  // --- API Fields (all nullable) ---
  final String? id;
  final String? userId;
  final bool? lesCorrect;
  final String? vehicleRegistration;
  final String? vehicleInsurance;
  final String? educationMilitary;
  final String? educationCivilian;
  final int? volunteerHour;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  AdminUserModel({
    this.id,
    this.userId,
    this.lesCorrect,
    this.vehicleRegistration,
    this.vehicleInsurance,
    this.educationMilitary,
    this.educationCivilian,
    this.volunteerHour,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  // --- From JSON ---
  factory AdminUserModel.fromJson(Map<String, dynamic> json) {
    return AdminUserModel(
      id: json['id'],
      userId: json['userId'],
      lesCorrect: json['lesCorrect'],
      vehicleRegistration: json['vehicleRegistration'],
      vehicleInsurance: json['vehicleInsurance'],
      educationMilitary: json['educationMilitary'],
      educationCivilian: json['educationCivilian'],
      volunteerHour: json['volunteerHour'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

   String get displayDate {
    if (createdAt.toString().isEmpty) return "N/A";
    try {
      final DateTime parsed = DateTime.parse(createdAt.toString());
      // formats to: Mar 22, 4025
      return DateFormat('MMM dd, yyyy').format(parsed);
    } catch (e) {
      return createdAt.toString(); // Return raw string if parsing fails
    }
  }
}
