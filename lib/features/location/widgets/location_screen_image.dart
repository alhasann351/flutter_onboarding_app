import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_images.dart';

class LocationScreenImage extends StatelessWidget {
  const LocationScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const baseWidth = 360.0;
    const baseHeight = 309.0;
    final imageWidth = min(screenWidth * 0.9, baseWidth);
    final imageHeight = imageWidth * (baseHeight / baseWidth);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Image.asset(
        AppImages.locationScreenImage,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.fill,
      ),
    );
  }
}
