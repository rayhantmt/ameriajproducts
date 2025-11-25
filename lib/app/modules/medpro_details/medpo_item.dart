class MedproItem {
  final String type;
  final String name;
  final String date;

  MedproItem({
    required this.type,
    required this.name,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "date": date,
  };
}
