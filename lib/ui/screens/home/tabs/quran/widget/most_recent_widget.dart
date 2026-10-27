import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Column(
      spacing: height * 0.01,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Most Recently', style: AppStyles.bold16White),
        SizedBox(
          height: height * 0.18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  spacing: width * 0.02,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Al-Anbiya', style: AppStyles.bold24Black),
                        Text('الأنبياء', style: AppStyles.bold24Black),
                        Text('112 Verses', style: AppStyles.bold14Black),
                      ],
                    ),
                    Image.asset(AppAssets.mostRecent),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.04);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
