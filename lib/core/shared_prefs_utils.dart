import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String key = "sura_index";
}

void saveLastSuraIndex(int suraIndex) async {
  var prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList(SharedPrefsKeys.key) ?? [];

  if (mostRecentList.contains('$suraIndex')) {
    mostRecentList.remove('$suraIndex');
    mostRecentList.insert(0, '$suraIndex');
  } else {
    mostRecentList.insert(0, '$suraIndex');
  }

  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }

  await prefs.setStringList(SharedPrefsKeys.key, mostRecentList);
}
