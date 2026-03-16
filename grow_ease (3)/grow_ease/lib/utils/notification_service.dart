import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notification service
  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Set your app icon

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle the notification tap or action here if necessary
      },
    );
  }

  // Show a simple immediate notification (In-App reminder)
  static Future<void> showInAppReminder({
    required BuildContext context,
    required String title,
    required String body,
  }) async {
    // Trigger an in-app reminder (popup) while the app is running
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Example: Schedule an in-app reminder with Timer for demo purposes
  static void scheduleInAppReminder({
    required BuildContext context,
    required String title,
    required String body,
    required Duration delay,
  }) {
    Timer(delay, () {
      showInAppReminder(context: context, title: title, body: body);
    });
  }
}
