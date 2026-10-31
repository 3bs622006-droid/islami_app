import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.introRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AppAssets.icSplash,
                width: context.width * 0.55,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),

            Text(
              "Created by Abdelrahman Mohamed",
              style: AppStyles.bold16White.copyWith(
                color: AppColors.primaryColor,
                fontSize: 20,
              ),
            ),
            SizedBox(height: context.height * 0.04),
          ],
        ),
      ),
    );
  }
}
