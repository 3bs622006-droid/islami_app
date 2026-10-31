import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getLastSuraIndex();
    },);
  }



  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return mostRecentProvider.mostRecentList.isEmpty ?
    Container()
        :
    Column(
      spacing: height * 0.01,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Most Recently', style: AppStyles.bold16White),
        SizedBox(
          height: height * 0.18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      AppRoutes.suraDetails1RouteName,
                      arguments: mostRecentProvider.mostRecentList[index]);
                },
                child: Container(
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
                          Text(QuranRecourses
                              .englishQuranSuraList[mostRecentProvider
                              .mostRecentList[index]],
                              style: AppStyles.bold24Black),
                          Text(QuranRecourses
                              .arabicQuranSuraList[mostRecentProvider
                              .mostRecentList[index]],
                              style: AppStyles.bold24Black),
                          Text('${QuranRecourses
                              .versesNumbersList[mostRecentProvider
                              .mostRecentList[index]]} Verses',
                              style: AppStyles.bold14Black),
                        ],
                      ),
                      Image.asset(AppAssets.mostRecent),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.04);
            },
            itemCount: mostRecentProvider.mostRecentList.length,
          ),
        ),
      ],
    );
  }
}
