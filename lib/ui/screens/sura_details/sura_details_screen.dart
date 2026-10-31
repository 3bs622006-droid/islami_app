import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';
import 'package:islami_app/ui/screens/home/common/main_loading_widget.dart';
import 'package:islami_app/ui/screens/sura_details/sura_content1.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String verses = '';
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    loadSuraFile(index);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranRecourses.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Column(
        spacing: context.height * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.leftCorner),
                    Image.asset(AppAssets.rightCorner),
                  ],
                ),
                Text(
                  QuranRecourses.arabicQuranSuraList[index],
                  style: AppStyles.bold24Primary,
                ),
              ],
            ),
          ),
          Expanded(child: verses.isEmpty ?
          MainLoadingWidget()
              :
          SingleChildScrollView(
            child: SuraContent1(content: verses,
            ),
          )
          ),
          Image.asset(AppAssets.mosqueImage),
        ],
      ),
    );
  }


  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
        'assets/files/quran/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += "[${i + 1}]";
    }
    verses = lines.join('');
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {

      });
    },);
  }
}
