import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_string.dart';
import 'package:flutter_onboarding_app/features/onboarding/widgets/onboarding_page.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common_widgets/custom_elevated_button.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../routes/app_routes.dart';
import '../controller/onboarding_screen_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final onboardingScreenController = Get.put(OnboardingScreenController());
    final onboardingPages = [
      const OnboardingPage1(
        imagePath: AppImages.onboardingImage1,
        title: AppString.onboardingTitle1,
        subtitle: AppString.onboardingSubtitle1,
      ),
      const OnboardingPage1(
        imagePath: AppImages.onboardingImage2,
        title: AppString.onboardingTitle2,
        subtitle: AppString.onboardingSubtitle2,
      ),
      const OnboardingPage1(
        imagePath: AppImages.onboardingImage3,
        title: AppString.onboardingTitle3,
        subtitle: AppString.onboardingSubtitle3,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: onboardingScreenController.pageController.value,
              onPageChanged: (index) {
                onboardingScreenController.currentPage.value = index;
              },
              children: onboardingPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: onboardingScreenController.pageController.value,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.pageIndicatorColor,
                  activeDotColor: AppColors.pageIndicatorActiveColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: SizedBox(
              width: screenWidth,
              height: 56.0,
              child: CustomElevatedButton(
                text: AppString.next,
                backgroundColor: AppColors.nextButtonBackgroundColor,
                onPressed: () {
                  if (onboardingScreenController.currentPage.value == 2) {
                    Get.offAllNamed(AppRoutes.locationPermissionScreen);
                  } else {
                    onboardingScreenController.pageController.value.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
