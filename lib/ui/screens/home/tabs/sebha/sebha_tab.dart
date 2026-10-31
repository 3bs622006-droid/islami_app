import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import 'sebha_view_model.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late SebhaViewModel viewModel;
  double turns = 0.0;

  @override
  void initState() {
    super.initState();
    viewModel = SebhaViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.groupBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
            style: AppStyles.bold24Primary.copyWith(
                color: AppColors.whiteColor),
          ),
          SizedBox(height: context.height * 0.04),

          GestureDetector(
            onTap: () {
              setState(() {
                turns += 0.05;
              });
              viewModel.onSebhaPressed((fn) => setState(fn));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    AppAssets.sebha,
                    width: context.width * 0.75,
                    height: context.width * 0.75,
                    fit: BoxFit.contain,
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewModel.zekr,
                      textAlign: TextAlign.center,
                      style: AppStyles.bold24Primary.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: context.height * 0.015),
                    Text(
                      "${viewModel.counter}",
                      style: AppStyles.bold24Primary.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}