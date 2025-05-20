import 'package:flutter_onboarding_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../features/location/screens/location_permission_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';

class AppPages {
  static appPages() => [
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.locationPermissionScreen,
      page: () => const LocationPermissionScreen(),
    ),
  ];
}
