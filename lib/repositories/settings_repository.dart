import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SettingsRepository {
  static Future<bool> getIsVibrate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool('isVibrate') ?? true;
  }

  static Future<void> setIsVibrate(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool('isVibrate', value);
  }

  static Future<double> getDuration() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getDouble('duration') ?? 5.0;
  }

  static Future<void> setDuration(double value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setDouble('duration', value);
  }

  // static Future<List<TimeOfDay>> getReminders() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();

  //   return (preferences.getStringList('reminders') ?? []).map((e) {
  //     return TimeOfDay.fromDateTime(DateFormat("hh:mm").parse(e));
  //   }).toList();
  // }

  // static Future<void> addReminder(String value,
  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();

  //   List<String> reminders = preferences.getStringList('reminders') ?? [];
  //   print(value);
  //   reminders.add(value);

  //   preferences.setStringList(
  //     'reminders',
  //     reminders,
  //   );

  //   tz.initializeTimeZones();

  //   flutterLocalNotificationsPlugin.zonedSchedule(
  //     reminders.length,
  //     "Détendez-vous !",
  //     "C'est l'heure de votre scéance.",
  //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  //     const NotificationDetails(
  //       iOS: IOSNotificationDetails(
  //         presentAlert: true,
  //         presentBadge: true,
  //         presentSound: true,
  //       ),
  //     ),
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     androidAllowWhileIdle: true,
  //   );
  // }

  // static Future<void> removeReminder(String value) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();

  //   List<String> reminders = preferences.getStringList('reminders') ?? [];

  //   reminders.remove(value);

  //   preferences.setStringList('reminders', reminders);
  // }
}
