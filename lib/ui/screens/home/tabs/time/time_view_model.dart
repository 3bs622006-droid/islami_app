import 'package:islami_app/core/utils/app_assets.dart';

import 'time_model.dart';

class TimeViewModel {
  List<PrayerTimeModel> prayersList = [
    PrayerTimeModel(name: "Fajr", time: "04:20", period: "AM"),
    PrayerTimeModel(name: "Dhuhr", time: "01:01", period: "PM"),
    PrayerTimeModel(name: "ASR", time: "04:38", period: "PM"),
    PrayerTimeModel(name: "Maghrib", time: "07:57", period: "PM"),
    PrayerTimeModel(name: "Isha", time: "09:05", period: "PM"),
  ];

  List<ZekrCardModel> azkarList = [
    ZekrCardModel(title: "Evening Azkar", imagePath: AppAssets.illustration1),
    ZekrCardModel(title: "Morning Azkar", imagePath: AppAssets.illustration),
  ];
}
