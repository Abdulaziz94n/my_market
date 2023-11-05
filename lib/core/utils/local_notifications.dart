// import 'dart:async';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class LocalNotificationsApi {
//   static final _localNotifications = FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel _androidChannel =
//       AndroidNotificationChannel(
//     'channel_id',
//     'channel_name',
//     description: 'channel_description',
//     importance: Importance.max,
//   );

//   static Future _notificationDetails() async {
//     return NotificationDetails(
//       android: AndroidNotificationDetails(
//         _androidChannel.id,
//         _androidChannel.name,
//         channelDescription: _androidChannel.description,
//         importance: _androidChannel.importance,
//         // icon: '@drawable/ICON_FILE_PATH',
//         /// ADD This line to the AndroidManifest outside the activity tag:
//         ///                 <meta-data
//         ///    android:name="com.google.firebase.messaging.default_notification_channel_id"
//         ///     android:value="CHANNEL_ID" />
//       ),
//       iOS: const DarwinNotificationDetails(),
//     );
//   }

//   static Future init({bool initScheduled = false}) async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iOS = DarwinInitializationSettings();
//     const settings = InitializationSettings(iOS: iOS, android: android);

//     final details = await _localNotifications.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {}

//     await _localNotifications.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (details) {},
//     );

//     final platform = _localNotifications.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//     // different "PLATFORM" settings for IOS platform should be implemented (check documentation)
//     await platform?.createNotificationChannel(_androidChannel);

//     if (initScheduled) {
//       tz.initializeTimeZones();
//       final locationName = await FlutterNativeTimezone.getLocalTimezone();
//       tz.setLocalLocation(tz.getLocation(locationName));
//     }
//   }

//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async =>
//       _localNotifications.show(
//         id,
//         title,
//         body,
//         await _notificationDetails(),
//         payload: payload,
//       );
// }
