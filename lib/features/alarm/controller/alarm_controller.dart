import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

import '../models/alarm_model.dart';

class AlarmController extends GetxController {
  final alarms = <AlarmModel>[].obs;

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: DarwinInitializationSettings(),
    );

    await notificationsPlugin.initialize(initSettings);
  }

  void addAlarm(DateTime time) {
    final alarm = AlarmModel(time: time, isActive: true);
    alarms.add(alarm);
    _scheduleNotification(time, alarms.length);
  }

  void toggleAlarm(int index, bool value) {
    final alarm = alarms[index];
    alarms[index] = AlarmModel(time: alarm.time, isActive: value);

    if (value) {
      _scheduleNotification(alarm.time, index + 1);
    } else {
      notificationsPlugin.cancel(index + 1);
    }
  }

  Future<void> _scheduleNotification(DateTime dateTime, int id) async {
    final tz.TZDateTime tzTime = tz.TZDateTime.from(dateTime, tz.local);

    await notificationsPlugin.zonedSchedule(
      id,
      'Alarm',
      'Your alarm is ringing!',
      tzTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Alarms',
          channelDescription: 'Alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      //uiLocalNotificationDateInterpretation: UiLocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
