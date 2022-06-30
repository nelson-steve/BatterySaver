// import 'package:flutter/material.dart';


// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';

// import 'package:device_info/device_info.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as image;
// import 'package:path_provider/path_provider.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// /// Streams are created so that app can respond to notification-related events
// /// since the plugin is initialised in the `main` function
// final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
//     BehaviorSubject<ReceivedNotification>();

// final BehaviorSubject<String?> selectNotificationSubject =
//     BehaviorSubject<String?>();

// const MethodChannel platform =
//     MethodChannel('dexterx.dev/flutter_local_notifications_example');

// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });

//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }

// String? selectedNotificationPayload;

// /// IMPORTANT: running the following code on its own won't work as there is
// /// setup required for each platform head project.
// ///
// /// Please download the complete example app from the GitHub repository where
// /// all the setup has been done
// Future<void> main() async {
//   // needed if you intend to initialize in the `main` function
//   WidgetsFlutterBinding.ensureInitialized();

//   await _configureLocalTimeZone();

//   // final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
//   //         Platform.isLinux
//   //     ? null
//   //     : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//   // String initialRoute = HomePage.routeName;
//   // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//   //   selectedNotificationPayload = notificationAppLaunchDetails!.payload;
//   //   initialRoute = SecondPage.routeName;
//   }

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');

//   /// Note: permissions aren't requested here just to demonstrate that can be
//   /// done later
//   final IOSInitializationSettings initializationSettingsIOS =
//       IOSInitializationSettings(
//           requestAlertPermission: false,
//           requestBadgePermission: false,
//           requestSoundPermission: false,
//           onDidReceiveLocalNotification: (
//             int id,
//             String? title,
//             String? body,
//             String? payload,
//           ) async {
//             didReceiveLocalNotificationSubject.add(
//               ReceivedNotification(
//                 id: id,
//                 title: title,
//                 body: body,
//                 payload: payload,
//               ),
//             );
//           });
//   const MacOSInitializationSettings initializationSettingsMacOS =
//       MacOSInitializationSettings(
//     requestAlertPermission: false,
//     requestBadgePermission: false,
//     requestSoundPermission: false,
//   );
//   final LinuxInitializationSettings initializationSettingsLinux =
//       LinuxInitializationSettings(
//     defaultActionName: 'Open notification',
//     defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
//   );
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//     macOS: initializationSettingsMacOS,
//     linux: initializationSettingsLinux,
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     selectedNotificationPayload = payload;
//     selectNotificationSubject.add(payload);
//   });


// class NewNotificationService extends StatefulWidget {
//   const NewNotificationService({Key? key}) : super(key: key);

//   @override
//   State<NewNotificationService> createState() => _NewNotificationServiceState();
// }

// class _NewNotificationServiceState extends State<NewNotificationService> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }