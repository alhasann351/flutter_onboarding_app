import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_string.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../routes/app_routes.dart';

class OnboardingPage1 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingPage1({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              Image.asset(
                imagePath,
                width: screenWidth,
                height: screenHeight * 0.5,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AutoSizeText(
                  title,
                  minFontSize: 28,
                  maxFontSize: 28,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AutoSizeText(
                  subtitle,
                  minFontSize: 14,
                  maxFontSize: 14,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
          Positioned(
            top: 16,
            right: 10,
            child: SafeArea(
              child: TextButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.locationPermissionScreen);
                },
                child: const AutoSizeText(
                  AppString.skip,
                  minFontSize: 16,
                  maxFontSize: 16,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
