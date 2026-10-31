import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraContent1 extends StatelessWidget {
  final String content;

  const SuraContent1({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: Text(
        content,
        style: AppStyles.bold20Primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
