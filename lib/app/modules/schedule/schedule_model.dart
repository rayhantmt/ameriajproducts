class ScheduleModel {
  final String id;
  final String date;    // e.g. 2025-08-05
  final String time;    // e.g. 12:24 AM
  final String details;
  final String location;
  final String type;

  ScheduleModel({
    required this.id,
    required this.date,
    required this.time,
    required this.details,
    required this.location,
    required this.type
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    final rawDateTime = json['dateTime'];
    DateTime? parsedDateTime;

    try {
      parsedDateTime = DateTime.parse(rawDateTime);
    } catch (e) {
      parsedDateTime = null;
    }

    String formattedDate = parsedDateTime != null
        ? "${parsedDateTime.year}-${_twoDigits(parsedDateTime.month)}-${_twoDigits(parsedDateTime.day)}"
        : "";

    String formattedTime = parsedDateTime != null
        ? _formatTime(parsedDateTime)
        : "";

    return ScheduleModel(
      id: json['id'] ?? '',
      date: formattedDate,
      time: formattedTime,
      details: json['details'] ?? '',
      location: json['location'] ?? '',
      type: json['type']?? ''
    );
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  static String _formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = _twoDigits(dt.minute);
    final period = dt.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $period";
  }
}
