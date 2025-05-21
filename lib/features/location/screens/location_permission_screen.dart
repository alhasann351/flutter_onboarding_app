import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_images.dart';
import 'package:flutter_onboarding_app/constants/app_string.dart';
import 'package:flutter_onboarding_app/features/location/widgets/location_screen_image.dart';
import 'package:flutter_onboarding_app/features/location/widgets/location_screen_title_subtitle.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_elevated_button.dart';
import '../../../constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../controller/location_controller.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            spacing: 7.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationScreenTitleSubtitle(),
              const Center(child: LocationScreenImage()),
              CustomElevatedButton(
                text: AppString.currentLocation,
                backgroundColor: AppColors.buttonBackgroundColor,
                image: Image.asset(
                  AppImages.locationImage,
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  locationController.fetchLocationOnce();
                },
              ),
              CustomElevatedButton(
                text: AppString.home,
                backgroundColor: AppColors.buttonBackgroundColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.alarmScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
