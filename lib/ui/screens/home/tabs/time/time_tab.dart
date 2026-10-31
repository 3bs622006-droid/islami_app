import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class PrayerTimeModel {
  final String name;
  final String time;
  final String period;

  PrayerTimeModel(
      {required this.name, required this.time, required this.period});
}

class ZekrCardModel {
  final String title;
  final String imagePath;

  ZekrCardModel({required this.title, required this.imagePath});
}

class TimeViewModel {
  List<PrayerTimeModel> prayersList = [
    PrayerTimeModel(name: "Fajr", time: "04:20", period: "AM"),
    PrayerTimeModel(name: "Dhuhr", time: "01:01", period: "PM"),
    PrayerTimeModel(name: "ASR", time: "04:38", period: "PM"),
    PrayerTimeModel(name: "Maghrib", time: "07:57", period: "PM"),
    PrayerTimeModel(name: "Isha", time: "09:05", period: "PM"),
  ];

  List<ZekrCardModel> azkarList = [
    ZekrCardModel(title: "Evening Azkar", imagePath: AppAssets.illustration1),
    ZekrCardModel(title: "Morning Azkar", imagePath: AppAssets.illustration),
  ];
}

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  late TimeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = TimeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.groupBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: context.height * 0.05),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "16 Jul,\n2024",
                        style: AppStyles.bold16White.copyWith(
                            color: AppColors.blackColor, fontSize: 13),
                      ),
                      Column(
                        children: [
                          Text(
                            "Pray Time",
                            style: AppStyles.bold16White.copyWith(
                                color: AppColors.blackColor, fontSize: 14),
                          ),
                          Text(
                            "Tuesday",
                            style: AppStyles.bold24Primary.copyWith(
                                color: AppColors.blackColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        "09 Muh,\n1446",
                        style: AppStyles.bold16White.copyWith(
                            color: AppColors.blackColor, fontSize: 13),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.02),

                  SizedBox(
                    height: 115,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.prayersList.length,
                      separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final prayer = viewModel.prayersList[index];
                        bool isSelected = prayer.name == "ASR";
                        return Container(
                          width: 85,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFB18848) : Colors
                                .transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                prayer.name,
                                style: AppStyles.bold16White.copyWith(
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                prayer.time,
                                style: AppStyles.bold24Primary.copyWith(
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                prayer.period,
                                style: AppStyles.bold16White.copyWith(
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: context.height * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next Pray - 02:32",
                        style: AppStyles.bold16White.copyWith(
                            color: AppColors.blackColor, fontSize: 14),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.volume_off, color: AppColors.blackColor,
                          size: 20),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: context.height * 0.03),

            Text(
              "Azkar",
              style: AppStyles.bold24Primary.copyWith(
                  color: AppColors.whiteColor, fontSize: 18),
            ),
            SizedBox(height: context.height * 0.015),

            Row(
              children: [
                Expanded(child: ZekrCard(zekr: viewModel.azkarList[0])),
                const SizedBox(width: 16),
                Expanded(child: ZekrCard(zekr: viewModel.azkarList[1])),
              ],
            ),
            SizedBox(height: context.height * 0.04),
          ],
        ),
      ),
    );
  }
}

class ZekrCard extends StatelessWidget {
  final ZekrCardModel zekr;

  const ZekrCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.asset(
              zekr.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            zekr.title,
            style: AppStyles.bold24Primary.copyWith(
              color: AppColors.blackColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}