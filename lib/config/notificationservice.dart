import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  static const channelId = "1";
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    "amarjeeet",
    channelDescription:
        "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.max,
    importance: Importance.max,
  );

  static const DarwinNotificationDetails _iOSNotificationDetails =
      DarwinNotificationDetails();

  final NotificationDetails notificationDetails = const NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  Future<void> initNotification() async {
    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // ios initialization
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,

      //  notificationCategories: darwinNotificationCategories,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    // the initialization settings are initialized after they are setted

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // ...
      },
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }
  //
  // tz.TZDateTime nextInstanceOfTenAM(int hour, int minuts) {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minuts);
  //   if (scheduledDate.isBefore(now)) {
  //     print(scheduledDate);
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }

  // Future<void> scheduleNotification(
  //     int id, String title, String body, DateTime eventDate, TimeOfDay eventTime, String payload,
  //     [DateTimeComponents? dateTimeComponents]) async {
  //   final scheduledTime = eventDate.add(Duration(
  //     hours: eventTime.hour,
  //     minutes: eventTime.minute,
  //   ));
  //   var data = await flutterLocalNotificationsPlugin.getActiveNotifications();
  //   print(
  //       " all ${tz.TZDateTime.now(tz.local)} notification ${nextInstanceOfTenAM(eventTime.hour, eventTime.minute)} --- ");
  //
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  //       // tz.TZDateTime.from(scheduledTime, tz.local),
  //       nextInstanceOfTenAM(eventTime.hour, eventTime.minute),
  //       notificationDetails,
  //       payload: payload,
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time);
  // }

  Future<void> showNotificationsimple(RemoteMessage message) async {
    await flutterLocalNotificationsPlugin.show(
      message.ttl!,
      message.notification!.title,
      message.notification!.body,
      //schedule the notification to show after 2 seconds.
      const NotificationDetails(
        // Android details
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "amarjeet",
            importance: Importance.max,
            priority: Priority.max),
        // iOS details
        iOS: DarwinNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  int id = 0;

  Future<void> showProgressNotification() async {
    id++;
    final int progressId = id;
    const int maxProgress = 20;
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 1), () async {
        final AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails('progress channel', 'progress channel',
                channelDescription: 'progress channel description',
                channelShowBadge: false,
                importance: Importance.max,
                category: AndroidNotificationCategory.stopwatch,
                actions: <AndroidNotificationAction>[
                  const AndroidNotificationAction(
                    showsUserInterface: true,
                    'text_id_1',
                    'Enter Text',
                    icon: DrawableResourceAndroidBitmap('ic_next_custom'),
                    // inputs: <AndroidNotificationActionInput>[
                    //   AndroidNotificationActionInput(
                    //     label: 'Enter a message',
                    //   ),
                    // ],
                  ),
                ],
                priority: Priority.high,
                onlyAlertOnce: true,
                showProgress: true,
                maxProgress: maxProgress,
                progress: i);
        final NotificationDetails notificationDetails =
            NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(
            progressId,
            'progress notification title',
            'progress notification body',
            notificationDetails,
            payload: 'item x');
      });
    }
  }
}
