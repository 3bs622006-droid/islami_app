import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
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
          Expanded(child: Container(color: AppColors.whiteColor)),
          Image.asset(AppAssets.mosqueImage),
        ],
      ),
    );
  }
}
