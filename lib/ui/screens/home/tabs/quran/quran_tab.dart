import 'package:flutter/material.dart';
import 'package:islami_app/core/shared_prefs_utils.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/widget/sura_item.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * 0.02,
          children: [
            _builtSearchSection(
                onChanged: (text) {
                  searchBySuraName(text);
                }),
            MostRecentWidget(),
            Text('Suras List', style: AppStyles.bold16White),
            _builtSuraListSection(
              onSuraItemClick: (index) {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.suraDetails1RouteName, arguments: index);
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }

  Widget _builtSearchSection({required void Function(String)?onChanged}) {
    return TextField(
      style: AppStyles.bold16White,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        enabledBorder: _builtDecorationBorder(),
        focusedBorder: _builtDecorationBorder(),
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold16White,
        prefixIcon: Image.asset(AppAssets.iconSearch),
      ),
      onChanged: onChanged,
    );
  }

  Widget _builtSuraListSection({required void Function(int) onSuraItemClick}) {
    return filterList.isEmpty ?
    Center(child: Text('No Sura Name Found.',
      style: AppStyles.bold24Primary,
    ),)
        :
    ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            saveLastSuraIndex(filterList[index]);
            onSuraItemClick(filterList[index]);
          },
          child: SuraItem(index: filterList[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 2,
          height: context.height * 0.04,
          color: AppColors.whiteColor,
          endIndent: context.width * 0.06,
          indent: context.width * 0.06,
        );
      },
      itemCount: filterList.length,
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranRecourses.englishQuranSuraList.length; i++) {
      if (QuranRecourses.englishQuranSuraList[i].toLowerCase()
          .contains(suraName.toLowerCase())
          || QuranRecourses.arabicQuranSuraList[i].contains(suraName)) {
        searchList.add(i);
      }
      filterList = searchList;
      setState(() {

      });
    }
  }
}
