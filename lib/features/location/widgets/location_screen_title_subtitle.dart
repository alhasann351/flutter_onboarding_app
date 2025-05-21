import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_string.dart';

class LocationScreenTitleSubtitle extends StatelessWidget {
  const LocationScreenTitleSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 124.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          AutoSizeText(
            AppString.locationTitle,
            minFontSize: 28,
            maxFontSize: 28,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          AutoSizeText(
            AppString.locationSubtitle,
            minFontSize: 14,
            maxFontSize: 14,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
