class FitnessHistoryModel {
  final String title;  // renamed for consistency
  final String date;
  final String userId;
  final bool isDeleted;
  final bool pass;
  final String createdAt;
  final String updatedAt;
  final String id;

  FitnessHistoryModel({
    required this.title,
    required this.date,
    required this.userId,
    required this.isDeleted,
    required this.pass,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  // Factory method to convert the response JSON into FitnessHistoryModel
  factory FitnessHistoryModel.fromJson(Map<String, dynamic> json) {
    return FitnessHistoryModel(
      title: json['name'],  // "name" from API response
      date: json['date'],  // "date" from API response
      userId: json['userId'],
      isDeleted: json['isDeleted'],
      pass: json['pass'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
    );
  }
}
