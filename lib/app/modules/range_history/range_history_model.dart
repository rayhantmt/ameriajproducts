// class RangeHistoryModel {
//   final String tittle;
//   final String date;

//   RangeHistoryModel({required this.tittle, required this.date});
  
// }
// class rangehistorydata{
//   List<RangeHistoryModel> rangehistory=[

//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//     RangeHistoryModel(tittle: 'Range Qualification', date: 'Oct 19, 2024'),
//   ];
// }
import 'package:intl/intl.dart';

class RangeHistoryModel {
  // --- 1. API Fields (Store all data here) ---
  final String? id;
  final String? weaponName;
  final int? score;
  final String? qualificationLevel; // Changed to a single string
  final String? userId;
  final String? rawDate; // Keep the original ISO date string
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  RangeHistoryModel({
    this.id,
    this.weaponName,
    this.score,
    this.qualificationLevel, // Updated
    this.userId,
    this.rawDate,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  // --- 2. FromJson Factory ---
  factory RangeHistoryModel.fromJson(Map<String, dynamic> json) {
    return RangeHistoryModel(
      id: json['id'],
      weaponName: json['weaponName'],
      score: json['score'],
      qualificationLevel: json['qualificationLevel'], // Updated
      userId: json['userId'],
      rawDate: json['date'], // Map API 'date' to rawDate
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  // --- 3. UI Helpers (For your ListView) ---

  // This replaces your old 'title'. 
  // It returns the Weapon Name (e.g., "AK47") or a default string.
  String get title {
    if (weaponName == null) return "Range Qualification";
    return weaponName!.toUpperCase(); 
  }

  // This formats the API date to 'Oct 19, 2024'
  String get displayDate {
    if (rawDate == null) return "N/A";
    try {
      final DateTime parsed = DateTime.parse(rawDate!);
      // formats to: Oct 19, 2024
      return DateFormat('MMM dd, yyyy').format(parsed); 
    } catch (e) {
      return rawDate!; // Return raw string if parsing fails
    }
  }
}
