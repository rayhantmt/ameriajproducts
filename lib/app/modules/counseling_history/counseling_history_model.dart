class CounselingHistoryModel {
  // --- 1. API Fields (all optional) ---
  final String? id;
  final String? name;
  final String? counseledBy;
  final String? notes;
  final String? userId;
  final String? rawDate;       // date → stored as original string
  final String? rawNextDate;   // nextDate → stored as original string
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  CounselingHistoryModel({
    this.id,
    this.name,
    this.counseledBy,
    this.notes,
    this.userId,
    this.rawDate,
    this.rawNextDate,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  // --- 2. FromJson Factory (same style as your Range model) ---
  factory CounselingHistoryModel.fromJson(Map<String, dynamic> json) {
    return CounselingHistoryModel(
      id: json['id'],
      name: json['name'],
      counseledBy: json['counseledBy'],
      notes: json['notes'],
      userId: json['userId'],
      rawDate: json['date'],          // original ISO string
      rawNextDate: json['nextDate'],  // original ISO string
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
