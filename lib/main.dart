import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:permission_handler/permission_handler.dart';
import 'commonfun/app_provider.dart';
import 'config/firebase_options.dart';
import 'config/notificationservice.dart';
import 'screen/onboardingScreen/onboarding_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //NotificationService().showNotificationsimple(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  NotificationService().initNotification();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationService().showNotificationsimple(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    NotificationService().showNotificationsimple(message);
    debugPrint('onMessageOpenedApp: ${message.notification!.title.toString()}');
  });
  await GetStorage.init();
  runApp(MultiProvider(
      providers: AppProvider.appProvider.providers(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      // providers: [
      //   // ChangeNotifierProvider(create: (_) => Counter()),
      // ],
      home: ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(
              context,
              GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: const OnboardingContent()))),
          maxWidth: 1200,
          minWidth: 420,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(420, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
    );
  }
}
