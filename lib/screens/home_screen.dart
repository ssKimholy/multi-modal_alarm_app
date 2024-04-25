import 'package:alarm_app/screens/alarm_page_screen.dart';
import 'package:alarm_app/screens/friends_screen.dart';
import 'package:alarm_app/screens/history_screen.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isUserInfoSet = false;

  void setUserInfo(global) async {
    final prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone-num')!;

    Map<String, dynamic> userInfo = await HttpRequestUtil.getUserInfo(phone);

    await global.setUserName(userInfo["memberName"]);
    await global.setUserId(userInfo["memberId"]);
    await global.setUserPw(userInfo["password"]);
    await global.setUserPhoneNumber(userInfo["phone"]);
    await global.setDeviceToken(userInfo["deviceKey"]);

    print('yeah ${global.getUserId}');
  }

  void getMyDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print('token: $token');
  }

  @override
  void initState() {
    getMyDeviceToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;

      // _AndroidMethodChannel androidMethodChannel = _AndroidMethodChannel();
      // await androidMethodChannel.setNativeAlarm();

      if (notification != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'high_importance_notification',
              importance: Importance.max,
            ),
          ),
        );
      }
    });

    super.initState();
    if (!_isUserInfoSet) {
      final global = Provider.of<GlobalVar>(context, listen: false);
      setUserInfo(global);
      setState(() {
        _isUserInfoSet = true;
      });
    }
  }

  @override
  void didChangeDependencies() {
    print('home change');
  }

  final List<Widget> _pages = [
    const AlarmPageScreen(),
    const FriendScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);

    return IndexedStack(
      index: global.getIndex,
      children: _pages,
    );
  }
}

class _AndroidMethodChannel {
  static const MethodChannel platform = MethodChannel("please");

  Future<void> setNativeAlarm() async {
    try {
      print('f2');
      String ss = await platform.invokeMethod("setAlarm");
      print(ss);
    } on PlatformException catch (e) {
      print("Failed to set alarm: '${e.message}'.");
    }
  }
}
