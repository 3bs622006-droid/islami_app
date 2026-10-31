import 'package:flutter/material.dart';
import 'package:islami_app/core/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getLastSuraIndex() async {
    var prefs = await SharedPreferences.getInstance();

    List<String> mostRecentIndexListAsString =
        prefs.getStringList(SharedPrefsKeys.key) ?? [];

    mostRecentList = mostRecentIndexListAsString
        .map((index) => int.parse(index))
        .toList();

    notifyListeners();

    // return mostRecentIndexListAsInt;
  }
}
