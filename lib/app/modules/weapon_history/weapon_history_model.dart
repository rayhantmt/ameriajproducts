class WeaponHistoryModel {
  final String title;
  final String date;

  WeaponHistoryModel({
    required this.title,
    required this.date,
  });

  factory WeaponHistoryModel.fromJson(Map<String, dynamic> json) {
    return WeaponHistoryModel(
      title: json["name"] ?? "Unknown",
      date: json["date"] ?? "",
    );
  }
}
