import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;
import '../screens/random_joke_screen.dart';
import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {

  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    if (!kIsWeb) {
      tz.initializeTimeZones();

      const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await notificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) async {
          if (response.payload == 'joke_of_the_day') {
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (_) => RandomJokeScreen(onAddToFavorites: (Joke ) {  },),
              ),
            );
          }
        },
      );
    }
  }

  Future<bool> requestPermissions() async {
    if (kIsWeb) {
      if (html.Notification.supported) {
        final permission = await html.Notification.requestPermission();
        return permission == 'granted';
      }
      return false;
    } else {
      final AndroidFlutterLocalNotificationsPlugin? androidPlugin =
      notificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidPlugin?.requestNotificationsPermission();

      final iOS = await notificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      return granted ?? false;
    }
  }

  Future<void> scheduleJokeNotification() async {
    if (kIsWeb) {
      if (html.Notification.supported) {
        final now = DateTime.now();
        var scheduledDate = DateTime(
            now.year,
            now.month,
            now.day,
            21,
            50
        );

        if (now.isAfter(scheduledDate)) {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }

        final delay = scheduledDate.difference(now);

        Future.delayed(delay, () {
          html.Notification('Joke of the Day',
            body: 'Check out today\'s joke!',

          );

          scheduleJokeNotification();
        });
      } else {
        final now = DateTime.now();
        var scheduledDate = DateTime(
            now.year,
            now.month,
            now.day,
            10,
            0
        );

        if (now.isAfter(scheduledDate)) {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }

        await notificationsPlugin.zonedSchedule(0,
          'Joke of the Day',
          'Check out today\'s joke!',
          tz.TZDateTime.from(scheduledDate, tz.local),
          const NotificationDetails(
            android: AndroidNotificationDetails('daily_joke',
              'Daily Joke',
              channelDescription: 'Daily notification for joke of the day',
              importance: Importance.max,
              priority: Priority.high,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation
              .absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
          payload: 'joke_of_the_day',
        );
      }
    }
  }

    Future<void> cancelNotifications() async {
      if(!kIsWeb){
        await notificationsPlugin.cancelAll();
      }
    }


  }




