import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grow_ease/Screen/signin_screen.dart';
import 'package:grow_ease/provider/cart_notifier.dart';
import 'package:grow_ease/provider/product_notifier.dart';
import 'package:grow_ease/provider/wishlist_notifier.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize timezone
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata')); // Set based on your region

  // Initialize local notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // Handle notification tap action (optional)
    },
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartNotifier>(create: (_) => CartNotifier()),
        ChangeNotifierProvider<ProductNotifier>(create: (_) => ProductNotifier()),
        ChangeNotifierProvider<WishlistNotifier>(create: (_) => WishlistNotifier()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    ),
  );
}

// Function to schedule reminder notifications for plant care
Future<void> scheduleReminder({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledDate,
}) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(scheduledDate, tz.local),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'reminder_channel',
        'Plant Reminders',
        channelDescription: 'Reminder notifications for plant care',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time, // Repeat daily at that time
  );
}

// Function to cancel the reminder notification
Future<void> cancelReminder(int id) async {
  await flutterLocalNotificationsPlugin.cancel(id);
}
