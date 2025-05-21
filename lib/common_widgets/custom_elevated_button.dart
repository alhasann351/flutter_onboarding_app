import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Image? image;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child:
            image != null
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.0,
                  children: [
                    Flexible(
                      flex: 3,
                      child: AutoSizeText(
                        text,
                        minFontSize: 16,
                        maxFontSize: 16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonTextColor,
                        ),
                      ),
                    ),
                    Flexible(flex: 1, child: image!),
                  ],
                )
                : AutoSizeText(
                  text,
                  minFontSize: 16,
                  maxFontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttonTextColor,
                  ),
                ),
      ),
    );
  }
}
