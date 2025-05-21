import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_string.dart';

class AlarmTitle extends StatelessWidget {
  const AlarmTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
        child: AutoSizeText(
          AppString.alarms,
          minFontSize: 18,
          maxFontSize: 18,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
