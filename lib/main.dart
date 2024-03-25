import 'package:alarm_app/firebase_options.dart';
import 'package:alarm_app/screens/alarm_screen.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/utils/NotificationController.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:alarm_app/widgets/alarm_card.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('start');
  print("백그라운드 메시지 처리.. ${message.notification!.body!}");
  // _AndroidMethodChannel androidMethodChannel = _AndroidMethodChannel();
  // await androidMethodChannel.setNativeAlarm();
}

Future<void> initializeNotification() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(const AndroidNotificationChannel(
          'high_importance_channel', 'high_importance_notification',
          importance: Importance.max));

  await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
  ));

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  print('end Initialize');
}

void playAlarmSound() {
  FlutterRingtonePlayer.playAlarm();
}

void stopAlarmSound() {
  FlutterRingtonePlayer.stop();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotification();
  print('hihi');
  runApp(ChangeNotifierProvider(
    create: (context) => GlobalVar(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final MethodChannel _channel =
      const MethodChannel('com.example.alarmApp/channel');

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<void> handleMethod(MethodCall call) async {
      if (call.method == "getRoute") {
        final String route = call.arguments;
        Navigator.of(context).pushNamed(route);
      }
    }

    _channel.setMethodCallHandler(handleMethod);

    return MaterialApp(
      title: 'AlarmApp Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // 영어
        Locale('ko', ''), // 한국어
        // 필요한 다른 로케일을 여기에 추가
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/alarmPage': (context) => const AlarmScreen(),
      },
    );
  }
}
