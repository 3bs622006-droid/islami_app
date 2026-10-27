import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_recourses.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/widget/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          _builtSearchSection(),
          MostRecentWidget(),
          Text('Suras List', style: AppStyles.bold16White),
          _builtSuraListSection(
            onSuraItemClick: (index) {
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.suraDetailsRouteName, arguments: index);
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }

  Widget _builtSearchSection() {
    return TextField(
      style: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        enabledBorder: _builtDecorationBorder(),
        focusedBorder: _builtDecorationBorder(),
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold16White,
        prefixIcon: Image.asset(AppAssets.iconSearch),
      ),
    );
  }

  Widget _builtSuraListSection({required void Function(int) onSuraItemClick}) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onSuraItemClick(index);
            },
            child: SuraItem(index: index),
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
        itemCount: QuranRecourses.versesNumbersList.length,
      ),
    );
  }
}
