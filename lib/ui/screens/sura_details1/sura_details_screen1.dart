import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/screens/home/common/main_loading_widget.dart';
import 'package:islami_app/ui/screens/sura_details1/sura_content.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;

    mostRecentProvider = Provider.of(context);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranRecourses.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.groupBg)),
        ),
        padding: EdgeInsets.only(
          top: context.height * 0.02,
          bottom: context.height * 0.12,
        ),
        child: Column(
          spacing: context.height * 0.06,
          children: [
            Text(
              QuranRecourses.arabicQuranSuraList[index],
              style: AppStyles.bold24Primary,
            ),
            Expanded(
              child: verses.isEmpty
                  ? MainLoadingWidget()
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return SuraContent(
                          content: verses[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.height * 0.02);
                      },
                      itemCount: verses.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  dispose() {
    super.dispose();
    mostRecentProvider.getLastSuraIndex();
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');

    verses = lines;
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {});
    });
  }
}
