import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/routes/app_pages.dart';
import 'package:flutter_onboarding_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'constants/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Dhaka'));
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
