import 'package:intl/intl.dart';

class WeaponHistoryModel {
  final String id;
  final String weaponName;
  final int score;
  final String qualificationLevel;
  final String userId;
  final String rawDate; // ISO date string
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final bool pass; // Added pass field

  WeaponHistoryModel({
    required this.id,
    required this.weaponName,
    required this.score,
    required this.qualificationLevel,
    required this.userId,
    required this.rawDate,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.pass, // Added
  });

  // --- 2. FromJson Factory ---
  factory WeaponHistoryModel.fromJson(Map<String, dynamic> json) {
    return WeaponHistoryModel(
      id: json['id'] ?? '',
      weaponName: json['weaponName'] ?? 'Unknown',
      score: json['score'] ?? 0,
      qualificationLevel: json['qualificationLevel'] ?? 'Unknown',
      userId: json['userId'] ?? '',
      rawDate: json['date'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      pass: json['pass'] ?? false, // Added pass field
    );
  }

  // --- 3. UI Helpers (For your ListView) ---

  // This returns the Weapon Name (e.g., "AK47")
  String get title {
    return weaponName.toUpperCase();
  }

  // This formats the raw date into a user-friendly date string like 'Mar 22, 4025'
  String get displayDate {
    if (rawDate.isEmpty) return "N/A";
    try {
      final DateTime parsed = DateTime.parse(rawDate);
      // formats to: Mar 22, 4025
      return DateFormat('MMM dd, yyyy').format(parsed);
    } catch (e) {
      return rawDate; // Return raw string if parsing fails
    }
  }
}

