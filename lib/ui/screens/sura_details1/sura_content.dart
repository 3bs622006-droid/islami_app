import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;

  SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: AppColors.primaryColor),
      ),
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
        horizontal: context.width * 0.04,
      ),
      child: Text(
        '${content} [${index + 1}]',
        style: AppStyles.bold20Primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
