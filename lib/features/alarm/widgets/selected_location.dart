import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_string.dart';
import '../../location/controller/location_controller.dart';

class SelectedLocation extends StatelessWidget {
  const SelectedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    /*return Padding(
      padding: const EdgeInsets.only(
        right: 48.0,
        left: 48.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Column(
        spacing: 16.0,
        children: [
          const AutoSizeText(
            AppString.selectedLocation,
            minFontSize: 16,
            maxFontSize: 16,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            spacing: 8.0,
            children: [
              Image.asset(
                AppImages.locationImage,
                height: 24,
                width: 24,
                alignment: Alignment.center,
              ),
              Obx(
                () => AutoSizeText(
                  locationController.locationText.value,
                  minFontSize: 14,
                  maxFontSize: 14,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 25.0,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              AppString.selectedLocation,
              minFontSize: 16,
              maxFontSize: 16,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              spacing: 9.0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    AppImages.locationImage,
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                  ),
                ),
                Obx(
                  () => Flexible(
                    flex: 3,
                    child: AutoSizeText(
                      locationController.locationText.value,
                      minFontSize: 14,
                      maxFontSize: 14,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
