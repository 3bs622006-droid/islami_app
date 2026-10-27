import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/model/intro_model.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

import 'intro_screen_item.dart';

class IntroBoardingScreen extends StatefulWidget {
  const IntroBoardingScreen({super.key});

  @override
  State<IntroBoardingScreen> createState() => _IntroBoardingScreenState();
}

class _IntroBoardingScreenState extends State<IntroBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<IntroModel> introPages = [
    IntroModel(
      imagePath: AppAssets.intro1,
      title: 'Welcome To Islami App',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    IntroModel(
      imagePath: AppAssets.intro2,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    IntroModel(
      imagePath: AppAssets.intro3,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    IntroModel(
      imagePath: AppAssets.intro4,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: introPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return IntroScreenItem(model: introPages[index]);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(color: Color(0xFFE2BE7F)),
                          ),
                        )
                      : const SizedBox(width: 50),

                  Row(
                    children: List.generate(
                      introPages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentIndex == index ? 20 : 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? const Color(0xFFE2BE7F)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      if (_currentIndex < introPages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: Text(
                      _currentIndex == introPages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: const TextStyle(color: Color(0xFFE2BE7F)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
