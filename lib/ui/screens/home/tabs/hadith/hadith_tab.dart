import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import 'hadith_model.dart';
import 'hadith_view_model.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  late HadithViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HadithViewModel();
    viewModel.loadHadethFile((fn) => setState(fn));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.groupBg), // الخلفية العامة للشاشة
          fit: BoxFit.cover,
        ),
      ),
      child: viewModel.allHadethList.isEmpty
          ? Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      )
          : PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: viewModel.allHadethList.length,
        itemBuilder: (context, index) {
          return HadithItemCard(hadith: viewModel.allHadethList[index]);
        },
      ),
    );
  }
}

class HadithItemCard extends StatelessWidget {
  final HadithModel hadith;

  const HadithItemCard({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.05,
        horizontal: context.width * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Stack(
        children: [
          // 1. صورة welcome (المصحف والجامع) كخلفية داخلية للكارت بشفافية
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                AppAssets.welcome,
                fit: BoxFit.contain,
                opacity: const AlwaysStoppedAnimation(
                    0.20), // نسبة الشفافية لضمان وضوح النص
              ),
            ),
          ),

          // 2. محتوى الحديث (العنوان، الفاصل، والنص مع مسافات مريحة)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Column(
              children: [
                Text(
                  hadith.title,
                  style: AppStyles.bold24Primary.copyWith(
                      color: AppColors.blackColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.height * 0.015),
                Divider(
                  color: AppColors.blackColor,
                  thickness: 1.5,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(height: context.height * 0.02),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          hadith.content,
                          textAlign: TextAlign.center,
                          style: AppStyles.bold16White.copyWith(
                            color: AppColors.blackColor,
                            height: 1.6, // مسافة مريحة جداً بين السطور
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}