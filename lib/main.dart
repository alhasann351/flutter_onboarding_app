import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/routes/app_pages.dart';
import 'package:flutter_onboarding_app/routes/app_routes.dart';
import 'package:get/get.dart';

import 'constants/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding app',
      initialRoute: AppRoutes.onboardingScreen,
      getPages: AppPages.appPages(),
      theme: AppThemes.themeData(),
    );
  }
}
