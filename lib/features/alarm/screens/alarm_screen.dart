import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/features/alarm/widgets/alarm_title.dart';
import 'package:flutter_onboarding_app/features/alarm/widgets/selected_location.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/custom_elevated_button.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_string.dart';
import '../controller/alarm_controller.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({super.key});

  final alarmController = Get.put(AlarmController());

  void pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      final now = DateTime.now();
      final alarmTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      alarmController.addAlarm(alarmTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 96.0,
          bottom: 10.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: [
            const SelectedLocation(),
            SizedBox(
              width: 256,
              child: CustomElevatedButton(
                text: AppString.addAlarm,
                backgroundColor: AppColors.buttonBackgroundColor,
                onPressed: () {
                  pickTime(context);
                },
              ),
            ),
            const AlarmTitle(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: alarmController.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = alarmController.alarms[index];
                    final timeString = TimeOfDay(
                      hour: alarm.time.hour,
                      minute: alarm.time.minute,
                    ).format(context);
                    final dateString = DateFormat(
                      'EEE dd MMM yyyy',
                    ).format(alarm.time);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 84,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.alarmContainerColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: AutoSizeText(
                                  timeString,
                                  minFontSize: 28,
                                  maxFontSize: 28,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: AutoSizeText(
                                        dateString,
                                        textAlign: TextAlign.end,
                                        minFontSize: 14,
                                        maxFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale:
                                          MediaQuery.of(context).size.width <
                                                  360
                                              ? 0.75
                                              : 0.9,
                                      child: Switch(
                                        value: alarm.isActive,
                                        splashRadius: 2,
                                        onChanged: (val) {
                                          alarmController.toggleAlarm(
                                            index,
                                            val,
                                          );
                                        },
                                        activeColor:
                                            AppColors.switchActiveColor,
                                        thumbColor:
                                            WidgetStateProperty.resolveWith<
                                              Color
                                            >((Set<WidgetState> states) {
                                              return AppColors.whiteColor;
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
