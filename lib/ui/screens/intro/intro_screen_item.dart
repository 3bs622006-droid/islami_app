import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/model/intro_model.dart';

class IntroScreenItem extends StatelessWidget {
  final IntroModel model;

  const IntroScreenItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo, height: 100, fit: BoxFit.contain),
          const Spacer(),

          Image.asset(model.imagePath, height: 280, fit: BoxFit.contain),
          const Spacer(),

          Text(
            model.title,
            style: const TextStyle(
              color: Color(0xFFE2BE7F),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          Text(
            model.description,
            style: const TextStyle(color: Color(0xFFFFF5EA), fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
