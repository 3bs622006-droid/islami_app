import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_theme.dart';
import 'package:islami_app/ui/screens/intro/intro_boarding_screen.dart';
import 'package:islami_app/ui/screens/sura_details/sura_details_screen.dart';

import 'ui/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.introRouteName,

      routes: {
        AppRoutes.introRouteName: (context) => IntroBoardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}