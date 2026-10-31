import 'package:flutter/services.dart';

import 'hadith_model.dart';

class HadithViewModel {
  List<HadithModel> allHadethList = [];

  Future<void> loadHadethFile(Function(void Function()) updateState) async {
    for (int i = 1; i <= 50; i++) {
      try {
        String fileContent = await rootBundle.loadString(
          'assets/files/hadeth/h$i.txt',
        );
        List<String> lines = fileContent.split('\n');

        String title = lines.isNotEmpty ? lines[0] : "الحديث $i";
        String content = lines.length > 1
            ? lines.sublist(1).join('\n').trim()
            : '';

        allHadethList.add(HadithModel(title: title, content: content));
      } catch (e) {
        print("Error loading hadeth $i: $e");
      }
    }
    updateState(() {});
  }
}
