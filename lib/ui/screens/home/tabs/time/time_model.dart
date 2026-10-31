class PrayerTimeModel {
  final String name;
  final String time;
  final String period;

  PrayerTimeModel({
    required this.name,
    required this.time,
    required this.period,
  });
}

class ZekrCardModel {
  final String title;
  final String imagePath;

  ZekrCardModel({required this.title, required this.imagePath});
}
