import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';

class SuraItem extends StatelessWidget {
  final int index;

  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Row(
      spacing: width * 0.06,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index + 1}', style: AppStyles.bold14White),
          ],
        ),
        Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranRecourses.englishQuranSuraList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranRecourses.versesNumbersList[index]}  Verses',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranRecourses.arabicQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
