import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List <Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List <String> backgroundImagesList = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.transparentColor,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: AppColors.primaryColor
          ),
          child: BottomNavigationBar(
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.blackColor,

              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
              // backgroundColor: AppColors.primaryColor,
              //   type: BottomNavigationBarType.fixed,
              items: [
                builtBottomNavigationBarItem(icon: AppAssets.quranIcon,
                    label: 'Quran', index: 0),
                builtBottomNavigationBarItem(icon: AppAssets.hadithIcon,
                    label: 'Hadith', index: 1),
                builtBottomNavigationBarItem(icon: AppAssets.sebhaIcon,
                    label: 'Sebha', index: 2),
                builtBottomNavigationBarItem(icon: AppAssets.radioIcon,
                    label: 'Radio', index: 3),
                builtBottomNavigationBarItem(icon: AppAssets.timeIcon,
                    label: 'Time', index: 4),
              ]
          ),
        ),
        body: Stack(
          children: [
            Image.asset(backgroundImagesList[selectedIndex],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            SafeArea(
              child: Column(
                spacing: context.height * 0.02,
                children: [
                  Image.asset(AppAssets.logo),
                  Expanded(child: tabsList[selectedIndex]),
                ],
              ),
            ),
          ],
        )
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem(
      {required String icon, required String label, required int index}) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index ?
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.lightBlackColor
          ),
          padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 20
          ),
          child: ImageIcon(AssetImage(icon))) :
      ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
