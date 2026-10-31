import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_theme.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/screens/intro/intro_boarding_screen.dart';
import 'package:islami_app/ui/screens/splash/splash_view.dart';
import 'package:islami_app/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islami_app/ui/screens/sura_details1/sura_details_screen1.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.splshRouteName,

      routes: {
        AppRoutes.splshRouteName: (context) => SplashView(),
        AppRoutes.introRouteName: (context) => IntroBoardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetailsScreen1(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}