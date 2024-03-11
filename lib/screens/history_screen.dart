import 'package:alarm_app/screens/alarm_history_screen.dart';
import 'package:alarm_app/screens/preview_chat_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_bar.dart';
import '../widgets/select_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isChatPage = true;

  Offset transitionDirection = const Offset(-1.0, 0.0);

  void onChangeChatScreen() {
    setState(() {
      isChatPage = true;
      transitionDirection = const Offset(-1.0, 0.0);
    });
  }

  void onChangeAlarmLogScreen() {
    setState(() {
      isChatPage = false;
      transitionDirection = const Offset(1.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.white,
          elevation: 1,
          flexibleSpace: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '기록',
              style: TextStyle(
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          )),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            SelectBar(
              isChatPage: isChatPage,
              onChangeChatScreen: onChangeChatScreen,
              onChangeAlarmLogScreen: onChangeAlarmLogScreen,
            ),
            const SizedBox(
              height: 35.0,
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 120), // 애니메이션 지속 시간을 설정합니다.
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // 슬라이드 애니메이션을 정의합니다.
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: transitionDirection, // 왼쪽에서 시작하여
                      end: const Offset(0.0, 0.0), // 오른쪽으로 이동합니다.
                    ).animate(animation),
                    child: child,
                  );
                },
                child: isChatPage
                    ? PreviewChatScreen(key: UniqueKey())
                    : AlarmHistoryScreen(key: UniqueKey()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
